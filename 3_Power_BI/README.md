# 🗃️ Módulo Power BI

Este directorio contiene los ejercicios del módulo Power BI realizados durante el Bootcamp **Data & Analytics de ThePower**. 

El objetivo es aplicar el flujo completo de trabajo con Power BI: desde la conexión y transformación de datos (Power Query), hasta el modelado relacional, la creación de medidas DAX personalizadas y la construcción de dashboards interactivos orientados a análisis de negocio.

## 📁 Estructura del contenido
````
3_Power_BI/
├── 1_Caso_practico_Obtencion_Manipulacion.pbix
├── 2_Caso_practico_DAX.pbix
├── 3_Caso_practico_Visualizacion.pbix
├── Dashboard_final.pdf
├── Reto_1_Obtencion_transformacion.pbix
├── Reto_2_Modelado_de_datos.pbix
├── Reto_3_Power_Query_Avanzado.pbix

````
## 🔍 Descripción de los archivos

## 🚀 Casos Prácticos

1. ``1_Caso_practico_Obtencion_Manipulacion.pbix:`` Caso práctico completo desde la carga y limpieza de datos.

2. ``2_Caso_practico_DAX.pbix:`` Implementación de medidas básicas, condicionales y comparativas en DAX.

>🔢 Medidas DAX aplicadas

| Categoría        | Medidas                                                                 |
|------------------|-------------------------------------------------------------------------|
| 📌 Básicas       | Nº de productos distintos, Nº de plantas, Nº de líneas, Unidades totales, Velocidad media, Tiempo de ejecución (HH:mm), Nº de averías |
| 🧪 Condicionales | Producción a pleno rendimiento (`ActSpeed = NorSpeed`), Estado de frecuencia (`Normal` / `Alta`) |
| 📊 Porcentuales  | % Tiempo a pleno rendimiento, % Tiempo en frecuencia alta, % Tiempo con averías |
| 📈 Comparativas  | Unidades mes anterior, % Crecimiento mes actual vs anterior              |




3. ``3_Caso_practico_Visualizacion.pbix:`` Diseño del dashboard final con visualizaciones optimizadas.

>📷 Dashboard_final.pdf: Vista previa del dashboard generado en el archivo: 3_Caso_practico_Visualizacion.pbix



## 🧩 Retos realizados

``Reto_1_Obtencion_transformacion.pbix:`` 
- Carga de ficheros múltiples y limpieza de columnas.
- Creación de nuevas variables (ej. `Antigüedad` y fecha personalizada).
- Clasificación de vendedores y renombrado de campos para claridad.
- Aplicación de una estructura de modelo estrella.

``Reto_2_Modelado_de_datos.pbix:``
- Creación de relaciones entre tablas de hechos y dimensiones.
- Generación de una tabla calendario personalizada:
- Año, mes, día, semana, día de la semana.
- Ocultación de columnas auxiliares para optimizar el modelo.

``Reto_3_Power_Query_Avanzado.pbix:`` 
- Obtención de días festivos de España (2023).
- Transformaciones exclusivamente en Lenguaje M.
- Modelado flexible y automatizado.

## 🛠️ Tecnologías utilizadas

- Power BI Desktop
- Power Query (Lenguaje M)
- DAX
- Modelado de datos relacional