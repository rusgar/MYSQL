Algoritmo calculadora_repeticion_con_menu
	
    // Declaraci�n de variables
    operador1 = 0
    operador2 = 0
    operacion = 0
    resultado = 0
    continuar = Verdadero  // Variable para controlar si se sigue calculando
	
    Mientras continuar Hacer
        // Mostrar men� de operaciones
        Escribir "Elige la operaci�n que deseas realizar:"
        Escribir "1. Suma"
        Escribir "2. Resta"
        Escribir "3. Multiplicaci�n"
        Escribir "4. Divisi�n"
        Escribir "5. Salir"
        Leer operacion
		
        // Verificar si la operaci�n es v�lida
        Segun operacion Hacer
             1, 2, 3, 4, :
                // Pedir al usuario que ingrese el primer n�mero
                Escribir "Ingresa el primer n�mero:"
                Leer operador1
				
                // Para operaciones distintas de la ra�z cuadrada, pedir el segundo n�mero
                Si operacion <> 5 Entonces
                    Escribir "Ingresa el segundo n�mero:"
                    Leer operador2
                FinSi
				
                // Realizar la operaci�n seleccionada
                Segun operacion Hacer
                     1:
                        resultado = operador1 + operador2
                        Escribir '(', ConvertirATexto(operador1), ' + ', ConvertirATexto(operador2), ')'
                        Escribir "Resultado de la suma: ", resultado
                     2:
                        resultado = operador1 - operador2
                        Escribir '(', ConvertirATexto(operador1), ' - ', ConvertirATexto(operador2), ')'
                        Escribir "Resultado de la resta: ", resultado
                     3:
                        resultado = operador1 * operador2
                        Escribir '(', ConvertirATexto(operador1), ' * ', ConvertirATexto(operador2), ')'
                        Escribir "Resultado de la multiplicaci�n: ", resultado
                     4:
						 // Pedir al usuario que ingrese el segundo n�mero, verificando que no sea cero
						Si operador2 = 0 Entonces
                            Escribir "Error: El divisor no puede ser ' 0 ' ."
                        Sino
                            resultado = operador1 / operador2
                            Escribir '(', ConvertirATexto(operador1), ' / ', ConvertirATexto(operador2), ')'
                            Escribir "Resultado de la divisi�n: ", resultado
                        FinSi
                   
                FinSegun
				
             5:
                // Salir del ciclo mientras
                continuar = Falso
				
			De Otro Modo:
			
                // Opci�n inv�lida, volver al inicio del ciclo
                Escribir "Operaci�n no v�lida. Por favor, elige una opci�n del 1 al 5."
				
        FinSegun
		
    FinMientras
	
    Escribir "Calculadora terminada. Gracias por colaboracion."


FinAlgoritmo
