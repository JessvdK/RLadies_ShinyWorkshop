library(shiny)
library(dplyr)
library(scales)
library(ggplot2)
library(babynames)

shinyServer(function(input, output) {
  
  # Welcome the user
  output$welcome <- renderText({ paste0("Welcome ",input$name,", nice to meet you!") })
  
  # Count the number of babies with this name
  nameCounter <- reactive({
    babynames$n[which(babynames$year == 2000 & babynames$name == input$name & babynames$sex == input$sex)]
  })
  output$countName <- renderText({ paste0("In the year 2000, ",
                                          ifelse(length(nameCounter()) == 0, 0, nameCounter())," ",
                                          ifelse(input$sex == "F","babygirls", "babyboys"),
                                          " were born with your name.") })
  
  # Show a graph of the occurrence of this name
  output$namePlot <- renderPlot({
    ggplot(babynames %>% filter(name == input$name, sex == input$sex), 
         aes(x = year, y = n, group = 1, colour = sex)) + 
      geom_line() +
      geom_vline(xintercept = 2000) +
      scale_y_continuous(labels = scales::comma) +
      scale_colour_manual(values = c("F" = "pink", "M" = "blue"), guide = FALSE) +
      labs(x = "", y = "", title = paste0("How much ",
                                          ifelse(input$sex == "F","babygirls", "babyboys"),
                                          " were born with the name ",input$name,"?")) +
      theme_bw()
  })
  
})




