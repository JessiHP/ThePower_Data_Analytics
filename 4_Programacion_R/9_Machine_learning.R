# Elegir entre un modelo de KNN y un modelo de regresión logística.
# Cual predice mejor si un paciente es diabético o no.

install.packages("mlbench")

library(caret)
library(dplyr)

# Cargamos nuestros datos
data(package="mlbench",PimaIndiansDiabetes2)
head(PimaIndiansDiabetes2)
summary(PimaIndiansDiabetes2)

data <- PimaIndiansDiabetes2 %>% 
  select(pregnant,glucose,pressure,pedigree,age,diabetes) %>%
  na.omit()

set.seed(478)
index <- createDataPartition(data$diabetes,
                             p=0.7,
                             list = FALSE)
index
train_set <- data[index,]
test_set <- data[-index,]

modelLookup("knn")

# Configurar control de entrenamiento con validación cruzada (CV)
ctrl <- trainControl(method = "cv", number = 8, verboseIter = TRUE)

# Definir la grilla de parámetros para k (número de vecinos)
knn_params <- expand.grid(k = c(2:20))

# Entrenar el modelo KNN
knn_model <- train(
  diabetes ~ .,
  data = train_set,
  method = "knn",
  trControl = ctrl,
  tuneGrid = knn_params
)

knn_model

plot(knn_model)

knn_predict <- predict(knn_model, test_set)
confusionMatrix(knn_predict, test_set$diabetes)

## Specificity:Cuantos miembros de la clase B(no A, seria la negativa)
# ha identificado correctamente como esa clase B. como es de un 57% probamos
# el modelo de regresión logística.
# Sensitivity: Cuantos elementos de la clase A ha identificado correctamente 
# como clase A.


# Modelo de regresión logística.
glm_model <- train(diabetes ~.,
              data = train_set,
              method = "glm",
              trControl = ctrl,
)
modelLookup("glm")

glm_model

glm_predict <- predict(glm_model, test_set)
confusionMatrix(glm_predict, test_set$diabetes)

# La especificidad es mejor en este modelo.Ya que predice/detecta más numero de 
# casos positivos
