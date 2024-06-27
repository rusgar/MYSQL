Algoritmo FibonacciRepetir
	// Declaración de variables
	var=0
	continuar = 'S'
	number= 0
	
	
    Repetir
		// Pedimos al usuario que ingrese el número de elementos de la serie Fibonacci
        Escribir "Ingrese el número de elementos de la serie Fibonacci que desea ver:"
        Leer number
        
		// Inicializamos los primeros dos números de la serie
        a = 0
        b = 1
        
		// Mostramos los primeros dos números de la serie
        Escribir "Serie Fibonacci a mostrar:"
        Escribir a
        Escribir b
        
		// Generamos y mostramos el resto de la serie
        Para var = 3 Hasta number Con Paso 1 Hacer
            c = a + b
            a = b
            b = c
			Escribir c
        Fin Para
        
		// Preguntamos si desea generar otra serie de Fibonacci
        Escribir "¿Desea generar otra serie de Fibonacci? (S/N):"
        Leer continuar
    Hasta Que continuar = "N" 
FinAlgoritmo





