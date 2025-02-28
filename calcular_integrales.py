import sympy as sp

x = sp.symbols('x')
funcion = sp.sin(x)  # Cambia la función a integrar

integral_indefinida = sp.integrate(funcion, x)
print(f"Integral indefinida de {funcion}: {integral_indefinida} + C")
