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
                checkboxInput('arrow_toggle', "Show arrows", FALSE)
            ),

            mainPanel(
                plotOutput('xyPlot')
            )
        )
    )
)
