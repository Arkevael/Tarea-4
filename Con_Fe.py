# Codigo de verciones
Kfrutas = int(input(""))
resultado= (Kfrutas*2)/3

entero= resultado % 10
decimal= resultado // 10

if decimal <= 0.29:
    decimal=0
if decimal <= 0.7:
    decimal=0.5
else:
    decimal=1
print(f"{entero}, {decimal}")







