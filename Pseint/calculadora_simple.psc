Algoritmo calculadora_simple
	
    // Declaraci�n de variables
    operador1 = 0
    operador2 = 0
    signo = ""
    resultado = 0
    continuar = Verdadero  // Variable para controlar si se sigue calculando
    
	Escribir "Vamos a hacer una calculadora donde debes ingresar dos n�meros que debes sumar, multiplicar, restar , dividir o elevar a la pontecia.";
	
    
        // Pedir al usuario que ingrese dos n�meros
        Escribir "Ingresa el primer n�mero:"
        Leer operador1
        
        Escribir "Ingresa el segundo n�mero:"
        Leer operador2
        
        // Pedir al usuario que elija la operaci�n, es un menu para que escoja el numero a decidir de la operacion
        Escribir "Elige la operaci�n que deseas realizar:"
        Escribir "1. Suma"
        Escribir "2. Resta"
        Escribir "3. Multiplicaci�n"
        Escribir "4. Divisi�n"
        Escribir "5. Potencias"
        Leer signo
        
        // Realizar la operaci�n seleccionada
        Segun signo Hacer
            Caso "1": // comprobamos los dos numeros que introduciomos en una suma, con la operacion de resultado impresa
                caso1 = operador1 + operador2
                Escribir "El resultado de la suma es: ...", ConvertirATexto(operador1), ' + ', ConvertirATexto(operador2), ' = ', ConvertirATexto(caso1)
				
            Caso "2": // comprobamos los dos numeros que introduciomos en una resta con la operacion de resultado impresa
                caso2 = operador1 - operador2
                Escribir "El resultado de la resta es:...", ConvertirATexto(operador1), ' - ', ConvertirATexto(operador2), ' = ', ConvertirATexto(caso2)
            Caso "3": // comprobamos los dos numeros que introduciomos en una multiplicacion, con la operacion de resultado impresa
                caso3 = operador1 * operador2
                Escribir "El resultado de la multiplicaci�n es:...", ConvertirATexto(operador1), ' * ', ConvertirATexto(operador2), ' = ', ConvertirATexto(caso3)
            Caso "4": // comprobamos los dos numeros que introduciomos en una division, con la operacion de resultado impresa
                // Verificar que el divisor no sea cero
                Si operador2 <> 0 Entonces
                    caso4 = operador1 / operador2
                    Escribir "El resultado de la divisi�n es:...", ConvertirATexto(operador1), ' / ', ConvertirATexto(operador2), ' = ', ConvertirATexto(caso4)
                Sino // si el divisior es cero arroja por pantalla este resultado
                    Escribir "Error: No se puede dividir entre cero."
                Fin Si
			Caso "5":
				si operador2 = 0 Entonces
					caso5 =operador1 ^ operador2
					Escribir "El resultado de la potencia es: ...", ConvertirATexto(operador1), ' ^ ', ConvertirATexto(operador2), ' = ', ConvertirATexto(caso5)
				sino 	
					Escribir " Error: La opci�n seleccionada no es valida."
				FinSi
        Fin Segun
        
   
    
FinAlgoritmo

