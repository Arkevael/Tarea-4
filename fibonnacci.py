def fibonacci_iterativo(n):
    if n <= 0:
        return "El número debe ser mayor a 0"
    elif n == 1:
        return [0]
    elif n == 2:
        return [0, 1]
    
    fib = [0, 1]
    for i in range(2, n):
        fib.append(fib[i - 1] + fib[i - 2])
    
    return fib

n = int(input("Ingrese la cantidad de términos: "))
print(fibonacci_iterativo(n))
