import sympy as sp

x = sp.symbols('x')

# Entrada de función por usuario
funcion_str = input("Ingrese la función a integrar respecto a x (ejemplo: sin(x), x**2, exp(x)): ")
funcion = sp.sympify(funcion_str)

# Integral indefinida
integral_indefinida = sp.integrate(funcion, x)
print(f"\nIntegral indefinida de {funcion}:")
sp.pprint(integral_indefinida, use_unicode=True)
print("+ C\n")

# Integral definida (opcional)
respuesta = input("¿Desea calcular integral definida? (s/n): ").lower()
if respuesta == 's':
    limite_inf = float(input("Ingrese límite inferior: "))
    limite_sup = float(input("Ingrese límite superior: "))
    integral_definida = sp.integrate(funcion, (x, limite_inf, limite_sup))
    print(f"\nIntegral definida de {funcion} desde {limite_inf} hasta {limite_sup}: {integral_definida}")
