#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required predict the stopping distance
shinyServer(function(input, output) {
   
        model1<-lm(dist ~ speed,data=cars)
        
        #Prediction
        distPred<-reactive({
                speedInput<-input$sliderSpeed
               predict(model1,newdata=data.frame(speed=speedInput))
                
                
        })
        
        output$distPlot<-renderPlot({
                speedInput<-input$sliderSpeed
                
                plot(cars$speed,cars$dist,xlab = "Speed (mph)",ylab = "Distance (ft)")
                abline(model1,col="red",lwd=2,pch=16)
                points(speedInput,distPred(),col='blue',pch=16,cex=2)
                legend(5,100,"Predicted Distance",pch=16,col='blue',cex=1.2)
        }
        )
        
        output$distPred<-renderText({
                distPred()
                
                
        })
})
