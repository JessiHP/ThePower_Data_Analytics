# Bucles y Funciones #
'''
1. Ejercicio: Define una función que utilice un bucle para imprimir los primeros n números de la serie de Fibonacci.
'''
def fib(n):
    if n == 0:
        return 0
    elif n == 1:
        return 1
    else:
        return fib(n - 1) + fib(n - 2)
n = 10
print(f"El numero {n} de la serie de Fibonacci es {fib(n)}")

'''
2. Ejercicio: Define una función que tome un número y retorne una lista de su divisores.
'''
def divisor(n):
    x = list ()
    for c in range (1,n):
        if n%c ==0:
            x.append(c)
    return x

b = 12
print ("Los divisores de" ,(b), "son",divisor(b))

'''
3. Ejercicio: Define una función que tome una lista y retorne una nueva lista con los elementos únicos de la lista original.
'''
def unico(entrylist):
    outputlist = list ()
    valorvalido=True
    for indexc, c in enumerate(entrylist, start=0):
        
        for indexd, d in enumerate(entrylist, start=0):    
            if indexc==indexd:
                valorvalido=True
            elif entrylist[indexc]!=entrylist[indexd]:
                valorvalido=True
            elif entrylist[indexc]==entrylist[indexd]:
                valorvalido=False
                break
        if valorvalido==True:
            outputlist.append(c)
    return outputlist        


a=['agua','tomate','agua','peras','aguacate','aguacate']
b=[3,4,5,2,4,5,2]

print("Valores unicos de la lista" ,(a),"=",unico(a))

'''
4. Ejercicio: Define una función que tome un número y retorne la suma de sus dígitos.
'''
def sumdig(n):
    x = list(str(n))
    result = 0
    for c in x:
        result = result + int(c)
    return result

a = 4567
print("La suma de los digitos de",(a), "es",sumdig(a))

'''
5. Ejercicio: Define una función que tome una cadena y cuente el número de vocales en la cadena.
'''
def findvowels(cadena:str):
    vowels = list("aeiouAEIOU")
    sumvowels=0
    for c in vowels:
        sumvowels= sumvowels + cadena.count(c)
    return sumvowels

cadena = ('hola paraiso verde natural')
print("El numero de vocales en '",(cadena),"' es",findvowels(cadena))

'''
6. Ejercicio: Define una función que tome una lista y un número n, y retorne los primeros n elementos de la lista.
'''
def firstn (lista:list,n:int):
    index=0
    sublista = list()
    for element in lista:
        if index==n:
            break
        if index!=n:
            sublista.append(element)
        index=index+1
    return sublista

n = 2
lista = ["papas",4,3,5,"libros"]
print ("Los primeros elementos de ",(lista),"son",firstn(lista,n))

'''
7. Ejercicio: Define una función que tome una cadena y retorne la cantidad de letras mayúsculas y minúsculas en la cadena.
'''
def mayusminusletter(cadena:str):
    upperletter=0
    lowerletter=0
    for element in cadena:
            upperletter= upperletter + str.isupper(element)
            lowerletter= lowerletter + str.islower(element)
    return (upperletter,lowerletter)

cadena= "hOLa amiGos"
countletter=mayusminusletter(cadena)
countmayuscula=countletter [0]
countminuscula=countletter [1]
print("El numero de mayusculas en mi cadena", (cadena),"son",(countmayuscula))
print("El numero de minusculas en mi cadena", (cadena),"son",(countminuscula))

#Otra forma##
def mayusminusletter(cadena:str):
    upperletter=0
    lowerletter=0
    for element in cadena:
        if str.isupper(element):
            upperletter=upperletter +1
        if str.islower(element):
            lowerletter=lowerletter + 1
    return (upperletter,lowerletter)

cadena= "BueNOS Dias"
countletter=mayusminusletter(cadena)
countmayuscula=countletter [0]
countminuscula=countletter [1]
print("El numero de mayusculas en mi cadena", (cadena),"son",(countmayuscula))
print("El numero de minusculas en mi cadena", (cadena),"son",(countminuscula))

'''
8. Ejercicio: Define una función que tome un número y retorne True si es un número perfecto, False en caso contrario. Un número perfecto es aquel que es igual a la suma de sus divisores propios positivos. Por ejemplo, 6 es un número perfecto porque sus divisores son 1, 2 y 3, y 6 = 1 + 2 + 3.
'''
def num_perfecto (num):
    suma_divisores = sum (divisor for divisor in range (1,num) if num % divisor ==0)
    return suma_divisores == num 
print (num_perfecto (6))

'''
9. Ejercicio: Define una función que reciba un número y retorne su representación en binario.
'''
def convertir_a_binario(numero):
    return bin(numero).replace("0b", "")
print(convertir_a_binario(5))

## Otra forma ##
def convertir_a_binario(numero): 
    return bin(numero)[2:] #[2:] quito los dos primero valores de la cadena que son el 0b(corta la cadena en el tercer carácter), en el anterior ejemplo se reemplaza el 0b en cualquier lugar de la cadena.
print(convertir_a_binario(5))
'''
10. Ejercicio: Define una función que reciba dos listas y retorne la intersección de ambas (los elementos que están en las dos listas).
'''
def interseccion (lista1,lista2):
    return list(set(lista1) & set(lista2))
print(interseccion([2,4,5,6,7],[6,7,9,10,12]))

'''
11. Ejercicio: Define una función que tome una cadena y determine si es un palíndromo (se lee igual de izquierda a derecha que de derecha a izquierda).
'''
def palindromo (cadena):
    return cadena == cadena [::-1]
print(palindromo("oso"))

'''
12. Ejercicio: Escribe un programa que imprima los números del 1 al 50, pero para múltiplos de tres imprima “Fizz” en lugar del número y para los múltiplos de cinco imprima “Buzz”. Para números que son múltiplos de tanto tres como cinco imprima “FizzBuzz”.
'''
def fizzbuzz ():
    for num in range(1,51):
        if num % 3 == 0 and num % 5 == 0:
            print ("Fizzbuzz")
        elif num % 3 == 0:
            print ("Fizz")
        elif num % 5 == 0:
            print ("Buzz")
        else:
            print (num)
fizzbuzz()
'''
13. Ejercicio: Define una función que tome una lista y retorne la lista ordenada en orden ascendente.
'''
def lista_ordenada(lista):
    return sorted(lista)

print(lista_ordenada([5,6,8,12,43,22,10,0,2]))
    
'''
14. Ejercicio: Define una función que reciba una lista de palabras y un entero n, y retorne la lista de palabras que son más largas que n.
'''
def palabras_mas_largas (lista_palabras,n):
    return [palabra for palabra in lista_palabras if len(palabra) > n]

palabras = ["conejo","buey","elefante","antilope"]
n = 7
resultado = palabras_mas_largas(palabras,n)
print(resultado)

'''
15. Ejercicio: Define una función que tome un número y calcule su serie de Fibonacci.
'''
def fib(n):
    if n <= 0:
        return []
    elif n == 1:
        return [0]
    
    serie = [0, 1]
    while len(serie) < n:
        serie.append(serie[-1] + serie[-2])
    return serie

num = int(input("Ingrese un número: "))
resultado = fib(num)
print(f"Serie de Fibonacci hasta {num} términos: {resultado}")

'''
16. Ejercicio: Define una función que tome una lista de números y retorne el número más grande de la lista.
'''
def numero_mas_grande(lista):
    return max(lista)

numeros = [3,6,45,32,56]
resultado = numero_mas_grande(numeros)
print(f"El numero mas grande de la lista es: {resultado}")
'''
17. Ejercicio: Define una función que reciba un número y retorne la suma de sus dígitos al cubo.
'''
def suma_digitos_cubo (n):
    return sum(int(digito) **3 for digito in str (n))

print (suma_digitos_cubo(346))
'''
18. Ejercicio: Define una función que reciba una lista de números y retorne el segundo número más grande de la lista.
'''
def segundo_numero_mas_grande(lista):
    return sorted(set(lista),reverse=True)[1]

numeros = [2,5,7,8,12,6]
resultado = segundo_numero_mas_grande(numeros)
print(f"El segundo número mas grande es: {resultado}")

'''
19. Ejercicio: Define una función que tome dos listas y retorne True si tienen al menos un miembro en común, de lo contrario, retorne False.
'''
#def miembro_en_comun(lista1,lista2):
def miembro_comun(lista1, lista2):
    return bool(set(lista1) & set(lista2))

lista_a = [1, 2, 3, 4]
lista_b = [5, 6, 3, 8]
resultado = miembro_comun(lista_a, lista_b)
print(f"¿Tienen un elemento en común? {resultado}")

'''
20. Ejercicio: Define una función que tome una lista y retorne una nueva lista con los elementos de la lista original en orden inverso.
'''
def orden_inverso (lista):
    return lista [::-1]

numeros = [2,9,6,8,12]
print(orden_inverso(lista=numeros))

'''
21. Ejercicio: Define una función que reciba una cadena y cuente el número de dígitos y letras que contiene.
'''
def contar_digitos_letras(cadena):
    digitos = sum(num.isdigit() for num in cadena)
    letras = sum(num.isalpha() for num in cadena)
    return digitos, letras

print(contar_digitos_letras("Barcelona 2025"))

'''
22. Ejercicio: Define una función que reciba una lista de números y retorne la suma acumulada de los números
'''
def suma_acumulada_de_numeros(lista):
    
    suma = 0
    suma_acumulada = []
    for num in lista:
        suma += num 
        suma_acumulada.append(suma) 
    return suma_acumulada

numeros = [1, 2, 3, 4, 5]
resultado = suma_acumulada_de_numeros(numeros)
print(f"Suma acumulada: {resultado}")

'''
23. Ejercicio: Define una función que encuentre el elemento más común en una lista.
'''
from collections import Counter

def elemento_mas_comun(lista):
    return Counter(lista).most_common(1)[0][0]

colores = ["rojo","verde","azul","azul","verde","azul"]
resultado = elemento_mas_comun(colores)
print(f"el elemento más común es:{resultado}")    
'''
La función Counter(lista).most_common() devuelve una lista de tuplas.
- Al hacer Counter(lista).most_common(1) nos devolverá solo el elemento mas frecuente y su frecuencia→ [(“azul”,3)]
- Al hacer Counter(lista).most_common(1)[0] nos devolverá el valor del primer indice de la lista → (“azul”,3)
- Al hacer Counter(lista).most_common(1)[0][0] nos devolverá el valor del primer indice de la tupla, descartando la cantidad-frecuencia → “azul”, que es lo que queremos'''
'''
24. Ejercicio: Define una función que tome un número y retorne un diccionario con la tabla de multiplicar de ese número del 1 al 10.
'''
def tabla_de_multiplicar(numero):
    return {n: numero * n for n in range (1,11)} # 1:2*1

print (tabla_de_multiplicar(2))
'''
25. Ejercicio: Define una función que tome una cadena y retorne un diccionario con la cantidad de apariciones de cada caracter en la cadena.
'''
def cuenta_caracteres(cadena):
    return {caracter:cadena.count(caracter) for caracter in cadena}

print (cuenta_caracteres("Aprendiendo python"))

'''
26. Ejercicio: Define una función que tome dos listas y retorne la lista de elementos que no están en ambas listas.
'''
def elementos_diferentes(lista1,lista2):
    return list(set(lista1) ^ set(lista2))

print(elementos_diferentes(["rojo","azul","verde"],["rojo","verde","violeta"]))
'''
27. Ejercicio: Define una función que tome una lista y retorne la lista sin duplicados.
'''
def sin_duplicados(lista):
    return list(set(lista))

print(sin_duplicados([1,2,3,5,6,3,4,2,6,1]))
'''
28. Ejercicio: Define una función que reciba un número entero positivo y retorne la suma de los cuadrados de todos los números pares menores o iguales a ese número.
'''
def suma_cuadrados(num):
    return sum(n**2 for n in range (2,num+1,2))

print(suma_cuadrados(4))
'''
29. Ejercicio: Define una función que reciba una lista de números y retorne el promedio de los números en la lista.
'''
def promedio(lista):
    return sum(lista)/len(lista) #len(lista) calcula la cantidad de elementos en la lista

print(promedio([4,32,6,75,4]))
'''
30. Ejercicio: Define una función que reciba una lista de cadenas y retorne la cadena más larga en la lista.
'''
def cadena_mas_larga(lista_cadenas):
    return max(lista_cadenas, key=len)

cadenas = ["gato", "elefante", "perro", "hipopótamo"]
resultado = cadena_mas_larga(cadenas)
print(f"La cadena más larga es: {resultado}")

'''
31. Ejercicio: Define una función que reciba un número entero n y retorne una lista con los n primeros números primos.
'''
def es_primo(num): # Verifica si un número es primo.
    if num < 2:
        return False
    for n in range(2, int(num ** 0.5) + 1):
        if num % n == 0:
            return False
    return True

def primeros_n_primos(n): # Retorna una lista con los n primeros números primos.
    primos = []
    num = 2  # Comenzamos con el primer número primo
    while len(primos) < n:
        if es_primo(num):
            primos.append(num)
        num += 1
    return primos

print(primeros_n_primos(6))

'''
32. Ejercicio: Define una función que reciba una cadena y retorne la misma cadena pero con las palabras en orden inverso.
'''
def palabras_inversas(cadena):
    return ' '.join(cadena.split()[::-1])
print(palabras_inversas("Estudia Python y SQL"))
'''
33. Ejercicio: Escribe una función que reciba una lista de tuplas y retorne una lista ordenada basada en el último elemento de cada tupla.
'''
def ordenar_por_ultimo_elemento(lista_tuplas):
    return sorted(lista_tuplas, key=lambda x: x[-1])
print(ordenar_por_ultimo_elemento([(1, 3), (4, 1), (3, 2),(5, 0)]))
'''
34. Ejercicio: Define una función que reciba una cadena y retorne la cantidad de letras vocales en la cadena.
'''
def contar_vocales(cadena):
    vocales = "aeiouAEIOU"
    return sum(1 for letra in cadena if letra in vocales)
print(contar_vocales("Ir a Brazil y Argentina en barco"))
'''
35. Ejercicio: Define una función que reciba un número entero y retorne True si es un número primo, de lo contrario retorne False.
'''
def es_primo(num):
    if num < 2:
        return False
    for n in range(2, int(num ** 0.5) + 1):
        if num % n == 0:
            return False
    return True

print(es_primo(13))
