Algoritmo suma_valores_1
	
	// definimos las varianbles    
    numero = 0
    numero_1 = 0
	resultado = 0
	
	// antes de pedir solicitamos en valor de cada uno de  los enteros
	
	Escribir  'dame el primer numero'
	leer numero
	
	Escribir  'dame el segundo numero'
	leer numero_1
    
    // mostramos en una variable la suma + de los valores que hemos descrito anterioremente
    resultado = numero + numero_1
     
    
    Escribir "Resultado de la suma: ", resultado
	
	// otra forma de ejecutarlo
	
	sumaenteros = numero + numero_1

	sumando1 =Concatenar(ConvertirATexto(numero), ' + ')
	sumando2 =Concatenar(ConvertirATexto(numero_1), ' = ')
	operacion = Concatenar(sumando1,sumando2)
	resultado_1 = Concatenar(operacion, ConvertirATexto(sumaenteros))
	Escribir resultado_1
	
	// otra forma mas sencilla
	sumaenteros = numero + numero_1
	Escribir  ConvertirATexto(numero), ' + ', ConvertirATexto(numero_1), ' = ', ConvertirATexto(sumaenteros)
	
FinAlgoritmo	