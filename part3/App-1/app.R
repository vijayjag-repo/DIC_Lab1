library(shiny)

# Define UI for app that draws a histogram ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("FLU ANALYSIS"),
  fluidRow(
    column(3,
           selectInput("select", h3("Select your choice"), 
                       choices = list("CDC Heatmap Vs All Keywords Heatmap" = 1, "CDC Heatmap vs Some Keywords Heatmap" = 2), selected = 1))
    
  ),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    # Sidebar panel for inputs ----
    sidebarPanel(),
    
    # Main panel for displaying outputs ----
    mainPanel(
      img(src="Heatmap_t4p2.png"),
      imageOutput("img"),
      textOutput("displayText")
    )
  )
)

# Define server logic required to draw a histogram ----
server <- function(input, output) {
  output$img <- renderImage(return(list(
    
      if(input$select==1){
        return(list(
        src="www/Heatmap_t5p3.png",
        contentType = "png",
        alt = "Heatmap_t5p3.png"
        ))
      }
      else if(input$select==2){
        return(list(
        src="www/Heatmap_t6p3.png",
        contentType = "png",
        alt = "Heatmap_t6p3.png"
        ))
      }
    
  )), deleteFile = FALSE)
  output$displayText <- renderText(
    {
      if(input$select==1)
      {
        paste("On comparing the CDC Heatmap and the Heatmap will all the keywords, we find out that NYC, Florida, Massachusetts and few other states have a level of 10 which is not observable in the CDC Heatmap. Similarly, Colorado has a level of 10 in the CDC Heatmap whereas the other heatmap varies with respect to this. Similarly, we can find many differences between these two Heatmaps.")
    
      }
      else if(input$select==2)
      {
        paste("On comparing the CDC Heatmap and the Heatmap with some keywords, we find out that states such as Montana, North Dakota have been affected by flu as shown by the CDC Heatmap but the second Heatmap has not tweets from these states.Also, the state of Illinois is level 10 in the Heatmap generated with some keywords but the CDC Heatmaps says otherwise. Similarly, we can find such differences between both the Heatmaps.")
      }
    }
  )
}

shinyApp(ui, server)