
# Mostrar el nombre,apellidos y fechad de nacimiento de los empleados que nacieron en los 50's

select concat_ws(' ',empleados.Nombre, empleados.Apellidos) as 'Nombre Completo', empleados.FechaNacimiento
from empleados
where year(empleados.FechaNacimiento) between 1950 and 1959;

# Mostrar los datos de los clientes de Reino Unido y ordenados alfabeticamente por el nombrecompañia
select *
from clientes
where clientes.Pais like 'Reino Unido'
order by clientes.NombreCompañia asc;

# Mostrar los idproducto de los que han tenido algún descuento en la venta

select  distinct productos.IdProducto
from productos inner join detallespedidos
on productos.IdProducto = detallespedidos.IdProducto
inner join  pedidos
on detallespedidos.IdPedido = pedidos.IdPedido
where detallespedidos.Descuento != 0;


# Mostrar el número de proveedores en cada país

select  pais, count(IdProveedor) as 'Numero de proveedores'
from proveedores
group by pais
order by count(pais) desc;	

# Mostrar el nombre, apellidos y su tratamiento de todos los empleados en el siguiente formato 'Tratamiento Nombre Apellidos'

select concat_ws('  ',tratamiento, Nombre, Apellidos ) as 'Tratamiento de empleados'
from empleados;

# Mostrar los pedidos cuyo CodPostalDestinatario tiene más de 4 caracteres.

select *
from pedidos
where length(CodPostalDestinatario) > 4;

# Mostrar el idpedido de los pedidos entregados por la compañia 'Federal Shipping' y que el pais detinatario termine con 'a'

select pedidos.IdPedido, pedidos.PaisDestinatario
from pedidos
inner join compañiasenvios
on pedidos.FormaEnvio = compañiasenvios.IdCompañiaEnvios
where compañiasenvios.NombreCompañia like 'Federal Shipping' and pedidos.PaisDestinatario like 'a%';

# Mostrar los pedidos enviados al cliente 'Split Rail Beer & Ale' y cuyo año de entrega es 1998

select *
from pedidos
inner join clientes
on pedidos.IdCliente= clientes.IdCliente
where clientes.NombreCompañia like 'Split Rail Beer & Ale' and year(pedidos.FechaEntrega) = 1998;

# Mostrar el nombre y precio de los productos cuya categoria empiece por 'C'

select productos.NombreProducto, productos.PrecioUnidad,categorias.NombreCategoria
from productos
inner join categorias
on productos.IdCategoria = categorias.IdCategoria
where categorias.NombreCategoria like 'C%';

# Mostrar el nombre de los productos que son de 'Repostería' y que se compraron a la compañia 'Karkki Oy'

select productos.NombreProducto, categorias.NombreCategoria, proveedores.NombreCompañia
from productos
inner join categorias
on productos.IdCategoria = categorias.IdCategoria
inner join proveedores
on proveedores.IdProveedor= productos.IdProveedor
where categorias.NombreCategoria like 'Repostería' and proveedores.NombreCompañia like 'Karkki Oy';
