library(shiny)
library(ggplot2)
library(datasets)

# Define server logic required to plot variables from the data 
shinyServer(function(input, output) {
    
    # Select the dataset
    selectedData <- reactive({
                 mtcars[, c(input$xcol, input$ycol)]
    })
    
    # Plot the dataset
        output$plot1 <- renderPlot({
        p <- ggplot(mtcars, aes_string(input$xcol, input$ycol)) + geom_line()
        
        facets <- paste(input$facet_row, '~', input$facet_col)
        if (facets != '. ~ .')
            p <- p + facet_grid(facets)

        print(p)
    })
    
})

