library(shiny)

shinyUI(fluidPage(
  
  # Application title
  titlePanel("Introduce yourself"),
  
  # Sidebar for user input
  sidebarLayout(
    sidebarPanel(
       textInput("name", h3("What is your name?"),
                 value = "")
       , radioButtons("sex", h3("What sex are you?"),
                       choices = c("F", "M"),
                       selected = "F")
    ),
    
    # Main panel to show output
    mainPanel(
       textOutput("welcome")
       , textOutput("countName")
       , br()
       , br()
       , br()
       , plotOutput("namePlot")
    )
  )
))




