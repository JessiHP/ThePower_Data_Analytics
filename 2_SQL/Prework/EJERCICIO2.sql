/*Nivel de dificultad: Fácil
 
1. Crea una base de datos llamada "MiBaseDeDatos".*/
CREATE DATABASE MiBaseDeDatos

/*2. Crea una tabla llamada "Usuarios" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "edad" (entero).*/
CREATE TABLE usuarios (
	id SERIAL PRIMARY KEY,
	nombre VARCHAR (255) NOT NULL,
	edad INT 
);

/*3. Inserta dos registros en la tabla "Usuarios".*/
INSERT INTO usuarios (nombre, edad)
VALUES 
	('Juan',32),
	('Pedro',40);
	
	
/*4. Actualiza la edad de un usuario en la tabla "Usuarios".*/
UPDATE usuarios
SET edad = 34
WHERE id = 1 ;

/*5. Elimina un usuario de la tabla "Usuarios".*/
DELETE FROM usuarios
WHERE id = 2;

/*Nivel de dificultad: Moderado

1. Crea una tabla llamada "Ciudades" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "pais" (texto).*/
CREATE TABLE ciudades (
	id SERIAL PRIMARY KEY,
	nombre VARCHAR (255),
	pais VARCHAR (255)
) ;

/*2. Inserta al menos tres registros en la tabla "Ciudades".*/
INSERT INTO ciudades (nombre, pais)
VALUES 
	('Barcelona','España'),
	('Florencia','Italia'),
	('Vigo','España');
	
/*3. Crea una foreign key en la tabla "Usuarios" que se relacione con la columna "id" de la tabla "Ciudades".*/
ALTER TABLE usuarios
ADD ciudad_id INT,
ADD CONSTRAINT fk_ciudad_id 
FOREIGN KEY (ciudad_id) REFERENCES ciudades (id);


/*4. Realiza una consulta que muestre los nombres de los usuarios junto con el nombre de su ciudad y país (utiliza un LEFT JOIN).*/
SELECT u.nombre, c.nombre, c.pais
FROM usuarios AS u
LEFT JOIN ciudades AS c
ON u.ciudad_id = c.id;


/*5. Realiza una consulta que muestre solo los usuarios que tienen una ciudad asociada (utiliza un INNER JOIN).*/
SELECT u.nombre
FROM usuarios AS u
INNER JOIN ciudades AS c
ON u.ciudad_id = c.id;

---actualizamos la tabla usuarios, para tener una relación de usuario-ciudad y así poder visualizar las consultas 4 y 5.
UPDATE usuarios
SET "ciudad_id" = 1
WHERE id = 1;
