---
layout: post
title: "Workflow for converting from PDF to audiobook using command-line tools"
tags: life-ops self-improvement plaintext
---
If you have the command-line tools pdftoppm, mogrify, tesseract, and gtts-cli installed, and the PDF file(s) in some directory:

~~~
for i in *.pdf; do pdftoppm "$i" "${i%.*c}.png" -png; done
mogrify -crop 690x1080+105+145 *.png
for i in *.png; do tesseract "$i" "${i%.*c}.txt"; done
for i in *.txt; do gtts-cli -t us --file "$i" --output "${i%.*c}.mp3"; done
~~~

Notes:
- 690x1080+105+145 are the dimensions of the text you want to text-to-speech on any given page, expressed as output width x output height + offset x + offset y
- t -us gives you a nice American accent; if you run gtts-cli from an Australian IP address, it'll give you a terrible Australian accent by default. Nobody wants to hear that! t --co.uk gives you a British accent which is nice too.
- gtts-cli sometimes fails partway through, so it's best to run when the text files are still all separate and then combine the mp3 files afterwards, rather than converting a single very large text file.
