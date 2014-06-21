library(shiny)

lin_model <- lm(dist ~ speed -1, data=cars)
distance <- function(speed,units){
  if (units == "mph"){
    dist <- speed * as.double(lin_model$coefficients[1])
  }
  else if (units == "km/h"){
    dist <- speed/1.609344 *as.double(lin_model$coefficients[1]) * 0.3048
  }
  else if (units == "m/s"){
    dist <- speed *3600 /1609.344 *as.double(lin_model$coefficients[1]) * 0.3048
  }
  dist
}

out_units <- function(units){
  if (units == "mph") {
    out<- "feet"
  }
  else out <- "meters"
  out
}

shinyServer(
  function(input, output) {
    output$inputValue <- renderPrint({input$speed})
    output$inputUnits <- renderPrint({input$units})
    output$outputValue <- renderPrint({distance(input$speed,input$units)})
    output$outputUnits <- renderPrint({out_units(input$units)})
  }
  )