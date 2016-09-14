# This file is used to process data

library(dplyr)
library(DT)
library(rCharts)
require(data.table)

# Read data
data <- fread("GISTEMPData.csv")

# Temperature convertion
data$Glob <- data$Glob / 100
data$NHem <- data$NHem / 100
data$SHem<- data$SHem / 100

#' Aggregate dataset only by year
#' 
#' @param dt data.table
#' @param minYear
#' @param maxYear
#' @return data.table
#'
groupByYear <- function(dt, minYear, maxYear) {
  result <- dt %>% filter(Year >= minYear, Year <= maxYear) 
  return(result)
}

#' Plot temperature by year
#' 
#' @param dt data.table
#' @param dom
#' @param xAxisLabel year
#' @param yAxisLabel number of pieces
#' @return TempByYear plot
#' 
plotTempByYear <- function(dt, dom, xAxisLabel, yAxisLabel) {
    TempByYear <- nPlot(
    Glob ~ Year,
    data = dt, 
    type = "lineChart",
    dom = dom, width = 650
  )
  TempByYear$chart(margin = list(left = 100))
  TempByYear$chart(color = c('orange', 'blue', 'green'))
  TempByYear$yAxis(axisLabel = yAxisLabel, width = 80)
  TempByYear$xAxis(axisLabel = xAxisLabel, width = 70)
  TempByYear
}

