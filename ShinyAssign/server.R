#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

# Data pre-processing ----

beer<-read.csv("BeerRecipesST101.csv")

shinyServer(function(input, output){
  
  
  # Return the formula text for printing as a caption ----
  output$caption <- renderText({
    input$variable
  })
  
  # Generate a plot of the requested variable against mpg ----
  # and only exclude outliers if requested
  
  output$boxPlot <- renderPlot({
    
    plot.type<-switch(input$plot.type,
                      "boxplot" 	= 	geom_boxplot(),
                      "histogram" =	geom_histogram(alpha=0.5,position="identity"),
                      "density" 	=	geom_density(alpha=.75)
    )
    
    if(input$plot.type=="boxplot")	{
      ggplot(beer, aes(x=Style,y=get(input$variable), color =Style)) + plot.type + xlab("") + ylab("")
    }
    else{
      ggplot(beer,aes(x =get(input$variable),fill=as.factor(Style)))+ plot.type + xlab(input$variable)
    }
   
  })
})