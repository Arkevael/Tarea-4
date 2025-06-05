import numpy as np

def calcular_promedio_manual(matriz):
    suma_total = sum(sum(fila) for fila in matriz)
    total_elementos = len(matriz) * len(matriz[0])
    return suma_total / total_elementos

def main():
    try:
        # Pedir tamaño de la matriz al usuario desde teclado
        n = int(input("Ingrese el número de filas (n): "))
        m = int(input("Ingrese el número de columnas (m): "))
        
        # Inicializar matriz vacía
        matriz = []
        
        # Pedir datos al usuario
        print("Ingrese los valores de la matriz:")
        for i in range(n):
            fila = list(map(float, input(f"Fila {i + 1}: ").split()))
            if len(fila) != m:
                raise ValueError("Cada fila debe contener exactamente m valores.")
            matriz.append(fila)
        
        matriz = np.array(matriz)
        
        # Mostrar la matriz
        print("\nMatriz ingresada:")
        print(matriz)
        
        # Cálculo manual del promedio
        promedio_manual = calcular_promedio_manual(matriz)
        
        # Cálculo con numpy
        promedio_numpy = np.mean(matriz)
        
        # Mostrar resultados
        print(f"\nPromedio calculado manualmente: {promedio_manual:.2f}")
        print(f"Promedio calculado con numpy: {promedio_numpy:.2f}")
        
    except ValueError as e:
        print(f"Error: {e}. Ingrese valores válidos.")

if __name__ == "__main__":
    main()
