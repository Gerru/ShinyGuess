library(shiny)

shinyUI(fluidPage(
    
  fluidRow(
    column(6, wellPanel(
      sliderInput("guess", "Guess a number between 1 and 30:",
                  min = 0, max = 30, value = 0, step = 1),
      
      actionButton("goButton", "Guess!")
      
    ))),
  
  fluidRow(column(6, verbatimTextOutput("result"))),
  
  fluidRow(column(6, verbatimTextOutput("result2"))),
  
  fluidRow(
    column(6, wellPanel( 
  checkboxInput(inputId = "hideplot",
                label = "Hide Barplot",
                value = FALSE),
  conditionalPanel(condition = "input.hideplot == false",
                plotOutput(outputId = "guess_plot2", height = "300px"))
              )))
  
))



