# Cargamos las librerías necesarias
library(shiny)
library(plotly)
library(highcharter)
library(readxl)

# Definimos la UI para la aplicación
ui <- fluidPage(
  titlePanel("Puntos básicos del riesgo país Ecuador"),
  
  sidebarLayout(
    sidebarPanel(
      dateRangeInput('dateRange',
                     label = 'Seleccione un rango de fechas',
                     start = as.Date("2004-07-01"), 
                     end = as.Date("2023-06-01")
      )
    ),
    
    mainPanel(
      highchartOutput("countryRiskChart")
    )
  )
)

# Definimos el servidor para la aplicación
server <- function(input, output) {
  # Leemos los datos
  data <- reactive({
    df <- read_excel("Data/Puntos riesgo país.xlsx")
    df$Periodo <- as.Date(df$Periodo, format = "%d/%m/%Y")
    df
  })
  
  # Creamos el gráfico interactivo
  output$countryRiskChart <- renderHighchart({
    df <- data()
    df <- df[df$Periodo >= input$dateRange[1] & df$Periodo <= input$dateRange[2],]
    highchart() %>%
      hc_chart(type = "line") %>%
      hc_title(text = "Análisis de riesgo país", style = list(fontSize = "24px", fontWeight = "bold")) %>%
      hc_subtitle(text = "Filtrado por fechas", style = list(fontSize = "12px")) %>%
      hc_xAxis(categories = df$Periodo, labels = list(rotation = -45)) %>%
      hc_yAxis(title = list(text = "Riesgo país"), labels = list(style = list(fontSize = "8px"))) %>%
      hc_plotOptions(
        series = list(
          color = 'black',
          marker = list(
            enabled = TRUE,
            fillColor = 'black'
          )
        )
      ) %>%
      hc_add_series(name = "Riesgo país", data = df$`A fin de período`) %>%
      hc_credits(enabled = TRUE, text = "Fuente: Datos de riesgo país", style = list(fontSize = "8px"))
   
  })
}

# Ejecutamos la aplicación 
shinyApp(ui = ui, server = server)


