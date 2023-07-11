


DELIMITER //
DROP Function IF EXISTS saluda//
CREATE FUnction saluda_1(nombre CHAR(50)) RETURNS VARCHAR(100)
deterministic
BEGIN
	declare saludo CHAR (50);
    set saludo = CONCAT('Hola ', nombre, ', ¿qué tal estás?');
    RETURN saludo;
END
//


