import tkinter as tk
from tkinter import messagebox

# Funciones para cada operación
def sumar():
    try:
        a = float(entry_num1.get())
        b = float(entry_num2.get())
        resultado.set(a + b)
    except ValueError:
        messagebox.showerror("Error", "Ingrese valores numéricos válidos")

def restar():
    try:
        a = float(entry_num1.get())
        b = float(entry_num2.get())
        resultado.set(a - b)
    except ValueError:
        messagebox.showerror("Error", "Ingrese valores numéricos válidos")

def multiplicar():
    try:
        a = float(entry_num1.get())
        b = float(entry_num2.get())
        resultado.set(a * b)
    except ValueError:
        messagebox.showerror("Error", "Ingrese valores numéricos válidos")

def dividir():
    try:
        a = float(entry_num1.get())
        b = float(entry_num2.get())
        if b != 0:
            resultado.set(a / b)
        else:
            messagebox.showerror("Error", "No se puede dividir por cero")
    except ValueError:
        messagebox.showerror("Error", "Ingrese valores numéricos válidos")

def potencia():
    try:
        a = float(entry_num1.get())
        b = float(entry_num2.get())
        resultado.set(a ** b)
    except ValueError:
        messagebox.showerror("Error", "Ingrese valores numéricos válidos")

# Configuración de la interfaz gráfica
root = tk.Tk()
root.title("Calculadora")

resultado = tk.DoubleVar()

frame = tk.Frame(root, padx=20, pady=20)
frame.pack()

entry_num1 = tk.Entry(frame)
entry_num1.grid(row=0, column=1)
tk.Label(frame, text="Número 1:").grid(row=0, column=0)

entry_num2 = tk.Entry(frame)
entry_num2.grid(row=1, column=1)
tk.Label(frame, text="Número 2:").grid(row=1, column=0)

btn_sumar = tk.Button(frame, text="Sumar", command=sumar)
btn_sumar.grid(row=2, column=0)

btn_restar = tk.Button(frame, text="Restar", command=restar)
btn_restar.grid(row=2, column=1)

btn_multiplicar = tk.Button(frame, text="Multiplicar", command=multiplicar)
btn_multiplicar.grid(row=3, column=0)

btn_dividir = tk.Button(frame, text="Dividir", command=dividir)
btn_dividir.grid(row=3, column=1)

btn_potencia = tk.Button(frame, text="Potencia", command=potencia)
btn_potencia.grid(row=4, column=0)

label_resultado = tk.Label(frame, text="Resultado:")
label_resultado.grid(row=5, column=0)
entry_resultado = tk.Entry(frame, textvariable=resultado, state="readonly")
entry_resultado.grid(row=5, column=1)

btn_salir = tk.Button(frame, text="Salir", command=root.quit)
btn_salir.grid(row=6, column=0, columnspan=2)

root.mainloop()
