library(shiny)
shinyUI (pageWithSidebar(
  headerPanel("The Car Safety App"),
  sidebarPanel(
    h3('Input'),
    numericInput('speed','insert speed in mph', 20, min = 0, max = 200, step = 5),
    radioButtons('units','units',list("mph","km/h","m/s"),selected ="mph")
    #submitButton('Submit')
  ),
  mainPanel(
    p("This application shows you the breaking distance for a normal car. You use your left panel to enter the speed of the car, and the application will show you in the main panel how many meters your car will do before completly stop."),
    p("Maybe you will be surprise with the results!"),
    h3('Results of the prediction'),
    h4('If you are driving at'),
    verbatimTextOutput("inputValue"),
    verbatimTextOutput("inputUnits"),
    h4('Your car will need '),
    verbatimTextOutput("outputValue"),
    verbatimTextOutput("outputUnits"),
    h4('to completely stop!')
    )
  )
)