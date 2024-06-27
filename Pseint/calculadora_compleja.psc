Algoritmo calculadora_simple
	
    // Declaración de variables
    operador0 = 0
    operador1 = 0
    operacion = ""
    resultado = 0
    continuar = Verdadero  // Variable para controlar si se sigue calculando
	
    Mientras continuar Hacer
        // Pedir al usuario que elija la operación
        Escribir "Elige la operación que deseas realizar:"
        Escribir "1. Suma"
        Escribir "2. Resta"
        Escribir "3. Multiplicación"
        Escribir "4. División"
		Escribir "6. Raíz Cuadrada"
		Escribir "7. Número Aleatorio entre 1 y N"
        Escribir "8. Salir"
        Leer operacion
		
        Si operacion = "8" Entonces
            Escribir "Saliendo de la calculadora."
            continuar = Falso  // Terminar el bucle y salir del programa
        Sino
            Si operacion = "7" Entonces
                // Pedir al usuario que ingrese un número
                Escribir "Ingresa el número:"
                Leer operador1
				
				resultado = azar(operador1)
                Escribir "Número aleatorio entre 1 y ", ConvertirATexto(operador1), "....es:", ConvertirATexto(resultado)
			Fin Si	
			Si operacion = "6" Entonces
                // Pedir al usuario que ingrese un número
                Escribir "Ingresa el número:"
                Leer numero1
                // Calcular la raíz cuadrada
                Si operador1 >= 0 Entonces
                    resultado = Raiz(numero1)
                    Escribir "El resultado de la raíz cuadrada es:", resultado
                Sino
                    Escribir "Error: No se puede calcular la raíz cuadrada de un número negativo."
                Fin Si
            Sino
                // Pedir al usuario que ingrese dos números
                Escribir "Ingresa el primer número:"
                Leer operador0
				
                Escribir "Ingresa el segundo número:"
                Leer operador1
				
                // Realizar la operación seleccionada
                Segun operacion Hacer
                    Caso "1":
                        resultado = operador0 + operador1
                        Escribir "El resultado de la suma es:", resultado
                    Caso "2":
                        resultado = operador0 - operador1
                        Escribir "El resultado de la resta es:", resultado
                    Caso "3":
                        resultado = operador0  * operador1
                        Escribir "El resultado de la multiplicación es:", resultado
                    Caso "4":
                        // Verificar que el divisor no sea cero
                        Si operador1 <> 0 Entonces
                            resultado = operador0 / operador1
                            Escribir "El resultado de la división es:", resultado
                        Sino
                            Escribir "Error: No se puede dividir entre cero."
                        Fin Si
                    De Otro Modo:
                        Escribir "Opción inválida. Inténtalo de nuevo."
                Fin Segun
            Fin Si
        Fin Si
		
    Fin Mientras

FinAlgoritmo
