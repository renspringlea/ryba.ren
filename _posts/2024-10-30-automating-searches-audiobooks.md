---
layout: post
title: "Automating searches for audiobooks"
---
I listen to audiobooks on multiple platforms: Libby (connected to my local library), Kobo, Audible (Australian market) and Audible (US market).  

Here is R code for automating the process of checking whether audiobooks exist on each of those platforms. (You may need to make simple modifications if you care about different Audible markets or if you don't use Libby.)  

All you have to do is modify the first three lines: the title and author of the book you want to search, and the Libby ID corresponding to your local library (if you want to use Libby).  

To get the Libby ID that corresponds to your library:  
- Go to [this website](https://libbysearch.com/) and click "Find Libraries"
- Search for your library
- Note the number that appears in the website URL (e.g. mine is 100243)
- Copy that number and paste it to the end of this URL: https://thunder.api.overdrive.com/v2/libraries/?websiteIds=
- Enter that URL into your web browser (e.g. for me this woudl be https://thunder.api.overdrive.com/v2/libraries/?websiteIds=100243)
- Search for "preferredKey" and then copy the subsequent ID key (e.g. mine is "sapln" for "South Australian Public Library Network")  

Note that this code isn't fully tested—in particular, I expect that the logical checks at the bottom of the code could be further refined. But it works for me.  

~~~
book_title <- "INSERT YOUR BOOK TITLE HERE"
author <- "INSERT THE AUTHOR NAME HERE"
libby_library <- "INSERT YOUR LIBBY ID KEY HERE"

raw_query <- paste0(book_title," ",author)
audible_query <- gsub(" ","+",raw_query)
libby_query <- URLencode(raw_query)
libby_format <- "audiobook-overdrive,audiobook-mp3"

url_audibleAU <- "https://www.audible.com.au/search?keywords=placeholder+text&k=placeholder+text&sprefix=%2Cfe-audible-au%2C598&i=fe-audible-au&url=search-alias%3Dfe-audible-au"
url_audibleUS <- "https://www.audible.com/search?keywords=placeholder+text&k=placeholder+text&overrideBaseCountry=true&overrideBaseCountry=true&ipRedirectOverride=true&ref_pageloadid=not_applicable&pf_rd_p=f2358941-9d61-45b7-b6b7-48b8a8a9a7a2&pf_rd_r=K6VK090EZTT01QQ8GDGJ&pageLoadId=8V9ZYCCpXWzc5XL5&creativeId=7e5ef24f-29c2-42b4-9ad7-cdff92184a00"
url_kobo <- "https://www.kobo.com/au/en/search?query=placeholder+text&fclanguages=en&pagenumber=1&fcmedia=AudioBook"

url_audibleAU <- gsub("placeholder\\+text",audible_query,url_audibleAU)
url_audibleUS <- gsub("placeholder\\+text",audible_query,url_audibleUS)
url_kobo <- gsub("placeholder\\+text",audible_query,url_kobo)

url_libby <- paste0(
  "https://thunder.api.overdrive.com/v2/libraries/",
  libby_library,
  "/media?query=",
  libby_query,
  "&format=",
  libby_format,
  "&page=1&perPage=20"
)

search_audible_AU <- httr::GET(url_audibleAU)
soup_audible_AU <- rvest::read_html(search_audible_AU) %>%
  rvest::html_text()
result_audible_AU <- str_count(soup_audible_AU,row$book_title)>2

search_audible_US <- httr::GET(url_audibleUS)
soup_audible_US <- rvest::read_html(search_audible_US) %>%
  rvest::html_text()
result_audible_US <- str_count(soup_audible_US,row$book_title)>2

search_kobo <- httr::GET(url_kobo)
soup_kobo <- rvest::read_html(search_kobo) %>%
  rvest::html_text()
result_kobo <- str_count(soup_kobo,row$book_title)>2

search_libby <- httr::GET(url_libby)
soup_libby <- rvest::read_html(search_libby) %>%
  rvest::html_text()
result_libby <- str_count(soup_libby,row$book_title)>1

result <- paste0("Audiobook available at: ",
                 ifelse(result_libby,"Libby; ",""),
                 ifelse(result_kobo,"Kobo; ",""),
                 ifelse(result_audible_AU,"Audible (AU); ",""),
                 ifelse(result_audible_US,"Audible (US)","")
                 )
result

~~~
