-- 1. hallar todos los pedidos cuya categoría sea Bebidas
select pedidos.IdPedido, categorias.NombreCategoria
from categorias inner join productos
on categorias.IdCategoria=productos.IdCategoria
inner join detallespedidos
on productos.IdProducto= detallespedidos.IdProducto
inner join pedidos
on detallespedidos.IdPedido=pedidos.IdPedido
where lower(categorias.NombreCategoria) like 'bebidas';


-- 2. Cuántos productos hay de cada categoría y el precio medio.

select count(productos.IdProducto) as 'Total Productos',
       categorias.NombreCategoria, 
       concat(format(avg(productos.PrecioUnidad), 2), ' €') as 'PrecioMedio'
from categorias inner join  productos
on categorias.IdCategoria = productos.IdCategoria
group by categorias.NombreCategoria;


-- 3. Cuanto se facturó en el mes de diciembre de 1996

select  concat(format(sum(pedidos.Cargo), 2), ' €') as 'Total Facturado'
from pedidos 
where year(pedidos.FechaPedido) = 1996 and month(pedidos.FechaPedido) = 12;

-- 4. Mostrar el importe total de los pedidos 10501 y 10503

select pedidos.IdPedido,
concat(format(SUM(detallespedidos.Cantidad * detallespedidos.PrecioUnidad * (1 - detallespedidos.Descuento)), 2), '  €') as 'Importe Total'
from pedidos inner join detallespedidos  on pedidos.IdPedido = detallespedidos.IdPedido
where pedidos.IdPedido in (10501, 10503)
group by pedidos.IdPedido;

-- 5. Mostrar el total de ventas de los clientes de Londres.

select concat(format(sum(pedidos.Cargo), 2), ' €')  as ' Total de Venta' ,
       clientes.NombreContacto, clientes.Ciudad
from clientes inner join pedidos
on clientes.IdCliente = pedidos.IdCliente
where  clientes.Ciudad = 'Londres'
group by clientes.NombreContacto, clientes.Ciudad
order by sum(pedidos.Cargo)  desc;

-- 6. Mostrar los nombres de las 3 compañías que mas han facturado

select concat(format(sum(pedidos.Cargo), 2), ' €')  as ' Total Facturado' ,
       clientes.NombreCompañia
from clientes inner join pedidos
on clientes.IdCliente = pedidos.IdCliente
group by clientes.NombreCompañia
order by sum(pedidos.Cargo)  desc
limit 3;


-- 7. Mostar los empleados que han facturado más que el empleado Steven.
select empleados.IdEmpleado,
      concat_ws('  ',empleados.Nombre, empleados.Apellidos) as  'Nombre Completo',
      concat(format(sum(pedidos.Cargo), 2), '  €') as 'Total Facturado'
from empleados inner join pedidos
on empleados.IdEmpleado = pedidos.IdEmpleado
group by empleados.IdEmpleado,`Nombre Completo`
having `Total Facturado` > (
                            select  format(sum(pedidos.Cargo), 2) 
                            from empleados inner join pedidos
                            on empleados.IdEmpleado = pedidos.IdEmpleado
							where empleados.Nombre = 'Steven'
)
order by `Total Facturado` desc;


-- 8. Mostrar cuántos pedidos ha servido el empleado con apellido King.
select   	  empleados.Apellidos, count(*) as 'pedidos servidos'
from pedidos inner join empleados
on pedidos.IdEmpleado= empleados.IdEmpleado 
where lower(empleados.Apellidos) like '%king%'
group by empleados.Apellidos ;




-- 9. Mostrar el total de ventas de la empresa desde que se tienen registros

-- 10. Mostar el nombre de los empleados que han facturado más que el empleado janet