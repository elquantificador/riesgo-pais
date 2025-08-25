# Riesgo país del Ecuador

Este repositorio contiene el código, datos y reportes para el artículo "Ecuador en la encrucijada: el susurro del riesgo país y su efecto en nuestro día a día" de Andrés Soria publicado en El Quantificador. 

La base de datos y los scripts reproducen tanto un gráfico estático como una aplicación Shiny interactiva. El gráfico estático resalta áreas de crisis y recuperación, mientras que la aplicación permite filtrar el periodo 2004‑2023 y recuerda que los puntos base representan la diferencia entre la tasa de rendimiento de la deuda soberana y la tasa libre de riesgo. Un número mayor de puntos base implica un riesgo percibido mayor.

Para más información, consulta el perfil de GitHub del [autor](https://github.com/andressoria12).

## Requisitos

-  R (≥4.1)
-  Paquetes a instalarse automáticamente por los scripts. 

## Cómo reproducir el análisis. 

1.	Reproducir el gráfico estático:
2.	Desde la raíz del proyecto, ejecute source("code/Gráfico riesgo país.R").
3.	El script lee la serie mensual desde data/Puntos riesgo país.xlsx[3], crea un data frame y genera un gráfico de líneas con anotaciones de eventos[1].
4.	La figura se guarda en figures/grafico_riesgo_pais.png[4].
5.	Ejecutar la aplicación Shiny:
6.	Cargue el archivo code/shiny/Gráfico Dinámico RP.R y utilice el botón “Run App”, o bien ejecute shiny::runApp("code/shiny/Gráfico Dinámico RP.R").
7.	La interfaz permite seleccionar un rango de fechas y muestra el riesgo país con highcharter[2]. Los puntos base son la diferencia entre el rendimiento de los bonos soberanos y la tasa libre de riesgo, y un mayor número indica mayor riesgo percibido[2].
8.	Generar el informe:
9.	Abra report/report.Rmd y “Knit to HTML”. El documento incorpora la narrativa del artículo, citas bibliográficas y un módulo Shiny embebido con la misma serie de datos.
10.	El informe utiliza refs.bib y style.csl para dar formato a las referencias.


## Referencias

- Banco Central del Ecuador—Información Económica. (s. f.). Recuperado 12 de julio de 2023, de https://www.bce.fin.ec/informacioneconomica/
