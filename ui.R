library(shiny)

shinyUI(
    fluidPage(

        titlePanel('Successive Old Faithful Eruptions'),

        sidebarLayout(
            sidebarPanel(
                radioButtons(
                    'type',
                    label = h3('Graph type'),
                    choices = list('Line' = 'l', 'Point' = 'p'),
                    selected = 'p'
                ),
                checkboxInput('arrow_toggle', 'Show arrows', FALSE),
                sliderInput('sample_size', 'Sample size:', min = 10, max = 272, value = 272)
            ),

            mainPanel(
                plotOutput('xyPlot')
            )
        )
    )
)
