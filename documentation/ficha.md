# Ficha del artículo

Completa esta ficha al crear el repositorio y mantenla al día. Es el único
lugar con datos propios del artículo; el README es igual en todos los
repositorios.

## Identificación

- **Título:** Riesgo país del Ecuador
- **Descripción del repositorio:** Repositorio con el código de R para el artículo de El Quantificador, "Ecuador en la encrucijada", de Andrés Soria
- **Autoría:** Andrés Soria
- **Fecha de publicación:** 2023-08-18 (fecha del artículo en el sitio; el `report/report.Rmd` del repositorio lleva 2023-08-15)
- **Artículo publicado:** [Ecuador en la encrucijada: El susurro del riesgo país y su efecto en nuestro día a día](https://elquantificador.org/post/economia/2023-08-18-ecuador-en-la-encrucijada/)
- **Categoría:** Economía
- **Edición:** Febrero - Agosto 2023

## Estado

Publicado en El Quantificador el 2023-08-18. En el repositorio no consta ningún
pendiente editorial. La serie llega hasta junio de 2023 y no se ha actualizado.

## Pregunta y alcance

El artículo explica qué es el riesgo país, qué factores explican sus
variaciones en el Ecuador y cómo se relaciona con el gobierno, las empresas y
las personas. La serie es mensual, de julio de 2004 a junio de 2023, para el
Ecuador en su conjunto, y se mide en puntos base. El gráfico estático anota
episodios de crisis y recuperación entre 2019 y 2023.

## Requisitos

- R: la versión no está documentada en el repositorio; el README anterior
  indica R (≥ 4.1).
- Paquetes de R: ggplot2, highcharter, lubridate, readxl, shiny, stringr.

## Fuentes de datos

| Fuente | Institución | Periodo | Acceso | Script |
|---|---|---|---|---|
| Riesgo país en puntos base, serie mensual (Información Económica) | Banco Central del Ecuador, <https://www.bce.fin.ec/informacioneconomica/> | 2004-07 a 2023-06 | Manual: el archivo ya está en `data/Puntos riesgo país.xlsx` (hoja "Puntos básicos", columnas `Periodo` y `Puntos_base`) | `code/Gráfico riesgo país.R`, `code/shiny/Gráfico Dinámico RP.R`, `report/report.Rmd` (lo leen; no hay script de descarga) |

La descarga no es automática. El repositorio no documenta la ruta exacta dentro
del portal del BCE ni la fecha de descarga; el README anterior cita el portal
con fecha de consulta 12 de julio de 2023.

## Salidas

- `figures/grafico_riesgo_pais.png`: gráfico estático de líneas del riesgo país
  entre enero de 2019 y junio de 2023, con zonas sombreadas que marcan eventos.
- Aplicación Shiny `code/shiny/Gráfico Dinámico RP.R`: gráfico interactivo
  (highcharter) con filtro de fechas sobre la serie 2004-2023. Está publicada
  en <https://elquantificadorandressoria1848.shinyapps.io/Codedinamico/>.
- `report/report.Rmd`: informe que renderiza la narrativa del artículo con la
  aplicación embebida (`runtime: shiny`), `refs.bib` y `style.csl`.

## Cómo replicar en este repositorio

Este repositorio no tiene `MASTER.R`; cada pieza se ejecuta por separado, según
el README anterior y los scripts. No hay pasos de limpieza ni descarga: el
único dato es `data/Puntos riesgo país.xlsx`, que ya está en el repositorio.

1. Instala los paquetes de la lista de Requisitos. Los scripts solo llaman a
   `library()`, no instalan nada.
2. Gráfico estático: ejecuta `source("code/Gráfico riesgo país.R")` con la
   raíz del repositorio como directorio de trabajo. El script lee
   `data/Puntos riesgo país.xlsx` y guarda en
   `figures/grafico_riesgo_pais.png` (crea `figures/` si no existe).
3. Aplicación Shiny: abre `code/shiny/Gráfico Dinámico RP.R` y usa "Run App", o
   ejecuta `shiny::runApp("code/shiny/Gráfico Dinámico RP.R")`.
4. Informe: abre `report/report.Rmd` y usa "Knit to HTML".

Observación verificada en el código: `code/Gráfico riesgo país.R` lee el
archivo de Excel, pero construye el gráfico con los vectores `periodo` y
`puntos_base` escritos a mano en el script (enero de 2019 a junio de 2023),
no con los datos leídos. La aplicación Shiny y el informe sí usan el Excel.

## README anterior

Texto del README de este repositorio antes de adoptar el README estándar,
conservado sin cambios de contenido para no perder información.

### Riesgo país del Ecuador

Este repositorio contiene el código, datos y reportes para el artículo "Ecuador en la encrucijada: el susurro del riesgo país y su efecto en nuestro día a día" de Andrés Soria publicado en El Quantificador. 

La base de datos y los scripts reproducen tanto un gráfico estático como una aplicación Shiny interactiva. El gráfico estático resalta áreas de crisis y recuperación, mientras que la aplicación permite filtrar el periodo 2004‑2023 y recuerda que los puntos base representan la diferencia entre la tasa de rendimiento de la deuda soberana y la tasa libre de riesgo. Un número mayor de puntos base implica un riesgo percibido mayor.

Para más información, consulta el perfil de GitHub del [autor](https://github.com/andressoria12).

#### Requisitos

-  R (≥4.1)
-  Paquetes a instalarse automáticamente por los scripts. 

#### Cómo reproducir el análisis. 

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


#### Referencias

- Banco Central del Ecuador—Información Económica. (s. f.). Recuperado 12 de julio de 2023, de https://www.bce.fin.ec/informacioneconomica/
