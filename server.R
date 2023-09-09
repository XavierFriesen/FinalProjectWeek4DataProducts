library(shiny)
library(dplyr)
shinyServer(function(input, output) {
      model1 <- lm(weight ~ Time + as.factor(Diet), data = ChickWeight)
      
      model1pred <- reactive({
            TimeInput <- input$sliderAge
            DietInput <- as.factor(input$diet)
            predict(model1, newdata = data.frame(Time = TimeInput, Diet = DietInput))
      })
      
      output$plot1 <- renderPlot({
            TimeInput <- input$sliderAge
            DietInput <- input$diet
            model1 <- lm(weight ~ Time, data = subset(ChickWeight, Diet == DietInput))
            
            plot(weight ~ Time, data = subset(ChickWeight, Diet == DietInput),
                 xlab = "Age of Chicken in Days", 
                 ylab = "Expected Weight", bty = "n", pch = 16,
                 xlim = c(0, 22))
            abline(model1, col = "red", lwd = 2)
      })
      
      output$pred1 <- renderText({
            model1pred()
      })
      
})
