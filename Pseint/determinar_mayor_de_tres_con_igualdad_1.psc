Algoritmo determinar_mayor_de_tres_con_igualdad
		
		// Inicializamos las variables
		numero1 = 0
		numero2 = 0
		numero3 = 0
		auxdato =0
		auxiguales= 0 // apagago
		
		// Pedimos los números al usuario
		Escribir 'Dame el primer numero'
		Leer numero1
		
		Escribir 'Dame el segundo numero'
		Leer numero2
		
		Escribir 'Dame el tercer numero'
		Leer numero3
		
		SI  numero1>numero2 Entonces // guardamos n1 por ser mayor que n2
			auxdato=numero1
		SiNo
			si numero2 > numero1	Entonces //guardamos n2 por ser mayor que n1
				auxdato= numero2
			SiNo
				auxdato= numero2
				auxiguales= 1
			FinSi
	    FinSi 
		
		SI  auxdato>numero3 Entonces // comparamos auxdato con el numero 3
			Escribir 'El mayor  numero es ....', ConvertirATexto(auxdato)
		SiNo
			si numero3 > auxdato	Entonces //comparamos numero 3 con auxdato
				Escribir 'El mayor  numero es ....', ConvertirATexto(numero3)
			SiNo
				Si auxiguales= 1 entonces
				   Escribir 'Todos los numeros son iguales'
			    SiNo
				    Escribir 'El mayor es ...', ConvertirATexto(numero3)
				
			    FinSi
			
			 FinSi
	    FinSi 
FinAlgoritmo
