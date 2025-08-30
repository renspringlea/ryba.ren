---
title: Ren Ryba
layout: home
---

{%   assign today = site.time | date: '%s'      %}
{%   assign start = '17-06-1996 04:00:00' | date: '%s'  %}
{%   assign secondsSince = today | minus: start     %}
{%   assign hoursSince = secondsSince | divided_by: 60 | divided_by: 60     %}
{%   assign daysSince = hoursSince | divided_by: 24  %}
{%   assign weeksSince = daysSince | divided_by: 7  %}
{%   assign lifeProp = weeksSince | divided_by: 4106.0  %}
{%   assign lifePerc = lifeProp | times: 100  %}
{%   assign lifePercRound = lifePerc | round  %}

*she/her or they/them*  

My work focuses on animal advocacy. I have been deeply involved in numerous fish welfare projects in particular. I worked at Animal Ask from 2021 to 2025, and I'm now an independent contractor. I like researching things, planning things, and organising things.  

I have experience in ecology, fisheries science, and statistics from my time in academia and government. I enjoy thinking about politics and social justice. I like soccer!  

* Proudly transgender and neurodivergent
* Kaurna land (South Australia)
* "Ryba" is pronounced "REE-ber" and it means "fish" in Slovak
* Years lived: {{lifePercRound}} %

## My work
* Academic publications @ [Google Scholar](https://www.scholar.google.com/citations?hl=en&user=hCCZcZYAAAAJ&view_op=list_works&sortby=pubdate)
* Animal advocacy research @ [Animal Ask](https://www.animalask.org/research)
* Additional hot takes @ [Effective Altruism Forum](https://forum.effectivealtruism.org/users/ren-ryba)
* Data on the European fish farming industry @ [Finsight](https://finsight.fish)
* Data on the global cage-free egg market @ [Cagefr.ee](https://cagefr.ee)  

## My books
<div style="display: flex; align-items: center; justify-content: space-between;"><span style="text-align: center; width: 50%;"><a href="/shrimp.html"><img src="/assets/images/shrimpbookcover.jpg" alt="Book cover for Shrimp and Prawn Welfare in the Wild-Caught Fishing Industry, showing an underwater close-up photograph of a red shrimp with white spots standing against grey-blue rocks" width="300" /></a></span><span style="text-align: center; width: 50%;"><a href="/trashfish.html"><img src="/assets/trashfish/cover_compressed.jpg" alt="Book cover for Trash Fish, a zine-style illustration of pink and blue fish with background images of a soccer ball, a rosary, and dog paws" width="300" /></a></span></div>

<div style="display: flex; align-items: center; justify-content: space-between;"><span style="text-align: center; width: 50%;"><i>Shrimp and Prawn Welfare in the Wild-Caught Fishing Industry: A Global Review and Recommendations for Research and Policy</i><br />An academic book with Shannon M Davis, Tse Yip Fai, and Peter Singer; preorder from CRC Press <a href="https://www.routledge.com/Shrimp-and-Prawn-Welfare-in-the-Wild-Caught-Fishing-Industry-A-Global-Review-and-Recommendations-for-Research-and-Policy/Ryba-Davis-Tse-Singer/p/book/9781032901459">here</a></span><span style="text-align: center; width: 50%;"><i>Trash Fish: Navigating the Shoals of Gender, Species, and Meaning in an Oppressive World</i><br />A book of autobiographical essays, free to read and download <a href="/trashfish.html">here</a><br /><br /></span></div>

<br />

## Blog  
*These posts are hot takes and tidbits on topics that I find interesting, not systematic or rigorous examinations. "Notes on" posts summarise key academic sources on a given topic, rather than involving my own reasoning or views. I do not use generative AI to write.*  

<script type="text/javascript">
  function filterUsingTag(selectedTag) {
    var id = 0;
    {% for post in site.posts %}
      var ts = {{ post.tags | jsonify }}

      var postDiv = document.getElementById(++id);
      postDiv.style.display =
        (selectedTag == 'All' || ts.includes(selectedTag))
          ? 'list-item'
          : 'none';
    {% endfor %}
  }
</script>

<p style="text-align: justify;">
filter&nbsp;
{%- assign tags = site.tags | sort -%}
{%- for tag in tags -%}
  {%- assign t = tag | first -%}
<a href="#disable" id="{{ t }}" onclick="filterUsingTag(this.id)">{{ t }}</a>&nbsp;
{%- endfor -%}
| <a href="#disable" id="All" onclick="filterUsingTag('All')">show all</a>
</p>
