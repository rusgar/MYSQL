Algoritmo Ent_binario
    Escribir "Ingrese n�mero: "
    Leer x
    binario = ""
    
    Mientras (x > 0) Hacer
        var = x MOD 2
        binario = ConvertirATexto(var) + binario
        x = Trunc(x / 2)
    Fin Mientras
    
    Escribir "N�mero Binario pedido es: ", binario
FinAlgoritmo

