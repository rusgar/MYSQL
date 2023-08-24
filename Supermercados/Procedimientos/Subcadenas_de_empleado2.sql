select current_user();
use supermercado;
call caja2(4,33);

-- Guardamos la @ en una variable
select position('@' in current_user()) into @position;

select @position; -- 10

select substring(current_user(),1,@position -1); 