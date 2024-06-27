Algoritmo Ent_binario
    // Declaraci�n de variables
    x=0 
    var= 0 
    binario= ""   // Inicializamos la cadena binaria vac�a
	
    // Pedimos al usuario que ingrese un n�mero
    Escribir "Ingrese un n�mero: "
    Leer x
    
   
    
    // Verificamos si el n�mero ingresado es mayor que 0
    Si x > 0 Entonces
        // Convertimos el n�mero a binario
        Mientras x > 0 Hacer
            var = x MOD 2
            binario = ConvertirATexto(var) + binario
            x = Trunc(x / 2)
        Fin Mientras
    Sino
        // Si el n�mero es 0 o negativo
        Si x = 0 Entonces
            binario = "0"
        Sino
            Escribir "Ingrese un n�mero positivo."
		Fin Si
	Fin Si


// Mostramos el n�mero binario
Escribir "El n�mero binario es: ", binario
FinAlgoritmo

