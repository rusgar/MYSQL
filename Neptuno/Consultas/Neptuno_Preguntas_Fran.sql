#Mostrar el número de clientes de los paises que empiezan por E

select clientes.Pais, count(*) as 'Numero de clientes'
from clientes
where clientes.Pais like 'E%'
group by clientes.pais;

#Mostrar todos los productos que tengan menos de 20 unidades en existencia/stock

select  productos.NombreProducto, productos.UnidadesEnExistencia
from productos
where  productos.UnidadesEnExistencia <20;

#Indicar cuantos proveedores tiene cada país y ordenar de mayor a menor.

select proveedores.pais, count(*) as 'Numero de Proveedores'
from proveedores
group by proveedores.pais
order by `Numero de Proveedores` desc;

#Indicar cuantos pedidos han sido gestionados por Federal Shipping.

select count(*) as 'Numero de Pedidos'
from pedidos inner join compañiasenvios
on pedidos.FormaEnvio= compañiasenvios.IdCompañiaEnvios
where compañiasenvios.NombreCompañia like '%Federal%Shipping%';

#Indicar cuantos pedidos han sido gestionados entre febrero y octubre de cualquier año.

select count(*) as 'Numero Total de Pedidos'
from pedidos
where month(pedidos.FechaPedido) between 2 and 10;

#Indicar nombre y cantidad total de categoría de productos que tiene mas Unidades de existencia total de productos

select  categorias.NombreCategoria, sum(productos.UnidadesEnExistencia) as 'Total'
from categorias inner join productos
on categorias.IdCategoria= productos.IdCategoria
group by categorias.NombreCategoria
order by `Total` desc
limit 1;

select categorias.NombreCategoria, sum(productos.UnidadesEnExistencia) as 'Stock'
from categorias inner join productos on categorias.IdCategoria = productos.IdCategoria
group by productos.IdCategoria order by sum(productos.UnidadesEnExistencia) desc limit 1;



#Mostrar Nombre producto, precio unidad y un 10% de descuento, en los 3 productos mas vendidos en 1996

select productos.NombreProducto, productos.PrecioUnidad,(productos.PrecioUnidad * 0.9) as PrecioConDescuento
from Productos
inner join detallespedidos 
on Productos.IdProducto = detallespedidos.IdProducto
inner join pedidos
on detallespedidos.IdPedido=pedidos.IdPedido
where year(pedidos.FechaPedido) = 1996
order by productos.PrecioUnidad desc;

#Mostrar los el nombre del producto que no tengan existencia/ stock y el nombre y país del proveedor.

select productos.NombreProducto, productos.IdProveedor, proveedores.Pais
from  Productos inner join Proveedores 
on productos.IdProveedor = proveedores.IdProveedor
where productos.UnidadesEnExistencia = 0;

#Mostrar las nombre y dirección de los clientes que hayan recibido un pedido en el primer semestre de 1995

select clientes.NombreContacto, clientes.Direccion
from Clientes inner join Pedidos 
on clientes.IdCliente = pedidos.IdCliente
where year(pedidos.FechaPedido) = 1997
and month(pedidos.FechaPedido) BETWEEN 1 AND 6;


#Indicar el nombre de empleado que ha realizado pedidos para la compañía proveedora Exotics Liquids.


select distinct concat(empleados.Nombre, ' ', empleados.Apellidos) as 'Nombre Completo', proveedores.NombreCompañia
from proveedores
inner join productos on proveedores.IdProveedor = productos.IdProveedor	
inner join detallespedidos on detallespedidos.IdProducto = productos.IdProducto
inner join pedidos on pedidos.IdPedido= detallespedidos.IdPedido
inner join empleados on empleados.IdEmpleado= pedidos.IdEmpleado
where proveedores.NombreCompañia like 'Exotic Liquids';

SELECT DISTINCT Empleados.Nombre
FROM Empleados
INNER JOIN Pedidos ON Empleados.IdEmpleado = Pedidos.IdEmpleado
INNER JOIN DetallesPedidos ON Pedidos.IdPedido = DetallesPedidos.IdPedido
INNER JOIN Productos ON DetallesPedidos.IdProducto = Productos.IdProducto
INNER JOIN Proveedores ON Productos.IdProveedor = Proveedores.IdProveedor
WHERE Proveedores.NombreCompañia = 'Exotics Liquids';