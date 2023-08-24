create database on_cascade;
use on_cascade;
/*
Ejemplo de ON DELETE CASCADE
*/

/*
Creamos y rellenamos las tablas
*/

CREATE TABLE category (
    id INT,
    category_name VARCHAR(50),
    CONSTRAINT pk_category PRIMARY KEY (id)
);

CREATE TABLE product (
    id INT,
    category_id INT,
    product_name VARCHAR(50),
    CONSTRAINT pk_product PRIMARY KEY (id),
    CONSTRAINT fk_prod_category
      FOREIGN KEY (category_id) REFERENCES category(id)
);

INSERT INTO category (id, category_name) VALUES
(1, 'Electronics'),
(2, 'Furniture');

INSERT INTO product (id, category_id, product_name) VALUES
(1, 2, 'Desk Chair'),
(2, 2, 'Couch'),
(3, 1, 'TV'),
(4, 1, 'Coffee Machine');

/*
Borramos la fila del 
*/

DELETE FROM category WHERE id = 1;

/*
Veremos un error con código: 1451.*/

/*
Ahora, las borramos y las creamos con ON DELETE CASCADE
*/

DROP TABLE product;
DROP TABLE category;

CREATE TABLE category (
    id INT,
    category_name VARCHAR(50),
    CONSTRAINT pk_category PRIMARY KEY (id)
);

CREATE TABLE product (
    id INT,
    category_id INT,
    product_name VARCHAR(50),
    CONSTRAINT pk_product PRIMARY KEY (id),
    CONSTRAINT fk_prod_category 
      FOREIGN KEY (category_id) REFERENCES category(id)
      ON DELETE CASCADE
);

INSERT INTO category (id, category_name) VALUES
(1, 'Electronics'),
(2, 'Furniture');

INSERT INTO product (id, category_id, product_name) VALUES
(1, 2, 'Desk Chair'),
(2, 2, 'Couch'),
(3, 1, 'TV'),
(4, 1, 'Coffee Machine');


/*
Borramos el registro en la tabla padre
*/

DELETE FROM category WHERE id = 1;

/*
Consultamos las tablas...
*/

SELECT id, category_name
FROM category;

SELECT id, category_id, product_name
FROM product;