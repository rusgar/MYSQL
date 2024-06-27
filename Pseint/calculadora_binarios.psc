Algoritmo DecimalABinario
	Escribir "Ingrese numero: "
	Leer x
	operador=0
	i=1
	
	Mientras (x>0) Hacer
		var = x mod 2
		operador=operador+var*i
		x = trunc(x/2)
		i= i* 10
	FinMientras
	
	Escribir "Numero Binario pedido es: ",operador
FinAlgoritmo
