Algoritmo operacion_combinadas
	// Definimos las variables e iniciliaciomos a cero
    numero1 = 0
    numero2 = 0
    numero3 = 0
    numero4 = 0
    
    // Solicitamos los valores de los n�meros
    Escribir 'Dame el primer numero'
    leer numero1
    Escribir 'Dame el segundo numero'
    leer numero2
    Escribir 'Dame el tercer numero'
    leer numero3
    Escribir 'Dame el cuarto numero'
    leer numero4
    
    // Realizamos la operaci�n (numero1 + numero2 - numero3) * numero4
    resultado = (numero1 + numero2 - numero3) * numero4
	Escribir 'El resultado de la operaci�n combinada es: ', resultado
	
	
	
    
    // Crear la cadena de la operaci�n
    Escribir ConvertirATexto(numero1), ' + ', ConvertirATexto(numero2), ' - ', ConvertirATexto(numero3), ' * ', ConvertirATexto(numero4)
	
	Escribir  '(', ConvertirATexto(numero1), ' + ', ConvertirATexto(numero2), ' - ', ConvertirATexto(numero3),')',  ' * ',  ConvertirATexto(numero4)
    
    // Mostrar la operaci�n y el resultado
    Escribir "operacion sin parentesis seria: " resultado
	Escribir  " opetacion con parentesis seria de esta forma:  " resultado
FinAlgoritmo

