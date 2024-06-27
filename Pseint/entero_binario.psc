Algoritmo Ent_binario
    Escribir "Ingrese número: "
    Leer x
    binario = ""
    
    Mientras (x > 0) Hacer
        var = x MOD 2
        binario = ConvertirATexto(var) + binario
        x = Trunc(x / 2)
    Fin Mientras
    
    Escribir "Número Binario pedido es: ", binario
FinAlgoritmo

