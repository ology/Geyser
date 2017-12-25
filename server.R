library(shiny)

shinyServer(
    function(input, output) {
        output$xyPlot <- renderPlot({
            x <- faithful$eruptions[ 1 : length(faithful$eruptions) - 1 ]
            y <- faithful$eruptions[ 2 : length(faithful$eruptions) ]
            plot( x, y, xlab="Previous Duration", ylab="Next Duration", main="Eruption Pairs", type=input$type )

            if ( input$arrow_toggle ) {
                s <- seq(length(x)-1)
                arrows(x[s], y[s], x[s+1], y[s+1], length = 0.1, angle = 20, col="black")
            }
        })
    }
)
