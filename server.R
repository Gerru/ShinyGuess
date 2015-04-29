library(shiny)

# Generate a random number between 1 and 30 
x <- sample(1:30, 1)

# Create default values
i <- 0     #will be used to store all guessed numbers

wrc <- array()  #array to make it possible to change the 
                #colours of the bars in the barplot

shinyServer(function(input, output) {
  
  observe ({
    
    input$goButton
    
    y <<- isolate(input$guess)
    
    # Creates a list of guessed numbers
    if (i == 0) { values <<- y } else values <<- c(values, y) 
    #values <<- c(values, y)
    l <<- length(values)
    i <<- i + 1
    
    # Create various outputs and arrays depending on the number guessed 
    if (l == 1) 
      longtip <<- "Use the slider to select a number and press the Guess! button"
    
    else if (y == x) {
      wrc <<- cbind(wrc, c(0, 0, y))
      tip <<- "Correct!"
      longtip <<- "Congratulations, you guessed the correct number"
    }
    else if (y > x) {
      wrc <<- cbind(wrc, c(0, y, 0))
      tip <<- "Too High!"
      longtip <<- "You guessed too high"
    }
    else if (y < x) {
      wrc <<- cbind(wrc, c(y, 0, 0))
      tip <<- "Too Low!"
      longtip <<- "You guessed too low"
    }
  })  
  
  # Return a sentence for too high/low or correct
  output$result <- renderText({
    input$goButton
    return(longtip)
  })
  
  # Return a sentence for too high/low or correct
  output$result2 <- renderText({
    input$goButton
    yyy <- paste("Last guess: ", y)
    return(yyy)
  })  
  
  #Generating the Barplot
  output$guess_plot2 <- renderPlot({
    input$goButton
    
    if (l == 1)
      barplot(1, ylim = c(0, 30))   #an empty barblot to display at start
    
    else {
      colnames(wrc) <- values[1:l]  #adding guessed number as colnames
      #to display the values on the plot 
      barplot(wrc[,2:l], 
              xlab = tip,
              main = "",
              ylim = c(0, 30),
              col=c("blue", "red", "green"))
    }
    
  })
  
  
})