	Algoritmo multiplicacion_valores_1
		
		// definimos las varianbles    
		numero = 0
		numero_1 = 0
		multiplicacion = 0
		
		// antes de pedir solicitamos en valor de cada uno de  los enteros
		
		Escribir  'Dame el primer numero'
		leer numero
		
		Escribir  'Dame el segundo numero'
		leer numero_1
		
		// mostramos en una variable la suma + de los valores que hemos descrito anterioremente
		multiplicacion = numero * numero_1
		
		
		Escribir "Resultado de la multiplicacion: ", resultado
		
		// otra forma de ejecutarlo		
		multiplicacion = numero * numero_1
		
		multi1 =Concatenar(ConvertirATexto(numero), ' * ')
		multi2 =Concatenar(ConvertirATexto(numero_1), ' = ')
		operacion = Concatenar(multi1,multi2)
		
		resultado = Concatenar(operacion, ConvertirATexto(multiplicacion))
		Escribir resultado
		
FinAlgoritmo	

