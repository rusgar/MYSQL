-- 1. Lista el nombre de todos los productos que hay en la tabla producto.
SELECT nombre FROM tienda.producto;

-- 2. Lista los nombres y los precios de todos los productos de la tabla producto.
SELECT nombre, precio FROM tienda.producto;

-- 3. Lista todas las columnas de la tabla producto.
SELECT * from producto;

-- 4. Lista el nombre de los productos, el precio en euros y el precio en dolares estadounidenses (USD).
SELECT nombre, concat(format(precio,2), " €") as precio_euros, concat(format(precio*0.93,2), " $") as precio_dolar FROM producto;

-- 5. Lista el nombre de los productos, el precio en euros y el precio en dolares estadounidenses (USD). Utiliza las siguientes alias para las columnas: nombre de producto, euros, dolares.
SELECT nombre 'nombre de producto', concat(format(precio,2), " €") euros, concat(format(precio*0.93,2), " $") dolares FROM producto;

-- 6. Lista todos los nombres y los precios de todos los productos de la tabla producto convirtiendo los nombres en mayúsculas.
SELECT upper(nombre) 'nombre de producto', concat(format(precio,2), " €") euros FROM producto;

-- 7. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula.
SELECT lower(nombre) 'nombre de producto', concat(format(precio,2), " €") euros FROM producto;

-- 8. Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.
SELECT nombre, concat(UPPER(substr(fabricante.nombre,1,2)),substr(fabricante.nombre,3)) as nombreUpp from fabricante;

-- 9. Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.
SELECT nombre, round(precio) as precioRed FROM producto;

-- 10. Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal.
SELECT nombre, truncate(precio,0) as precioRed FROM producto;

-- 11. Lista el código de los fabricantes que tienen productos en la tabla producto.
SELECT fabricante.codigo FROM fabricante inner join producto on fabricante.codigo=producto.codigo_fabricante;

-- 12. Lista el código de los fabricantes que tienen productos en la tabla producto, eliminando los códigos que aparecen repetidos.
SELECT distinct fabricante.codigo FROM fabricante inner join producto on fabricante.codigo=producto.codigo_fabricante;

-- 13. Lista los nombres de los fabricantes ordenados de forma ascendente.
SELECT nombre FROM fabricante order by nombre asc;

-- 14. Lista los nombres de los fabricantes ordenados de forma descendente.
SELECT nombre FROM fabricante order by nombre desc;

-- 15. Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente.
SELECT nombre, precio FROM producto order by nombre asc, precio desc;

-- 16. Devuelve una lista con las 5 primeras filas de la tabla fabricante.
SELECT * FROM fabricante LIMIT 5;

-- 17. Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también se debe incluir en la respuesta.
SELECT * FROM fabricante LIMIT 5 offset 3;

-- 18. Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT)
SELECT nombre, precio FROM producto order by precio limit 1;

-- 19. Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y LIMIT)
SELECT nombre, precio FROM producto order by precio desc LIMIT 1;

-- 20. Lista el nombre de todos los productos del fabricante cuyo código de fabricante es igual a 2.
SELECT nombre FROM fabricante WHERE fabricante.codigo=2;

-- 21. Lista el nombre de los productos que tienen un precio menor o igual a 120€.
SELECT nombre, precio FROM producto where precio <=120;

-- 22. Lista el nombre de los productos que tienen un precio mayor o igual a 400€.
SELECT nombre FROM producto where precio >=400;

-- 23. Lista el nombre de los productos que no tienen un precio mayor o igual a 400€.
SELECT nombre FROM producto where precio >=400;

-- 24. Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN.
SELECT nombre, precio FROM producto where precio >=80 and precio <=300;

-- 25. Lista todos los productos que tengan un precio entre 60€ y 200€. Utilizando el operador BETWEEN.
SELECT nombre, precio FROM producto where precio between 60 and 200;

-- 26. Lista todos los productos que tengan un precio mayor que 200€ y que el código de fabricante sea igual a 6.
SELECT producto.nombre, producto.precio FROM producto inner join fabricante on fabricante.codigo=producto.codigo where precio > 200 and fabricante.codigo = 6;

-- 27. Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Sin utilizar el operador IN.
SELECT producto.nombre, fabricante.codigo FROM producto INNER JOIN fabricante on fabricante.codigo=producto.codigo where fabricante.codigo =1 or fabricante.codigo =3 or fabricante.codigo =5;

-- 28. Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Utilizando el operador IN..
SELECT producto.nombre, fabricante.codigo FROM producto INNER JOIN fabricante on fabricante.codigo=producto.codigo where fabricante.codigo IN (1,3,5);

-- 29. Lista el nombre y el precio de los productos en céntimos (Habrá que multiplicar por 100 el valor del precio). Cree un alias para la columna que contiene el precio que se llame céntimos.
SELECT nombre, precio, (precio*100) céntimos FROM producto;

-- 30. Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.
SELECT nombre FROM fabricante where nombre like 'S%';

-- 31. Lista los nombres de los fabricantes cuyo nombre termine por la vocal e. Fabricantes de 4 o más caracteres
SELECT nombre FROM fabricante where nombre like '%e' and length(nombre)>=4;

-- 32. Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.
SELECT nombre FROM fabricante where nombre like '%w%';

-- 33. Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.
SELECT nombre FROM fabricante where length(nombre)=4;

-- 34. Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre.
SELECT nombre FROM producto where nombre like '%Portátil%';

-- 35. Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre y tienen un precio inferior a 215 €.
SELECT nombre, precio FROM producto where nombre like '%Monitor%' and precio < 215;

-- 36. Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€.
	 -- Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente).
SELECT nombre, precio FROM producto where precio >= 180 order by precio desc, nombre asc;