library(shiny)

shinyServer(
    function( input, output ) {
        output$xyPlot <- renderPlot({
            z <- sample( faithful$eruptions, input$sample_size )
            x <- z[ 1 : length(z) - 1 ]
            y <- z[ 2 : length(z) ]

            plot(
                x, y,
                xlab = 'Previous Duration',
                ylab = 'Next Duration',
                main = 'Eruption Timing Pairs',
                type = input$graph_type
            )

            if ( input$arrow_toggle ) {
                s <- seq(length(x) - 1)
                arrows(
                    x[s], y[s],
                    x[s + 1], y[s + 1],
                    length = 0.1,
                    angle = 20,
                    col = 'black'
                )
            }
        })
    }
)
