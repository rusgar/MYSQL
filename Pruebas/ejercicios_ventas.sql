-- VENTAS

-- 1. Calcula la cantidad total que suman todos los pedidos que aparecen en la tabla pedido.

select concat(truncate (sum(total),2), " €") as 'Total Pedidos'
from pedido;

-- 2. Calcula la cantidad media de todos los pedidos que aparecen en la tabla pedido.
select concat(truncate (avg(total),2), " €")  as 'Media Pedidos'
from pedido;
-- select concat(truncate (sum(total/2),2), " €")  as media_pedidos
-- from pedido;

-- 3. Calcula el número total de comerciales distintos que aparecen en la tabla pedido.
select count(distinct ( id_comercial)) as 'Total Comercial'
from pedido;


-- 4. Calcula el número total de clientes que aparecen en la tabla cliente.
select count( id) as 'Total Cliente'
from cliente;
-- select count( id) as 'Total Cliente'
-- from cliente;


-- 5. Calcula cuál es la mayor cantidad que aparece en la tabla pedido.
select concat(max(total), " €") as 'Precio mas alto'
from pedido;


-- 6. Calcula cuál es la menor cantidad que aparece en la tabla pedido.
select concat(min(total), " €") as 'Precio mas bajo'
from pedido;

-- 7. Calcula cuál es el valor máximo de categoría para cada una de las ciudades que aparece en la tabla cliente.
-- select  max( categoría)(ciudad)
-- from cliente;
select  ciudad, max(categoría) as ' Maximo de categoria'
 from cliente
 group by ciudad;


-- 8. Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes. 
-- Es decir, el mismo cliente puede haber realizado varios pedidos de diferentes cantidades el mismo día.
--  Se pide que se calcule cuál es el pedido de máximo valor para cada uno de los días en los que un cliente ha realizado un pedido. 
-- Muestra el identificador del cliente, nombre, apellidos, la fecha y el valor de la cantidad.
 select pedido.id_cliente, cliente.nombre, CONCAT_WS(' - ',cliente.apellido1, cliente.apellido2) as apellido , pedido.fecha, max(pedido.total)
 from cliente inner join pedido on pedido.id_cliente = cliente.id group by pedido.fecha, pedido.id_cliente;
 
 select pedido.id_cliente, cliente.nombre, CONCAT_WS(' - ',cliente.apellido1, cliente.apellido2) as apellido , pedido.fecha, max(pedido.total)
 from cliente inner join pedido on pedido.id_cliente = cliente.id group by pedido.fecha, pedido.id_cliente;

-- 9. Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes, 
-- teniendo en cuenta que sólo queremos mostrar aquellos pedidos que superen la cantidad de 2000 €.
 select pedido.id_cliente, cliente.nombre, CONCAT_WS(' - ',cliente.apellido1, cliente.apellido2) as apellido , pedido.fecha, concat(max(pedido.total), '  €')
 from cliente inner join pedido on pedido.id_cliente = cliente.id group by pedido.fecha, pedido.id_cliente having max(pedido.total)  >2000;


-- 10. Calcula el máximo valor de los pedidos realizados para cada uno de los comerciales durante la fecha 2016-08-17.
--  Muestra el identificador del comercial, nombre, apellidos y total.

select comercial.id as comercial, comercial.nombre,  CONCAT_WS(' -- ',comercial.apellido1, comercial.apellido2) as apellido,pedido.fecha, concat(max(pedido.total), '  €') as total
from comercial inner join pedido on comercial.id = pedido.id_comercial
where pedido.fecha = '2016-08-17'
group by comercial.id, comercial.nombre, comercial.apellido1, comercial.apellido2;




-- 11. Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de pedidos que ha realizado cada uno de clientes. 
-- Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido. Estos clientes también deben aparecer en el listado indicando que el número de pedidos realizados es 0.

select cliente.id as indetificador, cliente.nombre, cliente.apellido1, cliente.apellido2, count( pedido.total) as 'Total Pedido'
from cliente  left join pedido on cliente.id = pedido.id_cliente
group by cliente.id, pedido.id_cliente;

-- 12. Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de pedidos que ha realizado cada uno de clientes
--  durante el año 2017.
select cliente.id as indetificador, cliente.nombre, cliente.apellido1, cliente.apellido2, count( pedido.id) as 'Total Pedido'
from cliente   join pedido
on cliente.id = pedido.id_cliente
where pedido.fecha between '2017-01-01'and '2017-12-31'
group by cliente.id, cliente.nombre, cliente.apellido1, cliente.apellido2;



-- 13. Devuelve un listado que muestre el identificador de cliente, nombre, primer apellido y el valor de la máxima cantidad del
--  pedido realizado por cada uno de los clientes. 
-- El resultado debe mostrar también aquellos clientes que no han realizado ningún pedido indicando que la máxima cantidad de sus pedidos realizados es 0. Puede hacer uso de la función IFNULL.
 SELECT cliente.id as identificador , cliente.nombre, cliente.apellido1,ifnull( max(pedido.total), 0) as 'Maxima Cantidad'
 from cliente left join pedido on cliente.id=pedido.id_cliente 
 group by cliente.id, pedido.id_cliente;



-- 14. Devuelve cuál ha sido el pedido de máximo valor que se ha realizado cada año.

-- 15. Devuelve el número total de pedidos que se han realizado cada año.