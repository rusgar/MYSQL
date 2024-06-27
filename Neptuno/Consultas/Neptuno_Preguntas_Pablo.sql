
# Queremos saber el número de Jefes que tenemos

select count(distinct jefe)
from empleados;


# Queremos saber el Nombre completo de los empleados cuyo pedido haya sido realizado en Barcelona

select concat_ws('  ', empleados.Nombre,empleados.Apellidos)  as 'Nombre Completo',pedidos.CiudadDestinatario
from empleados inner join pedidos
on empleados.IdEmpleado=pedidos.IdEmpleado
where pedidos.CiudadDestinatario like 'Barcelona';

	# Queremos ver los distintos tipos de descuento que pueden tener nuestros productos

	select   distinct  detallespedidos.Descuento
	from productos inner join detallespedidos
	on productos.IdProducto = detallespedidos.IdProducto;


# Queremos ver la Fecha de nacimiento de Margaret y Steven, aunque en el caso de Steven hay una errata con su nombre ya que realmente es Stephen

 select nombre, FechaNacimiento
from empleados
where Nombre like 'Margaret' or  Nombre  like 'Steven';


# Quiero saber el Nombre de las Compañías cuyo número telefónico termine en 31 (así como ver el teléfono completo)

select NombreCompañia, Telefono
from compañiasenvios
where Telefono like'%31' ;

# Hay que reponer stock; queremos ver el nombre de los productos de los que no tengamos unidades. y calcula su precio final en el caso de tener 10 unidades de cada uno

select NombreProducto, PrecioUnidad, (  PrecioUnidad * 10 ) as 'Con existencias'
from productos
where UnidadesEnExistencia = 0;

# Quiero que relaciones el nombre de los últimos 6 productos que tenemos con la Descripción de la categoría a la que pertenece

select productos.NombreProducto,categorias.Descripcion
from productos inner join categorias
on productos.IdCategoria = categorias.IdCategoria
order by productos.NombreProducto  desc 
limit 6 ;

# Queremos saber el cuánto he de pagar (en euros) si pido una unidad de Queso de cabra y Licor Cloudberry

select NombreProducto, concat(format(PrecioUnidad, 2), '  €') as 'Pago'
from productos
where NombreProducto like 'Queso de cabra' or NombreProducto like 'Licor Cloudberry';

# Queremos saber el número de pedidos realizados relacionados con Carnes

select pedidos.IdPedido, productos.NombreProducto, categorias.NombreCategoria
from categorias inner join productos
on categorias.IdCategoria = productos.IdCategoria 
inner join detallespedidos
on  productos.IdProducto = detallespedidos.IdProducto
inner  join pedidos
on detallespedidos.IdPedido= pedidos.IdPedido
where categorias.NombreCategoria = 'Carnes';

# Quiero que me muestres el IdPedido (ordenados de forma descendente), el Cargo (redondeado a la segunda décima y representado en dólares), la Ciudad (mostrando sólo los de Madrid) y el País (modificando el País por Spain)

select IdPedido, concat(round(cargo, 2),'  $') as 'Cargo', CiudadDestinatario, replace(PaisDestinatario, 'España', 'Spain') as 'Pais'
from pedidos
where CiudadDestinatario = 'Madrid' and PaisDestinatario = 'España'
order by  IdPedido asc;

