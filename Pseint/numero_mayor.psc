Algoritmo numero_mayor
	
	// inicialimos las varianbles
	
	numero1=0
	numero2=0
	
	//pedimos los numeros
	Escribir  'Dame el primer numero'
	leer numero1
	
	Escribir  'Dame el segundo numero'
	leer numero2
	
	// Determinamos cuál es el mayor usando un condicional if
    Si numero1 > numero2 Entonces
        Escribir "El  numero mayor es:", ConvertirATexto(numero1)
    Sino
        Escribir "El  numero mayor es:",ConvertirATexto(numero2)
		Si numero1=numero2 Entonces
			Escribir " Son numeros iguales... intentalo otra vez" 
		FinSi
    Fin Si	
	


	
FinAlgoritmo
