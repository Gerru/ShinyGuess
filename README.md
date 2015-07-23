## ShinyGuess
##### Guess the number app using R and shiny

This is a simple guess the number game, that uses a slider to select the number. 
At the start of the game, a random number between 1 and 30 is selected. This number is compared to the user's guess 
and a result of "too high", "too low" or "correct" is given.
The guesses are displayed on a bar graph that changes the colour of the bar according to the outcome of the guess.
To achieve this, the guesses are recorded on different rows based on the outcome, and then plotted as a "stacked plot" where each bar are represented by 100% of a row.
