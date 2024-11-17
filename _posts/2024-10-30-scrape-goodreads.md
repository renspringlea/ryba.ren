---
layout: post
title: "Some notes on scraping Goodreads"
---
Please use this for personal use only. Recent court cases have affirmed that web scraping (at least of publicly available webpages) is not necessarily illegal in the United States. However, you may be entering into murky waters depending on how you scrape and what you use the data for.  

Goodreads doesn't have a strong search function. For example, if you want to search for all LGBT books with "jelly" in the description published between 2010 and 2020 and with a rating of at least 4.0 stars from at least 1,000 users, you're out of luck.  

Fortunately, you can just download all of Goodreads. It takes about a year if you don't bother to optimise the scraping at all.  

(Note: you should only need to scrape books published in 2018 onwards, as there is an existing public dataset of 2.3M books up until 2017 [here](https://mengtingwan.github.io/data/goodreads.html))

# Get the ISBNs of ~every book  

The first step is to download the Open Library data dump. Basically, you can download all of Open Library's book data [here](https://openlibrary.org/developers/dumps) (in fact I used a torrent as archive.org was still recovering from the recent cyberattack). See [here](https://github.com/LibrariesHacked/openlibrary-search) for detailed instructions on processing this data.  

Once you have processed the data files (i.e. you've just run openlibrary_data_process_chunked.py from that second link, but before setting up the database itself), you can use R to import all the CSV files and use some simple string manipulation extract only the ISBNs.  

The following R code basically pulls the ISBNs out of all of those CSV files and saves it to a text file. The final result, at least for the years that I've specified, has only 11 million lines.  

~~~
library(readr) #for reading in large text files
library(stringr) #For string manipulation

# List text files
all_csv_files <- list.files("../openlibrary-search/data/processed/",
                            pattern="editions_")

# For each of those text files
for (i in all_csv_files){
  print(i)
  print(Sys.time())
  csv_lines <- read_lines(paste0("../openlibrary-search/data/processed/",i))
  length(csv_lines)

  # Restrict to English-language books
  csv_lines_english <- csv_lines[which(grepl("languages/eng",csv_lines))]
  length(csv_lines_english)

  # Restrict to books with a particular set of years
  date_chunk <- str_match(csv_lines_english,"publish_date\": \"(.*?)\"")[,2]
  csv_lines_year <- csv_lines_english[which(grepl("2023|2022|2021|2020|2019",date_chunk))]
  length(csv_lines_year)

  # Extract the ISBN of each row
  string_isbn <- "\"isbn_13\": \\[\"([0-9]){13}"
  isbn_match <- str_match(csv_lines_year,string_isbn)[,1]
  isbn <- substr(isbn_match,nchar(isbn_match)-12,nchar(isbn_match))

  # Write the ISBN from this batch to the end of a text file
  write_lines(isbn,"ol_isbn_last5years.txt",append=T)
  }
~~~

Up to this point, all we've done is download the publicly available Open Library data dump and used very simple tools to extract the ISBNs. Nothing that we've done so far has directly involved Goodreads.  

## Download the Goodreads page(s)  
The next step is to use the ISBNs to scrape Goodreads and download the data about the books that only Goodreads has.  

The trick here is that you can search on Goodreads by ISBN. This means that you can download the Goodreads page of a book just by knowing the ISBN.  

The following code shows how you can do this for a single ISBN (assuming that it exists in your R environment as an object named "isbn"). This is trivial to automate to run for a bunch of ISBNs, which you would need to do if you want to assemble a large dataset to use for advanced searching.  

~~~
library(httr)
library(rvest)
url <- paste0("https://www.goodreads.com/search?q=", isbn)
response <- GET(url)
soup <- read_html(response)
~~~

## Process the data  

Lastly, we want to turn that ugly pile of HTML into some key variables that we actually care about.  

Here is some code, which I adapted from the R package [Goodreader](https://cran.rstudio.com/web/packages/Goodreader/Goodreader.pdf). Much of this is copied directly from the code of the function scrape_books() within that package. I made some small modifications for my own convenience, plus some non-trivial changes to the genres code (scrape_books() wasn't getting the genres for me, which I think might be because of the recent changes in the Goodreads page layout).  

This code is for a single book, but it is also trivial to automate for many books.  

~~~
library(magrittr)

book_title <- soup %>% rvest::html_node("h1[data-testid='bookTitle']") %>%
           rvest::html_text() %>% gsub("\n", " ", x = .) %>%
           trimws()

  genres_div <- soup %>% rvest::html_node("[data-testid='genresList']")
  genres <- ""
  if (!is.null(genres_div) & !is.na(genres_div)) {
                genres <- genres_div %>% rvest::html_nodes("*") %>%  #modified
                  rvest::html_text(trim = TRUE)
                genres <- unique(genres)
                genres <- genres[c(4:(length(genres)-2))] #modified
                genres <- toString(genres)
            }

  rating_bars <- soup %>% rvest::html_nodes("div.RatingsHistogram__bar")
  rating_distribution <- sapply(rating_bars, function(bar) {
        rating <- bar %>% rvest::html_attr("aria-label") %>%
          stringr::str_extract("^[0-9]")
        num_ratings <- bar %>% rvest::html_node("div.RatingsHistogram__labelTotal") %>%
          rvest::html_text() %>% stringr::str_extract("^[0-9,]+") %>%
          gsub(",", "", x = .)
        stats::setNames(num_ratings, rating)
      })
   rating_distribution <- toString(rating_distribution)

   book_details <- soup %>% rvest::html_node("div.DetailsLayoutRightParagraph") %>%
          rvest::html_text()
   author <- soup %>% rvest::html_node("a.ContributorLink") %>%
           rvest::html_node("span.ContributorLink__name") %>%
           rvest::html_text(trim = TRUE)

   num_reviews <- soup %>% rvest::html_node("span[data-testid='reviewsCount']") %>%
           rvest::html_text() %>% gsub("[^0-9]", "", x = .)
   average_rating <- soup %>% rvest::html_node("div.RatingStatistics__rating") %>%
           rvest::html_text(trim = TRUE)

   data.frame(book_title,author,genres,num_reviews,average_rating,rating_distribution,book_details)
~~~
