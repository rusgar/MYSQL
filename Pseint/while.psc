Algoritmo while
//	 contar de  0 a 10
	num=0
	
	Mientras num <= 10 Hacer
		Escribir  ConvertirATexto(num)
		num= num +1
	Fin Mientras
	
	// contar de 10 a 0
	
	num=10
	
	Mientras num >= 0 Hacer
		Escribir  ConvertirATexto(num)
		num= num -1
	Fin Mientras
	
//	 bucle donde marco inicio y fin 
	imicio=0
	final =0
	Escribir  "indicame el inicio del bucle"
	leer inicio
	Escribir  "indicame el final del bucle"
	leer final
	
	Mientras inicio <= final Hacer
		Escribir  ConvertirATexto(inicio)
		inicio= inicio  +  1
	Fin Mientras
	
	
//	 bucl controlado con estados de varianbles
	
	control= 1
	Mientras control= 1 Hacer
		respuesta = "n"
		Escribir "Continua con la ejecucuion" 
		Escribir "Desea parar? (s/n)"
		leer respuesta
		si respuesta = "s" Entonces
			control=0
		FinSi
		Escribir "fin del bucle control" 
	Fin Mientras
	
	
	
FinAlgoritmo
