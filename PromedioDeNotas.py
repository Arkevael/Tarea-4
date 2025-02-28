def calcular_promedio_ponderado(materias):
    total_puntos = sum(nota * creditos for nota, creditos in materias)
    total_creditos = sum(creditos for _, creditos in materias)
    return total_puntos / total_creditos if total_creditos > 0 else 0

def main():
    try:
        num_materias = int(input("Ingrese el número de materias: "))
        if num_materias <= 0:
            raise ValueError("El número de materias debe ser mayor que cero.")
        
        materias = []
        for i in range(num_materias):
            nota = float(input(f"Ingrese la nota (máx 20) de la materia {i + 1}: "))
            if not 0 <= nota <= 20:
                raise ValueError("Las notas deben estar entre 0 y 20.")
            
            creditos = int(input(f"Ingrese el número de créditos de la materia {i + 1}: "))
            if creditos <= 0:
                raise ValueError("Los créditos deben ser un número positivo.")
            
            materias.append((nota, creditos))
        
        promedio_ponderado = calcular_promedio_ponderado(materias)
        
        print(f"\nPromedio ponderado: {promedio_ponderado:.2f}")
        print("¡Felicidades! Has aprobado." if promedio_ponderado >= 10.5 else "Debes esforzarte más para aprobar.")
        
    except ValueError as e:
        print(f"Error: {e}. Ingrese valores válidos.")

if __name__ == "__main__":
    main()