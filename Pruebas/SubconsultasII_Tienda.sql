-- Subconsultas (En la cláusula WHERE)
-- Con operadores básicos de comparación
-- Utilizando la BD tienda
use tienda;
-- 1. Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).

SELECT * FROM producto
WHERE codigo_fabricante = (   SELECT codigo   FROM fabricante   WHERE nombre = 'Lenovo');
                            
-- 2. Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo (Sin utilizar INNER JOIN)

SELECT   *   FROM producto 
WHERE   precio   =   (   SELECT   MAX(precio)   FROM producto  WHERE producto.codigo_fabricante = (  SELECT codigo  FROM fabricante   WHERE nombre = 'Lenovo'))
                                               
-- 3. Lista el nombre del producto más caro del fabricante 'Lenovo'

-- 4. Lista el nombre del producto más barato de Hewlett-Packard

-- 5. Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo

-- 6. Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos los productos.
                            
-- 6 (II parte) . Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos SUS productos Asus.


-- Subconsultas con ALL y ANY
-- 1. Devuelve el producto más caro que existe en la tabla producto sin hacer uso de MAX, ORDER BY ni LIMIT.alter
               
-- 2. Devuelve el producto más barato

-- 3. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando ALL y ANY)                   


-- 4. Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando ALL y ANY)                          

-- Subconsultas con IN y NOT IN
-- 5. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando IN o NOT IN).

-- 6. Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando IN o NOT IN).

-- Subconsultas con EXISTS y NOT EXISTS
-- 1. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).


-- 2. Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).


--  Subconsultas correlacionadas
-- 1. Lista el nombre de cada fabricante con el nombre y el precio de su producto más caro.

-- 2. Devuelve un listado de todos los productos que tienen un precio mayor o igual a la media de todos los productos de su mismo fabricante.

-- 3. Lista el nombre del producto más caro del fabricante Lenovo.
                    
-- Subconsultas (En la cláusula HAVING)
-- 1. Devuelve un listado con todos los nombres de los fabricantes que tienen el mismo número de productos que el fabricante Lenovo.
-- Pasos previos:
-- devolver el código de fabricante y el número de productos de cada fabricante
-- devolver el número de productos del fabricante lenovo