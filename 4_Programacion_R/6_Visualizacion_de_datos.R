install.packages("mlbench")
library(ggplot2)
library(mlbench)
library(stringr)
library(dplyr)

?mpg #informacion del dataset

head(mpg, n=5)

# Histrograma
ggplot(mpg,aes(x=cyl))+
  geom_histogram(binwidth = 2, color = "red", fill="blue")+
  labs(title = "Histograma: coches por cilindrada",
       x="Cilindros",
       y="Nº. de Coches")

# Gráfico de barras
ggplot(mpg,aes(x=class))+
  geom_bar(aes(fill=manufacturer))+
  labs(title = "Distribución de coches por clase",
       x="Clase",
       y="Nº. de Coches")+
  theme(panel.background = element_blank())+
  theme(plot.title = element_text(color = "red"))+
    theme(legend.position = "none")
  
# Boxplot
# limpiamos los datos, para ver solo auto o manual
mpg$trans <- mpg$trans %>% str_sub(1,-5)
  
  
ggplot(mpg,aes(x=trans, y = cty))+
  geom_boxplot(aes(fill=trans))+
  labs(title = "Boxplot: consumo por tipo de distribución",
        x="Transmisión",
        y="Consumo urbano")+
  theme(panel.background = element_blank())+
  theme(legend.position = "none")

# Dispersión
ggplot(mpg,aes(x=cty, y = hwy))+
  geom_point(aes(color=trans,size=cyl))

# Facetado (separa en diferentes graficos, en función de lo que digamos, por ejemplo en clases)
ggplot(mpg, aes(x=cty, y = hwy))+
  geom_point(aes(color=trans,size=cyl))+
  facet_wrap(~class)

# Otro ejemplo
ggplot(mpg, aes(x=year, y = hwy))+
  geom_point(aes(color=class,size=cyl))+
  facet_wrap(~trans)
