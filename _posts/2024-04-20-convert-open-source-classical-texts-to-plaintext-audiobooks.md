---
layout: post
title: "Convert open-source classical texts to plaintext audiobooks"
tags: plaintext religion life-ops code
---
This may be the nerdiest thing I've ever done (and that is saying something).
1. Find and download an open source, plaintext translation of a spiritual or philosophical text (downloads for the Christian Bible and Buddhist Sutras below).
2. Write and run a script to edit the structure of the text file(s) such that a) each separate text (e.g. each Biblical book or each Sutra) is its own text file, and b) there aren't any annoying extras like verse numbers. (I did this in R, you could probably do it with a bash script or whatever.)
3. Sync between your computer and phone (e.g. using SyncThing).
4. Download a text-to-speech app on your phone (e.g. eSpeak TTS from F-Droid).

Bam. Free, open-source, audiobook versions of whatever religious or philosophical text.

Christian Bible downloads:
- https://openbible.com/texts.htm
- https://www.biblesupersearch.com/bible-downloads/ (I downloaded the zip file full of CSVs, then just chose the American Standard Version, asv.csv)

Buddhist texts:
- Pali canon, from the team led by Bhikku Sujato, at [SuttaCentral.net](https://suttacentral.net/) and [the associated Github](https://github.com/suttacentral) (Note: The easiest way I've found to obtain these in  plain text is to download the entire "sc-data" repository, and navigate to sc-data-main/html_text/en/pli/sutta (or whichever basket you want!). This folder contains e.g. Majjhima Nikaya (/mn/) and so on.

R code to convert the asv.csv to my desired format of one book per file, with chapter headings and text but nothing else:
```R
#Read CSV
asv <- read.csv("asv.csv", skip = 5, header = TRUE)

#Rearrange the columns so it's book number, then book name, then chapter number,
#then text
#I don't care about the verse numbers
asv <- asv[,c("Book.Number","Book.Name","Chapter","Text")]

for (i in unique(asv$Book.Number)){
  #Get the book name
  book_name_tmp <- asv[which(asv$Book.Number==i),]$Book.Name[1]

  #Make a data frame that contains only verses from this book
  #(with chapters and text)
  asv_tmp <- asv[which(asv$Book.Number==i),c("Chapter","Text")]

  #Create a blank vector to store this book
  asv_tmp_forwrite <- c()

  #I want to slot chapter numbers in as additional text, for easy
  #navigation etc
  for (j in unique(asv_tmp$Chapter)){
    asv_tmp_forwrite <- c(asv_tmp_forwrite,
                          paste0("Chapter ",j),
                          asv_tmp[which(asv_tmp$Chapter==j),]$Text)
  }

  #Write this book to a text file
  write(asv_tmp_forwrite, file=paste0("asv/asv_",i,"_",book_name_tmp,".md"))
}
```

Bash script to convert Majjhima Nikaya from HTML to plain text:
```bash
#!/usr/bin/env bash
for filename in "/home/doctoreleven/Nextcloud/Codebook/plain_text_wisdom/mn"/*".html" ; do cat $filename | sed 's/SC [0-999]*</</g' | sed 's|<[^>]*>||g' | sed 's|mn.*.[0-999]||g' > "${filename//.html}.md"; done
```
