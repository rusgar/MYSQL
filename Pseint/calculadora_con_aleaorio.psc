Algoritmo calculadora_con_raiz
	
    // Declaración de variables
    operador1 = 0
    operador2 = 0
    signo = ""
    resultado = 0
    continuar = Verdadero  // Variable para controlar si se sigue calculando
    
    // Inicio del bucle principal
    mientras continuar Hacer
        Escribir "Vamos a hacer una calculadora donde debes ingresar dos números y elegir una operación:"
        
        // Pedir al usuario que ingrese dos números
        Escribir "Ingresa el primer número:"
        Leer operador1
        
        Escribir "Ingresa el segundo número:"
        Leer operador2
        
        // Pedir al usuario que elija la operación
        Escribir "Elige la operación que deseas realizar:"
        Escribir "1. Suma"
        Escribir "2. Resta"
        Escribir "3. Multiplicación"
        Escribir "4. División"
        Escribir "5. Potencia"
        Escribir "6. Raíz Cuadrada"
		Escribir "7. Número Aleatorio entre 1 y N"
        Escribir "7. Salir"
        Leer signo
        
        // Realizar la operación seleccionada
        Segun signo Hacer
            Caso "1":
                resultado = operador1 + operador2
				Escribir "El resultado de la suma es: ...", ConvertirATexto(operador1), ' + ', ConvertirATexto(operador2), ' = ', ConvertirATexto(caso1)
            Caso "2":
                resultado = operador1 - operador2
                Escribir "El resultado de la resta es:...", ConvertirATexto(operador1), ' - ', ConvertirATexto(operador2), ' = ', ConvertirATexto(caso2)
            Caso "3":
                resultado = operador1 * operador2
                Escribir "El resultado de la multiplicación es:...", ConvertirATexto(operador1), ' * ', ConvertirATexto(operador2), ' = ', ConvertirATexto(caso3)
            Caso "4":
                // Verificar división entre cero
                Si operador2 <> 0 Entonces
                    resultado = operador1 / operador2
                    Escribir "El resultado de la división es:...", ConvertirATexto(operador1), ' / ', ConvertirATexto(operador2), ' = ', ConvertirATexto(caso4)
                Sino
                    Escribir "Error: No se puede dividir entre cero."
                Fin Si
            Caso "5":
				Si operador2 = 0 Entonces
                resultado = operador1 ^ operador2
                Escribir "El resultado de la potencia es: ...", ConvertirATexto(operador1), ' ^ ', ConvertirATexto(operador2), ' = ', ConvertirATexto(caso5)
				Sino 	
				Escribir " Error: La opción seleccionada no es valida."
			FinSi
			Caso "6":
                // Calcular raíz cuadrada (solo operador1)
                resultado = Raiz(operador1)
                Escribir "La raíz cuadrada de...", ConvertirATexto(operador1), "....es:", ConvertirATexto(caso6)
			Caso "7":
                // Generar número aleatorio entre 1 y operador1 utilizando la función azar
                resultado = azar(operador1)
                Escribir "Número aleatorio entre 1 y", ConvertirATexto(operador1), "es:", ConvertirATexto(caso7)
            Caso "8":
                Escribir "Saliendo de la calculadora."
                continuar = Falso  // Salir del bucle
            Defecto:
                Escribir "Opción no válida. Por favor selecciona una opción del 1 al 8."
        Fin Segun
        
    Fin Mientras

Fin Algoritmo
