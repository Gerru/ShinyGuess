library(shiny)

shinyUI(fluidPage(
    
  fluidRow(
    column(6, wellPanel(
      helpText("This is a simple Guess the number game made with R and shiny.",
               "Simply move the slider and click on Guess to choose your 1st number.",
               "Follow the tips and choose a higher or lower number based on the outcome."),
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



