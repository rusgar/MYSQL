Algoritmo suma_valores
	
   // definimos las varianbles    
    numero = 5
    numero_1 = 7
	resultado = numero + numero_1
	
	// antes de pedir solicitamos en valor de cada uno de  los enteros
	Valor = Concatenar("El valor del numero es...: ", ConvertirATexto(numero))
	Escribir valor
    
	Valor_1 = Concatenar("El valor del numero_1 es...: ", ConvertirATexto(numero_1))
	Escribir valor_1
	
	
    
    // mostramos en una variable la suma + de los valores que hemos descrito anterioremente
    resultado = numero + numero_1
    
    Escribir "Resultado de la suma: ", resultado
	
	sumaenteros = numero + numero_1
	Escribir  sumaenteros
	sumando1 =Concatenar(ConvertirATexto(numero), ' + ')
	sumando2 =Concatenar(ConvertirATexto(numero_1), ' = ')
	operacion = Concatenar(sumando1,sumando2)
	resultado_1 = Concatenar(operacion, ConvertirATexto(sumaenteros))
	Escribir resultado_1
	
	

	
	
    
  
	
	
	
FinAlgoritmo

