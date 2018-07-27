library(shiny)
library(dplyr)
library(scales)
library(ggplot2)
library(babynames)

shinyServer(function(input, output) {
  
  # Welcome the user
  userName <- eventReactive(input$go,{ input$name })
  userSex <- eventReactive(input$go,{ input$sex })
  userYear <- eventReactive(input$go,{ input$year })
  output$welcome <- renderText({ paste0("Welcome ",userName(),", nice to meet you!") })
  
  # Count the number of babies with this name
  nameCounter <- eventReactive(input$go,{
    babynames$n[which(babynames$year == input$year & babynames$name == input$name & babynames$sex == input$sex)]
  })
  output$countName <- renderText({ paste0("In the year ",userYear(),", ",
                                          ifelse(length(nameCounter()) == 0, 0, nameCounter())," ",
                                          ifelse(userSex() == "F","babygirls", "babyboys"),
                                          " were born with your name.") })
  
  # Show a graph of the occurrence of this name
  plotData <- eventReactive(input$go,{
    babynames %>% filter(name == input$name, sex == input$sex)
  })
  output$namePlot <- renderPlot({
    ggplot(plotData(), 
         aes(x = year, y = n, group = 1, colour = sex)) + 
      geom_line() +
      geom_vline(xintercept = userYear()) +
      scale_y_continuous(labels = scales::comma) +
      scale_colour_manual(values = c("F" = "pink", "M" = "blue"), guide = FALSE) +
      labs(x = "", y = "", title = paste0("How much ",
                                          ifelse(userSex() == "F","babygirls", "babyboys"),
                                          " were born with the name ",userName(),"?")) +
      theme_bw()
  })
  
})




