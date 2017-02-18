Shiny_App_for_mtcars Dataset
========================================================
author: Amol Nankar
date: Feb 18, 2017
width: 1440
height: 900

Introduction
========================================================
You can use this application to view histogram, dataset with dynamic inputs provided through side bar panel
- In Histogram tab, you can view the histogram based on input selection. Explained in next slide
- View Data tab displays record from mtcars dataset.
- In reactive analysis tab,it shows relation of MPG with no.of cylinders or transmission with input selection
- Explore tab has another reactive analysis that discovers which variables predict miles per gallon (MPG) and provide summary for the same. You need to select input variable as column name from list to view relation.
Note- when you select any input/method on side panel click on appropriate tab to view results  </small>

Input for Histogram and ViewData tab in App
========================================================
Histogram Tab
<small> - a. Number of breaks we need to apply in histogram between 1 to 12should be selected in sidebar panel
   This value is used in tab of histogram with normal curve and histogram of mtcars </small>
<small> - b. Check individual observation input box if you want to have individual observations in histogram  </small>
<small> - c. Check density input box to draw density over histogram and adjust bandwidth to check difference </small>

ViewData Tab
<small> - a. Initially it shows 10 rows per page, you can change the number of rows per page by selecting value in show tab </small>
<small> - b. To sort data/records on particular column, click on column name.Blue colored column means records are sorted using this column </small>
<small> - c. You can also search for particular record by entering required column value in search text box. </small>     
Sample Histogram from App
========================================================

```r
hist(mtcars$mpg,
         probability = TRUE,
         breaks = as.numeric(20),
         xlab = "Miles per Gallon",
         main = "Histogram for mtcars Dataset")
```

![plot of chunk unnamed-chunk-1](Shiny_App_for_mtcars-figure/unnamed-chunk-1-1.png)

Reactive analysis for mtcars
========================================================

 ![my image](reactive_analysis.png) 
 ***
 ![my image](mpgVswt.png) 
