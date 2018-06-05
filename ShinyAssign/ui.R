#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny); 

fluidPage(
  
  # App title ----
  titlePanel("Beer characteristics"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Selector for variable to plot against mpg ----
      selectInput("variable", "Variable:",
                  c("Alcool" = "ABV",
                    "Bitterness" = "IBU",
                    "Color" = "COLOR")),
      selectInput("plot.type","Plot Type:", 
                  list(boxplot = "boxplot", histogram = "histogram", density = "density"))
      
    ),
    

    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Formatted text for caption ----
      h3(textOutput("caption")),
      
      # Output: Plot of the requested variable against mpg ----
      plotOutput("boxPlot")
      
    )
  )
)