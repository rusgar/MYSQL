use neptuno;
-- )	 Busca los pedidos que hizo la empleado Robert.

select IdPedido, nombre
from Pedidos
inner join Empleados on Pedidos.IdEmpleado = Empleados.IdEmpleado 
where	Empleados.Nombre = 'Robert';

-- )      	Mostrar los pedidos de BLONP (código cliente), con su nombre 

select Pedidos.IdPedido , Clientes.IdCliente, Clientes.NombreContacto as ' Nombre'
from Pedidos inner join Clientes
on Clientes.IdCliente = Pedidos.IdCliente 
where Clientes.IdCliente = 'BLONP';

-- )          Que IDClientes que pidieron chocolate en mes de enero de 1997

select Productos.NombreProducto , IdCliente
from Productos
inner join Detallespedidos on Detallespedidos.IdProducto = Productos.IdProducto
inner join Pedidos on Pedidos.IdPedido = Detallespedidos.IdPedido 
where NombreProducto like '%Chocolate%' and Pedidos.FechaPedido between '1997/01/01'  and '1997/01/31';

-- )         Obtener, del pedido 10304, su id, el nombre del cliente,el nombre y apellidos del empleado,
--           la fecha del pedido y el importe total de dicho pedido 

SELECT	pedidos.IdPedido, clientes.NombreCompañia as 'Cliente', concat(empleados.Apellidos, '--- ' ,empleados.Nombre) as Empleado,
		pedidos.FechaPedido, format(sum(detallespedidos.Cantidad * detallespedidos.PrecioUnidad ),2  ) as Total
FROM	Pedidos 
INNER JOIN Clientes  on(Pedidos.IdCliente = Clientes.IdCliente)
INNER JOIN Empleados on(Pedidos.IdEmpleado = Empleados.IdEmpleado)
INNER JOIN Detallespedidos  on(Pedidos.IdPedido = Detallespedidos.IdPedido)
WHERE	Pedidos.IdPedido = 10304
GROUP by Pedidos.IdPedido, Clientes.NombreCompañia, Pedidos.FechaPedido;

-- )          Mostar todas las ventas que se realizaron desde España

 select pedidos.CiudadDestinatario, pedidos.PaisDestinatario
 from  pedidos
 inner join Clientes on clientes.IdCliente = Pedidos.IdCliente
 where clientes.Pais = 'España';
 
-- )           Mostrar todos los pedidos del cliente Philip Cramer del año 1997 (consubconsultas)

select * 
from pedidos 
where IdCliente= (select IdCliente 
                  from clientes 
                  where NombreContacto='Philip Cramer' ) AND FechaPedido between '1997-01-01' and '1997-12-31';
                  
                  
-- )         Mostrar los id de los pedidos junto con su nombre que tienen productos de las categorías Lacteos o Bebibas.

select Pedidos.IdPedido, productos.nombreProducto as 'Nombre', Categorias.NombreCategoria as 'Categoria'
from Pedidos
inner join Detallespedidos on Detallespedidos.IdPedido =Pedidos.IdPedido
inner join Productos on Detallespedidos.IdProducto=Productos.IdProducto
inner join Categorias on Categorias.IdCategoria = Productos.IdCategoria
where  Categorias.NombreCategoria = 'Lácteos' or categorias.NombreCategoria= 'Bebidas';
 

-- )         Obtener los nombres de los empleados que han vendido productos de la categoría lácteos el día 4 de marzo de 1998

select  distinct concat(empleados.nombre, '--',empleados.apellidos) as 'Nombre Completo'
from empleados
inner join Pedidos on empleados.IdEmpleado = pedidos.IdEmpleado
inner join detallespedidos on Pedidos.IdPedido =detallespedidos.IdPedido
inner join productos on productos.IdProducto= detallespedidos.IdProducto
inner join categorias on categorias.IdCategoria= productos.IdCategoria
where categorias.NombreCategoria = 'Lácteos' and pedidos.FechaPedido= '1998-03-04';

-- ) ¿Cuánto se facturo Agosto 1996?

select sum(Detallespedidos.Cantidad * Detallespedidos.PrecioUnidad)	as 'Facturacion de Agosto' 
from Detallespedidos
inner join Pedidos on Detallespedidos.IdPedido = Pedidos.IdPedido
where Pedidos.FechaPedido >='1996/08/01' and Pedidos.FechaPedido <='1996/08/30';

-- )  Mostrar todos los ciudades de la tabla clientes tenga una ‘er’ en  cualquier definicion de la ciudad
Select clientes.Ciudad
from clientes
where clientes.Ciudad like '%er%'
order by clientes.Ciudad asc;


select replace(replace(upper(NombreProducto), 'SALCHICHA', 'SAUSAGE'), ' ', '_') as 'Nuevo_Nombre'
from productos
where NombreProducto like '%salchicha%';
