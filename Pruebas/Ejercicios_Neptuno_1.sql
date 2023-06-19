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
where categorias.NombreCategoria = 'Lácteos' and pedidos.FechaPedido= '1998-03-04';

-- 15 Detañlles de pedido de los produrctos vendidop por el empleado nº1 el cliente 'greal'

select Pedidos.IdPedido ,NombreProducto, Clientes.IdCliente, Clientes.NombreContacto as ' Empleado', detallespedidos.*
from Pedidos inner join Clientes on Clientes.IdCliente = Pedidos.IdCliente
inner join detallespedidos on  detallespedidos.IdPedido= pedidos.IdPedido
inner join productos on productos.IdProducto= detallespedidos.IdProducto
inner join empleados on empleados.IdEmpleado= pedidos.IdEmpleado
where Clientes.IdCliente = 'GREAL' and empleados.Idempleado = 1 ;

-- 16 Obtener todos los detalles del pedido cuyo cliente sea el Id cliente 'Furib', con el ID proveedor '23, con el ID empleado '1'

select cli.IdCliente,cli.NombreContacto, prov.IdProveedor, prov.NombreCompañia,emp.Idempleado, emp.cargo
from detallespedidos det
inner join productos prod on det.IdProducto= prod.IdProducto
inner join proveedores prov on prov.IdProveedor= prod.IdProveedor
inner join categorias cat on cat.IdCategoria= prod.IdCategoria
inner join pedidos  ped on ped.IdPedido= det.IdPedido
inner join empleados  emp on emp.IdEmpleado= ped.IdEmpleado
inner join clientes  cli on cli.IdCliente= ped.IdCliente
where cli.IdCliente= 'FURIB' and prov.IdProveedor=23 and emp.Idempleado= 1 ;

-- 17  Mostrar todos los campos de la tabla CATEGORÍAS
SELECT *
FROM neptuno.categorias;

-- 18 Mostrar todos los países distintos de la tabla de CLIENTES
select distinct Pais
from clientes;

-- 19 Mostrar el nombreProducto y precioUnidad de todos los PRODUCTOS cuyo precioUnidad sea superior a 100
select  NombreProducto, concat(format(preciounidad,2), ' €') as 'precio'
from productos
where PrecioUnidad > 100;

-- 20 Mostrar el nombreProducto, precioUnidad y unidades EnExistencia de todos los PRODUCTOS con precioUnidad comprendido entre 75 y 100
select NombreProducto, PrecioUnidad, UnidadesEnExistencia
from productos
where PrecioUnidad  between  75 and 100 ;

-- 21 Mostrar el nombre, apellidos y fechaContratacion  de todos los EMPLEADOS contratados (FechaContratacion) antes del 01-02-1993
select Nombre, Apellidos, FechaContratacion
from empleados
where FechaContratacion < '1993-02-01';

-- 22 Mostrar destinatario, fechaPedido y cargo de todos los PEDIDOS del segundo trimestre del año 1997
select  Destinatario, FechaPedido, Cargo
from pedidos
where FechaPedido between '1997-04-01' and '1997-06-30';

-- 23 Mostrar todos los CLIENTES cuyo nombreCompañia comience por ‘A’
select *
from clientes
where NombreCompañia like 'a%';

-- 25Mostrar todos los CLIENTES cuyo nombreCompañia tenga una ‘A’ en  el segundo carácter
select *
from clientes
where NombreCompañia like '_a%';

-- 26Mostrar todos los CLIENTES cuyo nombreCompañia finalice con el texto “store”
select *
from clientes
where NombreCompañia like '%store';

-- 27Mostrar todos los CLIENTES cuyo nombreCompañia  NO comience por ‘A’

select *
from clientes
where NombreCompañia  not like 'a%';

-- 28 Mostrar todos los PRODUCTOS cuyo nombreProducto contenga el texto “chocolate” en cualquier parte del nombreProducto
select *
from productos
where NombreProducto like '%Chocolate%';

-- 29 Mostrar nombreproducto y preciounidad de todos los PRODUCTOS que se encuentren suspendidos. El valor del campo suspendido tiene que ser distinto de 0 (0 = FALSE).
select NombreProducto, PrecioUnidad, Suspendido
from productos
where Suspendido  <> 0;

-- 30 Mostrar nombrecompañia, ciudad, pais, fax de los CLIENTES de los cuales no tengamos su número de fax (el valor del campo fax sea nulo).
select  NombreCompañia, Ciudad,Pais, fax
from clientes
where fax is null;

-- 31 Mostrar los nombreCompañia, ciudad, region y pais de todos los PROVEEdORES de los que conozcamos su región. 
select NombreCompañia, Ciudad,Region,Pais
from proveedores
where region is not null;

-- 32 Mostrar los nombreCompañia, ciudad, region y pais de todos los PROVEEDORES de Oviedo, Madrid o Berlín. 
select * , NombreCompañia,Ciudad,Region,Pais
from proveedores
where ciudad in('Oviedo', 'Madrid','Berlin') ;

-- 33 Mostrar los nombreCompañia, ciudad y codpostal de todos los CLIENTES cuyo código postal tenga una longitud de 5 caracteres.
select * , NombreCompañia,Ciudad,codpostal
from clientes
where length(CodPostal)= 5;

-- 34 Mostrar de la tabla de EMPLEADOS, el nombre, apellidos y cargo con el siguiente formato:   Nombre Apellidos (Cargo)
select concat_ws('',Nombre, '--', Apellidos, '--', Cargo) as 'Nombre Apellidos (Cargo)'
from empleados;


-- 35 Mostrar los nombreproducto, preciounidad y el nombreproducto reemplazando el texto ‘Queso’ por ‘CHEESE’ de todos los PRODUCTOS que contengan el texto ‘queso’
--    en cualquier parte del nombre.

select Replace(Replace(NombreProducto,'Queso','Cheese'), 'queso', 'cheese') as  Nombre , concat(format(PrecioUnidad, 2), ' €') as 'Precio' 
from productos
 where NombreProducto like '%queso%' ;
 
-- 36 Mostrar los precioUnidad de todos los PRODUCTOS aplicándoles todas las funciones de redondeo
   -- (ROUND, FLOOR, CEIL). Mostrar únicamente los productos que tienen idCategoria con valor 1.
   select  round(PrecioUnidad), floor(PrecioUnidad), Ceil(PrecioUnidad), IDcategoria
   from Productos
   where idcategoria = 1;
   
 -- 37 Mostrar de la tabla de  PEDIDOS: idcliente, idpedido, fechapedido, fechaenvio, fechaentrega, número de días transcurridos desde que se 
 -- envió el pedido hasta que lo recibió el cliente y cargo del pedido
-- de todos los pedidos cuyo idCliente sea ‘WELLI’, saberr tambien su nombre.  	
 select ped.IdPedido, ped.IdCliente, ped.IdEmpleado,cli.NombreContacto, ped.FechaPedido, ped.FechaEntrega, ped.FechaEnvio , datediff( ped.FechaEntrega, ped.FechaPedido) as 'Dias Transcurridos'
 from pedidos ped  INNER JOIN clientes cli on ped.IdCliente=cli.IdCliente
 where ped.idcliente = 'WELLI';

-- 38¿Cuántos CLIENTES tenemos?
 select  count(*) as clientes
from clientes;


-- 38 Mostrar el número de países diferentes que hay en la tabla de CLIENTES.
select count(distinct Pais) as ' Total  de Paises Diferentes'
from clientes;


#Mostrar  el cargo medio de los PEDIDOS realizados en el año 1996.
select concat(format(avg(Cargo),2), ' €') as 'Cargo Medio',  year(FechaPedido) as Año
from pedidos
where year(FechaPedido) = '1996' group by year(FechaPedido) ;



#Calcular los precioUnidad: mínimo, máximo y medio de todos los productos.
 Select NombreProducto, PrecioUnidad, max(PrecioUnidad) as 'Maximo', min(PrecioUnidad) as 'Minimo', avg(PrecioUnidad) as 'Media'
from productos
group by PrecioUnidad, NombreProducto;

#Calcular la suma de los cargos de todos los pedidos con fechaPedido
# del año 1996.
select  concat(format(sum(cargo),2), ' €') as 'Suma Total',  year(FechaPedido) as año
from pedidos
where year(FechaPedido) = '1996' group by year(FechaPedido) ;




#Queremos hacer un descuento del 25% en todos nuestros PRODUCTOS. 
#Mostrar el nombreproducto, el precioUnidad sin y con descuento.

select nombreProducto, concat(format((PrecioUnidad),2), ' €') as 'Precio sin Descuento', concat(format((PrecioUnidad -(PrecioUnidad * 0.25) ),2 ),' €') as 'Precio con Descuento'
from productos;




#Queremos ver en una consulta sobre la tabla de PEDIDOS:
 #el idpedido, idcliente, idempleado, fechapedido, fechaentrega, 
 #número de días* transcurridos desde el pedido hasta la entrega del 
 #mismo al cliente, cargo del pedido, comisión del vendedor* (15%) 
 #y beneficio neto* (cargo-comisión= 85%). 
 #Solamente se contemplarán los pedidos con FechaPedido 
 #a partir del 1 de enero de 1997 y que se haya tardado menos de 
 #30 días en entregar. 
 
 select *, IdPedido, IdCliente,IdEmpleado,FechaPedido
 from pedidos;


#Se desea ver el nombreProducto, precioUnidad y 
#unidadesEnExistencia de todos los PRODUCTOS 
#ordenados descendentemente por el precioUnidad.


#Se desea ver el nombreCompañia, Ciudad y Pais de todos los
 #CLIENTES ordenados ascendentemente primero por el Pais, 
 #después por la Ciudad y por último por el nombreCompañia.
SELECT nombrecompañia, ciudad, pais
FROM clientes
ORDER BY pais, ciudad, nombrecompañia;

#Se desea ver el nombreProducto, precioUnidad y unidadesEnExistencia 
#de los 8 PRODUCTOS más caros. 


#Se desea ver el nombreProducto, precioUnidad y
# unidadesEnExistencia de los 6 productos siguientes al 4º producto más caro. 
#seleccionar todos los paises de los cliente agrupado por pais

#Calcular el número de CLIENTES que tenemos en cada país.

# mostrar el número de clientes de los paisis que empiezan por A


#Mostrar el número de PEDIDOS realizados cada año.
# Recordad que existe una función llamada YEAR(fecha) 
#que devuelve el año de una fecha. Agrupar utilizando esta función

#Mostrar cuánto hemos vendido (Cargo de PEDIDOS)
# agrupando los resultados por año y 
#por PaisDestinatario de los pedidos.
 #Ver los datos de todos los empleados cuya
 #fecha de contratación sea anterior a la 
 #fecha del primer pedido que ha recibido la empresa













 