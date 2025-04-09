
# Condicionales #

'''
1. Ejercicio: Dado un número, imprime si es positivo o negativo.
'''
x = 4
if x > 0:
    print("x es positivo")
else:
    print("x es negativo")

'''
2. Ejercicio: Dado un número, imprime si es par o impar.
'''
b = 3
if b % 2 == 0:
    print("b es par")
else:
    print("b es impar")

'''
3. Ejercicio: Dado tres números, encuentra y muestra el mayor de ellos.
'''
def numero_maximo(list_numeros):
    maximo = list_numeros [0]
    for numero in list_numeros:
        if numero > maximo:
            maximo = numero
    return maximo

x1 = numero_maximo([9,10,2])
print(x1)

