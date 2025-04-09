/*Nivel de dificultad: Fácil
 
1. Crea una base de datos llamada "MiBaseDeDatos".*/
CREATE DATABASE "MiBaseDeDatos";

/*2. Crea una tabla llamada "Usuarios" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "edad" (entero).*/
CREATE TABLE "Usuarios" (
    "id" SERIAL PRIMARY KEY,
    "nombre" VARCHAR(255) NOT NULL,
    "edad" INT
);
/*3. Inserta dos registros en la tabla "Usuarios".*/
INSERT INTO "Usuarios" ("nombre", "edad")
VALUES 
    ('Juan', 32),
    ('Pedro', 40);
	
/*4. Actualiza la edad de un usuario en la tabla "Usuarios".*/
UPDATE "Usuarios"
SET "edad" = 34
WHERE "id" = 1;

/*5. Elimina un usuario de la tabla "Usuarios".*/
DELETE FROM "Usuarios"
WHERE "id" = 2;

/*Nivel de dificultad: Moderado

1. Crea una tabla llamada "Ciudades" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "pais" (texto).*/
CREATE TABLE "Ciudades" (
    "id" SERIAL PRIMARY KEY,
    "nombre" VARCHAR(255),
    "pais" VARCHAR(255)
);

/*2. Inserta al menos tres registros en la tabla "Ciudades".*/
INSERT INTO "Ciudades" ("nombre", "pais")
VALUES 
    ('Barcelona', 'España'),
    ('Florencia', 'Italia'),
    ('Vigo', 'España');
	
/*3. Crea una foreign key en la tabla "Usuarios" que se relacione con la columna "id" de la tabla "Ciudades".*/
ALTER TABLE "Usuarios"
ADD COLUMN "ciudad_id" INT,
ADD CONSTRAINT "fk_ciudad_id"
FOREIGN KEY ("ciudad_id") REFERENCES "Ciudades"("id");


/*4. Realiza una consulta que muestre los nombres de los usuarios junto con el nombre de su ciudad y país (utiliza un LEFT JOIN).*/
SELECT 
    u."nombre" AS "usuario",
    c."nombre" AS "ciudad",
    c."pais"
FROM "Usuarios" AS u
LEFT JOIN "Ciudades" AS c
ON u."ciudad_id" = c."id";

/*5. Realiza una consulta que muestre solo los usuarios que tienen una ciudad asociada (utiliza un INNER JOIN).*/
SELECT 
    u."nombre"
FROM "Usuarios" AS u
INNER JOIN "Ciudades" AS c
ON u."ciudad_id" = c."id";

---actualizamos la tabla usuarios, para tener una relación de usuario-ciudad y así poder visualizar las consultas 4 y 5.
UPDATE "Usuarios"
SET "ciudad_id" = 1
WHERE "id" = 1;