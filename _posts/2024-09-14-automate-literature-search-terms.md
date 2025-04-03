---
layout: post
title: "Making systematic literature searches slightly more automated"
tags: research life-ops self-improvement code
---
# 1. Automatic keyword generation  
Install the package here: https://elizagrames.github.io/litsearchr/  
Use is demonstrated here: https://elizagrames.github.io/litsearchr/litsearchr_vignette.html  

The only part of that latter link that requires any manual processing is categorising the automatically determined keywords by your categories.  

I realised that if you have a large language model installed locally on your computer, you can use R's system() command to get the LLM to do stuff for you inside R.  

Thus, you can automate the process of categorising the automatically determined keywords.  

In the following R code, I've adapted the code from the second link:  
1. I specify my naive search terms up-front  
2. I repeat the process demonstrated in the second link  
3. I save the automatically generated keywords to file  
4. I use system() to call llm (which I installed on my computer previously, using gemini-pro) and give it a prompt to assign each automatically generated keyword to a category  
5. I finally do a little bit of text manipulation on the results to make it readily pastable into Web of Science or whatever database  

~~~  
library(litsearchr)  

naive_terms <- c("black-backed woodpecker","forest","fire")  
naiveresults <- import_results(file="savedrecs.txt",verbose=T)  
rakedkeywords <- extract_terms(text=paste(naiveresults$title,naiveresults$abstract),  
  method="fakerake", min_freq=2, ngrams=T,min_n=2, language="English")  
taggedkeywords <- extract_terms(keywords = naiveresults$keywords,  
    method = "tagged",min_freq = 2,ngrams = TRUE,min_n = 2,language = "English")  
all_keywords <- unique(append(taggedkeywords, rakedkeywords))  
naivedfm <-  create_dfm(elements = paste(naiveresults$title, naiveresults$abstract),  
    features = all_keywords)  
naivegraph <- create_network(search_dfm = naivedfm,  
    min_studies = 2,min_occ = 2)  
cutoff <- find_cutoff(naivegraph,method = "cumulative",percent = .80,imp_method = "strength")  
reducedgraph <- reduce_graph(naivegraph, cutoff_strength = cutoff[1])  
searchterms <- get_keywords(reducedgraph)  

llm_prompt <- paste0(  
"Here is a list of keywords for use in an academic database search.  
I want you to group these keywords by pre-specified categories.  
Your response should be given in the format:  
CATEGORY_1 (KEYWORD_1, KEYWORD_2, KEYWORD_3)  
CATEGORY_2 (KEYWORD_4, KEYWORD_5, KEYWORD_5)  

I will start with an example for illustrative purposes.  
Imagine the categories are: sugar, star  
Imagine the list of keywords is: ice-cream, sun, stellar, chocolate  

The correct response from you would be:  
sugar (ice-cream, chocolate)  
star (sun, stellar)  

That was just for illustrative purposes, so ignore those words.  

I will now give you the actual categories and keywords.  
The categories are:  
",  
paste(naive_terms,collapse="\n"),  
"\n\n",  
"The keywords are:  
",  
paste(searchterms,collapse="\n"))  

writeLines(llm_prompt,"llm_prompt.txt")  
system("cat llm_prompt.txt | llm -m gemini-pro > searchterms_sorted.txt")  

searchterms_sorted <- readLines("searchterms_sorted.txt")  
searchterms_sorted <- gsub(", ","' OR '",searchterms_sorted)  
searchterms_sorted <- gsub("^.*?\\(","(",searchterms_sorted)  
searchterms_sorted <- gsub("\\(","('",searchterms_sorted)  
searchterms_sorted <- gsub("\\)","')",searchterms_sorted)  
searchterms_sorted <- paste(searchterms_sorted,collapse=" AND ")  

writeLines(searchterms_sorted,"final_search_term.txt")  
~~~  

# 2. Automatic interpretation of abstracts  

I think this particular tool is *less* useful than it might seem, as it comes with some limitations.  

But basically if you install the R package gemini.R, you can write a large language model prompt and then ask Gemini to interpret that prompt given some abstract (if you read the abstracts from your full search into R). If you pop this into a loop, you can basically get Gemini to extract basic information from the abstract or even the full text of the paper.  

I would hesitate to use this for anything high-stakes, as Gemini (and other LLMs) frequently get things wrong. (Hence "Pandora's prompt" below!) I would certainly take care to validate the answers that the LLM produces if this information is action-relevant. But it could be useful to e.g. generate a quick summary of which country each study was conducted in.  

~~~
library(gemini.R)
library(ggplot2)

# Set API key
setAPI("YOUR_GEMINI_API_KEY_HERE")

# Load saved search results from a locally stored CSV file containing titles and abstracts
savedrecs_raw <- read.csv("savedrecs.csv")
savedrecs <- savedrecs_raw[, c("Title", "Abstract.Note")]  # Select only relevant columns (Title, Abstract)

# Prepare prompts for Gemini model queries
pandoras_prompt_base <- "Here is the title and abstract of a scientific journal article. Pretend you are the lead author of this paper, then answer the question that follows."
pandoras_prompt_2 <- "Tell me which country this was conducted in. Do not explain your answer; simply give the country name, using the UN two-letter code."

# Create placeholder columns for storing Gemini model replies
savedrecs$Gemini_reply_2 <- "a"

# Loop through each record (each title and abstract)
for (i in c(1:nrow(savedrecs))) {
  title_tmp <- savedrecs$Title[i]  # Get the title for the current article
  abstract_tmp <- savedrecs$Abstract.Note[i]  # Get the abstract for the current article

  # Prepare the prompt (introducing the question and asking for the country where the research was conducted)
  prompt_string_2 <- paste0(
    pandoras_prompt_base, "\n",
    "The title is:\n", title_tmp, "\n\n",
    "The abstract is:", abstract_tmp, "\n",
    "The question is:\n", pandoras_prompt_2
  )

  # Query the Gemini model with the first prompt and store the reply
  gemini_reply_tmp_2 <- gemini(prompt_string_2)

  # Wait 5 seconds (to avoid making too many calls at once)
  Sys.sleep(5)

  # Store the Gemini model replies in the corresponding columns
  savedrecs$Gemini_reply_2[i] <- gemini_reply_tmp_2
}

# Visualize the distribution of responses (countries) from the Gemini model using ggplot2
ggplot(aes(x=Gemini_reply_2), data=savedrecs) +
  theme_bw() +  # Make the theme not awful
  geom_bar()  # Create a bar chart
~~~
