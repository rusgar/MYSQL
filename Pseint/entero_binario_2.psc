Algoritmo Ent_binario
    // Declaración de variables
    x=0 
    var= 0 
    binario= ""   // Inicializamos la cadena binaria vacía
	
    // Pedimos al usuario que ingrese un número
    Escribir "Ingrese un número: "
    Leer x
    
   
    
    // Verificamos si el número ingresado es mayor que 0
    Si x > 0 Entonces
        // Convertimos el número a binario
        Mientras x > 0 Hacer
            var = x MOD 2
            binario = ConvertirATexto(var) + binario
            x = Trunc(x / 2)
        Fin Mientras
    Sino
        // Si el número es 0 o negativo
        Si x = 0 Entonces
            binario = "0"
        Sino
            Escribir "Ingrese un número positivo."
		Fin Si
	Fin Si


// Mostramos el número binario
Escribir "El número binario es: ", binario
FinAlgoritmo

