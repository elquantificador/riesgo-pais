# Ficha del artículo

Completa esta ficha al crear el repositorio y mantenla al día. Es el único
lugar con datos propios del artículo; el README es igual en todos los
repositorios.

## Identificación

- **Título:** Riesgo país del Ecuador
- **Descripción del repositorio:** Repositorio con el código de R para el artículo de El Quantificador, "Ecuador en la encrucijada", de Andrés Soria
- **Autoría:** [COMPLETAR: nombres, igual que en el sitio]
- **Fecha de publicación:** [COMPLETAR: AAAA-MM-DD]
- **Artículo publicado:** [COMPLETAR: enlace a elquantificador.org]
- **Categoría:** [COMPLETAR: Economía, Política, Salud, Educación o Valores y
  comportamiento]
- **Edición:** [COMPLETAR: por ejemplo, Julio-Diciembre 2026]

## Estado

[COMPLETAR: en preparación, en revisión editorial o publicado. Anota qué falta
para cerrar el artículo.]

## Pregunta y alcance

[COMPLETAR: dos o tres oraciones con la pregunta, el periodo, la cobertura
geográfica y la unidad de análisis.]

## Requisitos

- R [COMPLETAR: versión, por ejemplo 4.5.x].
- Paquetes de R: [COMPLETAR: lista en orden alfabético].

## Fuentes de datos

| Fuente | Institución | Periodo | Acceso | Script |
|---|---|---|---|---|
| [COMPLETAR] | [COMPLETAR] | [COMPLETAR] | [COMPLETAR: descarga automática o manual] | `code/cleaning/00_download_fuente.R` |

Si alguna fuente no permite descarga automática, explica aquí cómo obtenerla y
dónde colocarla en `data/raw/`.

## Salidas

- `outputs/tables/[COMPLETAR].csv`: [COMPLETAR: qué contiene].
- `outputs/graphs/[COMPLETAR].png`: [COMPLETAR: qué muestra].
- `article/images/graficoN.png`: copias numeradas según el orden del texto.

## Cómo replicar en este repositorio

Este repositorio conserva sus instrucciones originales en la sección
"README anterior". Si todavía no tiene `MASTER.R`, sigue esas instrucciones.
Cuando se migre a la estructura estándar, reemplaza esta sección por los pasos
de `MASTER.R`.

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
