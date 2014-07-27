library(shiny)
library(ggplot2)
library(datasets)

shinyServer(function(input, output) {

   # Generate a summary of the model generated.
  output$summary <- renderPrint({
     if (input$variable == "am") {
       fit<-lm(mpg ~ am,data=mtcars)
     }
     else if(input$variable=="disp"){
       fit<-lm(mpg ~ disp,data=mtcars)
     }
    else if(input$variable=="hp"){
      fit<-lm(mpg ~ hp,data=mtcars)
     }
    else if(input$variable=="drat"){
      fit<-lm(mpg ~ drat,data=mtcars)
     }
    else if(input$variable=="wt"){
      fit<-lm(mpg ~ wt,data=mtcars)
     }
   else if(input$variable=="qsec"){
      fit<-lm(mpg ~ qsec,data=mtcars)
     }
   else if(input$variable=="vs"){
      fit<-lm(mpg ~ vs,data=mtcars)
     }
   else if(input$variable=="cyl"){
      fit<-lm(mpg ~ cyl,data=mtcars)
     }
   else if(input$variable=="gear"){
     fit<-lm(mpg ~ gear,data=mtcars)
     }
   else if(input$variable=="carb"){
      fit<-lm(mpg ~ carb,data=mtcars)
}
    summary(fit)
  })

   # Generate a plot of the data. Also uses the inputs to build the 
  # plot label. Note that the dependencies on both the inputs and
  # the 'data' reactive expression are both tracked, and all expressions 
  # are called in the sequence implied by the dependency graph
  output$plot <- renderPlot({
    if (input$variable == "am") {
       mpgData <- data.frame(mpg = mtcars$mpg, var = factor(mtcars[[input$variable]], labels = c("Automatic", "Manual")))
     }
     else if(input$variable=="disp"){
        mpgData <- data.frame(mpg = mtcars$mpg, var = factor(mtcars[[input$variable]]))
     }
    else if(input$variable=="hp"){
        mpgData <- data.frame(mpg = mtcars$mpg, var = factor(mtcars[[input$variable]]))
     }
    else if(input$variable=="drat"){
      mpgData <- data.frame(mpg = mtcars$mpg, var = factor(mtcars[[input$variable]]))
     }
    else if(input$variable=="wt"){
      mpgData <- data.frame(mpg = mtcars$mpg, var = factor(mtcars[[input$variable]]))
     }
   else if(input$variable=="qsec"){
      mpgData <- data.frame(mpg = mtcars$mpg, var = factor(mtcars[[input$variable]]))
     }
   else if(input$variable=="vs"){
      mpgData <- data.frame(mpg = mtcars$mpg, var = factor(mtcars[[input$variable]]))
     }
   else if(input$variable=="cyl"){
      mpgData <- data.frame(mpg = mtcars$mpg, var = factor(mtcars[[input$variable]]))
     }
   else if(input$variable=="gear"){
      mpgData <- data.frame(mpg = mtcars$mpg, var = factor(mtcars[[input$variable]]))
     }
   else if(input$variable=="carb"){
     mpgData <- data.frame(mpg = mtcars$mpg, var = factor(mtcars[[input$variable]]))
    }
     p <- ggplot() + 
       geom_point(aes(var,mpg),mpgData,color="blue") + 
       xlab(input$variable)+ylab("mpg")
     print(p)
  })


 })