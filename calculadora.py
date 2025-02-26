# Funciones para cada operación
def sumar(a, b):
    return a + b

def restar(a, b):
    return a - b

def multiplicar(a, b):
    return a * b

def dividir(a, b):
    if b != 0:
        return a / b
    else:
        return "Error: No se puede dividir por cero"

# Función para mostrar el menú
def mostrar_menu():
    print("Seleccione una operación:")
    print("1. Sumar")
    print("2. Restar")
    print("3. Multiplicar")
    print("4. Dividir")
    print("5. Salir")

# Función principal
def calculadora():
    while True:
        mostrar_menu()
        opcion = input("Ingrese el número de la operación deseada: ")

        if opcion == '5':
            print("¡Hasta luego!")
            break

        if opcion in ['1', '2', '3', '4']:
            try:
                num1 = float(input("Ingrese el primer número: "))
                num2 = float(input("Ingrese el segundo número: "))
            except ValueError:
                print("Por favor, ingrese un número válido.")
                continue

            if opcion == '1':
                print(f"{num1} + {num2} = {sumar(num1, num2)}")
            elif opcion == '2':
                print(f"{num1} - {num2} = {restar(num1, num2)}")
            elif opcion == '3':
                print(f"{num1} * {num2} = {multiplicar(num1, num2)}")
            elif opcion == '4':
                print(f"{num1} / {num2} = {dividir(num1, num2)}")
        else:
            print("Opción no válida, por favor intente nuevamente.")

# Ejecutar la calculadora
calculadora()
