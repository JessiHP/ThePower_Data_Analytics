# Descargamos los datos y los guardamos en un fichero excel
data("mtcars") 
setwd("C:/Users/jessi/Documents/GitHub/ThePower_Data_Analytics/4_Programacion_R")
write_xlsx(mtcars, path = "mtcars.xlsx")

# Datasets que tienen nombres de filas con información útil-> convertirlos
#en columnas desde el inicio
# mtcars <- tibble::rownames_to_column(mtcars, var = "model")

# Leer el excel mtcars
library(readxl)
excel_sheets(path = "mtcars.xlsx")
datos <- read_excel(path = "mtcars.xlsx",sheet = "Sheet1")
# Recuperar los nombres de fila originales desde mtcars
modelos <- rownames(mtcars)
# Añadirlos como columna a tu tabla leída:
datos$model <- modelos
# Reordenamos para poner model como primera columna:
datos <- datos[, c("model", setdiff(names(datos), "model"))]
# Sobrescribimos el Excel con la versión corregida:
library(writexl)
write_xlsx(datos, "mtcars_corregido.xlsx")



head(datos,n=5)

?mtcars # Info de los datos

automaticos <- datos[datos$am==0, ] # Vemos que 19 son automáticos

resumen_at <- automaticos[,c("mpg","cyl","hp","gear")]

datos[datos$model=="Mazda RX4",] # Ponemos la "," al final para que ponga
#todas las columnas
datos[datos$model=="Mazda RX4",]$gear



# Leer de una web (página de Wikipedia)
install.packages("rvest")
library(rvest)
# URL de la página
url <- "https://en.wikipedia.org/wiki/Men%27s_high_jump_world_record_progression"
# Leer el contenido HTML de la página
page <- read_html(url)

# Extraer todas las tablas
tables <- html_table(html_elements(page,"table"))
table <- tables[[3]] # Escoge la tabla de interes

class(table)
head(table, n=5)
tail(table, n=5)

table$Mark

ny = table[table$Venue=="New York",]
ny
