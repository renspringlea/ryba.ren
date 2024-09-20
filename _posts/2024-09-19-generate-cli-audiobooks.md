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
ls -1 *.txt | sort | while read fn ; do cat "$fn" >> output.txt.file; done
tr '\n' ' ' < output.txt.file > output2.txt.file
gtts-cli -t us --file output2.txt.file --output audiobook.mp3"; done
~~~

Explanation:  
- Line 1: converts each PDF page to a separate png  
- Line 2: crops each png to the location of the text (which needs to be specified manually - see below), avoiding headers and footers etc  
- Line 3: uses tesseract to perform optimal character recognition, thus converting the png images to plain text  
- Line 4: merges the text files (ordered alphabetically) into a single text file  
- Line 5: replaces line breaks with spaces, which is necessary because tesseract inserts line breaks at the end of every physical line of text, and if these are left in, then the text-to-speech will interpret these as separate sentences (this gets annoying to listen to)  
- Line 6: performs the text to speech  

Notes:
- 690x1080+105+145 are the dimensions of the text you want to text-to-speech on any given page, expressed as output width x output height + offset x + offset y   
- t -us gives you a nice American accent; if you run gtts-cli from an Australian IP address, it'll give you a terrible Australian accent by default. Nobody wants to hear that! t --co.uk gives you a British accent which is nice too.  
- gtts-cli sometimes fails partway through, so an alternative (not shown here) is to use a loop to call gtts-cli separately for each text file. The benefit is that if gtts-cli fails, you don't have to start the gtts-cli text-to-speech conversion from scratch.  
