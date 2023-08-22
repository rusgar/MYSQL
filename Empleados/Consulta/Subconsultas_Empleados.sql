Use empleados;

-- Con operadores básicos de comparación
-- 1. Devuelve un listado con todos los empleados que tiene el departamento de Sistemas. (Sin utilizar INNER JOIN).

 select *
 from empleado
 where codigo_departamento = ( select codigo from departamento where nombre = 'Sistemas');
 
 -- Utilizando INNER JOIN
 
  select empleado.codigo_departamento, empleado.nif, empleado.nombre, departamento.nombre
 from empleado
 inner join departamento on empleado.codigo_departamento= departamento.codigo
 where departamento.nombre = 'sistemas';

-- 2. Devuelve el nombre del departamento con mayor presupuesto y la cantidad que tiene asignada.

select nombre, presupuesto as 'Mayor Presupuesto'
 from departamento
 where  presupuesto = ( select max(presupuesto) from departamento );

-- 3. Devuelve el nombre del departamento con menor presupuesto y la cantidad que tiene asignada. 

 select nombre, presupuesto as 'Menor Presupuesto'
 from departamento
 where  presupuesto = ( select min(presupuesto) from departamento );
 
 -- 3bis  Devuelve el nombre del departamento con menor gasto y la cantidad que tiene asignada
 select nombre, gastos as 'Menor Gasto'
 from departamento
 where  gastos = ( select min(gastos) from departamento );

-- Subconsultas con ALL y ANY
-- 4. Devuelve el nombre del departamento con mayor presupuesto y la cantidad que tiene asignada. Sin hacer uso de MAX, ORDER BY ni LIMIT.


select nombre, presupuesto  as 'Mayor Presupuesto'  
FROM departamento
WHERE presupuesto >= All
  (SELECT   
    presupuesto  FROM departamento );
    
/*select nombre, presupuesto    
FROM departamento
WHERE presupuesto >= Any
  (SELECT   
    presupuesto  FROM departamento where  presupuesto = 150000  );  */  

-- 5. Devuelve el nombre del departamento con menor presupuesto y la cantidad que tiene asignada. Sin hacer uso de MIN, ORDER BY ni LIMIT.


select nombre, presupuesto  as 'Menor Prosupuesto'  
FROM departamento
WHERE presupuesto <= All
  (SELECT   
    presupuesto  FROM departamento );
    
-- 5bis. Devuelve el nombre del departamento con menor gasto y la cantidad que tiene asignada. Sin hacer uso de MIN, ORDER BY ni LIMIT.    
select nombre, gastos as 'Menor Gasto'
FROM departamento
WHERE gastos <= All
  (SELECT   
    gastos  FROM departamento );    

-- 6. Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando ALL o ANY).
 select departamento
 from departamento
 where departamento.codigo = any (select empleado.codigo_departamento from empleado);
 
 /* realiazado con el Inner Join
 select distinct departamento.nombre, empleado.codigo_departamento
 from departamento join empleado on departamento.codigo = empleado.codigo_departamento;*/

-- 7. Devuelve los nombres de los departamentos que no tienen empleados asociados. (Utilizando ALL o ANY).
select distinct departamento.nombre as 'Departamentos'
from departamento right join empleado on departamento.codigo <> empleado.codigo_departamento 
where departamento.codigo != all (select empleado.codigo_departamento from empleado where empleado.codigo_departamento);

select  departamento.nombre as 'Departamentos'
from departamento  
where departamento.codigo <> all (select empleado.codigo_departamento from empleado where empleado.codigo_departamento  );

select nombre as 'Departamentos'
from departamento
where codigo <> all( select ifnull(codigo_departamento,0 )from empleado where codigo_departamento);

 -- Subconsultas con IN y NOT IN
-- 8. Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando IN o NOT IN).
 select nombre as 'Departamentos'
 from departamento
 where codigo in (select codigo_departamento
                  from empleado);

-- 9. Devuelve los nombres de los departamentos que no tienen empleados asociados. (Utilizando IN o NOT IN).

select  nombre as 'Departamentos'
from departamento  
where codigo not in ( select ifnull(codigo_departamento,0 )
                      from empleado
                      where codigo_departamento );

-- Subconsultas con EXISTS y NOT EXISTS
-- 10. Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando EXISTS o NOT EXISTS).
 select departamento.nombre as 'Departamentos'
 from departamento
 where  exists (select empleado.codigo_departamento
                from empleado
                where empleado.codigo_departamento=departamento.codigo  );


-- 11. Devuelve los nombres de los departamentos que no tienen empleados asociados. (Utilizando EXISTS o NOT EXISTS).

 select departamento.nombre as 'Departamentos'
 from departamento
 where not exists (select empleado.codigo_departamento
                  from empleado where empleado.codigo_departamento=departamento.codigo  );