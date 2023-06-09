-- Subconsultas (En la cláusula WHERE)
-- Con operadores básicos de comparación
-- Utilizando la BD tienda
use tienda;
-- 1. Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).

SELECT * 
FROM producto
WHERE id_fabricante = (   SELECT id
                              FROM fabricante 
                              WHERE nombre = 'Lenovo');
                            
-- 2. Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo (Sin utilizar INNER JOIN)

SELECT   *   
FROM producto 
WHERE   precio   =   (  SELECT MAX(precio)
                        FROM producto
                        WHERE producto.id_fabricante = (  SELECT id  FROM fabricante   WHERE nombre = 'Lenovo'));
                                               
-- 3. Lista el nombre del producto más caro del fabricante 'Lenovo'

select producto.nombre
FROM   producto  WHERE precio=  (SELECT MAX(precio)
                         FROM  producto,fabricante 
                         WHERE fabricante.nombre = "Lenovo");

-- 4. Lista el nombre del producto más barato de Hewlett-Packard

SELECT   nombre
FROM   producto 
WHERE  precio= (SELECT   MIN(precio)   
         FROM producto, fabricante 
         WHERE fabricante.nombre = "Hewlett-Packard") ;

-- 5. Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo

SELECT   nombre, precio  
 FROM   producto   
 WHERE   precio   >=   (SELECT   MAX(precio)
                        FROM producto
                        WHERE id_fabricante= (  SELECT id  FROM fabricante   WHERE nombre = 'Lenovo'));

-- 6. Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos los productos.

                 
select * 
from producto
where id_fabricante = (select id
						from fabricante
                        where nombre = 'Asus') and  precio > ( select avg(precio)
                                                              from producto where id_fabricante= (select id
                                                                                                      from fabricante
                                                                                                      where nombre = 'Asus'));
-- 6bisss. Lista todos los productos de los fabricante distintos a  Asus que tienen un precio superior al producto Asus mas caro.
SELECT * 
FROM producto
 WHERE precio > (SELECT AVG(precio) 
                 FROM producto
                 WHERE id_fabricante <> '1') and (  SELECT id  FROM fabricante   WHERE nombre = 'Asus');
                                                                                                      
                            
-- 6 (II parte) . Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos SUS productos Asus.

SELECT * 
FROM producto 
WHERE precio > (SELECT AVG(precio)
                FROM producto,fabricante 
				WHERE fabricante.nombre = "Asus");
                



-- Subconsultas con ALL y ANY
-- 1. Devuelve el producto más caro que existe en la tabla producto sin hacer uso de MAX, ORDER BY ni LIMIT.alter

SELECT * 
FROM producto 
WHERE precio >= ALL ( SELECT precio
                      FROM producto);
               
-- 2. Devuelve el producto más barato

SELECT * 
FROM producto 
WHERE precio <= ALL ( SELECT precio
                      FROM producto);

-- 3. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando ALL y ANY) 
SELECT nombre as 'Fabricantes Asociados'
FROM fabricante
 WHERE id= ANY ( SELECT id_fabricante FROM producto) ;                  


-- 4. Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando ALL y ANY)
SELECT nombre  as 'Fabricantes No Asociados'
FROM fabricante 
WHERE id <> ALL ( SELECT id_fabricante FROM producto);                          

-- Subconsultas con IN y NOT IN
-- 5. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando IN o NOT IN).

 SELECT nombre 
 FROM fabricante
 WHERE id IN (SELECT id_fabricante FROM producto); 

-- 6. Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando IN o NOT IN).

 SELECT nombre 
 FROM fabricante
 WHERE id NOT IN (SELECT id_fabricante FROM producto); 

-- Subconsultas con EXISTS y NOT EXISTS
-- 1. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).

SELECT nombre
 FROM fabricante
 WHERE EXISTS ( SELECT id_fabricante
                FROM producto 
				WHERE producto.id_fabricante = fabricante.id);


-- 2. Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).

SELECT nombre
 FROM fabricante
 WHERE NOT EXISTS ( SELECT id_fabricante
                    FROM producto
                    WHERE producto.id_fabricante = fabricante.id);


--  Subconsultas correlacionadas
-- 1. Lista el nombre de cada fabricante con el nombre y el precio de su producto más caro.

SELECT producto.nombre, producto.precio, fabricante.nombre
FROM producto INNER JOIN fabricante ON producto.id_fabricante = fabricante.id 
WHERE producto.precio = ( SELECT MAX(precio) 
                          FROM producto 
                          WHERE id_fabricante = fabricante.id ) ;

-- 2. Devuelve un listado de todos los productos que tienen un precio mayor o igual a la media de todos los productos de su mismo fabricante.

SELECT * 
FROM producto AS pre_mayor
WHERE precio >= (SELECT AVG(precio) 
                 FROM producto AS pre_avg
                 WHERE pre_mayor.id_fabricante = pre_avg.id_fabricante);

-- 3. Lista el nombre del producto más caro del fabricante Lenovo.

SELECT producto.nombre
 FROM fabricante INNER JOIN producto ON fabricante.id = producto.id_fabricante 
 WHERE fabricante.nombre = 'Lenovo' AND producto.precio = ( SELECT MAX(precio) 
                                                            FROM producto 
                                                            WHERE id_fabricante = fabricante.id);
                    
-- Subconsultas (En la cláusula HAVING)
-- 1. Devuelve un listado con todos los nombres de los fabricantes que tienen el mismo número de productos que el fabricante Lenovo.
-- Pasos previos:
-- devolver el código de fabricante y el número de productos de cada fabricante
-- devolver el número de productos del fabricante lenovo

SELECT fabricante.nombre, COUNT(producto.id) as 'Listado'
FROM fabricante INNER JOIN producto ON fabricante.id = producto.id_fabricante 
GROUP BY fabricante.id HAVING COUNT(producto.id) >= ( SELECT COUNT(producto.id) 
                                                              FROM fabricante INNER JOIN producto ON fabricante.id = producto.id_fabricante 
                                                              WHERE fabricante.nombre = 'Lenovo');
												
                                            