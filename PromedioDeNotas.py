def calcular_promedio_ponderado(materias):
    """
    Calcula el promedio ponderado de las materias.
    
    Args:
        materias: Lista de tuplas (nota, créditos)
    
    Returns:
        float: Promedio ponderado, o 0 si no hay créditos
    """
    if not materias:
        return 0.0
    
    total_puntos = sum(nota * creditos for nota, creditos in materias)
    total_creditos = sum(creditos for _, creditos in materias)
    
    return total_puntos / total_creditos if total_creditos > 0 else 0.0


def ingresar_materias():
    """
    Solicita al usuario ingresar los datos de las materias.
    
    Returns:
        list: Lista de tuplas (nota, créditos)
    """
    materias = []
    
    try:
        num_materias = int(input("Ingrese el número de materias: "))
        if num_materias <= 0:
            raise ValueError("Debe ingresar al menos una materia.")
        
        for i in range(1, num_materias + 1):
            print(f"\nMateria {i}:")
            nota = float(input("Nota (0-20): "))
            if not 0 <= nota <= 20:
                raise ValueError("La nota debe estar entre 0 y 20.")
            
            creditos = int(input("Créditos: "))
            if creditos <= 0:
                raise ValueError("Los créditos deben ser positivos.")
            
            materias.append((nota, creditos))
            
    except ValueError as e:
        print(f"\nError: {e}")
        return None
    
    return materias


def mostrar_resultado(promedio):
    """
    Muestra el resultado del cálculo y el estado de aprobación.
    
    Args:
        promedio (float): Promedio ponderado calculado
    """
    print(f"\n{'='*40}")
    print(f"Promedio ponderado final: {promedio:.2f}")
    print("="*40)
    
    if promedio >= 10.5:
        print("\n¡Felicidades! Has aprobado con éxito.")
    else:
        print("\nEstado: No aprobado")
        print("Recomendación: Debes esforzarte más en tus estudios.")


def main():
    print("CALCULADORA DE PROMEDIO PONDERADO")
    print("="*40)
    print("Instrucciones:")
    print("- Ingresa la cantidad de materias")
    print("- Para cada materia, proporciona la nota (0-20) y los créditos")
    print("- El sistema calculará automáticamente tu promedio\n")
    
    while True:
        materias = ingresar_materias()
        if materias is not None:
            break
    
    promedio = calcular_promedio_ponderado(materias)
    mostrar_resultado(promedio)


if __name__ == "__main__":
    main()