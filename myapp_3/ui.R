library(shiny)

# Define UI for app 
ui <- fluidPage(
  
  # App title ----
  titlePanel("Hello Shiny!"),
  
  # Sidebar layout with a input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel ----
    sidebarPanel(
      h1("Sidebar Panel"),
      
      dateRangeInput("dates", h3("Date range")),
      
      checkboxGroupInput("checkGroup", 
                         h3("Checkbox group"), 
                         choices = list("Choice 1" = 1, 
                                        "Choice 2" = 2, 
                                        "Choice 3" = 3),
                         selected = 1),
      numericInput("num", 
                   h3("Numeric input"), 
                   value = 1),
      sliderInput("slider1", h3("Sliders"),
                  min = 0, max = 100, value = 50)
      ),
    
    # Main panel ----
    mainPanel(
      "Main title",
      tabsetPanel(
        tabPanel("Tab 1",p("plot")),
        tabPanel("Tab 2", p("summary")),
        tabPanel("Tab 3", p("table"))
      )
    )
  )
)