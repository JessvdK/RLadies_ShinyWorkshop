library(shiny)

# Define UI for app 
ui <- fluidPage(
  
  # App title ----
  titlePanel("Hello Shiny!"),
  
  # Sidebar layout with a input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel ----
    sidebarPanel("Sidebar Panel"),
    
    # Main panel ----
    mainPanel("Main Panel" )
  )
)