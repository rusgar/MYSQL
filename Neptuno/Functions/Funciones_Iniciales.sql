-- Funciones Iniciales


delimiter $$
drop function if exists sayMyname $$
create function sayMyname(name varchar(30)) returns varchar(30) 
begin


return name;
end
$$

-- --------------------------------------ECHO_MAYUS-------------------------
delimiter $$
drop function if exists Echo_Mayus $$
create function Echo_Mayus( palabra varchar(30)) returns varchar(30) 
begin
     set @auxplabra  = upper(palabra);
     return @auxplabra;
end
$$

-- --------------------------------------ECHO_MINIS-------------------------
delimiter $$
drop function if exists Echo_Minis $$
create function Echo_Minis( palabra varchar(30)) returns varchar(30) 
begin
declare inicio varchar(30) default '';
    set inicio = lower(palabra);
    return inicio;
end
$$
-- --------------------------------------UNION_MAYUSCULAS-------------------------
delimiter $$
drop function if exists UNION_MAYUSCULAS $$
create function UNION_MAYUSCULAS( Nombre varchar(30),Apellidos varchar(30 )) returns varchar(30) 
begin
declare nombre_completo varchar(30) default '';
    set nombre_completo = upper(concat_ws(' ', nombre, apellidos));
    return nombre_completo;
end
$$


delimiter $$
drop function if exists UNION_MAYUSCULAS $$
create function UNION_MAYUSCULAS( Nombre varchar(30),Apellido_1 varchar(30 ),Apellido_2 varchar(30 ) ) returns varchar(30) 
begin
declare nombre_completo varchar(30) default '';
    set nombre_completo = upper(concat_ws(' ', nombre, Apellido_1,Apellido_2 ));
    return nombre_completo;
end
$$

-- ---------------------------------Union con Camel_Case------------------------------------
DELIMITER $$

drop function if exists UNION_CAMELCASE $$
create function UNION_CAMELCASE(Nombre varchar(30), Apellido1 varchar(30), Apellido2 varchar(30) ) returns varchar(60) 
BEGIN

-- Declaración de Variables:
 --                        nombre_completo es la concatenación inicial de Nombre y Apellidos.
--                         palabras es una cadena para acumular el resultado final.
--                         palabra se usa para procesar cada palabra individualmente.
--                         posicion se usa para iterar a través de cada palabra en la cadena completa.
    declare nombre_completo varchar(60) default '';
    declare palabras varchar (60) default '';
    declare palabra varchar(30) default '';
    declare posicion int default 1;
    
    SET nombre_completo = CONCAT_WS(' ', Nombre, Apellido1,Apellido2);
    SET nombre_completo = LOWER(nombre_completo); -- Convertir todo a minúsculas
    
    -- Procesar cada palabra para convertir a CamelCase
    -- El bucle REPEAT se utiliza para procesar cada palabra en la cadena. 
    -- Utiliza SUBSTRING_INDEX para extraer cada palabra.
    repeat
        set palabra = substring_index(substring_index(nombre_completo, ' ', posicion), ' ', -1);
        if palabra <> '' then
            set palabras = concat_ws(' ', palabras, concat(upper(substring(palabra, 1, 1)), lower(substring(palabra, 2))));
        end if;
        
        set posicion = posicion + 1;
		until posicion > char_length(nombre_completo) - char_length(replace(nombre_completo, ' ', '')) + 1
        
    end repeat;
    
    return trim(palabras); -- Devolver el resultado final, eliminando espacios adicionales al principio y al final

end $$
-- ----------------------------------------------------Contador_Max--------------------------------
DELIMITER $$

drop function if exists conctador_Max $$
create function contador_Max(inicial int, final int) returns varchar(100)
begin
    declare resultado varchar(100) default '';
    declare ini int default 0;
    declare fin int default 0;
    
    set ini=inicial;
    set fin=final;
    set resultado=ini;

   while ini < fin do
        set ini= ini + 1;
        set resultado = concat_ws(',', resultado, ini );
   end while;

    return trim(resultado);
end $$

DELIMITER ;

-- ----------------------Sunma y media de los numeros introducidos----------------------

DELIMITER $$

drop function if exists contador_AVG $$
create function contador_AVG(inicial int, final int) returns varchar(100)
begin
    declare resultado varchar(100) default '';
    declare ini int default 0;
    declare fin int default 0;
    declare suma int default 0;
    declare cantidad int default 0;
    
    set ini = inicial;
    set fin= final;
    set resultado = ini;
    set suma = ini;
    set cantidad = 1;
   

    While ini < fin do
        set ini = ini + 1;
        set resultado = concat(resultado,' , ', ini );
        set suma = suma + ini;
        set cantidad = cantidad + 1;
        
        
    end while;

    return concat(' Suma Numeros: ', suma,'-------', ' Media  Numeros: ',round(suma / cantidad,2));
end $$

DELIMITER ;

-- ------------------------------------------------Binarios--------------------------------------------

DELIMITER $$



drop function if exists entero_a_binario $$
create function entero_a_binario(numero int) returns varchar(100)
begin
    declare binario varchar(100) default '';
    declare resto int;
    declare cociente int;
    
    set cociente = numero;

    if cociente = 0 then
        return '0';
    end if;

    while cociente > 0 do
        set resto = cociente mod 2;
        set binario = concat(resto, binario);
        set cociente = cociente div 2;
    end while;

    return concat('El numero binario es:       ', binario);
end $$
DELIMITER ;
-- --------------------------------------------------------Romanos------------------------------------------------

DELIMITER $$

drop function if exists entero_a_romano $$
create function entero_a_romano(numero int) returns varchar(100)
begin
    declare romano varchar(100) default '';
    declare valor int;
    declare simbolo char(10);
    
    while numero > 0 do
        if numero >= 1000 then
            set valor = 1000;
            set simbolo = 'M';
        elseif numero >= 900 then
            set valor = 900;
            set simbolo = 'CM';
        elseif numero >= 500 then
            set valor = 500;
            set simbolo = 'D';
        elseif numero >= 400 then
            set valor = 400;
            set simbolo = 'CD';
        elseif numero >= 100 then
            set valor = 100;
            set simbolo = 'C';
        elseif numero >= 90 then
            set valor = 90;
            set simbolo = 'XC';
        elseif numero >= 50 then
            set valor = 50;
            set simbolo = 'L';
        elseif numero >= 40 then
            set valor = 40;
            set simbolo = 'XL';
        elseif numero >= 10 then
            set valor = 10;
            set simbolo = 'X';
        elseif numero >= 9 then
            set valor = 9;
            set simbolo = 'IX';
        elseif numero >= 5 then
            set valor = 5;
            set simbolo = 'V';
        elseif numero >= 4 then
            set valor = 4;
            set simbolo = 'IV';
        else
            set valor = 1;
            set simbolo = 'I';
        end if;

        set romano = concat(romano, simbolo);
        set numero = numero - valor;
    end while;

    return romano;
end $$

DELIMITER ;


-- 	Crear un conversor del idioma de la p de manera que sustituyamos cada vocal dela siguiente manera-------------------------------
-- a= apa; e=epe; i=ipi;  o=opo;  u=upu;

DELIMITER $$
drop function if exists codificacion $$
create function codificacion(texto varchar(100)) returns varchar(100)
begin
    declare resultado varchar(100) default '';
    declare x int default 1;
    declare cambiar char(1);

    while x <= char_length(texto) do -- Utilizamos CHAR_LENGTH(texto) para obtener la longitud de la cadena de entrada.
        set cambiar= lower(cambiar);
        set cambiar = substring(texto, x, 1); -- Recuperamos el carácter en la posición x en texto.
        
        if cambiar = 'apa' then
            set resultado = concat(resultado, 'a');
        elseif cambiar = 'epe' then
            set resultado = concat(resultado, 'e');
        elseif cambiar = 'ipi' then
            set resultado = concat(resultado, 'i');
        elseif cambiar = 'opo' then
            set resultado = concat(resultado, 'o');
        elseif cambiar = 'upu' then
            set resultado = concat(resultado, 'u');
        else
            set resultado = concat(resultado, cambiar);
        end if;
        
        set x = x + 1;
    end while;

    return resultado;
end
$$

DELIMITER ;

-- Crear un conversor del idioma de la p de manera que sustituyamos cada vocal dela siguiente manera----------
-- apa=a; epe=e; ipi=i; opo=o; upu=u---------------------------------------------------------------------------


DELIMITER $$

drop function if exists decodificacion $$
create function	 decodificacion(texto varchar(100)) returns varchar(100)
Begin
    declare resultado varchar(100) default texto; -- Inicializa resultado con texto

    -- Reemplaza cada patrón por su respectiva vocal
     set resultado = lower(resultado);
     set resultado = replace(resultado, 'apa', 'a');
     set resultado = replace(resultado, 'epe', 'e');
     set resultado = replace(resultado, 'ipi', 'i');
     set resultado = replace(resultado, 'opo', 'o');
     set resultado = replace(resultado, 'upu', 'u');

    return resultado;
end $$

DELIMITER ;

--  ------------Indica el número de de vocales que contiene una palabra----------------------------------------------------

delimiter $$

drop function if exists contar_vocales $$
create function contar_vocales(palabra varchar(100)) returns int
begin
    declare numero_vocales int default 0;
    declare x int default 1;
    declare letra char(1);

    while x <= char_length(palabra) do
        set letra = substring(palabra, x, 1);
        
        
        set letra = lower(letra);
        if letra in ('a', 'e', 'i', 'o', 'u') then
            set numero_vocales = numero_vocales + 1;
        end if;

        set x = x + 1;
    end while;

    return  concat(" El numero de vocales es:",numero_vocales);
end $$

delimiter ;

-- ----------------4.Introducida una frase y una palabra indicar si esta palabra está contenida en la frase(pista: LOCATE)------

delimiter $$

drop function if exists palabra_contenida $$
create function palabra_contenida(frase varchar(100), palabra varchar(55)) returns char(3)
begin
    declare resultado char (3);

    if locate(palabra, frase) > 0 then
        set resultado = 'SI';
    else
        set resultado = 'NO';
    end if;

    return resultado;
end $$

delimiter ;


delimiter $$
-- --------------------------otra manera de buscarlo sin el locate-----------------------
drop function if exists buscar_palabra $$
create function buscar_palabra(frase varchar(100), palabra varchar(55)) returns char(3)
begin
    declare resultado char(3);
    declare long_original int;
    declare long_modificada int;
    declare frase_modificada varchar(110);
    declare palabra_modificada varchar(60);


   -- Añadir espacios al principio y al final de la frase y la palabra
    set frase_modificada = concat(' ', frase, ' ');
    set palabra_modificada = concat(' ', palabra, ' ');
    
    -- Obtener la longitud de la frase original
    set long_original = length(frase);
    
    -- Reemplazar la palabra en la frase y obtener la longitud de la frase modificada
    set long_modificada = length(replace(frase_modificada, palabra_modificada, ''));
    
    -- Comparar las longitudes para determinar si la palabra estaba presente
    if long_modificada < long_original then
        set resultado = 'SI';
    else
        set resultado = 'NO';
    end if;

    return resultado;
end $$

-- ------------------------------------------ENTERO A ROMANO---------------------------------------------

delimiter $$

drop function if exists romano_a_entero $$
create function romano_a_entero(romano varchar(100)) returns int
begin
    declare total int default 0;
    declare valor_anterior int default 0;
    declare valor_actual int;
    declare letra char(1);
    declare numero int default length(romano);

    while numero > 0 do
        set letra = substring(romano, numero, 1);
        
        case letra
            when 'I' then set valor_actual = 1;
            when 'V' then set valor_actual = 5;
            when 'X' then set valor_actual = 10;
            when 'L' then set valor_actual = 50;
            when 'C' then set valor_actual = 100;
            when 'D' then set valor_actual = 500;
            when 'M' then set valor_actual = 1000;
            else set valor_actual = 0;
        end case;
        
        if valor_actual < valor_anterior then
            set total = total - valor_actual;
        else
            set total = total + valor_actual;
        end if;

        set valor_anterior = valor_actual;
        set numero = numero - 1;
    end while;

    return total;
end $$

delimiter ;