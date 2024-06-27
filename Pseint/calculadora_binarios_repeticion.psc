Algoritmo Ent_binario_con_bucle
    // Declaración de variables
    x= 0
    var= 0
    binario = " "     
    continuar = "s"
    
    Mientras continuar = "s" Hacer
        // Pedimos al usuario que ingrese un número
        Escribir "Ingrese un número: "
        Leer x
        
        // Inicializamos la cadena binaria vacía
        binario = " "
        
        // Verificamos si el número ingresado es mayor o igual que 0
        Si x >= 0 Entonces
            // Convertimos el número a binario
            Si x = 0 Entonces
                binario = "0"
            Sino
                Mientras x > 0 Hacer
                    var = x MOD 2
                    binario = Concatenar( ConvertirATexto(var), binario)
                    x = Trunc(x / 2)
                Fin Mientras
            Fin Si
            
            // Mostramos el número binario
            Escribir "El número binario pedido  es: ", binario
        Sino
            // Si el número es negativo
            Escribir "Ingrese un número positivo, los negativos no se puede convertir."
        Fin Si
        
        // Preguntamos si desea continuar
        Escribir "¿Desea convertir otro número? (s/n): "
        Leer continuar
    Fin Mientras
    
    Escribir "Conversión a binaria  terminada. Gracias por su colaboracion."
FinAlgoritmo
