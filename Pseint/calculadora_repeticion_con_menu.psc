Algoritmo calculadora_repeticion_con_menu
	
    // Declaración de variables
    operador1 = 0
    operador2 = 0
    operacion = 0
    resultado = 0
    continuar = Verdadero  // Variable para controlar si se sigue calculando
	
    Mientras continuar Hacer
        // Mostrar menú de operaciones
        Escribir "Elige la operación que deseas realizar:"
        Escribir "1. Suma"
        Escribir "2. Resta"
        Escribir "3. Multiplicación"
        Escribir "4. División"
        Escribir "5. Salir"
        Leer operacion
		
        // Verificar si la operación es válida
        Segun operacion Hacer
             1, 2, 3, 4, :
                // Pedir al usuario que ingrese el primer número
                Escribir "Ingresa el primer número:"
                Leer operador1
				
                // Para operaciones distintas de la raíz cuadrada, pedir el segundo número
                Si operacion <> 5 Entonces
                    Escribir "Ingresa el segundo número:"
                    Leer operador2
                FinSi
				
                // Realizar la operación seleccionada
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
                        Escribir "Resultado de la multiplicación: ", resultado
                     4:
						 // Pedir al usuario que ingrese el segundo número, verificando que no sea cero
						Si operador2 = 0 Entonces
                            Escribir "Error: El divisor no puede ser ' 0 ' ."
                        Sino
                            resultado = operador1 / operador2
                            Escribir '(', ConvertirATexto(operador1), ' / ', ConvertirATexto(operador2), ')'
                            Escribir "Resultado de la división: ", resultado
                        FinSi
                   
                FinSegun
				
             5:
                // Salir del ciclo mientras
                continuar = Falso
				
			De Otro Modo:
			
                // Opción inválida, volver al inicio del ciclo
                Escribir "Operación no válida. Por favor, elige una opción del 1 al 5."
				
        FinSegun
		
    FinMientras
	
    Escribir "Calculadora terminada. Gracias por colaboracion."


FinAlgoritmo
