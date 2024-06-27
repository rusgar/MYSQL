Algoritmo calculadora_simple
	
    // Declaraci�n de variables
    numero1 = 0
    numero2 = 0
    operacion = ""
    resultado = 0
    continuar = Verdadero  // Variable para controlar si se sigue calculando
    
    Mientras continuar Hacer
        // Pedir al usuario que ingrese dos n�meros
        Escribir "Ingresa el primer n�mero:"
        Leer numero1
        
        Escribir "Ingresa el segundo n�mero:"
        Leer numero2
        
        // Pedir al usuario que elija la operaci�n
        Escribir "Elige la operaci�n que deseas realizar:"
        Escribir "1. Suma"
        Escribir "2. Resta"
        Escribir "3. Multiplicaci�n"
        Escribir "4. Divisi�n"
        Escribir "5. Salir"
        Leer operacion
        
        // Realizar la operaci�n seleccionada
        Segun operacion Hacer
            Caso "1":
                resultado = numero1 + numero2
                Escribir "El resultado de la suma es:", resultado
            Caso "2":
                resultado = numero1 - numero2
                Escribir "El resultado de la resta es:", resultado
            Caso "3":
                resultado = numero1 * numero2
                Escribir "El resultado de la multiplicaci�n es:", resultado
            Caso "4":
                // Verificar que el divisor no sea cero
                Si numero2 <> 0 Entonces
                    resultado = numero1 / numero2
                    Escribir "El resultado de la divisi�n es:", resultado
                Sino
                    Escribir "Error: No se puede dividir entre cero."
                Fin Si
            Caso "5":
                Escribir "Saliendo de la calculadora."
                continuar = Falso  // Terminar el bucle y salir del programa
            De Otro Modo:
                Escribir "Opci�n inv�lida. Int�ntalo de nuevo."
        Fin Segun
        
    Fin Mientras
    
FinAlgoritmo
