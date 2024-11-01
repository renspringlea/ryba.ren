---
layout: post
title: "Better ways to search for movies and TV series"
---

1. A dataset of the names etc of 152,971 TV series, including a measure of quality/popularity, [here](https://www.kaggle.com/datasets/bourdier/all-tv-series-details-dataset).
2. A dataset of the names etc of 12,414 movies, including a measure of quality/popularity, [here](https://old.reddit.com/r/datasets/comments/1ecj6m2/dataset_for_rotten_tomatoes_movies_1970_2024/).
3. A tool for checking availability of a particular movie or series on streaming services [here](https://github.com/movieofthenight/ts-streaming-availability).
4. You could also automate the process of checking for content warnings on doesthedogdie.com by using that website's [API](https://www.doesthedogdie.com/api). I haven't done this yet, but I might at some point.  

To give an example for link #3, I downloaded the repository at that third link, and followed the instructions to set everything up using npm (Node Package Manager) and get an API key. Then I copied the Godfather example and made several modifications to the file index.ts:

~~~
import * as streamingAvailability from "streaming-availability";

const RAPID_API_KEY = "YOUR_API_KEY_HERE";

const client = new streamingAvailability.Client(new streamingAvailability.Configuration({
	apiKey: RAPID_API_KEY
}));

let show = await client.showsApi.getShow(
	{id: "replace_this_with_id", country: "au"}
);

console.log(show.title);
show.streamingOptions["au"].forEach((streamingOption) => {
	console.log(streamingOption.service.id);
});

~~~

(Because I live in Australia and I don't care about the show description.)

Now, I can use this R code to specify some movie or series ID then run the script for that ID. (The only reason I'm working in R here is personal preference and my existing workflow.)

~~~
library(readr)

# the format is like: tv/70 for TheMovieDatabase TV series ID
# movie/240 for TheMovieDatabase movie ID
# tt10048342 for IMDB ID
id <- "tv/70"

index <- read_lines("index.ts")
index <- gsub("replace_this_with_id",id,index)
write_lines(index,"index.ts")

system('npm start')

index <- read_lines("index.ts")
index <- gsub(id,"replace_this_with_id",index)
write_lines(index,"index.ts")
~~~

In fact, link #1 above (the TMDB TV series download) includes the TMDB ID number in the second column of the CSV file. You just need to change it from e.g. 13 to tv/13. (I don't care so much about movies!)  

Amazing how much work you have to do in order to not pirate :/
