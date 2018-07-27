library(shiny)

# Define UI for app 
ui <- fluidPage(
  
  # App title ----
  titlePanel("Hello Shiny!"),
  
  # Sidebar layout with a input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel ----
    sidebarPanel("Sidebar Panel", width = 6),
    
    # Main panel ----
    mainPanel(
      h1("First level title"),
      h2("Second level title"),
      h3("Third level title"),
      h4("Fourth level title"),
      h5("Fifth level title"),
      h6("Sixth level title"),
      strong("This is a bold test"),
      p(""),
      em("This is italicized text"),
      p("Below is a link:"),
      a("https://shiny.rstudio.com/tutorial/written-tutorial/lesson2/")
    )
  )
)