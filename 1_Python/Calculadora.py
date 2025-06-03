def sumar(x,y):
  return x + y

def restar(x,y):
  return x - y

def multiplicar(x,y):
  return x * y

'''Hay que poner una restricción, porque la división si da 0 será infinito'''
def division(x,y):
  if y == 0:
    return 'La division entre cero no se puede realizar'
  return x / y

def resto (x,y):
  if y == 0:
    return ' La division entre cero no se puede realizar'
  return x % y 

def potencia(x,y):
  return x ** y
'''Una raíz cuadrada se puede poner como un número elevado a 0,5, la raiz cuadrada de un numero negativo se vuelve imaginario, por lo que hay que poner una clausula'''

def raiz_cuadrada(x):
  if x < 0:
    return 'Esta calculadora no realiza raices cudradas con numeros negativos'
  return x** 0.5

def calculadora():
  print('Bienvenido a nuestra calculadora')
  while True:
    print ('Opciones:')
    print ('1. Sumar:')
    print ('2. Restar:')
    #multiplicar,dividir,potencia,raiz cuadrada,resto, el 8 sera salir
    eleccion = input( 'Seleccione una opcion (1/2/3/4/5/6/7/8):') #recoger un valor del usuario y lo podemos guardar en una variable, recoge si o si la representacion de un string, osea si le ponemos un 8 no recoge el valor 8 sino el string '8'
    if eleccion == '8':
      print('Hasta luego')
      break
      
    num1 = float(input('Ingrese el primer numero:'))#input siempre nos devuelve la representacion de un numero en string, por ello lo convertimos
    if eleccion != '6':
      num2 = float(input('Ingrese el segundo numero:'))
    
    if eleccion == '1':
      print ('_'*15)#para que salga mas bonito...
      print('Resultado: ',sumar(num1,num2))
      print ('_'*15)
    elif eleccion == '2':
      print('Resultado: ',restar(num1,num2))
    elif eleccion == '3':
      print('Resultado: ',multiplicar(num1,num2))
    elif eleccion == '4':
      print('Resultado: ',division(num1,num2))
    elif eleccion == '5':
      print('Resultado: ',potencia(num1,num2))
    elif eleccion == '6':
      print('Resultado: ',raiz_cuadrada(num1,num2)) ##añadir 7 y 8
      
#if__name__== '__main__':  añadir esa parte de codigo, me da error por eso la comitee #se pueden importar y exportar funciones en otros ficheros. ejemplo calculadora. py importame la def suma.  si calculadora la esta llamando otro fichero que no sea este calculadora.py no se ejecutara, ya que puede cargar mucho el otro fichero.
calculadora() #falta resto y raiz cuadrda
