-- Vemos que producto del ID es la cocacola
select * 
from producto
where id_producto= 2;
-- Actualizamos la cantidad vendida del stock de la cocacola
update producto
set stock= stock -3
where id_producto =2;

-- metemos la venta con los datos registrados
insert into venta values (default, 1,2,3,1.5,3*1.5);

-- comprobamos la venta con los datos
select *
from venta
order by id_venta desc limit 1;


-- y volemos a meter al empleado con la venta

insert into asignacion values (1,1);


-- -------------------------------------- Creamos otra venta----------------------

-- Vemos que producto del ID es la cocacola
select * 
from producto
where id_producto= 3;
-- Actualizamos la cantidad vendida del stock de la cocacola
update producto
set stock= stock -33
where id_producto =3;

-- metemos la venta con los datos registrados
insert into venta values (default, 3,3,33,3,33*3);

-- comprobamos la venta con los datos
select *
from venta
order by id_venta desc;


-- y volemos a meter al empleado con la venta

insert into asignacion values (2,2);


-- -------------------------------------- Creamos otra venta 11 unidaddes del id=1----------------------

-- Vemos que producto del ID es la cocacola
select * 
from producto
where id_producto= 1;
-- Actualizamos la cantidad vendida del stock de la cocacola
update producto
set stock= stock -11
where id_producto =1;

-- metemos la venta con los datos registrados
insert into venta values (default, 2,1,11,1,11*1);

-- comprobamos la venta con los datos
select *
from venta
order by id_venta desc;


-- y volemos a meter al empleado con la venta

insert into asignacion values (1,1);
