---  
layout: post  
title: "Making your high-value leisure time easier"  
---  

Many authors argue, and I agree, that high-value leisure time is a critical component of sustaining your impactful work over the long term.  

Sometimes, I'm exhausted/depressed/whatever, and I know that I need to pursue some high-quality leisure time. But frequently it's hard for my brain to step over the small hurdle necessary to get from low-quality leisure to high-quality leisure. I've found that it helps to remove this hurdle, or at least make it as small as possible.    

(When I say "high-quality leisure", I mean worthy and constructive pursuits that feed your soul. These certainly need not be *productive* pursuits—one of my low-energy but high-quality leisure activities is watching soccer. But you know it when you see it.)  

My favourite example is using the command-line tool yt-dlp to automatically  download specific content from Youtube as it is uploaded.  

I use this generic script that downloads all videos published by a specific Youtube channel and save them to file:  
~~~  
yt-dlp -v -o "OUTPUT_FOLDER_1/%(title)s.%(ext)s" --dateafter today-6weeks --download-archive archive1.txt YOUR_FAVOURITE_YOUTUBE_CHANNEL  
~~~  
(Read the documentation for yt-dlp. This software is very versatile! You can set filters by duration, e.g. if you only want some types of videos from your content creator but not others, and you can obtain the live streams of a channel rather than only the uploaded videos. You can also automatically extract just the video [which I have done above] or just the audio if you are only interested in the visuals or audio.)  

I also use the command-line tool crontab to automatically run that above script (e.g. daily), and then the truly excellent software syncthing to sync the downloaded videos with my streaming device (specifically, my partner's laptop which is hooked up to our projector!).  

I've found that this is an excellent way to make sure that I always have ready access to the content that feeds my soul (e.g. soccer videos, relaxing scenery videos, even queer Bible studies!!). This leads to far fewer distractions than browsing Youtube; since I decide in advance what content I would like to consume, I find that I am less likely to become distracted by low-quality content during my limited leisure time.  

I also use syncthing to automatically save some audio-only content to my phone, allowing me to then listen to that content using an app whose only function is to play audio files. Apps like [Escapepod](https://f-droid.org/en/packages/org.y20k.escapepod/) (for podcasts) and [URL Radio](https://github.com/jamal2362/URL-Radio) (for radio channels) achieve a similar function, and cause me far fewer distractions than having to navigate through commercial apps like Spotify.  
