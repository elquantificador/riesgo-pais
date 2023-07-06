#Librerías
library(readxl)
library(ggplot2)
#Importar base
Puntos_riesgo_país <- read_excel("Puntos riesgo país.xlsx")


#Creación de vectores manipulables
periodo <- as.Date(c("1/1/2019", "1/2/2019", "1/3/2019", "1/4/2019", "1/5/2019", "1/6/2019", "1/7/2019", "1/8/2019", "1/9/2019", "1/10/2019", "1/11/2019", "1/12/2019", "1/1/2020", "1/2/2020", "1/3/2020", "1/4/2020", "1/5/2020", "1/6/2020", "1/7/2020", "1/8/2020", "1/9/2020", "1/10/2020", "1/11/2020", "1/12/2020", "1/1/2021", "1/2/2021", "1/3/2021", "1/4/2021", "1/5/2021", "1/6/2021", "1/7/2021", "1/8/2021", "1/9/2021", "1/10/2021", "1/11/2021", "1/12/2021", "1/1/2022", "1/2/2022", "1/3/2022", "1/4/2022", "1/5/2022", "1/6/2022", "1/7/2022", "1/8/2022", "1/9/2022", "1/10/2022", "1/11/2022", "1/12/2022", "1/1/2023", "1/2/2023", "1/3/2023", "1/4/2023", "1/5/2023"), format = "%d/%m/%Y")
a_fin_periodo <- c(690, 584, 592, 560, 619, 580, 603, 705, 677, 789, 1146, 826, 1018, 1466, 4553, 5129, 3907, 3373, 2755, 2813, 1015, 1029, 1065, 1062, 1273, 1226, 1201, 764, 730, 776, 790, 751, 835, 847, 891, 869, 768, 755, 810, 816, 802, 1165, 1336, 1550, 1753, 1570, 1333, 1250, 1216, 1765, 1917, 1757, 1911)
promedio_periodo <- c(712, 659, 612, 552, 573, 590, 578, 702, 648, 763, 979, 938, 859, 1180, 3580, 5033, 4305, 3287, 2862,2780, 1413, 983, 1028, 1041, 1182, 1202, 1264, 937, 735, 757, 777, 793, 797, 825, 834, 867, 818, 761, 792, 803, 805, 960, 1344, 1427, 1540, 1682, 1413, 1294, 1130, 1505, 1796, 1892, 1780)

#Dataframe
data <- data.frame(Periodo = periodo, A.fin.de.periodo = a_fin_periodo, Promedio.del.periodo = promedio_periodo)
                      
# Convertir a formato fecha
data$Periodo <- as.Date(data$Periodo, format = "%d/%m/%Y")
                      
# Gráfico de líneas para promedio y puntos (1)
ggplot(data, aes(x = Periodo)) +
  geom_line(aes(y = A.fin.de.periodo, color = "A fin de período")) +
  geom_line(aes(y = Promedio.del.periodo, color = "Promedio del período")) +
  labs(x = "Fecha", y = "Puntos") +
  scale_color_manual(values = c("A fin de período" = "orange", "Promedio del período" = "cyan")) +
  theme_minimal()



