#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application 
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Predict Stopping Distance when Break Applied"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
        
    sidebarPanel(
            
        h3('Steps to predict the stopping distance'),    
            p('1. Set the Speed of the car when break is applied in the below slider.'),    
        p('2. Check the prediction on the right side of the page.Scroll down the page if required.'),    
       sliderInput("sliderSpeed","What is the speed of the car?",4,25,value = 10)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(

        h3('Overview of Application'),
            p('This application predicts and displays the distance a car travels when breaks are applied.'),    
        p('The prediction is based on the speed of the car,when breaks are applied.From the analysis, it is found that distance is directly proportional to speed.Menaing, when the speed of the car is more,car moves more distance before stoping after applying breaks.'),
        
        plotOutput("distPlot"),
       h3("Predicted Stopping Distance (ft):"),
       textOutput("distPred"),
       p('In the above graph, dots represent the distance car moves when breaks are applied corresponding to speed of the car.The red line indicates the prediction line.Blue dot on the red line indicates the predicted speed.')
    )
  )
))
