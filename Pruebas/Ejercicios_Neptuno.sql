-- Practicas con la tabla neptuno
 USE NEPTUNO;




-- -- 1)	Calcular el total de cada pedido con su identidficador
SELECT	IdPedido, sum(PrecioUnidad * Cantidad) as total
FROM	detallespedidos
GROUP by IdPedido;



-- 2)	Mostrar el importe total de los pedidos 10501 y 10503 usando únicamente la tabla detalles.
select * 
from detallespedidos 
where IdPedido in ('10501' , '10503');


-- 3)	¿Cuánto se factura Agosto 1996?

select sum(Detallespedidos.Cantidad * Detallespedidos.PrecioUnidad)	as 'Facturacion de Agosto' 
from Detallespedidos inner join Pedidos on Detallespedidos.IdPedido = Pedidos.IdPedido
where Pedidos.FechaPedido >='1996/08/01' and Pedidos.FechaPedido <='1996/08/30';

-- 4)	Los pedidos que hizo la empleado Robert.

select IdPedido, nombre
from Pedidos
inner join Empleados on Pedidos.IdEmpleado = Empleados.IdEmpleado 
where	Empleados.Nombre = 'Robert';

-- 5)	Mostrar los pedidos de BLONP (código cliente), con su nombre 

select Pedidos.IdPedido , Clientes.IdCliente, Clientes.NombreContacto as ' Nombre'
from Pedidos inner join Clientes on Clientes.IdCliente = Pedidos.IdCliente 
where Clientes.IdCliente = 'BLONP';


-- 6)	Clientes que pidieron chocolate en mes de enero de 1997

select Productos.NombreProducto , IdCliente
from Productos
inner join Detallespedidos on Detallespedidos.IdProducto = Productos.IdProducto
inner join Pedidos on Pedidos.IdPedido = Detallespedidos.IdPedido 
where NombreProducto like '%Chocolate%' and Pedidos.FechaPedido between '1997/01/01'  and '1997/01/31';


-- 7)	Cuántos productos hay de cada categoría y el precio medio


select   categorias.NombreCategoria as ' Productos', COUNT(productos.IdCategoria) as 'Productos hay por categoria', AVG(productos.PrecioUnidad) as 'Precio Medio'
from Productos inner join categorias on  productos.IdCategoria = categorias.IdCategoria
group by productos.IdCategoria  Order by   AVG(productos.PrecioUnidad) asc;


-- 8)	Mostar el nombre de los empleados  y ordenarlos de mayor a menor junto con su facturacion
select empleados.nombre, truncate(SUM(Detallespedidos.PrecioUnidad*Detallespedidos.Cantidad),2) as 'ventas'
from Detallespedidos inner join Pedidos on Pedidos.IdPedido = Detallespedidos.IdPedido
inner join empleados on Pedidos.IdEmpleado = empleados.IdEmpleado
group by empleados.nombre order by  'ventas' desc;



-- 9)  Mostrar el número de pedido y la cantidad del el país del cliente de los pedidos de Julio del año 1996
select Detallespedidos.IdPedido ,Detallespedidos.Cantidad, Clientes.Pais
from Clientes inner join Pedidos on pedidos.IdCliente = Clientes.IdCliente
inner join Detallespedidos on Detallespedidos.IdPedido = Pedidos.IdPedido
where Pedidos.FechaPedido >='1996/07/01' and Pedidos.FechaPedido <='1996/07/31';

-- 10) Obtener, del pedido 10304, su id, el nombre del cliente,el nombre y apellidos del empleado, la fecha del pedido y el importe total de dicho pedido 
	
SELECT	pedidos.IdPedido, clientes.NombreCompañia as 'Cliente', concat(empleados.Apellidos, '--- ' ,empleados.Nombre) as Empleado,
		pedidos.FechaPedido, format(sum(detallespedidos.Cantidad * detallespedidos.PrecioUnidad ),2  ) as Total
FROM	Pedidos 
LEFT 	JOIN Clientes  on(Pedidos.IdCliente = Clientes.IdCliente)
LEFT	JOIN Empleados on(Pedidos.IdEmpleado = Empleados.IdEmpleado)
		JOIN Detallespedidos  on(Pedidos.IdPedido = Detallespedidos.IdPedido)
WHERE	Pedidos.IdPedido = 10304
GROUP by Pedidos.IdPedido, Clientes.NombreCompañia, Pedidos.FechaPedido;
         
-- 11) Obtener el Nombre del producto, el nombre de su categoria y 	el precio, de aquellos productos cuyo precio sea superior a la media del precio de los productos de su categoria,
-- ordenados por precio de mayor a menor.


SELECT	productos.NombreProducto, categorias.NombreCategoria, productos.PrecioUnidad
FROM	Productos JOIN	Categorias  on(productos.IdCategoria = categorias.IdCategoria)
WHERE	productos.PrecioUnidad > (SELECT	avg(productos.PrecioUnidad)
								  FROM		Productos as productos
								  WHERE	productos.IdCategoria = productos.IdCategoria)
ORDER by productos.PrecioUnidad DESC;

-- 12) Mostrar los pedidos que tienen productos de las categorías Lacteos o Frutas/verduras.

select Pedidos.IdPedido , Pedidos.IdCliente , Categorias.NombreCategoria
from Pedidos inner join Detallespedidos on Detallespedidos.IdPedido =Pedidos.IdPedido
inner join Productos on Productos.IdProducto =Detallespedidos.IdProducto
inner join Categorias on Categorias.IdCategoria = Productos.IdCategoria
 where Categorias.NombreCategoria = 'Lacteos' or Categorias.NombreCategoria = 'Frutas/verduras';
 
 
 
 -- 13)  Mostar todas las ventas que se realizaron desde España
 
 
 select pedidos.CiudadDestinatario, pedidos.PaisDestinatario
 from  pedidos inner join detallespedidos on Detallespedidos.IdPedido = pedidos.IdPedido
 inner join Clientes on clientes.IdCliente = Pedidos.IdCliente
 where clientes.Pais = 'España';
 
 
 -- 11) Obtener el nombre del cliente que mas ha facturado y el total de su facturacion
 
 select clientes.NombreCompañia, format(sum(detallespedidos.cantidad * detallespedidos.PrecioUnidad),2) as 'Total'
 from clientes join pedidos on clientes.idCliente=pedidos.idCliente
 join detallespedidos on pedidos.IdPedido=detallespedidos.idPedido
 group by clientes.NombreCompañia;
 
 -- 12)Obtener el nombre de sus empleados y el de su jefe
 
 select  empleados.Nombre as 'Empleados', emp.Nombre as 'Jefe'
 from empleados left join empleados emp on empleados.jefe= emp.IdEmpleado;





