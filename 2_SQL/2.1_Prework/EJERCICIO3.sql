/*Nivel de dificultad: Dificil*/


/*1. Crea una tabla llamada "Productos" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "precio" (numérico).*/
-- Se Crea una tabla "Clientes" y se añaden datos para realizar la consulta final

CREATE TABLE "Clientes" (
    "clientes_id" SERIAL PRIMARY KEY,
    "nombre" VARCHAR(255) NOT NULL
);

INSERT INTO "Clientes" ("nombre")
VALUES
    ('Juan'),
    ('Aroa'),
    ('Pepe');


CREATE TABLE "Productos" (
    "producto_id" SERIAL NOT NULL,
    "nombre" VARCHAR(255) NOT NULL,
    "precio" NUMERIC NOT NULL,
    "cliente_id" INT NOT NULL,
    CONSTRAINT "pK_productos" PRIMARY KEY ("producto_id"),
    CONSTRAINT "fk_clientes_productos" FOREIGN KEY ("cliente_id") REFERENCES "Clientes"("clientes_id")
);
 

/*2. Inserta al menos cinco registros en la tabla "Productos".*/

INSERT INTO "Productos" ("nombre", "precio", "cliente_id")
VALUES
    ('Cámara', 250, 1),
    ('Móvil', 850, 2),
    ('Cascos', 120, 1),
    ('iPad', 750, 2),
    ('Tablet', 470, 1);


/*3. Actualiza el precio de un producto en la tabla "Productos".*/
UPDATE "Productos"
SET "precio" = 270
WHERE "producto_id" = 1;


/*4. Elimina un producto de la tabla "Productos".*/
DELETE FROM "Productos"
WHERE "producto_id" = 1;


/*5. Realiza una consulta que muestre los nombres de los usuarios junto con los nombres de los productos que han comprado (utiliza un INNER JOIN con la tabla "Productos").*/


SELECT
    c."nombre" AS "cliente",
    p."nombre" AS "producto"
FROM "Clientes" AS c
INNER JOIN "Productos" AS p
    ON p."cliente_id" = c."clientes_id"
ORDER BY c."nombre";

