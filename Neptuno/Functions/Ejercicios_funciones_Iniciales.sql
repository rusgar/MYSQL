-- Ejecicios de funciones Iniciales
use neptuno;
select user, host from mysql.user;
set global log_bin_trust_function_creators = 1;

select neptuno.sayMyname ('Dark Vaider soy tu padre') as ' Star Wars';
select neptuno.Echo_Mayus('Edu');
select neptuno.Echo_Minis('VOLANDO VOY');
select neptuno.UNION_MAYUSCULAS('edu', 'rus');
select neptuno.UNION_CAMELCASE('Fran', 'Artosta', 'generoso');
select neptuno.contador_AVG(5, 15);
select neptuno.entero_a_binario(148);
select neptuno.codificacion('hola');
select neptuno.decodificacion('apaepeipioipopoupupu');
select neptuno.entero_a_romano(1999);
select neptuno.contar_vocales('hOladonpEpiïto');
select palabra_contenida('Este es un ejemplo', 'ejemplo');
select neptuno.buscar_palabra('pepito de los palotes', 'pep');