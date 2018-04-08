library(shiny)

total <- length(faithful$eruptions)

shinyUI(
    fluidPage(

        titlePanel('Successive Old Faithful Eruptions'),

        sidebarLayout(
            sidebarPanel(

# XXX Redundant:
#                radioButtons(
#                    'graph_type',
#                    label = h3('Graph type'),
#                    choices = list( 'Line' = 'l', 'Point' = 'p' ),
#                    selected = 'p'
#                ),

                checkboxInput( 'arrow_toggle', 'Show arrows', FALSE ),

                sliderInput(
                    'sample_size',
                    'Sample size:',
                    min = 10,
                    max = total,
                    value = total
                )

            ),

            mainPanel(
                plotOutput('eruption_plot'),
                plotOutput('succession_plot'),
                plotOutput('waiting_plot')
            )
        )
    )
)
