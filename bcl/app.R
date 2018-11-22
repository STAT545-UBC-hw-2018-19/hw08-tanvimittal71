library(shiny)
library(ggplot2)
library(dplyr)
library(DT)
library(shinythemes)

bcl <- read.csv("bcl-data.csv", stringsAsFactors = FALSE)

ui <- fluidPage(
	theme = shinytheme("lumen"),
  titlePanel("BC Liquor Store Prices",
  					 windowTitle = "BC Liquor Store Prices"),
  
  sidebarLayout(
    sidebarPanel(
    	img(src = "img.png",height="95",width="350"),
      sliderInput("priceInput", "Price", 0, 100, c(25, 40), pre = "$"),
      radioButtons("typeInput", "Product type",
                  choices = c("BEER", "REFRESHMENT", "SPIRITS", "WINE"),
                  selected = "WINE"),
    	conditionalPanel(
    		condition = "input.typeInput == 'WINE'",
    		selectInput("sweetnessInput","Sweetness",choices = c(0:10))
    		
    	),
      uiOutput("countryOutput")
    ),
    mainPanel(
    	strong(textOutput("count")),
    	tabsetPanel(
    		tabPanel("Plot",plotOutput("coolplot")),
    		tabPanel("Table", DT::dataTableOutput("results"))
    	)
    )
  )
)

server <- function(input, output) {
  output$countryOutput <- renderUI({
    selectInput("countryInput", "Country",
                sort(unique(bcl$Country)),
                selected = "CANADA")
  })  
  
  filtered <- reactive({
    if (is.null(input$countryInput)) {
      return(NULL)
    }    
  	if(input$typeInput == "WINE"){
    bcl %>%
      filter(Price >= input$priceInput[1],
             Price <= input$priceInput[2],
             Type == input$typeInput,
             Country == input$countryInput,
      			 Sweetness == input$sweetnessInput
      )
  	}
  	else{
  		bcl %>%
  			filter(Price >= input$priceInput[1],
  						 Price <= input$priceInput[2],
  						 Type == input$typeInput,
  						 Country == input$countryInput
  			)
  	}
  })
  output$count <- renderText({
  	paste("Total results found: ",nrow(filtered()))
  })
  output$coolplot <- renderPlot({
  	if (is.null(filtered())) {
  		return()
  	}
  	ggplot(filtered(), aes(Alcohol_Content)) +
  		geom_bar() +
  		theme_bw()
  })

  output$results <- DT::renderDataTable({
  	filtered()
  })
}

shinyApp(ui = ui, server = server)
