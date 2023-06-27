select current_user() into @usuario;
select @usuario;

-- Como funciona la funcion position
set @texto= 'En un lugar de la mancha';
set @lugar= 'lugar';
select position(@lugar in  @texto);

select position('@' in current_user());

select length(@lugar);

select substring(@texto,7,5); -- 7 de donde esta el @ y el 5 de la longitud de lugar



select substring(@texto,position(@lugar in @texto),length(@lugar)); -- 7 de donde esta el @ y el 5 de la longitud de lugar



