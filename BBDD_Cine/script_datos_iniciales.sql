# incialización de tablas
# generos
insert into generos (generos.nombre) values 
('Acción'),#1
('Aventura'),#2
('Comedia'),#3
('Drama'),#4
('Terror'),#5
('Ciencia Ficción'),#6
('Fantasía'),#7
('Romance'),#8
('Suspense'),#9
('Musical')#10
,('Western'),#11
('Animación'),#12
('Hitórico')#13
,('Bélico'),#14
('Policiaca');#15
insert into peguis (peguis.nombre, peguis.edad) values 
('Todos los público',0),#1
('Recomendada infancia',0),#2
('No recomendada menores de 7 años',7),#3
('No recomendada menores de 12 años',12),#4
('No recomendada menores de 16 años',16),#5
('No recomendada menores de 18 años',18),#6
('Pelicula X',18);#7
insert into nacionalidades (nacionalidades.gentilicio, nacionalidades.pais) values 
('Asutraliana', 'Australia'),#1
('Alemana','Alemania'),#2
('Argentina','Agentino'),#3
('Británica','Gran Bretaña'),#4
('China','China'),#5
('Estado Unidense','EEUU'),#6
('Escocesa','Escocia'),#7
 ('Española','España'),#8
 ('Francesa','Francia'),#9
 ('India','India'),#10
 ('Italiana','Italia'),#11
 ('Japonesa','Japón'),#12
('Mexicana','México'),#13
('Austrica','Austria'),#14
('Neozelandesa', 'Nueva Zelanda'),#15
('Canadiense','Canada');#16
insert into tipos (tipos.nombre) value 
('Mejor actor'),#1
('Mejor actriz'),#2
('Mejor película'),#3
('Mejor Director'),#4
('Mejor Banda Sonora'),#5
('Mejores Efecto especiales');#6

#introducir los personajes
insert into cine.personajes (cine.personajes.nombre, cine.personajes.edad, 
cine.personajes.descripcion) values
('Frodo Bolsón',53,'El portador del anillo'),#1
('Gandalf el Gris',2000,'el sabio gris'),#2
('Stephen Strange',32,'Hechicero Supremo'),#3
('Wanda Maximoff',30,'Antiheroina corrompida por Darkhold'),#4
('William Munny',58,'famoso forajido y asesino arrepentido que ahora es granjero')#5
,('Coronel Kurtz',30,'Jefe del destacamento de Vietnam'),#6
('Capitan Benjamin',25,'Matador de Charlies'),#7
('Sam Diamond',50,'Peculiar investigador tozudo')#8
,('Sidney Wang',52,'Tolpe, alogante y audaz'),#9
('Dick Charleston',66,'Elegancia y estilo británico'),#10
('Bensonmum',62,'Mayordomo ciego cumplidor'),#11
('Jack Slater',46,'El mejor policía de Los Ángeles'),#12
('Benedict',47,'Mafioso con un ojo de cristal'),#13
('Frodo Bolsón',53,'El portador del anillo'),#14
('Gandalf el Gris',2000,'el sabio gris'),#15
('Rachell Keller',25,'madre de Aidan y periodista'),#16
('Aidan Keller',8,'El primo de Katie e hijo de Rachell'),#17
('Tim Goodman',21,'Joven quien busca a su padre desaparecido, Harry Goodman'),#18
('Pikachu',42,'Un humano atrapado en el cuerpo de un Pikachu'),#19
('Little Bill Daggett',47,'alguacil local'),#20
('Neo',28,'Neo es un hacker que trabaja en una empresa de informatica'),#21
('Trinity',30,'Trinity es una programadora informática y una hacker que ha escapado de Matrix'),#22
('Morfeo',45,'Es un hacker que está al corriente de Neo y de lo que le van a hacer sus enemigos'),#23
('Torrente',45,' Detective asqueroso, mala persona, gordito,calvo y sudoroso'),#24
('Felipe Torrente',70,'padre del detective, minusválido, dependiente de su hijo'),#25
('Jyn Erso',22,'Soldado de la República'),#26
('Orson Krennic',38,'Departamento Militar Imperial de Investigación de Armas Avanzadas');#27


#introducir las personas
insert into cine.personas (cine.personas.nombre, cine.personas.apellido, 
cine.personas.fecha_nacimiento, cine.personas.id_nacionalidad)
values 
('Elijah','Wood','1981-01-28',6),#1
('Ian','Mckellen','1939-05-25',4),#2
('Peter','Jackson','1961-10-31',15),#3
('Barri M.','Osborne','1944-02-07',6),#4
('Benedict','Cumberbatch','1976-07-19 00:00:00',4),#5
('Elizabeth','Olsen','1989-02-16 00:00:00',6),#6
('Kevin','Feige','1973-06-02 00:00:00',6),#7
('Sam','Raimi','1959-10-23 00:00:00',6),#8
('Clint','Eastwood','1930-05-31 00:00:00',6),#9
('Francis Ford','Coppola','1939-04-07 00:00:00',6),#10
('Frederick','Ried Roos','1934-05-22 00:00:00',6),#11
('Marlon','Brando','1924-04-03 00:00:00',6),#12
('Charlie','Sheen','1940-08-03 00:00:00',6),#13
('John','McTiernan','1951-01-08 00:00:00',6),#14
('Arnold','Schwarzenegger','1947-07-30 00:00:00',14),#15
('Charles','Dance','1946-10-10 00:00:00',4),#16
('Peter','Falk','1927-09-16 00:00:00',6),#17
('Peter','Sellers','1925-09-08 00:00:00',4),#18
('David','Niven','1910-03-01 00:00:00',4),#19
('Alec','Guinness','1914-04-02 00:00:00',4),#20
('Ray','Stark','1915-10-03 00:00:00',6),#21
('Robert','Moore','1927-02-01 00:00:00',6),#22
('Rob','Letterman','1970-10-31 00:00:00',6),#23
('Justice','Smith','1995-08-09 00:00:00',6),#24
('Ryan','Reynolds','1976-10-23 00:00:00',6),#25
('Mary','Parent','1968-03-23 00:00:00',6),#26
('Gene','Hackman','1930-01-30 00:00:00',6),#27
('Naomi','Watts','1968-09-28 00:00:00',4),#28
('David','Dorfman','1993-02-07 00:00:00',6),#29
('Gore','Verbinski','1964-03-16 00:00:00',6),#30
('Laurie','McDonald','1953-12-17 00:00:00',6),#31
('Elijah','Wood','1981-01-28 00:00:00',6),#32
('Ian','Mckellen','1939-05-25 00:00:00',4),#33
('Peter','Jackson','1961-10-31 00:00:00',15),#34
('Barri M.','Osborne','1944-02-07 00:00:00',6),#35
('Steven ','Spielberg','1946-12-18 00:00:00',6),#36
('Lilly','Wachowski','1967-12-29 00:00:00',6),#37
('Keanu','Reeves','1964-09-02 00:00:00',16),#38
('Laurence','Fishburne','1961-07-30 00:00:00',6),#39
('Carrie-Anne','Moss','1967-08-21 00:00:00',16),#40
('Santiago','Segura','1965-07-17 00:00:00',8),#41
('Toni','Leblanc','1922-05-07 00:00:00',8),#42
('Andrés Vicente','Gómez','1943-09-16 00:00:00',8),#43
('Felicity Rose','Hadley Jones','1983-09-17',4),#44
('Ben','Mendelsohn','1969-04-03',1),#45
('Kathleen','Kennedy','1953-06-05',6),#46
('Gareth','Edwards','1975-01-05',4);#47


# inserto en actores
insert into cine.actores (cine.actores.salario, cine.actores.id_persona)
values (7.5,5)#id cumberbatch, id 1
,(2,6),#id elisabeth olsen, id 2
(2,9),#id clean eastwood id 3
(19,12),#id marlon brando id 4
(15,15),#id arnold id 5
(2,16),#id charles id 6
(100,17),#id peter falk id 7
(100,18),#id peter seller id 8
(100,19),#id david nieven id 9
(100,20),#id alex guiness id 10
(6.9,13),#id charlie seen id 11
(1.9,27),#id gene hackman id 12
(1.3,24),#id justice smith id 13
(114,25),#id rayan reinaolds id 14
(35,32), #id Elijah wood id 15
(50.5,33), #id  Ian Makellenid 16
(270,28), #id  Naomi Watts id17
(250,29), #id  David Dorfman id18
(15,38), #id  Keannu Reaves id19
(12,39), #id  Laurence fishborne id20
(14,40), #id  Carrie-Anne Moss id21
(3.2,41), #Santiago Segura id22
(1.8,42) #Tony Leblanc id23
;

# inserto productores
insert into cine.productores (cine.productores.inversion, 
cine.productores.id_persona)
values (350.6,7),#id kevin feige id1
 (14.4,3),#id Clean Eastwood id2
 (1450,8),#id Sam raimi id3
 (85,14),#id Jhon MacTiernan id4
 (3,21),#id Ray Stark id5
  (45000,26),#id Mary parent id6
  (3000,4),#id Barry M Osborne id7
  (48,31),#id Laurie McDonald id8
  (110,36),#id Steven Spierlberg id9
  (100,37),#id Lilly Watchowski id10
  (2600,43)#id Adrés Vicente Gómez id11
;



# inserto en directores
insert into cine.directores (cine.directores.alma_mater, cine.directores.id_persona)
values ('Michigan State University',14),#id SAm raimi id1 
('Los Angeles City College',3),#id Clint eastwood id2
('Universidad Hofstra',10),#id Francis For Copola id3
 ('Julliard & New York University',14),#id Jhon MacTiernan id4
 ('Catholic Univty America Drama',22),#id Robert Moore id5
 ('Universidad Sur de California',23),#id Rob Letterman id6
 ('Universidad UCLA',30),#id Gore Vernbinski id7
 ('Kāpiti College',3),#id Peter Jakson id8
 ('California State University',36),#id Steven Spierlberg id9
 (' Emerson College',37)#Lilly Watchowski id10
;

# inserto en peliculas
insert into peliculas (cine.peliculas.titulo,cine.peliculas.fecha,
cine.peliculas.duracion, cine.peliculas.id_director,
cine.peliculas.id_productor, cine.peliculas.id_pegui)
values
('Doctor Strange 2','2022-05-06 00:00:00',126,1,1,4),#id1
('Sin Perdón','1992-08-07 00:00:00',127,2,2,6),#id2
('Apocalypse Now','1979-08-15 00:00:00',196,3,3,6),#id3
('El último gran héroe','1993-06-18 00:00:00',130,4,4,4),#id4
('Un cadáver a los postres','1976-06-23 00:00:00',94,5,5,1),#id5
('Pokémon: Detective Pikachu','2019-05-10 00:00:00',104,6,6,3),#id6
('The Ring','2002-10-18 00:00:00',115,7,7,4),#id7
('Las dos torres','2002-12-18 00:00:00',172,8,8,5),#id8
('La delgada línea roja','1998-02-25 00:00:00',170,9,9,6),#id9
('Matrix','1999-06-23 20:00:00',131,10,10,4)#id10
;

# insertar en peliculas generos
 insert into cine.peliculas_generos (cine.peliculas_generos.id_pelicula,
 cine.peliculas_generos.id_genero) values
 (1,1),(1,6),(1,7),(2,11),(3,1),(3,12),(3,14),(4,1),(4,3),(5,3),(6,1),(6,2),(6,7),(7,5),(7,6),(7,9),
 (8,2),(8,7),(9,14),(10,1),(10,6);
 
 # insertar sobre peliculas actores
 insert into cine.personajes_peliculas (cine.personajes_peliculas.id_pelicula,
 cine.personajes_peliculas.id_actor, cine.personajes_peliculas.id_personaje)
 values
 (2,1,7),
 (2,2,4),
 (1,4,6),
 (1,5,3),
 (3,4,6),
 (3,11,11),
 (4,5,12),
 (4,6,13),
 (5,7,8),
 (5,8,9),
 (5,9,10),
 (5,10,11),
 (6,13,18),
 (6,14,19),
 (8,15,14),
 (8,16,15),
 (10,19,21),
 (10,20,23),
 (10,21,22);
 
 # isercción en premio
 insert into cine.premios (cine.premios.nombre, cine.premios.fecha,
 cine.premios.id_pelicula, cine.premios.id_tipo)
 values 
 ('HMMA','2022-11-16 00:00:00',1,5),
 ('HPA Awards','2022-11-17 00:00:00',1,6),
 ('Óscar','1993-03-29 00:00:00',2,3),
 ('Óscar','1993-03-29 00:00:00',2,4),
 ('Óscar','1979-02-18 00:00:00',3,5),
 ('Óscar','1979-02-18 00:00:00',3,4),
 ('Óscar','1979-02-18 00:00:00',3,1),
 ('Óscar','2003-02-02 00:00:00',8,5),
 ('Óscar','2003-02-02 00:00:00',8,6),
 ('Óscar','2000-03-25 21:30:00',10,5),
 ('Óscar','2000-03-25 22:30:00',10,3),
 ('(PGA)','2000-03-02 22:30:00',10,6);
 
 

