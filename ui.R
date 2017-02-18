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
  titlePanel("Shiny App for mtcars Dataset Analysis"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      helpText("Click on Histogram tab and view histogram with below options"),
      selectInput(inputId = "n_breaks",
                  label = "Select Number of bins in Histogram",
                  choices = c(10, 20, 35),
                  selected = 10),
      checkboxInput(inputId = "individual_obs",
                    label = strong("Show individual observations"),
                    value = FALSE),
      
      checkboxInput(inputId = "density",
                    label = strong("Show density estimate"),
                    value = FALSE),
      helpText("You can adjust bandwidth after selection of density checkbox"),
      conditionalPanel(condition = "input.density == true",
                       sliderInput(inputId = "bw_adjust",
                                   label = "Bandwidth adjustment:",
                                   min = 0.2, max = 2, value = 1, step = 0.2)),
      
      br(),
      helpText("Click on Reactive Analysis tab to view result"),
      selectInput(
        "variable","Select Value for understanding relation with MPG",
        list("Cylinders"="cyl",
             "Transmission"="am")),
      br()
      
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(
        tabPanel("Documentation", uiOutput ("text")),
      
        tabPanel("Histogram", plotOutput("distPlot")),
        tabPanel("ViewData", dataTableOutput('mytable')),
        tabPanel("Reactive Analysis",textOutput("caption"),plotOutput("mpgPlot")),
       
        tabPanel("Explore",
                 fluidPage(
                   p("Discover which variables predict miles per gallon (MPG)"),
                   fluidRow(
                     selectInput("variable1", "",
                                 c("Number of cylinders" = "cyl",
                                   "Displacement (cu.in.)" = "disp",
                                   "Gross horsepower" = "hp",
                                   "Rear axle ratio" = "drat",
                                   "Weight (lb/1000)" = "wt",
                                   "1/4 mile time" = "qsec",
                                   "V-engine / Standard" = "vs",
                                   "Transmission" = "am",
                                   "Number of forward gears" = "gear",
                                   "Number of carburetors" = "carb"
                                 )
                     ),
                     fluidRow(
                       plotOutput("mpgPlot1"),
                       verbatimTextOutput("summaryFit")
                     )
                   )
                 )
        )
      
        
        
        
        
      )
       
    )
  )
))
