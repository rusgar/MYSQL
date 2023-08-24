use neptuno;
DELIMITER //
DROP Function IF EXISTS CargoTotalCliente//
CREATE FUnction CargoTotalCliente(NombreContacto varchar(30)) RETURNS decimal(10,2) 
deterministic
BEGIN
     declare total decimal (10,2);
    
	SELECT   sum( ped.Cargo) into total
    FROM clientes cli inner join pedidos ped on cli.IdCliente= ped.IdCliente
    where cli.NombreContacto = NombreContacto;
    
    return total ;
    
END
//
select neptuno.CargoTotalCliente('Ana Trujillo');