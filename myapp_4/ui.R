library(shiny)

# Define UI for app 
ui <- fluidPage(
  
  # App title ----
  titlePanel("Welcome"),
  
  # Sidebar layout with a input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel ----
    sidebarPanel(
      selectInput("var", 
                  label = "Choose a variable to display",
                  choices = list("Var 1 ", 
                                 "Var 2",
                                 "Var 3", 
                                 "Var 4"),
                  selected = "Var 1")
      ),
    
    # Main panel ----
    mainPanel(
      "Choose what you are interested in:",
      tabsetPanel(
        tabPanel("Plot",  plotOutput("plot_var")),
        tabPanel("Summary",  verbatimTextOutput("summary_var")),
        tabPanel("Table", tableOutput("table_var"))
      )
    )
  )
)