Algoritmo determinar_mayor_de_tres_con_igualdad
	
    // Inicializamos las variables
    numero1 = 0
    numero2 = 0
    numero3 = 0
    
    // Pedimos los números al usuario
    Escribir 'Dame el primer numero'
    Leer numero1
    
    Escribir 'Dame el segundo numero'
    Leer numero2
    
    Escribir 'Dame el tercer numero'
    Leer numero3
    
    // Determinamos cuál es el mayor usando condicionales if anidados
    Si numero1 > numero2 y numero1 > numero3 Entonces
        Escribir "El numero mayor es:", ConvertirATexto(numero1)
		Sino Si numero2 > numero1 y numero2 > numero3 Entonces
			Escribir "El numero mayor es:", ConvertirATexto(numero2)
		Sino Si numero3 > numero1 y numero3 > numero2 Entonces
				Escribir "El numero mayor es:", ConvertirATexto(numero3)
			Sino
				Escribir "Hay algun numero repetido no podemos determinarlo."
				
			Fin Si
		fin SI
	fin SI
FinAlgoritmo
	