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
  titlePanel("hello world"),
  h3("this is shiny world"),
  p("this is a shiny path"),
  br(),
  hr(),
  fileInput('file1', 'choose csv file', multiple = FALSE),
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("bins",
                   "Number of bins:",
                   min = 1,
                   max = 50,
                   value = 30)
    ),
    
    myfile <- reactive({
      if (is.null(input$file1)){return()}
      mydata <- read.csv(input$file1$datapath,header=TRUE, sep=",")
      return(mydata)
    }),
    
    output$table = renderDataTable({
        myfile( q)
    }),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot")
    )
  )
))
