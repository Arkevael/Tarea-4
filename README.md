# Proyecto ADSI2 - Tarea 4

Herramientas para cálculos académicos y matriciales

## 📦 Contenido del proyecto

### 🧮 Módulos principales:
1. **`Matrices_NxM.py`**  
   - Operaciones con matrices de dimensiones arbitrarias  
   - Incluye: suma, resta, multiplicación y transpuesta  
   - Validación de dimensiones compatibles  

2. **`PromedioDeNotas.py`**  
   - Cálculo de promedio ponderado por créditos  
   - Sistema de evaluación sobre 20 puntos  
   - Detección automática de aprobación (≥10.5)  

3. **`calculadora.py`** (Versión mejorada)  
   - **Nueva interfaz gráfica** con Tkinter  
   - Operaciones básicas: +, -, *, /, ^ (potencia)  
   - Validación robusta de entradas  

## ✨ Mejoras implementadas

### 🔧 En la calculadora:
```python
def operar():
    try:
        num1 = float(entrada1.get())
        num2 = float(entrada2.get())
        operacion = operador.get()
        
        if operacion == '+':
            resultado.set(num1 + num2)
        elif operacion == '-':
            resultado.set(num1 - num2)
        # ... otras operaciones ...
    except ValueError:
        messagebox.showerror("Error", "Entradas inválidas")