-- 1.- Hallar toda las compañias de envío

SELECT *
FROM compañiasenvios;
 
-- 2.- hallar los nomnbres de los productos cuya categoría contenga "on"
Select NombreProducto from productos where IdCategoria =(Select IdCategoria 
                                                         from categorias 
                                                         where  NombreCategoria like '%on%');
 
-- 2.- con el inner join 
select NombreProducto as 'Producto', NombreCategoria as 'Categoria' 
from productos  
inner join categorias  on productos.IdCategoria= categorias.IdCategoria
where NombreCategoria like '%on%';                                                         


-- 3.mostrar todas las categorias(nombre) con la imagen distintos de nulo, pero primero ponemos en 'null' la categoria reposteria

update categorias
set imagen = null
where nombrecategoria = 'Reposteria';

select categorias.NombreCategoria as 'Categoria', imagen
from categorias
where categorias.Imagen is  null;


-- 4.- mostrar el nombre de producto  y precio de todas las cervezas de la tabla productos   y sustituir el cerveza por beer
select Replace(productos.NombreProducto,'Cerveza','Beer')  AS Nombre , concat(format(productos.PrecioUnidad, 2), ' €') as 'Precio' 
from productos
 where productos.NombreProducto like '%cerv%';

 
-- 5.- Mostrar todos los pedidos del cliente Philip Cramer del año 1997
select * 
from pedidos 
where IdCliente= (select IdCliente 
                  from clientes 
                  where NombreContacto='Philip Cramer' ) AND FechaPedido between '1997-01-01' and '1997-12-31';
                  
                  -- con el inner join
                  
 select clientes.NombreContacto, pedidos.IdPedido, year(pedidos.FechaPedido) as 'Fecha'
 from pedidos 
 inner join clientes on pedidos.IdCliente= clientes.IdCliente 
where NombreContacto='Philip Cramer'  and  year (FechaPedido) = '1997';                  


-- 6.- Mostrar los pedidos realizados  por Mary Saveley y enviado por la empresa United Package

 select pedidos.IdPedido , clientes.NombreContacto, compañiasenvios.NombreCompañia, year(pedidos.FechaPedido) as 'Fecha'
 from clientes 
 inner join pedidos  on clientes.IdCliente= pedidos.IdCliente
 inner join compañiasenvios  on pedidos.FormaEnvio = compañiasenvios.IdCompañiaEnvios
 where compañiasenvios.NombreCompañia='United Package' and  clientes.NombreContacto='Mary Saveley';
 

 
-- 7.- mostrar la IdCLiente todos los  pedidos que han sido enviados por Speedy Express

 Select clientes.IdCliente,clientes.NombreContacto, compañiasenvios.NombreCompañia 
 from compañiasenvios 
 inner join pedidos  on  compañiasenvios.IdCompañiaEnvios= pedidos.FormaEnvio
 inner join clientes on pedidos.IdCliente=clientes.IdCliente
 where compañiasenvios.NombreCompañia='Speedy Express';


-- 8.- Mostrar Idliente=KOENE, con su nombre correspòndiente a  su pedido max, medio y  mínimo del año 1997

Select  pedidos.IdCliente, clientes.NombreContacto, MAX(pedidos.cargo) AS 'Pedido Maximo', MIN(pedidos.cargo) AS 'Pedido Minimo',  AVG(pedidos.cargo) AS 'Pedido Medio' 
from pedidos inner join clientes on pedidos.Idcliente = clientes.Idcliente
where pedidos.FechaPedido between '1997-01-01' and '1997-12-31' AND pedidos.Idcliente='KOENE';

-- 9 Quiero el nombre y el precio de todos los productos cuyo precio por unidad sea menor de 15 €

select nombreproducto as 'Nombre',  concat(format(preciounidad,2), ' €') as 'precio'
from productos
where PrecioUnidad <15 order by  PrecioUnidad  desc;


-- 10 Todos los productos que pertenezcan a la categoria de bebida y que muestren la categoria tamnbien
select productos.nombreproducto as 'Nombre', categorias.nombrecategoria as 'Categoria'
from productos join categorias on  productos.idCategoria=categorias.IdCategoria
where categorias.nombrecategoria = 'bebidas';

-- 11 Mostrar los id de los pedidos junto con su nombre que tienen productos de las categorías Lacteos o Bebibas.

select Pedidos.IdPedido, productos.nombreProducto as 'Nombre', Categorias.NombreCategoria as 'Categoria'
from Pedidos inner join Detallespedidos on Detallespedidos.IdPedido =Pedidos.IdPedido
inner join Productos on Detallespedidos.IdProducto=Productos.IdProducto
inner join Categorias on Categorias.IdCategoria = Productos.IdCategoria
 where  Categorias.NombreCategoria = 'Lácteos' or categorias.NombreCategoria= 'Bebidas';
 
 -- 12. Una lista de los pedidos que fueron entregados la primera quincena de mayo de 1998 y costaban más de 200€
 
 select *
 from pedidos 
 where   pedidos.fechaEntrega between "1998-05-01" and "1998-05-15"  and  pedidos.cargo >200; 
        


-- 13. Una lista de los clientes que han hecho algún pedido el 4 de mayo de 1998
select clientes.NombreContacto as 'Clientes'
from clientes inner join pedidos on clientes.idcliente=pedidos.IdCliente
where pedidos.fechapedido = "1998-05-04";




-- 14.- Obtener los nombres de los empleados que han vendido productos de la categoría lácteos el día 4 de marzo de 1998
 
 
 select  distinct concat(empleados.nombre, '--',empleados.apellidos) as 'Nombre Completo'
from empleados inner join Pedidos on empleados.IdEmpleado = pedidos.IdEmpleado
inner join detallespedidos on Pedidos.IdPedido =detallespedidos.IdPedido
inner join productos on productos.IdProducto= detallespedidos.IdProducto
inner join categorias on categorias.IdCategoria= productos.IdCategoria
where categorias.NombreCategoria = 'Lacteos' and pedidos.FechaPedido= '1998-03-04';


 