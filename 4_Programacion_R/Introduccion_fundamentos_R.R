
#Ejercicio 1:  Define una variable llamada numero con el valor 10 y otra llamada nombre con tu nombre
numero <- 10
nombre <- "Jessica"

#Ejercicio 2:Utiliza las funciones class e is.numeric para determinar el tipo de dato de numero .

class(numero) # Devuelve el tipo de dato de la variable
is.numeric(numero) # Comprueba si la variable es de tipo numérico

#Ejercicio 3:Realiza una operación aritmética que sume numero y el doble de numero .

suma <- numero + (2*numero)

#Ejercicio 4:Crea un vector llamado edades con las edades de tres personas y una lista llamada informacion con el nombre y 
#la edad de una persona.

edades <- c(24, 6, 20)
informacion <- list(nombre = "Pepe", edad = 6)
informacion1 <- list(nombre = "Pepe", edad = edades[2])

#Ejercicio 5:Verifica si nombre es de tipo caracter y si es_numerico es de tipo lógico.
is.character(nombre) # Comprueba si la variable es de tipo texto
is.logical(numero) # Comprueba si la variable es de tipo boolean

#Ejercicio 6:Crea una variable llamada mayor_de_edad que sea TRUE si la edad de la primera persona en edades es mayor o igual a 18.

mayor_de_edad <- edades[1] > 18
edades [1]

#Ejercicio 7:Utiliza el operador %in% para verificar si el valor 30 está presente en el vector edades.

30 %in% edades

#Ejercicio 8:Compara si el doble de numero es mayor que edades[3].

2*numero > edades[3]

#Ejercicio 9:Define dos variables lógicas, condicion1 y condicion2 , ambas con valor TRUE . Comprueba si ambas condiciones son verdaderas.


condicion1 <- 10 > 2
condicion2 <- 3 < 5

condicion1 & condicion2

#Ejercicio 10:Define una variable lógica, verdadero , con valor TRUE . Comprueba que su valor NO sea verdadero.

condicion3 <- 40 | 5 > 30

!condicion3

condicion4 <- 1 < 2

!condicion4

