Algoritmo calculadora_cinco_numeros
	
    // Declaraci�n de variables
    operador1 = 0
    operador2 = 0
    operador3 = 0
    operador4 = 0
    operador5 = 0
    resultado = 0
    
    // Pedir al usuario que ingrese cinco n�meros
    Escribir "Vamos a hacer una calculadora donde debes ingresar cinco n�meros para realizar la operaci�n (operador1 / operador2) + (operador3 * operador4) - operador5."
	
    Escribir "Ingresa el primer n�mero (operador1):"
    Leer operador1
	
    Escribir "Ingresa el segundo n�mero (operador2):"
    Leer operador2
	
    Escribir "Ingresa el tercer n�mero (operador3):"
    Leer operador3
	
    Escribir "Ingresa el cuarto n�mero (operador4):"
    Leer operador4
	
    Escribir "Ingresa el quinto n�mero (operador5):"
    Leer operador5
	
    // Realizamos la operaci�n (operador1 / operador2) + (operador3 * operador4) - operador5
    resultado = (operador1 / operador2) + (operador3 * operador4) - operador5
    
    // Mostrar la operaci�n y el resultado
    Escribir "Operaci�n de los cinco numeros seria la siguinete: (", ConvertirATexto(operador1), " / ", ConvertirATexto(operador2), ") + (", ConvertirATexto(operador3), " * ", ConvertirATexto(operador4), ") - ", ConvertirATexto(operador5)
    Escribir "Resultado Final: ", resultado
	
FinAlgoritmo


