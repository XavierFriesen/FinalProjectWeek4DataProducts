library(shiny)

shinyUI(fluidPage(
      titlePanel("Predict Chicken Weight based on Age and Diet"),
      sidebarLayout(
            sidebarPanel(
                  sliderInput("sliderAge", "What is the age of the chicken in days?", 0, 21, value = 10),
                  textInput("diet", "Enter diet (1, 2, 3 or 4)", value = "1")
            ),
            mainPanel(
                  h3("Predicted Weight of Chicken"),
                  textOutput("pred1"),
                  h4("Average Weight for a Chicken vs age for the selected diet"),
                  plotOutput("plot1")
            )
      )
))
