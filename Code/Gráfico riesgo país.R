#Librerías
library(readxl)
library(ggplot2)
library(lubridate)
#Importar base
Puntos_riesgo_país <- read_excel("Data/Puntos riesgo país.xlsx")

#Creación de tema
theme_article_rp <-
  theme_classic(base_size = 12) +
  theme(panel.grid = element_blank(),
        axis.text.y = element_blank(),
        plot.title = element_text(color = "grey20"),
        plot.subtitle = element_text(color = "grey30"),
        plot.caption = element_text(color = "grey30", hjust = 0),
        legend.background = element_blank())

#Creación de vectores manipulables
periodo <- as.Date(c("1/1/2019", "1/2/2019", "1/3/2019", "1/4/2019", "1/5/2019", "1/6/2019", "1/7/2019", "1/8/2019", "1/9/2019", "1/10/2019", "1/11/2019", "1/12/2019", "1/1/2020", "1/2/2020", "1/3/2020", "1/4/2020", "1/5/2020", "1/6/2020", "1/7/2020", "1/8/2020", "1/9/2020", "1/10/2020", "1/11/2020", "1/12/2020", "1/1/2021", "1/2/2021", "1/3/2021", "1/4/2021", "1/5/2021", "1/6/2021", "1/7/2021", "1/8/2021", "1/9/2021", "1/10/2021", "1/11/2021", "1/12/2021", "1/1/2022", "1/2/2022", "1/3/2022", "1/4/2022", "1/5/2022", "1/6/2022", "1/7/2022", "1/8/2022", "1/9/2022", "1/10/2022", "1/11/2022", "1/12/2022", "1/1/2023", "1/2/2023", "1/3/2023", "1/4/2023", "1/5/2023"), format = "%d/%m/%Y")
a_fin_periodo <- c(690, 584, 592, 560, 619, 580, 603, 705, 677, 789, 1146, 826, 1018, 1466, 4553, 5129, 3907, 3373, 2755, 2813, 1015, 1029, 1065, 1062, 1273, 1226, 1201, 764, 730, 776, 790, 751, 835, 847, 891, 869, 768, 755, 810, 816, 802, 1165, 1336, 1550, 1753, 1570, 1333, 1250, 1216, 1765, 1917, 1757, 1911)


#Secuencia de meses 
date_breaks <- seq(floor_date(min(data$Periodo), unit = "month"),
                   ceiling_date(max(data$Periodo), unit = "month"),
                   by = "4 months")

#Dataframe de variables
data <- data.frame(Periodo = periodo, A.fin.de.periodo = a_fin_periodo)
                      
# Convertir a formato fecha
data$Periodo <- as.Date(data$Periodo, format = "%d/%m/%Y")

# Definir las coordenadas de la zona a pintar
zona_xmin <- as.Date("01/10/2019", format = "%d/%m/%Y")
zona_xmax <- as.Date("01/12/2019", format = "%d/%m/%Y")
zona_ymin <- 0
zona_ymax <- 5500
zona_xmin1 <- as.Date("01/02/2020", format = "%d/%m/%Y")
zona_xmax1 <- as.Date("01/04/2020", format = "%d/%m/%Y")

zona_xmin2 <- as.Date("01/01/2021", format = "%d/%m/%Y")
zona_xmax2 <- as.Date("01/04/2021", format = "%d/%m/%Y")

zona_xmin3 <- as.Date("01/05/2022", format = "%d/%m/%Y")
zona_xmax3 <- as.Date("01/09/2022", format = "%d/%m/%Y")

zona_xmin4 <- as.Date("01/01/2023", format = "%d/%m/%Y")
zona_xmax4 <- as.Date("01/03/2023", format = "%d/%m/%Y")

# Gráfico de líneas para promedio y puntos (1)
gráfico_riesgo <- ggplot(data, aes(x = Periodo, y= A.fin.de.periodo)) +
  geom_line(colour = 'black') +
  geom_point(color = 'black') +
  scale_x_date(breaks = date_breaks, date_labels = '%b-%Y') +
  scale_y_continuous(breaks = seq(500, 6000, 500))+
  labs(x = '',
       y = 'Puntos base',
       title = 'Riesgo País Ecuador periodo 2019-2023',
       subtitle = 'Puntos básicos mensuales',
       caption = 'Nota: Fuente: Banco Central del Ecuador. 
       El gráfico muestra la evolución del riesgo país en Ecuador durante el periodo de 2019 a 2023. Los puntos base representan la diferencia entre la tasa de 
       interés de los bonos soberanos del país y la tasa de interés libre de riesgo. Muestra el panorama económico para la inversión extranjera La primera zona 
       roja del gráfico está asociada a un aumento en el valor del riesgo debido a la crisis política causada por el paro nacional en octubre del 2019.La 
       segunda zona roja está asociada al inicio de la pandemia COVID-19 a finales de febrero. En el primer cuatrimestre del año 2021 hay una bajada que se 
       debe al posicionamiento del nuevo gobierno con Guillermo Lasso como presidente. A finales de mayo del 2022 existe una subida que está ligada a otro 
       paro nacional provocado por los precios de los combustibles. Por último, la subida a finales de enero del 2023 se debe principalmente a la inestabilidad 
       del gobierno donde se pedía la renuncia del presidente que actualmente ha llevado a la muerte cruzada y la disolución de la asamblea.') +
  theme_article_rp +
  theme(axis.text.x = element_text(angle = 45, vjust = 0.5),
        axis.text.y = element_text(size = 8),
        plot.title = element_text(face = 'bold'),
        plot.subtitle = element_text(size = 12),
        plot.caption = element_text(size = 8))+
  annotate('rect', xmin = zona_xmin, xmax = zona_xmax, ymin = zona_ymin, ymax = zona_ymax,
      alpha = 0.1, fill = 'red')+
  annotate('rect', xmin = zona_xmin1, xmax = zona_xmax1, ymin = zona_ymin, ymax = zona_ymax,
           alpha = 0.1, fill = 'red')+
  annotate('rect', xmin = zona_xmin2, xmax = zona_xmax2, ymin = zona_ymin, ymax = zona_ymax,
           alpha = 0.1, fill = 'green')+
  annotate('rect', xmin = zona_xmin3, xmax = zona_xmax3, ymin = zona_ymin, ymax = zona_ymax,
           alpha = 0.1, fill = 'red')+
  annotate('rect', xmin = zona_xmin4, xmax = zona_xmax4, ymin = zona_ymin, ymax = zona_ymax,
           alpha = 0.1, fill = 'red')

ggsave(filename = "Figures/grafico_riesgo_pais.png", 
       plot = gráfico_riesgo, 
       width = 9, height = 7, dpi = 300)







