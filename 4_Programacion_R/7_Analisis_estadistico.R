# Primer ejemplo

data(package="mlbench",PimaIndiansDiabetes2)
head(PimaIndiansDiabetes2, n=10)

mean(PimaIndiansDiabetes2$glucose, na.rm = TRUE)
sd(PimaIndiansDiabetes2$glucose, na.rm = TRUE)

summary(PimaIndiansDiabetes2$glucose)

table(PimaIndiansDiabetes2$diabetes)
prop.table((table((PimaIndiansDiabetes2$diabetes))))

summary(PimaIndiansDiabetes2)

hist(PimaIndiansDiabetes2$glucose)

# Comparando las diferencias de medias entre dos categorias->T-student

t <-t.test(glucose ~ diabetes, data = PimaIndiansDiabetes2)
print(t)

# Correlación entre variables
# 1º Limpiamos los datos porque tenemos NA

datos <- PimaIndiansDiabetes2 %>% na.omit()
cor(datos$glucose, datos$pressure)


# Segundo ejemplo
# Datos sobre el consumo en millas por galón de una serie de vehículos.
# Vamos a analizar la relación entre los caballos de fuerza, el nº de cilindros,
# los litros, el peso y la transmisión, con el consumo en millas por galón.

library(readxl)
library(dplyr)
library(ggplot2)
raw <- read_excel("mtcars_corregido.xlsx", sheet = "Sheet1")
head(raw)
summary(raw)

clean <- raw %>% select(mpg, cyl, disp, hp, wt, am) %>%
  mutate(am = factor(am,level = c(0,1), labels = c("Automático", "Manual")),
         cyl = as.factor(cyl))
summary(clean)

correlation <- cor(clean[,c("mpg","disp","hp","wt")])
correlation
pairs(clean[,c("mpg","disp","hp","wt")])

ggplot(data = clean, aes(x=am, y = mpg,fill = am))+
  geom_boxplot()+
  labs(title = "Relación entre consumo y tipo de transmisión",
       x="Tipo de transmisión",
       y="Consumo (millas por galón)")

ggplot(data = clean, aes(x=cyl, y = mpg,fill = cyl))+
  geom_boxplot()+
  labs(title = "Relación entre consumo y número de cilindros",
       x="Número de cilindros",
       y="Consumo (millas por galón)")

# Relación de las medias del consumo entre los tipos de transmisión. 
# Diferenica entre un grupo binomial

t <- t.test(mpg~ am, data = clean)
t
# Se rechaza la hipotesis nula

anova <- aov(mpg~cyl, data = clean)
summary(anova)
#Hay una relación entre si es auomático o manual.

model <- lm(mpg~hp + disp + wt, data =clean)
summary(model)
# Hemos visto que si la transmisión es automática o manual influye en el consumo
# del coche, o cuantas millas recorre un coche por galón.