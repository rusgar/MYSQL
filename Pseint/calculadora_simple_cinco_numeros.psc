Algoritmo calculadora_cinco_numeros
	
    // Declaración de variables
    operador1 = 0
    operador2 = 0
    operador3 = 0
    operador4 = 0
    operador5 = 0
    resultado = 0
    
    // Pedir al usuario que ingrese cinco números
    Escribir "Vamos a hacer una calculadora donde debes ingresar cinco números para realizar la operación (operador1 / operador2) + (operador3 * operador4) - operador5."
	
    Escribir "Ingresa el primer número (operador1):"
    Leer operador1
	
    Escribir "Ingresa el segundo número (operador2):"
    Leer operador2
	
    Escribir "Ingresa el tercer número (operador3):"
    Leer operador3
	
    Escribir "Ingresa el cuarto número (operador4):"
    Leer operador4
	
    Escribir "Ingresa el quinto número (operador5):"
    Leer operador5
	
    // Realizamos la operación (operador1 / operador2) + (operador3 * operador4) - operador5
    resultado = (operador1 / operador2) + (operador3 * operador4) - operador5
    
    // Mostrar la operación y el resultado
    Escribir "Operación de los cinco numeros seria la siguinete: (", ConvertirATexto(operador1), " / ", ConvertirATexto(operador2), ") + (", ConvertirATexto(operador3), " * ", ConvertirATexto(operador4), ") - ", ConvertirATexto(operador5)
    Escribir "Resultado Final: ", resultado
	
FinAlgoritmo


