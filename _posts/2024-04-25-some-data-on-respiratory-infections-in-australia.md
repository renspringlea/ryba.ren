---
layout: post
title: "Some data on respiratory infections in Australia"
tags: life-ops research social-challenges
---
**A very important note: I'm neither an epidemiologist nor a doctor. I like data, and I want to do what I can to keep myself and my community safe. This is a blog article that I wrote for myself and to share with a handful of interested friends, and it doesn't remotely resemble a peer-reviewed journal publication or official government health advice. If you're after advice on what to do, please go see a GP, contact a qualified epidemiologist, or contact the health department of the government where you live.**

I'm interested in the incidence of respiratory infections for two reasons:
1. The incidence of COVID, relative to other types of respiratory infections, is relevant for guesstimating the positive impact of taking measures to prevent and control infections in my day-to-day life (e.g. wearing masks, using hand sanitiser, and so on).
2. There is a strong sense in the community that we are "post-COVID" or that, given that the governments in Australia have ended the 2020-era restrictions, the pandemic is "over". It'd be useful to see if there as data that actually supports this view. For me, it was very useful to have reliable, regularly updated data on how rates of COVID changed over time.

My dear brother told me about a useful data source for the incidence of respiratory infections in Australia: the Australian Respiratory Surveillance Reports, published by the Federal Government. From the website: "We compile each report from several data sources used to monitor the: distribution of acute respiratory illness activity in the community, severity of infections, populations which might be at-risk for severe infections, [and] impact of acute respiratory illness activity on the community and health system in Australia."

## FluTrack

FluTrack surveys are used to estimate "Fever and Cough Incidence", defined as "the number of new cases of fever and cough in participants over a specified period of time (usually the most recent reporting week)". The surveys use social media volunteers, so while it's not a perfectly random sample, it's a pretty good approximation and gives valuable insights beyond monitoring people who present to healthcare services as being sick (and FluTrack weights the results by demographics to try to get representative results). There is actually FluTrack data back to 2010 available [here](https://info.flutracking.net/reports/australia-reports/), and visualising this data could be a useful and interesting project at some point.

For my purposes, the biggest weakness of FluTrack is that it doesn't distinguish between different types of respiratory infections (e.g. COVID vs flu).

This graph from the FluTrack report (Week Ending – 31-Dec-23) shows the weekly incidence of fever and cough, as a percentage of the population, from April 2019 to December 2023. Helpfully labelled are the pre-pandemic infection rates (first arrow, around 1.5%), the height of the pandemic (BA.4/BA.5 fever & cough
surge, around 3%), and a similar spike due to influenza (around 3%).

I quite like the enormous trough from April 2020 to December 2021. I'm guessing that this corresponds to the social distancing policies that aimed to control the spread of COVID, but obviously would also control the spread of other infectious diseases - hence, the trough we see. I'm sure someone on the internet has calculated the number of lives accidentally saved by these policies (though obviously there are many genuinely negative effects on people's lives, like unemployment and harms to mental health, which the federal government put an admirable amount of resources into preventing).

The most recent FluTrack report as I write this (Week Ending – 21-Apr-24) shows that the fever and cough incidence throughout 2024 has, so far, remained mostly steady within the range of 1 to 1.75%, similar to the end of 2023.

Interestingly, current infection rates seem pretty similar to pre-pandemic rates. This could support the view that the COVID pandemic is "over" in Australia. On the other hand, since COVID can be more severe than other types of infections and cause higher rates of death and long-term complications, it could be that the relatively low rates of infections are obscuring a still-high rate of deaths and long-term complications. I haven't looked into this question further, though I'm sure data to test this claim would be relatively easy to find.

![Graph of FluTrack-estimated rates of fever and cough from 2019 to 2023](https://i.ibb.co/54ND4xs/Screenshot-from-2024-04-26-05-32-26.png)

## Notification to the NNDSS

The [Australian Respiratory Surveillance Report](https://www.health.gov.au/resources/collections/australian-respiratory-surveillance-reports-2024) combines a bunch of data sources. One that is particularly useful for my purposes (and usefully complements the FluTrack data above) is NNDSS notification. As the report says: "In Australia, states and territories report notified cases to the National Notifiable Diseases Surveillance System (NNDSS) based on the Australian national surveillance case definitions. For COVID-19, both laboratory-confirmed and probable cases are notified to the NNDSS and included in this report. For influenza and RSV, only laboratory-confirmed cases are notified to the NNDSS and included in this report."

So, NNDSS provides *a* measure of the relative rates of COVID, influenza, and RSV (respiratory syncytial virus). NNDSS notification is not a perfect data source - we might expect different types of diseases (e.g. COVID vs influenza) to be reported more or less often. Still, it is a useful measure if we have that caveat in mind.

The rate of *reported* COVID, influenza, and RSV (per 100,000 population) are available in Table 1 of the most recent report as I write this (report for "25 March to 7 April 2024"). The 2024 rates are (for 1 January to 7 April):
- COVID 376.8
- Influenza 125.1
- RSV 138.6

I think the best use for that data is to help us think about relative rates of COVID, compared to other infections. According to those rates above, COVID is responsible for 59% of infections *reported to the NNDSS and only counting those three specific viruses*. The corresponding proportions for influenza and RSV are 20% and 22%, respectively. (I'm focusing less on the absolute rates, since the NNDSS notifications would disproportionately capture the severe cases - you could think of these rates as the tip of an iceberg.)

## Presentation to ASPREN sentinel GPs and nurses

Another source of data in the Australian Respiratory Surveillance Report is presentation to GPs and nurse practitioners in the Australian Sentinel Practice Research Network (ASPREN). According to the ASPREN website: "The Australian Sentinel Practices Research Network (ASPREN) is a network of sentinel general practitioners and nurse practitioners who report de-identified information on Influenza like illness and other conditions seen in general practice."

The Australian Respiratory Surveillance Report for "25 March to 7 April 2024" writes: "In the year to date, 360 people presented to ASPREN sentinel general practitioners and nurse practitioners with new fever and cough symptoms and have been tested for respiratory viruses. Of those, 71.4% (257/360) tested positive for a respiratory virus. Among those positive for a respiratory virus, the most common respiratory virus reported was rhinovirus (37.7%; 97/257). Other respiratory viruses detected included SARS-CoV-2 (16.0%; 41/257), influenza (12.1%; 31/257), respiratory syncytial virus (9.7%; 25/257), metapneumovirus (8.6%; 22/257) and adenovirus (4.7%; 12/257)."

Thus, of the 257 positive tests, the distribution among viruses was:
- Rhinovirus 37.7%
- COVID 16.0%
- Influenza 12.1%
- RSV 9.7%
- Metapneumovirus 8.6%
- Adenovirus 4.7%
- Other respiratory viruses 11.3%

This is a really useful source of data, despite its small sample size.

Another interesting tidbit from this data is that we can zoom in on just COVID, influenza, and RSV, which offers a comparison with the NNDSS data (see above). If we restrict the ASPREN data to only those people who test positive for COVID, influenza, or RSV, we get a group of 97 people, distributed as follows:
- COVID 41/97 => ~42% (compare to 59% in NNDSS data)
- Influenza 31/97 => ~32% (compare to 20% in NNDSS data)
- RSV 25/97 => ~26% (compare to 22% in NNDSS data)

Those numbers are fairly similar, especially if you consider that the sample size of the ASPREN data (once we restrict the data to only people who tested positive for COVID, influenza, and RSV) is 97 people - if we used this sample to estimate population proportions, the error bars would be very wide. If the sample size were larger, we could calculate more precise population estimates. 

Nevertheless, the similarity between the ASPREN data and the NNDSS data provides confidence that both data sources are giving us similar answers. This leads to the natural conclusion that, if other types of respiratory infections were reported to the NNDSS (rhinovirus and so on), the rates of those viruses as estimated using the NNDSS data would be similar to the estimates produced using the APSREN data, above.

Therefore, if we want an estimate of what the rate of COVID *as a proportion of all serious infectious respiratory diseases*, then ~16% is probably a reasonable estimate.

