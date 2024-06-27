Algoritmo calculadora_repeticion_continuar
	
    // Declaraci�n de variables
    operador1 = 0
    operador2 = 0
    operacion = ""   // Variable para almacenar el car�cter de la operaci�n
    resultado = 0
    continuar = "s"  // Variable para controlar si se sigue calculando
	
    Mientras continuar = "s" Hacer
        // Pedir al usuario que ingrese el primer n�mero
        Escribir "Ingresa el primer n�mero:"
        Leer operador1
		
        // Mostrar los caracteres representativos de las operaciones
		Escribir "Selecciona el car�cter de la operaci�n que deseas realizar:"
        Escribir "  +  ", "  -  ",  "  *  ", "  /  ", "  s  "
        Leer operacion
		
        Segun operacion Hacer
             "+":
                // Pedir al usuario que ingrese el segundo n�mero
                Escribir "Ingresa el segundo n�mero:"
                Leer operador2
                
                // Realizar la suma
                resultado = operador1 + operador2
                Escribir '(', ConvertirATexto(operador1), ' + ', ConvertirATexto(operador2), ')'
                Escribir "Resultado de la suma: ", resultado
				
             "-":
                // Pedir al usuario que ingrese el segundo n�mero
                Escribir "Ingresa el segundo n�mero:"
                Leer operador2
                
                // Realizar la resta
                resultado = operador1 - operador2
                Escribir '(', ConvertirATexto(operador1), ' - ', ConvertirATexto(operador2), ')'
                Escribir "Resultado de la resta: ", resultado
				
             "*":
                // Pedir al usuario que ingrese el segundo n�mero
                Escribir "Ingresa el segundo n�mero:"
                Leer operador2
                
                // Realizar la multiplicaci�n
                resultado = operador1 * operador2
                Escribir '(', ConvertirATexto(operador1), ' * ', ConvertirATexto(operador2), ')'
                Escribir "Resultado de la multiplicaci�n: ", resultado
				
             "/":
                // Pedir al usuario que ingrese el segundo n�mero, verificando que no sea cero
                Escribir "Ingresa el segundo n�mero (distinto de 0):"
                Leer operador2
                
                Si operador2 = 0 Entonces
                    Escribir "Error: El divisor no puede ser ' 0 ' ."
                Sino
                    // Realizamos la divisi�n
                    resultado = operador1 / operador2
                    Escribir '(', ConvertirATexto(operador1), ' / ', ConvertirATexto(operador2), ')'
                    Escribir "Resultado de la divisi�n: ", resultado
                FinSi
				
              "s":
                // Salir del ciclo Mientras
                continuar = "n"
				
            De Otro Modo:
				
                // Opci�n inv�lida, volver al inicio del ciclo del bucle
                Escribir "Operaci�n no v�lida. Por favor, elige una caracter dentro de la descripcion."
				
				
        FinSegun
		
        // Nos hace la pregunta si deseamos continuar
        Si continuar = "s" Entonces
            Escribir "�Deseas realizar otra operaci�n? (S/N)"
            Leer continuar
        FinSi
		
    FinMientras
	
    Escribir "Calculadora terminada. Gracias por su atenci�n."

FinAlgoritmo
