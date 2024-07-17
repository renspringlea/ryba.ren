---
layout: post
title: "Voice pitch training using R and the command line"
tags: life-ops self-improvement plaintext
---
1. Assemble some samples of voices that you like. You can do this using youtube-dl to download clips from Youtube and then chop them up using ffmpeg. If needed, you can also use ffmpeg to convert to mp3. Command line code:  

~~~~~~
youtube-dl -x [insert-some-video-url-here]
ffmpeg -i  file.m4a -ss 0 to 20 -c copy file2.m4a
ffmpeg -i file2.m4a file.mp3  
~~~~~~  

2. For comparison, record yourself speaking (e.g. in Audacity).  
3. Use the program aubio to extract the pitch of all the mp3 files in the specific directory (note that you need to install aubio first!). Command line code:  

~~~~~~  
for f in *.mp3; do aubiopitch -i "$f" > "${f%.o}.txt"; done  
~~~~~~  

4. Process the data and visualise in R. R code:  
~~~~~~  
# Get all files ending in .mp3.txt from the folder and read them as lines
# into R
filelist <- list.files(pattern = "*.mp3.txt")
datalist <- lapply(filelist, function(x)readLines(x))

# Prepare an empty data frame
df_clips <- data.frame("timestamp"=1.1111,
                       "pitch"=1.1111,
                       "sample"="tmp")

# For every file we loaded in, manipulate that data
# and store it into the data frame
for (i in c(1:length(filelist))){
  df_tmp <- data.frame("timestamp"=word(datalist[[i]],1),
                       "pitch"=word(datalist[[i]],2),
                       "sample"=substr(filelist[i],1,(nchar(filelist[i])-8)))
  df_tmp$timestamp <- as.numeric(df_tmp$timestamp)
  df_tmp$pitch <- as.numeric(df_tmp$pitch)
  df_clips <- rbind(df_clips,df_tmp)
}

# Remove that first row
df_clips <- df_clips[-1,]

# Restrict to roughly the typical human voice range
df_clips_restrict <- df_clips[which(df_clips$pitch<260 & df_clips$pitch>50),]

# Graph, with blue lines for the typical masculine voice range
# and pink lines for the typical feminine voice range
g1 <- ggplot(aes(x=timestamp,y=pitch,group=sample,colour=sample),data=df_clips_restrict) +
  geom_line(alpha=0.1) +
  geom_smooth(se=F) +
  geom_hline(yintercept=90, colour="navy",linetype="dashed") +
  geom_hline(yintercept=155, colour="navy",linetype="dashed") +
  geom_hline(yintercept=165, colour="salmon",linetype="dashed") +
  geom_hline(yintercept=255, colour="salmon",linetype="dashed")
g1

# Save graph to file
ggsave("g1.png",g1,width=6,height=4)
~~~~~~

![Image](https://i.ibb.co/XSZ5wYH/g1.png)
