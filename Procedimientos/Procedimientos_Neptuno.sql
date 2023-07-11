-- Verificación de acciones

-- Vamos a implementar en nuestro código, mediante el uso de condicionales (IF...END IF)
-- y la ayuda de las funciones LAST_INSERT_ID() y ROW_COUNT() y FOUND_ROWS() un código 
-- que nos permita
-- saber si las acciones de inserción, actualizacón, selección o borrado se han realizado
-- correctamente. Antes de realizar esta implementación, haremos una demostración sencilla
-- y un pequeño ejercicio.

-- EJERCICIO: Crea un procedimiento en NEPTUNO que permita obtener el precio de los 
-- productos que contentan en alguna parte del nombre la cadena de caracteres que el 
-- usuario introduce por pantalla. Si el producto existe, muestra un mensaje que diga:
-- "El producto NombreProducto cuesta PrecioUnidad" y, si no existe ningún producto, 
-- muestra un mensaje que diga: "No tenemos ese producto".

use neptuno;
select * from productos;

select NombreProducto, PrecioUnidad
from productos
where NombreProducto like '%tibetana%';

DELIMITER //
DROP PROCEDURE IF EXISTS obtener_Precio_Producto//
CREATE PROCEDURE obtener_Precio_Producto(IN P_Nombre char(10),
                                         OUT P_NombreProducto char(40),
                                         OUT P_PrecioUnidad decimal(19,4) )
BEGIN
 	 select NombreProducto, PrecioUnidad
     from productos
     where NombreProducto like '%P_Nombre%'
     into P_NombreProducto, P_PrecioUnidad;
     
     
     select row_count() into @filas_encontradas;
            if @filas_encontradas = 0 then
               select "No tenemos ese producto" as 'Sorry';
            end if;   
			
                    

END

//


call neptuno.obtener_Precio_Producto('vasco', @P_NombreProducto, @P_PrecioUnidad);

