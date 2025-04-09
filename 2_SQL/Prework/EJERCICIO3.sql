/*Nivel de dificultad: Dificil*/

/*1. Crea una tabla llamada "Productos" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "precio" (numérico).*/
/*2. Inserta al menos cinco registros en la tabla "Productos".*/
/*3. Actualiza el precio de un producto en la tabla "Productos".*/
/*4. Elimina un producto de la tabla "Productos".*/
/*5. Realiza una consulta que muestre los nombres de los usuarios junto con los nombres de los productos que han comprado (utiliza un INNER JOIN con la tabla "Productos").*/

CREATE TABLE "productos" 
(
        "productosId" SERIAL NOT NULL,
        "nombre" VARCHAR (255) NOT NULL,
        "precio" INT NOT NULL,
        "clientesId" INT NOT NULL,
          CONSTRAINT "PK_productos" PRIMARY KEY  ("productosId")
);

CREATE TABLE "clientes"
(
    "clientesId" INT NOT NULL,
    "nombre" VARCHAR (255) NOT NULL,
    CONSTRAINT "PK_clientes" PRIMARY KEY  ("clientesId")
);
 
ALTER TABLE "productos" 
ADD CONSTRAINT "FK_clientesproductosId"
FOREIGN KEY ("clientesId") REFERENCES "clientes" ("clientesId");

INSERT INTO "clientes" ("nombre","clientesId")
VALUES ('Juan',1),
        ('Aroa',2),
        ('Pepe',3);

INSERT INTO "productos" ("nombre","precio","clientesId")
VALUES ('camara',250,1),
        ('movil',850,2),
        ('cascos',120,1),
        ('ipad',750,2),
        ('tablet',470,1);

UPDATE productos
SET precio = 270
WHERE "productosId" = 1;

DELETE FROM productos
WHERE "productosId" = 1;


SELECT c.nombre AS "cliente", 
        p.nombre AS "productos"
FROM clientes AS c
INNER JOIN "productos" AS p
ON p."clientesId" = c."clientesId" 
ORDER BY c.nombre;



------Otra forma-----
CREATE TABLE productos
(
        productosId SERIAL PRIMARY KEY,
        nombre VARCHAR (255) NOT NULL,
        precio INT NOT NULL
);

CREATE TABLE clientes
(
    clientesId SERIAL PRIMARY KEY,
    nombre VARCHAR (255) NOT NULL
);
 
ALTER TABLE productos 
ADD clientesId INT,
ADD CONSTRAINT FK_clientesproductosId
FOREIGN KEY (clientesId) REFERENCES clientes (clientesId);


ALTER TABLE productos 
ALTER COLUMN clientesId SET NOT NULL

INSERT INTO clientes (nombre)
VALUES ('Juan'),
        ('Aroa'),
        ('Pepe');

INSERT INTO productos (nombre,precio,clientesId)
VALUES ('camara',250,1),
        ('movil',850,2),
        ('cascos',120,1),
        ('ipad',750,2),
        ('tablet',470,1);

UPDATE productos
SET precio = 270
WHERE productosId = 1;

DELETE FROM productos
WHERE productosId = 1;

SELECT c.nombre AS "cliente", 
        p.nombre AS "productos"
FROM clientes AS c
INNER JOIN productos AS p
ON p.clientesId = c.clientesId 
ORDER BY c.nombre;