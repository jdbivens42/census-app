# server.R

source("helpers.R")
counties <- readRDS("data/counties.rds")
require(maps)
require(mapproj)
colnames(counties) = c("name", "total.pop", "Percent White", "Percent Black", "Percent Hispanic", "Percent Asian")

shinyServer(
  function(input, output) {
    
    
    output$map <- renderPlot({
      #(var, color, legend.title, min = 0, max = 100)
      percent_map(counties[,input$var], "darkgreen", "censusVis", input$range[1], input$range[2])
    })
      
  }
)
    