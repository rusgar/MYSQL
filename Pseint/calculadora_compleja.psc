Algoritmo calculadora_simple
	
    // Declaraci�n de variables
    operador0 = 0
    operador1 = 0
    operacion = ""
    resultado = 0
    continuar = Verdadero  // Variable para controlar si se sigue calculando
	
    Mientras continuar Hacer
        // Pedir al usuario que elija la operaci�n
        Escribir "Elige la operaci�n que deseas realizar:"
        Escribir "1. Suma"
        Escribir "2. Resta"
        Escribir "3. Multiplicaci�n"
        Escribir "4. Divisi�n"
		Escribir "6. Ra�z Cuadrada"
		Escribir "7. N�mero Aleatorio entre 1 y N"
        Escribir "8. Salir"
        Leer operacion
		
        Si operacion = "8" Entonces
            Escribir "Saliendo de la calculadora."
            continuar = Falso  // Terminar el bucle y salir del programa
        Sino
            Si operacion = "7" Entonces
                // Pedir al usuario que ingrese un n�mero
                Escribir "Ingresa el n�mero:"
                Leer operador1
				
				resultado = azar(operador1)
                Escribir "N�mero aleatorio entre 1 y ", ConvertirATexto(operador1), "....es:", ConvertirATexto(resultado)
			Fin Si	
			Si operacion = "6" Entonces
                // Pedir al usuario que ingrese un n�mero
                Escribir "Ingresa el n�mero:"
                Leer numero1
                // Calcular la ra�z cuadrada
                Si operador1 >= 0 Entonces
                    resultado = Raiz(numero1)
                    Escribir "El resultado de la ra�z cuadrada es:", resultado
                Sino
                    Escribir "Error: No se puede calcular la ra�z cuadrada de un n�mero negativo."
                Fin Si
            Sino
                // Pedir al usuario que ingrese dos n�meros
                Escribir "Ingresa el primer n�mero:"
                Leer operador0
				
                Escribir "Ingresa el segundo n�mero:"
                Leer operador1
				
                // Realizar la operaci�n seleccionada
                Segun operacion Hacer
                    Caso "1":
                        resultado = operador0 + operador1
                        Escribir "El resultado de la suma es:", resultado
                    Caso "2":
                        resultado = operador0 - operador1
                        Escribir "El resultado de la resta es:", resultado
                    Caso "3":
                        resultado = operador0  * operador1
                        Escribir "El resultado de la multiplicaci�n es:", resultado
                    Caso "4":
                        // Verificar que el divisor no sea cero
                        Si operador1 <> 0 Entonces
                            resultado = operador0 / operador1
                            Escribir "El resultado de la divisi�n es:", resultado
                        Sino
                            Escribir "Error: No se puede dividir entre cero."
                        Fin Si
                    De Otro Modo:
                        Escribir "Opci�n inv�lida. Int�ntalo de nuevo."
                Fin Segun
            Fin Si
        Fin Si
		
    Fin Mientras

FinAlgoritmo
