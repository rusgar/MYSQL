use ventas;
show columns from cliente;

-- 1. Devuelve un listado con el identificador, nombre y los apellidos de todos los clientes que han realizado algún pedido. 
-- El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos.

SELECT DISTINCT cli.id, cli.nombre, concat(ifnull(cli.apellido1, ' No Tiene'), '--', ifnull(cli.apellido2,'No Tiene'))as 'Apellidos'
 FROM  pedido  ped  JOIN cliente cli ON cli.id = ped.id_cliente
 ORDER BY cli.nombre ASC; 

-- 2. Devuelve un listado que muestre todos los pedidos que ha realizado cada cliente. 
-- El resultado debe mostrar todos los datos de los pedidos y del cliente. 
-- El listado debe mostrar los datos de los clientes ordenados alfabéticamente.

SELECT ped.*, cli.* 
FROM pedido ped INNER JOIN cliente cli ON ped.id_cliente = cli.id 
ORDER BY cli.nombre ASC;

-- 3. Devuelve un listado que muestre todos los pedidos en los que ha participado un comercial. 
-- El resultado debe mostrar todos los datos de los pedidos y de los comerciales. 
-- El listado debe mostrar los datos de los comerciales ordenados alfabéticamente.

SELECT ped.id as 'Pedido', ped.total, ped.fecha, com.id as 'Id Comercial', com.nombre 
from pedido ped join comercial com on ped.id_comercial = com.id
ORDER BY com.nombre ASC;


-- buscqueda que acabe en 'a' o en 'o'

SELECT ped.id as 'Pedido', ped.total, ped.fecha, com.id as 'Id Comercial', com.nombre 
from pedido ped join comercial com on ped.id_comercial = com.id
where com.nombre like 'A%' or com.nombre like '%O';

-- 4. Devuelve un listado que muestre todos los clientes, con todos los pedidos que han realizado y con los datos de los comerciales asociados
--  a cada pedido.

SELECT *
FROM cliente cli INNER JOIN pedido ped ON cli.id = ped.id_cliente 
INNER JOIN comercial com ON com.id = ped.id_comercial; 

-- 5. Devuelve un listado de todos los clientes que realizaron un pedido durante el año 2017, cuya cantidad esté entre 300 € y 1000 €.


SELECT *
FROM pedido ped INNER JOIN cliente cli ON ped.id_cliente = cli.id
 WHERE ped.fecha LIKE '%2017%' AND ped.total BETWEEN 300 AND 1000;
 
 
 -- Utilizando la year
 SELECT *
FROM pedido ped INNER JOIN cliente cli ON ped.id_cliente = cli.id
 WHERE YEAR (ped.fecha)= 2017 AND ped.total BETWEEN 300 AND 1000;

-- 6. Devuelve el nombre y los apellidos de todos los comerciales que ha participado en algún pedido realizado por María Santana Moreno.
SELECT pedido.* 
FROM pedido 
WHERE id_cliente = (SELECT id 
                    FROM cliente 
                    WHERE nombre = 'Maria' AND apellido1 = 'Santana' AND apellido2 = 'Moreno');
                    
                    
 select distinct com.nombre as 'nombre', com.apellido1 as ' Primer Apellido', com.apellido2 as 'Segundo Apellido'
 from comercial com join pedido ped on com.id= ped.id_comercial
 join cliente cli on cli.id = ped.id_cliente
 where cli.nombre = 'Maria' AND cli.apellido1 = 'Santana' AND cli.apellido2 = 'Moreno';                    


-- 7. Devuelve el nombre de todos los clientes que han realizado algún pedido con el comercial Daniel Sáez Vega.
    
     
 select distinct cli.nombre as 'clientes'
 from comercial com join pedido ped on com.id= ped.id_comercial
 join cliente cli on cli.id = ped.id_cliente
 where com.nombre = 'Daniel' AND com.apellido1 = 'Sáez' AND com.apellido2 = 'Vega';
 
-- (II parte)
-- 1. Devuelve un listado con todos los clientes junto con los datos de los pedidos que han realizado. 
-- Este listado también debe incluir los clientes que no han realizado ningún pedido. 
-- El listado debe estar ordenado alfabéticamente por el primer apellido, segundo apellido y nombre de los clientes.


SELECT *
FROM pedido ped 
RIGHT JOIN cliente cli ON ped.id_cliente = cli.id
ORDER BY cli.nombre ASC;

-- 2. Devuelve un listado con todos los comerciales junto con los datos de los pedidos que han realizado. 
-- Este listado también debe incluir los comerciales que no han realizado ningún pedido. 
-- El listado debe estar ordenado alfabéticamente por el primer apellido, segundo apellido y nombre de los comerciales.

select *
from pedido ped right  join comercial com on ped.id_comercial= com.id
ORDER BY com.apellido1 ASC, com.apellido2 ASC, com.nombre ASC;


-- 3. Devuelve un listado que solamente muestre los clientes que no han realizado ningún pedido.

select *
from pedido ped right  join cliente cli on ped.id_cliente= cli.id 
where ped.id_cliente is null;

-- 4. Devuelve un listado que solamente muestre los comerciales que no han realizado ningún pedido.

select *
from comercial com left  join pedido ped on com.id= ped.id_comercial
where ped.id_comercial is null;

-- 5. Devuelve un listado con los clientes que no han realizado ningún pedido y de los comerciales que no han participado en ningún pedido. 
-- Ordene el listado alfabéticamente por los apellidos y el nombre. 
-- En en listado deberá diferenciar de algún modo los clientes y los comerciales.




SELECT CONCAT(CLIENTE.NOMBRE,'--',CLIENTE.APELLIDO1,'--', CLIENTE.APELLIDO2 ) AS nombre, 'Cliente' as Desempeño
FROM CLIENTE LEFT JOIN PEDIDO ON CLIENTE.id = pedido.id_cliente
WHERE pedido.id_cliente IS  NULL 
UNION 
SELECT CONCAT(COMERCIAL.NOMBRE, '--',COMERCIAL.APELLIDO1,'--', COMERCIAL.APELLIDO2 ) as nombre, 'Comercial' as Desempeño 
                                        FROM comercial LEFT JOIN pedido ON comercial.id = pedido.id_comercial 
                                        WHERE pedido.id_comercial IS NULL
                                        ORDER BY nombre;
                                        
                                        
-- 1. clientes que no realizaron pedidos


select *
from pedido ped right  join cliente cli on ped.id_cliente= cli.id 
where ped.id_cliente is null;

-- 2. Comerciales que no participaron en un pedido

select *
from comercial com left  join pedido ped on com.id= ped.id_comercial
where ped.id_comercial is null;

