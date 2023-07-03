-- Ejercicio: Ahora, la entidad SUPERMERCADO ha abierto una tienda en el Reino Unido.
-- El cliente ha decidido crear una tabla más llamda TIENDA
-- en la que almacenemos el ID_TIENDA de la tienda (si es la 
-- tienda primigenia, el ID_TIENDA será 1, y si es la de Reino unido, será 2).
-- Tendrá también un campo llamado NOMBRE. Una de las tiendas se llamará 'Gijón'
-- y otra 'London'. También tendrá un campo llamado ID_PAIS, INT(3), que de momento solo tendrá
-- los países 'España' (1) y 'United Kingdom (2). Además, con vistas a
-- futuras aperturas, ha pedido que el ID_TIENDA sea INT(4), para poder vincular hasta 9999 tiendas
-- distintas con el mismo campo.



USE SUPERMERCADO_1;

DROP database IF exists PAIS;
CREATE TABLE PAIS (
	ID_PAIS INT(3) PRIMARY KEY AUTO_INCREMENT,
    NOMBRE CHAR(50) NOT NULL,
    MONEDA CHAR(5)NOT NULL   
    );
    
DROP database IF exists TIENDA;
CREATE TABLE TIENDA (
	ID_TIENDA INT(4) PRIMARY KEY AUTO_INCREMENT,
    NOMBRE CHAR(50) NOT NULL,
    ID_PAIS INT,
    FOREIGN KEY (ID_PAIS) REFERENCES PAIS(ID_PAIS)
    );
    
DROP database IF exists STOCK;    
CREATE TABLE STOCK (
	ID_PRODUCTO INT ,
    ID_TIENDA INT ,
    STOCK INT,
    FOREIGN KEY (ID_TIENDA) REFERENCES TIENDA (ID_TIENDA),
    FOREIGN KEY (ID_PRODUCTO) REFERENCES PRODUCTO (ID_PRODUCTO)
    );
    
 -- INTRODUCIMOS LOS DATOS A LAS TABLAS    
    
      INSERT INTO PAIS VALUES (DEFAULT, 'España', 'EUR' );
      INSERT INTO PAIS VALUES (DEFAULT, 'United Kingdom', 'GBP' );
      INSERT INTO TIENDA VALUES (DEFAULT, 'Gijon','1' );
      INSERT INTO TIENDA VALUES (DEFAULT, 'London','2' );
      
      -- CREACION DE PRIMARY KEY DE LA TABLA STOCK Y PARA QUE EN EL PROCEDIMEINTO NO SE PUEDAN METER REGISTROS DUPLICADOS
      
      
         ALTER TABLE STOCK ADD CONSTRAINT PRIMARY KEY(ID_PRODUCTO, ID_TIENDA); 
      
      -- MODIFICAMOS LA COLUMNA STOCK DE LA TABLA PRODUCTO, NO LA NECESITAMOS

        ALTER TABLE PRODUCTO DROP STOCK;
      
      -- Por otro lado, nuestro cliente quiere vender online, por lo que, además de las tiendas de Reino Unido
      -- y España, habrá una tienda llamada 'Online' con el ID_TIENDA = 3.
      
SELECT * FROM supermercado_1.tienda;
INSERT INTO PAIS VALUES(3,'Online', 'USD');
insert into tienda values(default, 'Online', 3);

-- Creamos la tabla envio
      
   DROP database IF exists ENVIO;    
  CREATE TABLE ENVIO (
  ID_ENVIO INT  AUTO_INCREMENT,
  ID_VENTA INT ,
  HORAFECHA_P TIMESTAMP,
  HORAFECHA_E TIMESTAMP,
  DIR_ENVIO CHAR,
  NOTAS VARCHAR(500),
  TIPO_ENVIO CHAR(50),
  GASTOS_ENVIO FLOAT(12),
  ESTADO CHAR(1) DEFAULT 'P',
  PRIMARY KEY (ID_ENVIO) ,
  FOREIGN KEY (ID_VENTA)  REFERENCES VENTA(ID_VENTA)
  );    