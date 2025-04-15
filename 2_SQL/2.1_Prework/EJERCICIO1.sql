/*Nivel de dificultad: Fácil*/

/*1. Crear una tabla llamada "Clientes" con las columnas: id (entero, clave primaria), nombre (texto) y email (texto).*/
CREATE TABLE "Clientes" (
    "id" SERIAL PRIMARY KEY,
    "nombre" VARCHAR(255) NOT NULL,
    "email" VARCHAR(255)
);


/*2. Insertar un nuevo cliente en la tabla "Clientes" con id=1, nombre="Juan" y email="juan@example.com".*/
INSERT INTO "Clientes" ("nombre", "email")
VALUES ('Juan', 'juan@example.com');



/*3. Actualizar el email del cliente con id=1 a "juan@gmail.com".*/
UPDATE "Clientes"
SET "email" = 'juan@gmail.com'
WHERE "id" = 1;



/*4. Eliminar el cliente con id=1 de la tabla "Clientes".*/
DELETE FROM "Clientes"
WHERE "id" = 1;

/*5. Crear una tabla llamada "Pedidos" con las columnas: id (entero, clave primaria), cliente_id (entero, clave externa referenciando a la tabla "Clientes"), producto (texto) y cantidad (entero).*/
CREATE TABLE "Pedidos" (
    "id" SERIAL PRIMARY KEY,
    "cliente_id" INT NOT NULL,
    "producto" VARCHAR(255),
    "cantidad" INT,
    CONSTRAINT "fk_cliente_id" FOREIGN KEY ("cliente_id") REFERENCES "Clientes" ("id")
);


/*6. Insertar un nuevo pedido en la tabla "Pedidos" con id=1, cliente_id=1, producto="Camiseta" y cantidad=2.*/
INSERT INTO "Pedidos" ("cliente_id", "producto", "cantidad")
VALUES (1, 'Camiseta', 2); 

/*7. Actualizar la cantidad del pedido con id=1 a 3.*/
UPDATE "Pedidos"
SET "cantidad" = 3
WHERE "id" = 3;

/*8. Eliminar el pedido con id=1 de la tabla "Pedidos".*/
DELETE FROM "Pedidos"
WHERE "id" = 3;


/*9. Crear una tabla llamada "Productos" con las columnas: id (entero, clave primaria), nombre (texto) y precio (decimal).*/
CREATE TABLE "Productos" (
    "id" SERIAL PRIMARY KEY,
    "nombre" VARCHAR(255),
    "precio" DECIMAL
);

/*10. Insertar varios productos en la tabla "Productos" con diferentes valores.*/
INSERT INTO "Productos" ("nombre", "precio")
VALUES 
    ('Camiseta', 25.90),
    ('Blusa',22.35),
    ('Vaquero',30.99),
    ('Chaqueta',55.00),
    ('Calcetines',12.00)
;

/*11. Consultar todos los clientes de la tabla "Clientes".*/
SELECT "nombre"
FROM "Clientes" AS c;

/*12. Consultar todos los pedidos de la tabla "Pedidos" junto con los nombres de los clientes correspondientes.*/
--Se introducen más clientes y pedidos para visualizar mejor la consulta--
INSERT INTO "Clientes" ("nombre", "email")
VALUES 
    ('Pepe','pepe@gmail.com'), 
    ('Laura','laura@gmail.com'),
    ('Lola','lola@gmail.com')
    ;

INSERT INTO "Pedidos" ("cliente_id", "producto", "cantidad")
VALUES 
    (2,'Camiseta',2), 
    (2,'Calcetines',1),
    (4,'BLusa',5),
    (3,'Vaquero',1),
    (3,'Chaqueta',2);

SELECT c."nombre", 
       p."producto" AS "pedidos"
FROM "Clientes" AS c
INNER JOIN "Pedidos" AS p 
ON c."id" = p."cliente_id";

/*Otra forma: de insertar datos*/
/* Insertar pedidos utilizando subqueries para obtener el ID correcto del cliente */
INSERT INTO "Pedidos" ("cliente_id", "producto", "cantidad")
VALUES 
    ((SELECT "id" FROM "Clientes" WHERE "nombre" = 'Pepe' LIMIT 1), 'Vaquero', 1),
    ((SELECT "id" FROM "Clientes" WHERE "nombre" = 'Laura' LIMIT 1), 'BLusa', 2);

/* Consulta para obtener el nombre del cliente, el producto y la cantidad del pedido */
SELECT c."nombre", 
       p."producto" AS "pedido", 
       p."cantidad"
FROM "Clientes" AS c
INNER JOIN "Pedidos" AS p 
    ON c."id" = p."cliente_id";


/*13. Consultar los productos de la tabla "Productos" cuyo precio sea mayor a $50.*/
SELECT *
FROM "Productos"
WHERE "precio" >= 50;

/*14. Consultar los pedidos de la tabla "Pedidos" que tengan una cantidad mayor o igual a 5.*/
SELECT *
FROM "Pedidos" AS p 
WHERE "cantidad" >= 5;

/*15. Consultar los clientes de la tabla "Clientes" cuyo nombre empiece con la letra "A".*/
SELECT "nombre" AS "cliente"
FROM "Clientes"
WHERE "nombre" LIKE 'A%';


/*16. Realizar una consulta que muestre el nombre del cliente y el total de pedidos realizados por cada cliente.*/   
SELECT c."nombre" AS "cliente", 
       COUNT(p."id") AS "total_pedidos"
FROM "Clientes" AS c
LEFT JOIN "Pedidos" AS p
ON c."id" = p."cliente_id"
GROUP BY c."nombre";


/*17. Realizar una consulta que muestre el nombre del producto y la cantidad total de pedidos de ese producto.*/


SELECT pr."nombre" AS "producto", 
       COUNT(p."producto") AS "total_pedidos"
FROM "Productos" AS pr
LEFT JOIN "Pedidos" AS p 
ON p."producto" = pr."nombre"
GROUP BY pr."nombre";

/*18. Agregar una columna llamada "fecha" a la tabla "Pedidos" de tipo fecha.*/
ALTER TABLE "Pedidos"
ADD COLUMN "fecha" DATE;

/*Añadir datos de fecha*/
UPDATE "Pedidos" 
SET "fecha" = '2025-02-23'
WHERE "cliente_id" = 2;

UPDATE "Pedidos" 
SET "fecha" = '2025-01-10'
WHERE "cliente_id" = 3;

UPDATE "Pedidos" 
SET "fecha" = '2025-01-06'
WHERE "cliente_id" = 4;


/*19. Agregar una clave externa a la tabla "Pedidos" que haga referencia a la tabla "Productos" en la columna "producto".*/
ALTER TABLE "Pedidos"
ADD COLUMN "producto_id" INT;--Creamos una nueva columna en la tabla pedidos, para almacenar el Id del producto

UPDATE "Pedidos" AS p
SET "producto_id" = (
    SELECT pr."id" 
    FROM "Productos" AS pr
    WHERE pr."nombre" = p."producto" -- el producto_id se selecciona en la columna id de la tabla productos, donde la columna nombre de producto es igual a la columna prodcuto de pedidos.
);

ALTER TABLE "Pedidos"
ADD CONSTRAINT "fk_producto_id"--la restricción hace que la columna producto_id solo contenga valores qeu tiene la columna id de la tabla productos
FOREIGN KEY ("producto_id") REFERENCES "Productos" ("id"); --la clave foranea está en la columna producto_id que hace referencia a la columna id de productos.


/*20. Realizar una consulta que muestre los nombres de los clientes, los nombres de los productos y las cantidades de los pedidos donde coincida la clave externa.*/


SELECT c."nombre" AS "cliente", 
       pr."nombre" AS "producto",
       COUNT(p."producto") AS "total_pedidos"
FROM "Pedidos" AS p
LEFT JOIN "Clientes" AS c
    ON c."id" = p."cliente_id"
LEFT JOIN "Productos" AS pr 
    ON pr."id" = p."producto_id"
GROUP BY c."nombre", pr."nombre";

--Cantidad total pedida de un producto por cliente.

SELECT c."nombre" AS "cliente", 
       pr."nombre" AS "producto",
       SUM(p."cantidad") AS "cantidad_total_producto"
FROM "Pedidos" AS p
LEFT JOIN "Clientes" AS c
    ON c."id" = p."cliente_id"
LEFT JOIN "Productos" AS pr 
    ON pr."id" = p."producto_id"
GROUP BY c."nombre", pr."nombre"
ORDER BY c."nombre";


