Algoritmo operacion_aleatoria
    
      
    // Generamos números aleatorios entre 1 y 50
    numero1 = Aleatorio(1,50)
    numero2 = Aleatorio(1, 50)
    numero3 = Aleatorio(1, 50)
    numero4 = Aleatorio(1, 50)
    
	
    // Realizamos la operación (numero1 + numero2 - numero3) * numero4
    resultado = (numero1 + numero2 - numero3) * numero4
    
    // Crear la cadena de la operación
    Escribir  ConvertirATexto(numero1), ' + ', ConvertirATexto(numero2), ' - ', ConvertirATexto(numero3), ' * ', ConvertirATexto(numero4)
    Escribir '(', ConvertirATexto(numero1), ' + ', ConvertirATexto(numero2), ' - ', ConvertirATexto(numero3), ') * ', ConvertirATexto(numero4)
    
    // Mostrar la operación y el resultado
    Escribir "Operacion: ", resultado
    Escribir "Resultado de la operacion con parentesis: ", resultado
    
FinAlgoritmo


