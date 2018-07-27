library(shiny)

shinyUI(fluidPage(
  
  # Application title
  titlePanel("Introduce yourself"),
  
  # Sidebar for user input
  sidebarLayout(
    sidebarPanel(
       textInput("name", h3("What is your name?"),
                 value = "Jessica")
       , radioButtons("sex", h3("What sex are you?"),
                       choices = c("F", "M"),
                       selected = "F")
       , numericInput("year", h3("What year are you interested in?"),
                      value = 2000)
       , actionButton("go", "Go!")
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




