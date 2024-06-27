Algoritmo resta_valores_1
	
	// definimos las varianbles    
    numero = 0
    numero_1 = 0
	resta = 0
	
	// antes de pedir solicitamos en valor de cada uno de  los enteros
	
	Escribir  'dame el primer numero'
	leer numero
	
	Escribir  'dame el segundo numero'
	leer numero_1
    
    // mostramos en una variable la suma + de los valores que hemos descrito anterioremente
    resta = numero - numero_1   
    
    Escribir "Resultado de la resta: ", resultado
	
	// otra forma de ejecutarlo
	resta = numero - numero_1   
	
	resta1 =Concatenar(ConvertirATexto(numero), ' - ')
	resta2 =Concatenar(ConvertirATexto(numero_1), ' = ')
	operacion = Concatenar(resta1,resta2)
	resultado = Concatenar(operacion, ConvertirATexto(resta))
	Escribir resultado
	
FinAlgoritmo	