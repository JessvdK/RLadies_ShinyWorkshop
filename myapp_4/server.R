# Define server logic
library(ggplot2)
library(datasets)
library(ggplot2)
mydata = mtcars

server <- function(input, output) {
  output$plot_var <- renderPlot({ 
    ggplot(mydata, aes(x=cyl, y = mpg))+geom_point()+labs(title="This is my plot")

  })
  output$summary_var <- renderPrint({ 
    summary(mtcars)
  })
  output$table_var <- renderTable({ 
    head(mtcars)
  })
}