Shiny_App_for_mtcars Dataset
========================================================
author: Amol Nankar
date: Feb 16, 2017
autosize: true

Introduction
========================================================

- This Shiny app analyzes mtcars dataset using histogram.  
- It is divided into three tabs: 
  
  1. Histogram with normal curve and also applies number of breaksto graph based on input provided in textbox 
  2. Kernel Density plot for mtcars dataset as it is much more effective way to view the distribution of a variable
  3. Know the mtcars dataset through summary
  
- This app also does reactive analysis of Miles per gallon vs input provided either transmission (automatic or manual)   or cylinders. You need to select either transmission or cylinders as an input through widget.
- Also, user can view histogram for mtcars and histogram with breaks i.e. number of bins based on input selection    through checkbox


Slide With Code of Histogram with Normal Curve
========================================================


```r
  h <- hist(mtcars$mpg, breaks=as.numeric(12), col="blue")
    lines(seq(min(mtcars$mpg),max(mtcars$mpg),length=20) ,
          dnorm(seq(min(mtcars$mpg),max(mtcars$mpg),length=20) ,
                mean=mean(mtcars$mpg),
                sd=sd(mtcars$mpg)) *diff(h$mids[1:2])*length(mtcars$mpg) , col="red", lwd=2)
```

![plot of chunk unnamed-chunk-1](Shiny_App_for_mtcars-figure/unnamed-chunk-1-1.png)

Reactive analysis plot in mtcars
========================================================

![my image](reactive_analysis.png)