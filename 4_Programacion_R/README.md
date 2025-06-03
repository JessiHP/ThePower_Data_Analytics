# 📘 Módulo R – Fundamentos, Análisis y Visualización

Este directorio contiene los scripts desarrollados durante el módulo de **Programación en R** del Bootcamp **Data & Analytics de ThePower**.

Incluye fundamentos del lenguaje, limpieza y visualización de datos, estadística básica, machine learning y conexión con SQL.



## 🧠 Objetivo

Dominar el lenguaje R desde la base hasta la manipulación y visualización avanzada de datos, aplicando las librerías más comunes del ecosistema tidyverse y otras herramientas útiles para análisis de datos.



## 📁 Estructura de carpetas
````
4_Programacion_R/
├── 8._Aplicación_Shiny_DiamondsApp/
│ └── app.R
│
├── data/
│ ├── 1_Introduccion_fundamentos.R
│ ├── 2_Programacion_y_funciones.R
│ ├── 3_Lectura_y_manejo_de_datos.R
│ ├── 4.0_Programacion_avanzada.R
│ ├── 4.1_Perfilado_para_mejorar_rapidez_scrip.R
│ ├── 5_Limpieza_y_Manipulacion_de_datos.R
│ ├── 6_Visualizacion_de_datos_ggplot2.R
│ ├── 7_Analisis_estadistico.R
│ ├── 9_Machine_learning.R
│ └── 10_Conexion_a_SQL.R
````



## 🔍 Descripción de archivos

| Archivo                                   | Contenido principal                                                           |
|-------------------------------------------|--------------------------------------------------------------------------------|
| `1_Introduccion_fundamentos.R`           | Fundamentos básicos de R, entorno, tipos de datos, operadores.                |
| `2_Programacion_y_funciones.R`           | Condicionales, bucles, definición y uso de funciones propias.                 |
| `3_Lectura_y_manejo_de_datos.R`          | Carga de datos (`readxl`), inspección y primeros análisis.           |
| `4.0_Programacion_avanzada.R`            | Estructuras complejas, control de flujo y programación más robusta.           |
| `4.1_Perfilado_para_mejorar_rapidez_scrip.R` | Optimización de scripts, medición de rendimiento.                          |
| `5_Limpieza_y_Manipulacion_de_datos.R`   | Uso de `dplyr` y otras funciones para limpieza y transformación.     |
| `6_Visualizacion_de_datos_ggplot2.R`     | Visualización avanzada con `ggplot2`, gráficos y personalización.             |
| `7_Analisis_estadistico.R`               | Estadística descriptiva, correlaciones y pruebas básicas.                     |
| `9_Machine_learning.R`                   | Modelado con `lm`, `randomForest` y técnicas introductorias de ML.           |
| `10_Conexion_a_SQL.R`                    | Conexión con bases de datos relacionales mediante `DBI` y `RPostgres`.        |

---

## 💻 Proyecto: App Shiny `DiamondsApp`

📦 Carpeta: `8._Aplicación_Shiny_DiamondsApp`  
Incluye el desarrollo de una aplicación interactiva con Shiny para explorar visualmente el dataset de diamantes. Contiene lógica reactiva, inputs dinámicos y gráficos interactivos con `plotly`.

---
## 🧰 Librerías y herramientas usadas

| Categoría                      | Librerías principales                                                                 |
|-------------------------------|----------------------------------------------------------------------------------------|
| 📦 Manipulación de datos       | `tidyverse`, `dplyr`, `readr`, `readxl`, `tidyr`, `stringr`, `lubridate`, `writexl`   |
| 📊 Visualización               | `ggplot2`, `shiny`, `shinythemes`                                                     |
| 📈 Modelado / Machine Learning | `caret`, `randomForest`, `mlbench`                                                    |
| ⚙️ Optimización y rendimiento  | `profvis`                                                                             |
| 🛢️ Conexión a BBDD             | `DBI`, `RPostgres`, `RSQLite`                                                         |
| 🌐 Web Scraping                | `rvest`                                                                               |



