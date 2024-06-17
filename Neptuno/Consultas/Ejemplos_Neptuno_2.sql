 USE neptuno;
-- • Hallar toda las compañías de envío
-- • Hallar todos los productos cuya categoría sea Bebidas
-- • Hallar todas los productos cuya categoría contenga "on"
-- • Mostrar todas las categorías(nombre) con la imagen distintos de nulo
-- • Mostrar el nombre de producto y precio de todas las cervezas de la tabla productos y sustituir el cerveza por
--   beer
-- • Mostrar todos los pedidos del cliente Philip Cramer del año 1997
-- • Mostrar los pedidos realizados por Mary Saveley y enviado por la empresa United Package
-- • Mostrar la IdCLiente todos los pendidos que han sido enviados por Speedy Express
-- • Mostrar Idliente=KOENE ; su pedido max, medio y mínimo del año 1997 (puede generar un error de permisos)
-- • Mostrar La I y la comisión(25% cargo) que se ha llevado por un pedido (puede generar un error de permisos)

select NombreCompañia
from neptuno.compañiasenvios;

select neptuno.productos.NombreProducto, neptuno.categorias.NombreCategoria
from neptuno.productos inner join categorias on neptuno.productos.IdCategoria= neptuno.categorias.IdCategoria
where neptuno.categorias.NombreCategoria= 'Bebidas' ;

select  neptuno.productos.NombreProducto, neptuno.categorias.NombreCategoria
from neptuno.productos join neptuno.categorias
on neptuno.productos.IdCategoria = neptuno.productos.IdCategoria
where neptuno.categorias.NombreCategoria like '%on%';

select neptuno.categorias.NombreCategoria
from neptuno.categorias
where neptuno.categorias.Imagen is not null;

select replace(neptuno.productos.NombreProducto, 'Cerveza', 'Beer') as 'Productos', 
               neptuno.productos.PrecioUnidad
from neptuno.productos
where neptuno.productos.NombreProducto like '%Cerveza%' ;

select neptuno.clientes.NombreContacto, neptuno.pedidos.FechaPedido
FROM neptuno.pedidos inner join clientes
on neptuno.pedidos.IdCliente = neptuno.clientes.IdCliente
where clientes.NombreContacto = 'Philip Cramer'
and year(neptuno.pedidos.fechaPedido) = 1997;


select neptuno.clientes.NombreContacto , neptuno.compañiasenvios.NombreCompañia, neptuno.pedidos.IdPedido
from neptuno.clientes
inner join  neptuno.pedidos on neptuno.clientes.IdCliente = neptuno.pedidos.IdCliente
inner join neptuno.compañiasenvios on neptuno.pedidos.FormaEnvio= neptuno.compañiasenvios.IdCompañiaEnvios
where neptuno.clientes.NombreContacto = 'Mary Saveley' and neptuno.compañiasenvios.NombreCompañia = 'United Package';


select neptuno.pedidos.IdCliente, neptuno.pedidos.IdPedido, neptuno.compañiasenvios.NombreCompañia
from neptuno.clientes 
inner join neptuno.pedidos on neptuno.clientes.IdCliente = neptuno.pedidos.IdCliente
inner join neptuno.compañiasenvios on neptuno.pedidos.FormaEnvio = neptuno.compañiasenvios.IdCompañiaEnvios
where neptuno.compañiasenvios.NombreCompañia = 'Speedy Express';

-- • Mostrar Idliente=KOENE ; su pedido max, medio y mínimo del año 1997 (puede generar un error de permisos)

select format(max(neptuno.pedidos.idPedido), 2) as 'Pedido Maximo',
       format(avg(neptuno.pedidos.idPedido), 2) as 'Pedido Medio',
	   format(min(neptuno.pedidos.idPedido), 2) as 'Pedido Minimo'      
from  neptuno.pedidos
inner join neptuno.clientes
on neptuno.pedidos.IdCliente = neptuno.clientes.IdCliente
where neptuno.clientes.IdCliente ='KOENE' and year(neptuno.pedidos.FechaPedido) = '1997';

-- • Mostrar La I y la comisión(25% cargo) que se ha llevado por un pedido (puede generar un error de permisos)
     