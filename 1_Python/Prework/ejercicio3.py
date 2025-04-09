
# Bucles #

'''
1. Ejercicio: Imprime los números del 1 al 10 usando un bucle for.
'''
print("BUCLES")
print("Ejercicio 1")
numeros = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
for dieznumeros in numeros:
    print(dieznumeros, end=" ")

## Otra forma #
print()
print("Ejercicio1.1")
numeros = range(10)
for dieznumeros in numeros:
    print(dieznumeros+1, end=" ")

## Otra forma ##
print()
print("Ejercicio 1.2")
numeros = range(1, 11)
for dieznumeros in numeros:
    print(dieznumeros, end=" ")


'''
2. Ejercicio: Imprime los números pares del 1 al 20 usando un bucle while.
'''
print()
print("Ejercicio 2")
numeros_1 = 1
while numeros_1 <= 20:
    if numeros_1 % 2 == 0:
        print(numeros_1, end=" ")
    numeros_1 += 1

'''
3. Ejercicio: Usa un bucle para calcular la suma de los números del 1 al 100.
'''

print()
print("Ejercicio 3")

i = 1
j = 100

x = range(i, j+1)
suma = 0

for y in x:
    suma += y

print("La suma es:", suma)

