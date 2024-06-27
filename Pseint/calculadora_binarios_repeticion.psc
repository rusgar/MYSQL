Algoritmo Ent_binario_con_bucle
    // Declaraci�n de variables
    x= 0
    var= 0
    binario = " "     
    continuar = "s"
    
    Mientras continuar = "s" Hacer
        // Pedimos al usuario que ingrese un n�mero
        Escribir "Ingrese un n�mero: "
        Leer x
        
        // Inicializamos la cadena binaria vac�a
        binario = " "
        
        // Verificamos si el n�mero ingresado es mayor o igual que 0
        Si x >= 0 Entonces
            // Convertimos el n�mero a binario
            Si x = 0 Entonces
                binario = "0"
            Sino
                Mientras x > 0 Hacer
                    var = x MOD 2
                    binario = Concatenar( ConvertirATexto(var), binario)
                    x = Trunc(x / 2)
                Fin Mientras
            Fin Si
            
            // Mostramos el n�mero binario
            Escribir "El n�mero binario pedido  es: ", binario
        Sino
            // Si el n�mero es negativo
            Escribir "Ingrese un n�mero positivo, los negativos no se puede convertir."
        Fin Si
        
        // Preguntamos si desea continuar
        Escribir "�Desea convertir otro n�mero? (s/n): "
        Leer continuar
    Fin Mientras
    
    Escribir "Conversi�n a binaria  terminada. Gracias por su colaboracion."
FinAlgoritmo
