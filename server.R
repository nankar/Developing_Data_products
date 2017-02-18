#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  
  output$text <-  renderUI({
    str1 <- paste(h4("This is shiny app for mtcars dataset analysis."))
    str2 <- paste(h5("You can use this application to view histogram, dataset with dynamic inputs provided through side bar panel"))
    str3 <- paste(tags$b("1. In Histogram tab, you can view the histogram based on input selection as below:"))
    str4 <- paste(em("a. Select number of bins you want to use as a breaks in histogram."))
    str5 <- paste(em("b. Click on checkbox of individual observation to see individual row marks."))
    str6 <- paste(em("c. Click on density checkbox to for density and you can adjust the bandwidth with slidebar."))
    
    str7 <- paste(tags$b( "2. View Data tab displays record from mtcars dataset. " ))
    str8 <- paste(em("a. Initially it shows 10 rows per page, you can change the number of rows per page by selecting value in show tab"))
    str9 <- paste(em("b. To sort data/records on particular column, click on column name.
                         Blue colored column means records are sorted using this column"))
    str10 <- paste(em("c. You can also search for particular record by entering required column value in search text box."))             
    
    str11 <- paste(tags$b("3. In reactive analysis tab, it will show relation of Miles per Gallon with no.of cylinders or transmission  with based on input selection" ))
    str12 <- paste(tags$b("4. Explore tab has another reactive analysis that discovers which variables predict miles per gallon (MPG) and provide summary for the same"))
    
    strn <- paste("Please note when you select any input/method on side panel click on appropriate tab to view results")
    HTML(  paste(  str1,str2,str3,str4,str5,str6,str7,str8,str9,str10,str11, str12, strn, sep ='<br/>')  )
  })
  
  
  output$distPlot <- renderPlot({
    
    hist(mtcars$mpg,
         probability = TRUE,
         breaks = as.numeric(input$n_breaks),
         xlab = "Miles per Gallon",
         main = "Histogram for mtcars Dataset")
    
    if (input$individual_obs) {
      rug(mtcars$mpg)
    }
    
    if (input$density) {
      dens <- density(mtcars$mpg, adjust = input$bw_adjust)
      lines(dens, col = "blue")
    }
  })
  
  output$mytable = renderDataTable({
    mtcars
  }, options = list(bSortClasses = TRUE, iDisplayLength = 10))
  
  
  formulaText <-reactive({
    #val <- input$variable
    paste("Plot for MPG ~", input$variable)
  })
  
  
  output$caption <- reactiveText(function() {
    formulaText()
  })
  
  output$mpgPlot <- reactivePlot(function() {
    if (input$variable == "am") {
      # am
      mpgData <- data.frame(mpg = mtcars$mpg, var = factor(mtcars[[input$variable]], labels = c("Automatic", "Manual")))
    }
    else {
      mpgData <- data.frame(mpg = mtcars$mpg, var = factor(mtcars[[input$variable]]))
    }
    
    ggplot(mpgData, aes(var, mpg)) + 
      geom_boxplot(outlier.size = ifelse(2==2, 2, NA)) +
      xlab(input$variable)
  })
  
  formulaString <- reactive({
    paste("mpg ~ ", input$variable1)
  })
  
  fit <- reactive({
    lm(as.formula(formulaString()), data = mtcars)
  })
  
  output$summaryFit <- renderPrint({
    summary(fit())
  })
  
  output$mpgPlot1 <- renderPlot({
    with(mtcars, {
      plot(as.formula(formulaString()), main = formulaString())
      abline(fit(), col = 4)
    })
  })
  
})
