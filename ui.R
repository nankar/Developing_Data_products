#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Shiny App mtcars Data Analysis"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      helpText("mtcars dataset analysis using histogram"),
      textInput("breaks", label=h6("Number of breaks in histogram(Enter between 1 to 12)"), value="12"),
      checkboxInput("Show_mtcars_Histogram", "show/hide Histogram for mtcars", FALSE) ,
      checkboxInput("show_mtcars_Histogram_with_Breaks", "show/hide Histogram with Breaks", FALSE),
    
       br(),
      selectInput(
        "variable","Select Value for analysis",
        list("Cylinders"="cyl",
             "Transmission"="am"))
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      
      tabsetPanel(
        tabPanel("Normal Curve Plot", plotOutput("histcurvePlot")),
        tabPanel("Kernal Density Plot", plotOutput("densityPlot")),
        tabPanel("Summary of Dataset", tableOutput("summarydata"))
      ),
      
      plotOutput("mpgPlot"),
      plotOutput("histPlot"),
      plotOutput("histbrkPlot"),
      textOutput("caption")
    )
  )
))