
# Creamos una app para analizar con el dataset de diamantes.
# Analizamos como varía el precio en función de la calidad del corte,
# los quilates y el color.

install.packages("shiny")
install.packages("ggplot2")

# Cargar paquetes

library(ggplot2)
library(shiny)
head(diamonds)



ui <- fluidPage(
  titlePanel("DiamondsApp"),
  sidebarLayout(
    sidebarPanel(
      selectInput("variable", "Seleccione una variable",
                  choices = c("carat", "cut", "color", "clarity")),
      sliderInput("muestra", "Tamaño de la muestra:",
                  min = 1000,
                  max = nrow(diamonds),
                  value = min(5000, nrow(diamonds)), step = 500, round = 0)
    ),
    mainPanel(
      tabsetPanel(
        tabPanel("Gráfico de Dispersión", plotOutput("scatterplot")),
        tabPanel("Gráfico de Barras", plotOutput("bar")),
        tabPanel("Tabla", tableOutput("tabla"))
      )
    )
  )
)

server <- function(input, output) {
  output$scatterplot <- renderPlot({
    ggplot(data=diamonds[sample(nrow(diamonds),input$muestra),],
           aes_string(x = input$variable,y = "price")) +
      geom_point()
  })

  output$bar <- renderPlot({
    ggplot(data=diamonds[sample(nrow(diamonds),input$muestra),],
           aes_string(x = input$variable)) +
      geom_bar()
  
  })
  output$tabla <- renderTable({
    diamonds[sample(nrow(diamonds),input$muestra),] 
  })
}
shinyApp(ui= ui, server = server) 


## En la consola, asegurarme de no estar dentro de la carpeta
# DiamondsApp, para que funciones los gráficos.Retroceder una carpeta -> setwd("..")


