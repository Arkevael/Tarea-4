import tkinter as tk
from tkinter import messagebox

def obtener_valores():
    try:
        a = float(entry_num1.get())
        b = float(entry_num2.get())
        return a, b
    except ValueError:
        messagebox.showerror("Error", "Ingrese valores numéricos válidos")
        return None, None

def sumar():
    a, b = obtener_valores()
    if a is not None and b is not None:
        resultado = a + b
        label_resultado.config(text=f"Resultado: {resultado}")

def restar():
    a, b = obtener_valores()
    if a is not None and b is not None:
        resultado = a - b
        label_resultado.config(text=f"Resultado: {resultado}")

def multiplicar():
    a, b = obtener_valores()
    if a is not None and b is not None:
        resultado = a * b
        label_resultado.config(text=f"Resultado: {resultado}")

def dividir():
    a, b = obtener_valores()
    if a is not None and b is not None:
        if b == 0:
            messagebox.showerror("Error", "No se puede dividir por cero")
            return
        resultado = a / b
        label_resultado.config(text=f"Resultado: {resultado}")

def potencia():
    a, b = obtener_valores()
    if a is not None and b is not None:
        resultado = a ** b
        label_resultado.config(text=f"Resultado: {resultado}")

def limpiar():
    entry_num1.delete(0, tk.END)
    entry_num2.delete(0, tk.END)
    label_resultado.config(text="Resultado:")

# Crear ventana principal
root = tk.Tk()
root.title("Calculadora Básica")

# Centrar ventana en pantalla
window_width = 300
window_height = 220
screen_width = root.winfo_screenwidth()
screen_height = root.winfo_screenheight()
pos_x = int((screen_width - window_width) / 2)
pos_y = int((screen_height - window_height) / 2)
root.geometry(f"{window_width}x{window_height}+{pos_x}+{pos_y}")

# Etiquetas y entradas
tk.Label(root, text="Número 1:").pack(pady=(10, 0))
entry_num1 = tk.Entry(root)
entry_num1.pack()

tk.Label(root, text="Número 2:").pack(pady=(10, 0))
entry_num2 = tk.Entry(root)
entry_num2.pack()

# Botones para operaciones
frame_botones = tk.Frame(root)
frame_botones.pack(pady=10)

btn_sumar = tk.Button(frame_botones, text="+", width=4, command=sumar)
btn_sumar.grid(row=0, column=0, padx=3)

btn_restar = tk.Button(frame_botones, text="-", width=4, command=restar)
btn_restar.grid(row=0, column=1, padx=3)

btn_multiplicar = tk.Button(frame_botones, text="*", width=4, command=multiplicar)
btn_multiplicar.grid(row=0, column=2, padx=3)

btn_dividir = tk.Button(frame_botones, text="/", width=4, command=dividir)
btn_dividir.grid(row=0, column=3, padx=3)

btn_potencia = tk.Button(frame_botones, text="^", width=4, command=potencia)
btn_potencia.grid(row=0, column=4, padx=3)

# Etiqueta para mostrar resultado
label_resultado = tk.Label(root, text="Resultado:", font=("Arial", 14))
label_resultado.pack(pady=10)

# Botón para limpiar
btn_limpiar = tk.Button(root, text="Limpiar", command=limpiar)
btn_limpiar.pack()

root.mainloop()
