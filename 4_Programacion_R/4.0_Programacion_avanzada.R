# Instalar paquetes
install.packages("ggplot2")
install.packages("readr")
install.packages("profvis")
install.packages("dplyr")
# Cargar paqutes
library(ggplot2)
library(readr)
library(profvis)
library(dplyr)

profvis({
# Acceder al dataset diamonds
data("diamonds")
setwd("C:/Users/jessi/Documents/GitHub/ThePower_Data_Analytics/4_Programacion_R")
write_csv(diamonds, path = "diamantes.csv")

path <- 'diamantes.csv'
datos <-read.csv(path)


# Cálculo con la libreria dpylr
resumen_diamantes <- datos %>% group_by(cut) %>%
  summarise(Media = mean(price))
resumen_diamantes

# Mismo cálculo con un bucle for
resultados <-list()

cortes <- unique(datos$cut)

for (i in 1:length(cortes)) {
  seleccion <- datos[datos$cut == cortes[i], ]
  media <- mean(seleccion$price)
  resultados[[i]] <- data.frame(Corte = cortes[i], Media = media)
}

resumen_diamonds <- do.call(rbind, resultados)

ggplot(resumen_diamonds, aes(x = Corte, y = Media)) +
  geom_col() +
  geom_text(aes(label = Media))

})

