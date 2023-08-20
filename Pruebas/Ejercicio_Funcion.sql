set global log_bin_trust_function_creators = 1;
Delimiter $$
    drop function if exists  insertarCodigos$$
    create function insertarCodigos (cod varchar(5)) returns int
                    begin 
                        set @retorno=0;
                        insert into codigo_postales (codigo_postal) values (cod);
                        select count(*) 
                        into @retorno 
                        from codigo_postales where codigo_postal=cod;
                        return @retorno;
                     end
                    $$
                    
                    
select insertarCodigos('33333'); 