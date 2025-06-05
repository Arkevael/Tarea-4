def fibonacci_iterativo(n):
    """
    Genera una lista con los primeros n términos de la serie de Fibonacci.
    
    Parámetros:
        n (int): número de términos a generar (debe ser entero positivo).
        
    Retorna:
        list: lista con la serie de Fibonacci o mensaje de error si n es inválido.
    """
    if not isinstance(n, int) or n <= 0:
        return "Error: El número debe ser un entero positivo mayor a 0"
    elif n == 1:
        return [0]
    elif n == 2:
        return [0, 1]

    fib = [0, 1]
    for i in range(2, n):
        fib.append(fib[i - 1] + fib[i - 2])

    return fib

# Entrada del usuario
try:
    n = int(input("Ingrese la cantidad de términos de Fibonacci que desea: "))
    resultado = fibonacci_iterativo(n)
    if isinstance(resultado, list):
        print(f"Serie Fibonacci con {n} términos:")
        print(', '.join(str(num) for num in resultado))
    else:
        print(resultado)
except ValueError:
    print("Error: Debe ingresar un número entero válido.")
