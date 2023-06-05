USE tienda;
select nombre
from producto
where precio = (select max(precio) from producto);

--  La siguiente consulta nos devuelve una listado de todos los productos que tienen un precio mayor o igual al precio medio de todos los productos de su mismo fabricante.


select fabricante.nombre, count(producto.codigo) as 'Total Producto'
from fabricante inner join producto
on fabricante.codigo = producto.codigo_fabricante
group by fabricante.codigo
having count(producto.codigo) =
(select count(producto.codigo) from fabricante inner join producto on fabricante.codigo = producto.codigo_fabricante where fabricante.nombre = 'Asus');

-- La siguiente consulta nos devuelve una listado de todos los productos que tienen un precio mayor o igual al precio medio de todos los productos de su mismo fabricante
select * from producto
inner join (select codigo_fabricante, avg(precio) as media 
            from producto group by codigo_fabricante) as todo 
            on producto.codigo_fabricante= todo.codigo_fabricante
where producto.precio >= todo.media;