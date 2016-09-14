## Course Project - Developing Data Products
# server.R file for the shiny app

library(shiny)
library(dtplyr)

# # Define server logic required to draw a histogram
# shinyServer(function(input, output) {
#   output$distPlot <- renderPlot({
#     
#     # generate bins based on input$bins from ui.R
#     x    <- faithful[, 2] 
#     bins <- seq(min(x), max(x), length.out = input$bins + 1)
#     
#     # draw the histogram with the specified number of bins
#     hist(x, breaks = bins, col = 'darkgray', border = 'white')
#     
#   })
#   
# })

source("data_processing.R")

shinyServer(
  function(input, output) {
    
    # Prepare dataset
    dataTable <- reactive({
      groupByYear(data, input$timeline[1], 
                   input$timeline[2])
    })
    
    # Render data table
    output$dTable <- renderDataTable({
      dataTable()
    } 
    )
    
    output$TempByYear <- renderChart({
      plotTempByYear(dt = dataTable(),
                     dom = "TempByYear", 
                     xAxisLabel = "Year",
                     yAxisLabel = "Temperature")
    })
    
  } # end of function(input, output)
)