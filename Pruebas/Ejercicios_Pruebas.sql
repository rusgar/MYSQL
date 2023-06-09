# Listar los nombres de los usuarios
SELECT nombre 
FROM clientes;

# Calcular el saldo máximo de los usuarios de sexo "Mujer"
SELECT MAX(saldo) 
FROM clientes 
WHERE sexo = 'M';

#Listar nombre y teléfono de los usuarios con teléfono NOKIA, BLACKBERRY o SONY
SELECT nombre, telefono 
FROM clientes 
WHERE marca IN('NOKIA', 'BLACKBERRY', 'SONY');

#Contar los usuarios sin saldo o inactivos
SELECT COUNT(*) 
FROM clientes 
WHERE NOT activo OR saldo <= 0;

#Listar el login de los usuarios con nivel 1, 2 o 3
SELECT usuario 
FROM clientes 
WHERE nivel IN(1, 2, 3);

#Listar los números de teléfono con saldo menor o igual a 300
SELECT telefono 
FROM clientes 
WHERE saldo <= 300;

#Calcular la suma de los saldos de los usuarios de la compañia telefónica NEXTEL
SELECT SUM(saldo) 
FROM clientes 
WHERE compañia = 'NEXTEL';

#Contar el número de usuarios por compañía telefónica
SELECT compañia, COUNT(*) 
FROM clientes 
GROUP BY compañia;

#Contar el número de usuarios por nivel
SELECT nivel, COUNT(*) 
FROM clientes 
GROUP BY nivel;

#Listar el login de los usuarios con nivel 2
SELECT usuario 
FROM clientes 
WHERE nivel = 2;

#Mostrar el email de los usuarios que usan gmail
SELECT email 
FROM clientes 
WHERE email LIKE '%gmail.com';

#Listar nombre y teléfono de los usuarios con teléfono LG, SAMSUNG o MOTOROLA
SELECT nombre, telefono 
FROM clientes 
WHERE marca IN('LG', 'SAMSUNG', 'MOTOROLA');