---
layout: post
title: "Making systematic literature searches slightly more automated"
tags: plaintext research life-ops self-improvement
---
Install the package here: https://elizagrames.github.io/litsearchr/
Use is demonstrated here: https://elizagrames.github.io/litsearchr/litsearchr_vignette.html

The only part of that latter link that requires any manual processing is categorising the automatically determined keywords by your categories.

I realised that if you have a large language model installed locally on your computer, you can use R's system() command to get the LLM to do stuff for you inside R.

Thus, you can automate the process of categorising the automatically determined keywords.

In the following R code, I've adapted the code from the second link:
1. I specify my native search terms up-front
2. I repeat the process demonstrated in the second link
3. I save the automatically generated keywords to file
4. I use system() to call llm (which I installed on my computer previously, using gemini-pro) and give it a prompt to assign each automatically generated keyword to a category
5. I ffinally do a little bit of text manipulation on the results to make it readily pastable into Web of Science or whatever database

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
