Algoritmo calculadora_con_raiz
	
    // Declaraci�n de variables
    operador1 = 0
    operador2 = 0
    signo = ""
    resultado = 0
    continuar = Verdadero  // Variable para controlar si se sigue calculando
    
    // Inicio del bucle principal
    mientras continuar Hacer
        Escribir "Vamos a hacer una calculadora donde debes ingresar dos n�meros y elegir una operaci�n:"
        
        // Pedir al usuario que ingrese dos n�meros
        Escribir "Ingresa el primer n�mero:"
        Leer operador1
        
        Escribir "Ingresa el segundo n�mero:"
        Leer operador2
        
        // Pedir al usuario que elija la operaci�n
        Escribir "Elige la operaci�n que deseas realizar:"
        Escribir "1. Suma"
        Escribir "2. Resta"
        Escribir "3. Multiplicaci�n"
        Escribir "4. Divisi�n"
        Escribir "5. Potencia"
        Escribir "6. Ra�z Cuadrada"
		Escribir "7. N�mero Aleatorio entre 1 y N"
        Escribir "7. Salir"
        Leer signo
        
        // Realizar la operaci�n seleccionada
        Segun signo Hacer
            Caso "1":
                resultado = operador1 + operador2
				Escribir "El resultado de la suma es: ...", ConvertirATexto(operador1), ' + ', ConvertirATexto(operador2), ' = ', ConvertirATexto(caso1)
            Caso "2":
                resultado = operador1 - operador2
                Escribir "El resultado de la resta es:...", ConvertirATexto(operador1), ' - ', ConvertirATexto(operador2), ' = ', ConvertirATexto(caso2)
            Caso "3":
                resultado = operador1 * operador2
                Escribir "El resultado de la multiplicaci�n es:...", ConvertirATexto(operador1), ' * ', ConvertirATexto(operador2), ' = ', ConvertirATexto(caso3)
            Caso "4":
                // Verificar divisi�n entre cero
                Si operador2 <> 0 Entonces
                    resultado = operador1 / operador2
                    Escribir "El resultado de la divisi�n es:...", ConvertirATexto(operador1), ' / ', ConvertirATexto(operador2), ' = ', ConvertirATexto(caso4)
                Sino
                    Escribir "Error: No se puede dividir entre cero."
                Fin Si
            Caso "5":
				Si operador2 = 0 Entonces
                resultado = operador1 ^ operador2
                Escribir "El resultado de la potencia es: ...", ConvertirATexto(operador1), ' ^ ', ConvertirATexto(operador2), ' = ', ConvertirATexto(caso5)
				Sino 	
				Escribir " Error: La opci�n seleccionada no es valida."
			FinSi
			Caso "6":
                // Calcular ra�z cuadrada (solo operador1)
                resultado = Raiz(operador1)
                Escribir "La ra�z cuadrada de...", ConvertirATexto(operador1), "....es:", ConvertirATexto(caso6)
			Caso "7":
                // Generar n�mero aleatorio entre 1 y operador1 utilizando la funci�n azar
                resultado = azar(operador1)
                Escribir "N�mero aleatorio entre 1 y", ConvertirATexto(operador1), "es:", ConvertirATexto(caso7)
            Caso "8":
                Escribir "Saliendo de la calculadora."
                continuar = Falso  // Salir del bucle
            Defecto:
                Escribir "Opci�n no v�lida. Por favor selecciona una opci�n del 1 al 8."
        Fin Segun
        
    Fin Mientras

Fin Algoritmo
