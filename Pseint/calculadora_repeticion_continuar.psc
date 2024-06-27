Algoritmo calculadora_repeticion_continuar
	
    // Declaración de variables
    operador1 = 0
    operador2 = 0
    operacion = ""   // Variable para almacenar el carácter de la operación
    resultado = 0
    continuar = "s"  // Variable para controlar si se sigue calculando
	
    Mientras continuar = "s" Hacer
        // Pedir al usuario que ingrese el primer número
        Escribir "Ingresa el primer número:"
        Leer operador1
		
        // Mostrar los caracteres representativos de las operaciones
		Escribir "Selecciona el carácter de la operación que deseas realizar:"
        Escribir "  +  ", "  -  ",  "  *  ", "  /  ", "  s  "
        Leer operacion
		
        Segun operacion Hacer
             "+":
                // Pedir al usuario que ingrese el segundo número
                Escribir "Ingresa el segundo número:"
                Leer operador2
                
                // Realizar la suma
                resultado = operador1 + operador2
                Escribir '(', ConvertirATexto(operador1), ' + ', ConvertirATexto(operador2), ')'
                Escribir "Resultado de la suma: ", resultado
				
             "-":
                // Pedir al usuario que ingrese el segundo número
                Escribir "Ingresa el segundo número:"
                Leer operador2
                
                // Realizar la resta
                resultado = operador1 - operador2
                Escribir '(', ConvertirATexto(operador1), ' - ', ConvertirATexto(operador2), ')'
                Escribir "Resultado de la resta: ", resultado
				
             "*":
                // Pedir al usuario que ingrese el segundo número
                Escribir "Ingresa el segundo número:"
                Leer operador2
                
                // Realizar la multiplicación
                resultado = operador1 * operador2
                Escribir '(', ConvertirATexto(operador1), ' * ', ConvertirATexto(operador2), ')'
                Escribir "Resultado de la multiplicación: ", resultado
				
             "/":
                // Pedir al usuario que ingrese el segundo número, verificando que no sea cero
                Escribir "Ingresa el segundo número (distinto de 0):"
                Leer operador2
                
                Si operador2 = 0 Entonces
                    Escribir "Error: El divisor no puede ser ' 0 ' ."
                Sino
                    // Realizamos la división
                    resultado = operador1 / operador2
                    Escribir '(', ConvertirATexto(operador1), ' / ', ConvertirATexto(operador2), ')'
                    Escribir "Resultado de la división: ", resultado
                FinSi
				
              "s":
                // Salir del ciclo Mientras
                continuar = "n"
				
            De Otro Modo:
				
                // Opción inválida, volver al inicio del ciclo del bucle
                Escribir "Operación no válida. Por favor, elige una caracter dentro de la descripcion."
				
				
        FinSegun
		
        // Nos hace la pregunta si deseamos continuar
        Si continuar = "s" Entonces
            Escribir "¿Deseas realizar otra operación? (S/N)"
            Leer continuar
        FinSi
		
    FinMientras
	
    Escribir "Calculadora terminada. Gracias por su atención."

FinAlgoritmo
