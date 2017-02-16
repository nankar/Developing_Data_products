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
  
  output$histPlot <- renderPlot({ ifelse(input$Show_mtcars_Histogram,hist(mtcars$mpg),"")
  })
  
  output$histbrkPlot <- renderPlot({ ifelse(input$show_mtcars_Histogram_with_Breaks, hist(mtcars$mpg, breaks=as.numeric(input$breaks), col="blue"),"")
  })
  
  output$histcurvePlot <- renderPlot({ 
    
    h <- hist(mtcars$mpg, breaks=as.numeric(input$breaks), col="blue")
    lines(seq(min(mtcars$mpg),max(mtcars$mpg),length=20) ,
          dnorm(seq(min(mtcars$mpg),max(mtcars$mpg),length=20) ,
                mean=mean(mtcars$mpg),
                sd=sd(mtcars$mpg)) *diff(h$mids[1:2])*length(mtcars$mpg) , col="red", lwd=2)
  })
  
  output$densityPlot <- renderPlot({ 
    d <- density(mtcars$mpg)
    plot(d)
   
  })
  
  output$summarydata <- renderTable(summary(mtcars))
  
 # output$predanalyze <- renderPlot({ 
#  plot(mtcars$mpg, mtcars$gear, xlab="Miles Per Gallon", ylab="Gear for car models")
#    })
  
  formulaText <-reactive({
    #val <- input$variable
    paste("Plot for mpg ~", input$variable)
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
  
})
