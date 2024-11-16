---  
layout: post  
title: "Tips for excellent visual science communication"  
---  

1. Scientific posters: Try the Better Poster ([video 1](https://www.youtube.com/watch?v=1RwJbhkCA58), [video 2](https://www.youtube.com/watch?v=SYk29tnxASs)). Many of the lessons in these videos can be applied in designing graphs too.  
2. Colour schemes: To generate swanky (and colour-blind friendly) colour palettes for graphs, websites, diagrams, or documents, try [Coolors](https://coolors.co/).  
3. Graphs: It should go without saying that the best package for generating graphs is the R package ggplot, which is stupidly powerful. Certainly read the documentation/browse the internet to get an idea of its capabilities and the fine level of control that this package offers over all components of the graph. Set your theme to something better than the default theme (e.g. theme_bw() or even theme_void() if you're feeling edgy) and this will do much of the heavy lifting. You can also use the gridExtra package to arrange multiple ggplot graphs on a page (example output: see figure 1 in [this paper](https://www.publish.csiro.au/sr/pdf/SR23168)).    
4. Colour maps: When using colour inside a graph (e.g. to map a particular continuous variable on a graph), use the [viridis colour maps](https://cran.r-project.org/web/packages/viridis/vignettes/intro-to-viridis.html). The quality of these colour maps are astonishing—unlike most other colour maps that are commonly used in scientific graphs, these colour maps are attractive, visually meaningful, and accessible, and they even work printed in greyscale! They easily integrate with ggplot too.  
