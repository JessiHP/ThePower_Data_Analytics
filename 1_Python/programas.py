'''
Ejercicio 1: Conversor de Temperatura
Escribe un programa que convierta una temperatura de grados Celsius a grados Fahrenheit.
'''
def celsius_a_fahrenheit(celsius):
    """
    Convierte una temperatura de grados Celsius a grados Fahrenheit.
    :param celsius: Temperatura en grados Celsius
    :return: Temperatura en grados Fahrenheit
    """
    fahrenheit = (celsius * 9/5) + 32
    return fahrenheit

temperatura_celsius = 25.8

temperatura_fahrenheit = celsius_a_fahrenheit(temperatura_celsius) # Convertir a Fahrenheit
print(f"{temperatura_celsius}°C es igual a {temperatura_fahrenheit:.2f}°F")

'''
Ejercicio 2: Calculadora de Propina
Crea un programa que calcule el monto total a pagar en un restaurante, incluyendo una propina del 15% sobre el total de la cuenta.
'''
def calcular_total_con_propina(total_cuenta):

    propina = total_cuenta * 0.15
    total_a_pagar = total_cuenta + propina
    return total_a_pagar

total_cuenta = float(input("Ingrese el total de la cuenta en el restaurante: ")) # Solicitar al usuario que ingrese el total de la cuenta

total_a_pagar = calcular_total_con_propina(total_cuenta) # Calcular el total a pagar incluyendo la propina
print(f"El monto total a pagar, incluyendo la propina del 15%, es: {total_a_pagar:.2f} €")

'''
Ejercicio 3: Verificación de Edad
Escribe un programa que solicite la edad de un usuario y determine si es mayor de edad (mayor o igual a 18 años) o no.
'''
edad = int(input('Introduce tu edad: '))
if edad >= 18:
    print ("Eres mayor de edad")
else:
    print ("No eres mayor de edad")

'''
Ejercicio 4: Contador de Vocales
Crea un programa que cuente el número de vocales en una palabra ingresada por el usuario.
'''
palabra = input('Introduce una palabra: ')
vocales = "aeiouAEIOU"

def contar_vocales(palabra):
    return sum(1 for letra in palabra if letra in vocales) # para cada letra de palabra sumamos 1, si la letra está en vocales

numero_de_vocales = contar_vocales(palabra)
print(f"La palabra {palabra} contiene {numero_de_vocales} vocales")
'''
Ejercicio 5: Suma de Números Pares
Escribe un programa que calcule la suma de todos los números pares del 1 al 100.
'''
def suma_pares():
    return sum(n for n in range (2,101,2))

resultado = suma_pares()
print(f" La suma de todos los números pares del 0 al 100 es: {resultado}")

# Otra forma
numeros = range(101)
suma=0
for numero in numeros:
    if numero % 2 == 0:
        suma+=numero
print(f"La suma de todos los números pares del 0 al 100 es: {suma}")

'''
Ejercicio 6: Verificación de Palíndromo
Crea un programa que verifique si una palabra ingresada por el usuario es un palíndromo (se lee igual de izquierda a derecha que de derecha a izquierda).
'''
palabra = input('Introduce una palabra: ')

def es_palindromo(palabra):
    return palabra == palabra[::-1]

resultado = es_palindromo(palabra)
if resultado:
    print(f"La palabra '{palabra}' es un palíndromo")
else:
    print(f"La palabra '{palabra}' no es un palíndromo")
'''
Ejercicio 7: Calculadora Simple
Crea un programa que realice operaciones aritméticas simples (suma, resta, multiplicación, división) según la elección del usuario.
'''

import os

def suma(a,b):
    return a + b

def resta(a,b):
    return a - b

def multiplicación(a,b):
    return a * b

def división(a,b):
    if b != 0:
        return a / b
    else:
        return "Error: no se puede dividir entre cero."

## Creación de un menú interativo
def limpiar_pantalla():
    os.system("cls" if os.name == "nt" else "clear")

def main():
    a = float(input("Introduce el primer número: "))
    b = float(input("Introduce el segundo número: ")) 
    
    while True:
        print("Selecciona una operación aritmética a realizar.")
        print("+ : Suma")
        print("- : Resta")
        print("* : Multiplicación")
        print("/ : División")
        print("0 : Salir")
        
        opcion = input("Ingresa la operación aritmética a realizar: ")
        limpiar_pantalla()  # Limpia la pantalla antes de ejecutar el ejercicio    

        if opcion == "+":
            resultado = suma(a,b)
        elif opcion == "-":
            resultado = resta(a,b)
        elif opcion == "*":
            resultado = multiplicación(a,b)
        elif opcion == "/":
            resultado = división(a,b)
        elif opcion == "0":
            print("Saliendo del programa...\n")
            break  # Sale del bucle
        else:
            print("Opción no válida. Intenta de nuevo.\n")
        print(f"El resultado de la operación es: {resultado} \n")
    
main()
'''
Ejercicio 8: Cálculo del Índice de Masa Corporal (IMC)
Escribe un programa que calcule el Índice de Masa Corporal (IMC) de una persona.
'''
peso = float(input("Introduce un peso en kg: "))
altura =  float(input("Introduce una altura en cm: "))/100

def calcular_imc(peso,altura):
    imc = peso / (altura**2) # Calcular el imc
    return imc

resultado = calcular_imc(peso,altura)
print(f"El indice de masa corporal es: {round(resultado, 2)}")
'''
Ejercicio 9: Conversor de Divisas
Crea un programa que convierta una cantidad de dólares a euros. Suponiendo que 1 dólar es igual a 0.85 euros.
'''
dolares = float(input("Introduce la cantidad de dolares: "))

def calcular_euros(dolares):
    cambio_dolar_euro = 0.85  # Tipo de cambio actual (1 dólar = 0.85 euros)
    euros = dolares * cambio_dolar_euro # Calcular la cantidad en euros
    return euros

resultado = calcular_euros(dolares) # Llamar a la función para convertir dólares a euros
print(f"{dolares} dólares son {resultado:.2f} €")

'''
Ejercicio 10: Determinar el Día de la Semana
Escribe un programa que determine el día de la semana correspondiente a un número ingresado por el usuario (1 para lunes, 2 para martes, etc.).
'''
try:
    NumeroUsuario = int(input('Introduce un nº del 1 al 7, siendo 1 lunes y 7 domingo: '))
    dias = {
        1: "Lunes",
        2: "Martes",
        3: "Miércoles",
        4: "Jueves",
        5: "Viernes",
        6: "Sábado",
        7: "Domingo"
    }

    if 1 <= NumeroUsuario <= 7:
        print(f"El día de la semana es: {dias[NumeroUsuario]}")
    else:
        print("Error: El número debe estar entre 1 y 7.")

except ValueError:
    print("Error: Por favor, introduce un número válido")

# Otra forma: usando la función .get y la función
def determinar_dia(num):
    dias_de_la_semana = {
        1: "Lunes",
        2: "Martes",
        3: "Miércoles",
        4: "Jueves",
        5: "Viernes",
        6: "Sábado",
        7: "Domingo"
    }
    return dias_de_la_semana.get(num, "Lo siento, el número no es válido")

try:
    numero = int(input("Ingrese el número del día de la semana (del 1 al 7): "))
    dia = determinar_dia(numero)
    print(f"El día correspondiente al número {numero} es: {dia}")
except ValueError:
    print("Error: Por favor, ingrese un número entero válido.")

'''
Ejercicio 11: Calculadora de Edad
Escribe un programa que solicite al usuario su año de nacimiento y calcule su edad actual.
'''
from datetime import datetime
fecha_nacimiento_persona = input("Ingrese su fecha de nacimiento: DD/MM/YYYY: ")

try:
    fecha_nacimiento = datetime.strptime(fecha_nacimiento_persona, "%d/%m/%Y")
    fecha_actual = datetime.now()
    edad = (fecha_actual-fecha_nacimiento).days // 365
    print(f"Tienes {edad} años")

except ValueError:
    print(f"Lo siento, el formato no es correcto")


'''
Ejercicio 12: Calculadora de Área de un Rectángulo
Crea un programa que calcule el área de un rectángulo. El usuario debe ingresar la longitud y el ancho del rectángulo.
'''
longitud = float(input("Ingresar longitud del rectángulo en cm: "))
ancho = float(input("Ingresar ancho del rectángulo en cm: "))

def calcular_area(longitud,ancho):
    return longitud * ancho

try:
    area = calcular_area(longitud,ancho)
    print(f"El área del rectángulo es {area} cm2")

except ValueError:
    print(f"Lo siento, el formato no es correcto")
'''
Ejercicio 13: Verificación de Número Primo
Escribe un programa que determine si un número ingresado por el usuario es primo o no.
'''
numero = int(input("Ingrese un numero entero: "))
def es_primo(num):
    if num < 2:
        return False
    for i in range(2, int(num ** 0.5) + 1):
        if num % i == 0:
            return False
    return True

try:
    if es_primo(numero):
        print(f"{numero} es un número primo.")
    else:
        print(f"{numero} no es un número primo.")
except ValueError:
    print(f"Lo siento, ha ingresado un valor numérico erroneo")


'''
Ejercicio 14: Calculadora de Descuento
Crea un programa que calcule el precio final de un artículo después de aplicar un descuento del 20%.
'''
articulo = float(input("Ingresar el precio del artículo en €: "))
def calcular_precio_final(articulo):
    descuento = 0.2
    precio_descuento = articulo * descuento
    precio_final = articulo - precio_descuento
    return precio_final

print (f"El precio con 20% de descuento es: {calcular_precio_final(articulo):.2f}")
'''
Ejercicio 15: Conversor de Tiempo
Escribe un programa que convierta un número de minutos en horas y minutos. Por ejemplo, 145 minutos serían 2 horas y 25 minutos.
'''
minutos = int(input("Ingrese el número de minutos a convertir: "))
def convertir_minutos_en_horas(minutos):
    horas = minutos // 60
    minutos_restantes = minutos % 60 # el modulo '%' devuelve el resto de la división
    return horas,minutos_restantes

horas,minutos_restantes = convertir_minutos_en_horas(minutos)    
print (f"{minutos} minutos son {horas} horas y {minutos_restantes} minutos.")

# Otra forma, usando el módulo divmod
minutos_a_convertir = int(input("Ingrese el número de minutos a convertir: "))
def convertir_minutos_en_horas(minutos_a_convertir):
    horas,minutos = divmod(minutos_a_convertir,60) # retorna la parte entera y el módulo (resto)
    return horas,minutos
horas,minutos = convertir_minutos_en_horas(minutos_a_convertir)    
print (f"{minutos_a_convertir} minutos son {horas} horas y {minutos} minutos.")

'''
Ejercicio 16: Contador de Números Pares e Impares
Crea un programa que cuente y muestre la cantidad de números pares e impares en una lista ingresada por el usuario.
'''
lista_usuario = input("Ingrese una lista de números separados por espacios: ")

def sumar_numeros(numeros):
    pares = 0
    impares = 0
    for element in numeros:
        if element % 2 == 0:
            pares +=1
        else:
            impares +=1
    return pares,impares


lista_numeros = list(map(int, lista_usuario.split()))

pares,impares = sumar_numeros(lista_numeros)
print(f"Cantidad de números pares: {pares}")
print(f"Cantidad de números impares: {impares}")

'''
## List comprehension usando la función map ( )
lista_numeros = list(map(int, lista_usuario.split()))

lista_usuario.split()-> da una lista en string: ["2", "5", "10"]
map(int, ...)-> aplica int a cada elemento: [2, 5, 10]
list(...)-> devuelve el resultado en lista
'''
'''
Ejercicio 17: Conversor de Millas a Kilómetros
Escribe un programa que convierta una distancia en millas a kilómetros. Sabiendo que 1 milla equivale a 1.60934 kilómetros.
'''
def calcular_kilometros(millas):
    kilometros = millas * 1.60934
    return kilometros

entrada_millas = float(input(f"Ingrese el número de millas: "))
resultado_kilometro = calcular_kilometros(entrada_millas)
print(f"La distancia de {entrada_millas} millas se corresponde a {resultado_kilometro:.2f} kilometros")
'''
Ejercicio 18: Contador de Palabras
Crea un programa que cuente la cantidad de palabras en una oración ingresada por el usuario.
'''
def contador_palabras(frase):
    cantidad_palabras = frase.split()
    return len(cantidad_palabras)

frase_introducida = str(input(f"Ingrese una frase: "))
resultado_palabras = contador_palabras(frase_introducida)
print(f"La frase: '{frase_introducida}' contiene: {resultado_palabras} palabras")

'''
Ejercicio 19: Verificación de Año Bisiesto
Escribe un programa que determine si un año ingresado por el usuario es bisiesto o no.
'''
def es_año_bisiesto(año):
    if (año % 4 == 0 and año % 100 != 0) or (año % 400 ==0):
        return True
    else:
        return False

introduce_año = int(input(f"Ingrese un año: "))
resultado_año = es_año_bisiesto(introduce_año)

if resultado_año:
    print(f"{introduce_año} es un año bisiesto.")
else:
    print(f"{introduce_año} no es un año bisiesto.")

## Otra forma, haciendo uso de la función isleap() ##
from calendar import isleap
def es_año_bisiesto(año):
        return isleap(año)

introduce_año = int(input(f"Ingrese un año: "))
resultado_año = es_año_bisiesto(introduce_año)

if resultado_año:
    print(f"{introduce_año} es un año bisiesto.")
else:
    print(f"{introduce_año} no es un año bisiesto.")

'''
Ejercicio 20: Suma de Números en una Lista
Crea un programa que sume todos los números en una lista ingresada por el usuario.
'''
lista_usuario = input("Ingrese una lista de números separados por espacios: ")

def sumar_numeros(numeros):
    numeros_totales = 0
    for element in numeros:
        numeros_totales += element
    return numeros_totales

lista_numeros = []
for element in lista_usuario.split():
    lista_numeros.append(int(element))

resultado_suma = sumar_numeros(lista_numeros)
print(f"La suma de los números en la lista es: {resultado_suma}")
'''
Poner lista_numeros como list comprehension en vez de usar un bucle: 

lista_numeros = [int(num) for num in lista_usuario.split()]

## Usando la función map ( )
lista_numeros = list(map(int, lista_usuario.split()))

lista_usuario.split()-> da una lista en string: ["2", "5", "10"]
map(int, ...)-> aplica int a cada elemento: [2, 5, 10]
list(...)-> devuelve el resultado en lista
'''

