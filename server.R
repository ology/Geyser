library(shiny)

shinyServer(
    function( input, output ) {
        output$succession_plot <- renderPlot({
            z <- sample( faithful$eruptions, input$sample_size )
            x <- z[ 1 : length(z) - 1 ]
            y <- z[ 2 : length(z) ]

            plot(
                x, y,
                xlab = 'Eruption Magnitude',
                ylab = 'Following Eruption Magnitude',
                main = 'Succession Plot',
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

        output$eruption_plot <- renderPlot({
            df <- faithful[sample( nrow(faithful), input$sample_size ), ]

            plot(
                df,
                xlab = 'Eruptions',
                ylab = 'Waiting',
                main = 'Eruption Plot',
                type = input$graph_type
            )

            if ( input$arrow_toggle ) {
                s <- seq(length(df$eruptions) - 1)
                arrows(
                    df$eruptions[s],
                    df$waiting[s],
                    df$eruptions[s + 1],
                    df$waiting[s + 1],
                    length = 0.1,
                    angle = 20,
                    col = 'black'
                )
            }
        })
    }
)
