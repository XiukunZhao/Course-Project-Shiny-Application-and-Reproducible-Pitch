# Course Project - Developing Data Products 
# ui.R file for the shiny app (user-interface)

library(shiny)
library(BH)
library(rCharts)
require(markdown)
library(dtplyr)
library(DT)

shinyUI(
  navbarPage("World Temperature", 
             # multi-page user-interface that includes a navigation bar.
             tabPanel("Explore the Data",
                      sidebarPanel(
                        sliderInput("timeline", 
                                    "Timeline:", 
                                    min = 1880,
                                    max = 2014,
                                    value = c(1964, 2014))
                                  ),
                      mainPanel(
                        tabsetPanel(
                          # Data 
                          tabPanel(p(icon("table"), "Dataset"),
                                   dataTableOutput(outputId="dTable")
                                   ), # end of "Dataset" tab panel
                          tabPanel(p(icon("line-chart"), "Visualize the Data"),
                                   h4('Global Temperature by Year', align = "center"),
                                   showOutput("TempByYear", "nvd3")
                                   ) # end of "Visualize the Data" tab panel
                        )
                      )
                      ),      # end of "Explore Dataset" tab panel
             tabPanel("About",
                      mainPanel(
                                includeMarkdown("about.md")
                               )
                      ) # end of "About" tab panel
            )  
      )