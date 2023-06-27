select current_user();
use supermercado;
call caja1(4,50);

select position('@' in current_user()); -- posicion 10 de Empleado_1@localhost


-- Guardamos la @ en una variable
select position('@' in current_user()) into @position;

select @position; -- 10




select substring(current_user(),1,@position -1); 



select current_user() into @usuario_con_arroba;

select position('@' in @usuario_con_arroba) into @posicion_de_arroba ;

select substring(@usuario_con_arroba,1,@posicion_de_arroba -1) into @usuario_sin_arroba;


select @usuario_sin_arroba;

select substring(@posicion_sin_arroba,9, length(@usuario_sin_arroba)-8);
