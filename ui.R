library(shiny)
library(ggplot2)

# Define UI for random distribution application 
shinyUI(pageWithSidebar(

  # Application title
  headerPanel("Linear Models for mtcars"),

  # Radio buttons to select the predictor variables.
  # Note the use of the br()
  # element to introduce extra vertical spacing
  sidebarPanel(
    textInput("outcome", "Outcome:", "Miles per Gallon"),
    radioButtons("variable", "Select the Predictor Variables:",
                 list("Number of Cylinders" = "cyl",
                      "Displacement" = "disp",
                      "Gross Horse Power" = "hp",
                      "Rear Axle Ratio" = "drat",
                      "Weight"="wt",
                      "1/4 Mile Time"="qsec",
                      "V/S"="vs",
                      "Transmission"="am",
                      "Number of front gears"="gear",
                      "Number of carburetors"="carb")),
    br())
,
  # Show the output that includes a plot and summary view
  # of the generated model.
  mainPanel(
    tabsetPanel(
      tabPanel("ModelSummary", verbatimTextOutput("summary")),
      tabPanel("Plot", plotOutput("plot"))
    )
  )
))