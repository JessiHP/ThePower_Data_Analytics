/*EJERCICIO 5
 * 
1. Crea una tabla llamada "Clientes" con las columnas id (entero) y nombre (cadena de texto).*/
CREATE TABLE "Clientes" (
    "id" INT,
    "nombre" VARCHAR (255) NOT NULL
);

/*2.Inserta un cliente con id=1 y nombre='John' en la tabla "Clientes".*/
INSERT INTO "Clientes" ("id","nombre")
VALUES (1,'John');

/*3. Actualiza el nombre del cliente con id=1 a 'John Doe' en la tabla "Clientes"*/
UPDATE "Clientes" 
SET "nombre" = 'John Doe'
WHERE "id" = 1;

/*4. Elimina el cliente con id=1 de la tabla "Clientes"*/
DELETE FROM "Clientes" 
WHERE "id" = 1;

/*5. Lee todos los clientes de la tabla "Clientes"*/
 SELECT *
 FROM "Clientes";
 
 
/*6. Crea una tabla llamada "Pedidos" con las columnas id (entero) y cliente_id(entero).*/
ALTER TABLE "Clientes" 
ADD CONSTRAINT "PK_clientes" PRIMARY KEY  ("id") --Convertimos el ID de clientes en PK, para poder usar el cliente_id como FK
;
 
CREATE TABLE "Pedidos" (
    "id" INT,
    "cliente_id" INT NOT NULL,
    CONSTRAINT "fk_cliente_id" FOREIGN KEY ("cliente_id") REFERENCES "Clientes" ("id")); 

/*7. Inserta un pedido con id=1 y cliente_id=1 en la tabla "Pedidos".*/

INSERT INTO "Clientes" ("id","nombre")
VALUES (1,'John');

INSERT INTO "Pedidos" (id,cliente_id)
VALUES (1,1)
;

/*8. Actualiza el cliente_id del pedido con id=1 a 2 en la tabla "Pedidos".*/
INSERT INTO "Clientes"  (id,"nombre") ---añadimos otro cliente para visualizar la consulta
VALUES (2,'Eva');

UPDATE "Pedidos"
SET cliente_id = 2
WHERE id = 1; 

/*9. Elimina el pedido con id=1 de la tabla "Pedidos".*/
DELETE FROM "Pedidos"
WHERE id = 1; 

/*10. Lee todos los pedidos de la tabla "Pedidos".*/
 SELECT *
 FROM "Pedidos";
 
/*11. Crea una tabla llamada "Productos" con las columnas id (entero) y nombre (cadena de texto).*/
CREATE TABLE "Productos" (
    "id" INT,
    "nombre" VARCHAR (255)
);

/*12. Inserta un producto con id=1 y nombre='Camisa' en la tabla "Productos".*/
INSERT INTO "Productos" ("id","nombre")
VALUES 
    (1,'Camisa')
    ;

/*13. Actualiza el nombre del producto con id=1 a 'Pantalón' en la tabla "Productos".*/
UPDATE "Productos"
SET "nombre" = 'Pantalon'
WHERE "id" = 1; 

/*14. Elimina el producto con id=1 de la tabla "Productos".*/
DELETE FROM "Productos"
WHERE "id" = 1; 

/*15. Lee todos los productos de la tabla "Producto*/
SELECT *
FROM "Productos";

/*16. Crea una tabla llamada "DetallesPedido" con las columnas pedido_id (entero) y producto_id (entero).*/
--Convertimos el ID de pedidos y producto a UNIQUE, ya que nos muestra el siguiente error al crear la tabla, 
--(no hay restricción unique que coincida con las columnas dadas en la tabla referida «pedidos»)

ALTER TABLE "Pedidos" 
ADD CONSTRAINT "PK_pedidos" PRIMARY KEY  ("id"); 

ALTER TABLE "Productos"
ADD CONSTRAINT "PK_productos" PRIMARY KEY  ("id");


CREATE TABLE "Detallespedido" (
    "pedido_id" INT NOT NULL,
    "producto_id" INT NOT NULL,
    CONSTRAINT "fk_pedidoid" FOREIGN KEY ("pedido_id") REFERENCES "Pedidos" ("id"),
    CONSTRAINT "fk_productoid" FOREIGN KEY ("producto_id") REFERENCES "Productos" ("id")
); 


/*17. Inserta un detalle de pedido con pedido_id=1 y producto_id=1 en la tabla "DetallesPedido".*/
---añadimos nuevamente datos a nuestras tablas para que funcione la tabla detadellespedido


INSERT INTO "Pedidos" ("id","cliente_id")
VALUES (1,1),
        (2,2),
        (3,1),
        (4,1);
        

INSERT INTO "Productos" ("id","nombre")
VALUES 
    (1,'Camisa'),
    (2,'Blusa'),
    (3,'Calcetin'),
    (4,'Gorra')
    ;

INSERT INTO "Detallespedido" ("pedido_id","producto_id")
VALUES (1,1)

/*18. Actualiza el producto_id del detalle de pedido con pedido_id=1 a 2 en la tabla "DetallesPedido".*/
UPDATE "Detallespedido"
SET "producto_id" = 2
WHERE "pedido_id" = 1; 

/*19. Elimina el detalle de pedido con pedido_id=1 de la tabla "DetallesPedido".*/
DELETE FROM "Detallespedido"
WHERE "pedido_id" = 1; 

/*20. Lee todos los detalles de pedido de la tabla "DetallesPedido".*/
SELECT *
FROM "Detallespedido";

/*21. Realiza una consulta para obtener todos los clientes y sus pedidos correspondientes utilizando un inner join.*/
INSERT INTO "Detallespedido" ("pedido_id","producto_id")
VALUES (1,1),
        (2,3),
        (3,2),
        (4,4);

SELECT c."id" AS "cliente_id", 
       c."nombre" AS "cliente", 
       p."id" AS "pedido_id"
FROM "Clientes" AS c
INNER JOIN "Pedidos" AS p ON c."id" = p."cliente_id"
ORDER BY c."nombre";



/*22. Realiza una consulta para obtener todos los clientes y sus pedidos correspondientes utilizando un left join.*/
SELECT c."id" AS "cliente_id", 
       c."nombre" AS "cliente", 
       p."id" AS "pedido_id"
FROM "Clientes" AS c
LEFT JOIN "Pedidos" AS p ON c."id" = p."cliente_id"
ORDER BY c."nombre";

---Para saber cuantos pedidos ha hecho cada cliente---

SELECT c."nombre" AS "cliente", 
       COUNT(p.id) AS "total_pedidos"
FROM "Clientes" AS c
LEFT JOIN "Pedidos" AS p ON c."id" = p."cliente_id"
GROUP BY c."nombre"
ORDER BY c."nombre";
------------------------------------------------------


/*23. Realiza una consulta para obtener todos los productos y los detalles de pedido correspondientes utilizando un inner join.*/

SELECT p."id" AS "producto_id", 
       p."nombre" AS "producto", 
       dp."pedido_id"
FROM "Productos" AS p
INNER JOIN "Detallespedido" AS dp ON p."id" = dp."producto_id";


------Consulta:obtener todos los productos, los detalles de pedido correspondientes y el nombre del cliente----
SELECT pr."nombre" AS "producto", 
       dp."pedido_id", 
       c."nombre" AS "cliente"
FROM "Detallespedido" AS dp
INNER JOIN "Productos" AS pr ON dp."producto_id" = pr."id"
INNER JOIN "Pedidos" AS p ON dp."pedido_id" = p."id"
INNER JOIN "Clientes" AS c ON p."cliente_id" = c."id"
ORDER BY c."nombre", dp."pedido_id";
------------------------------------------------------------------------------------------------------

/*24. Realiza una consulta para obtener todos los productos y los detalles de pedido correspondientes utilizando un left join.*/
--Añado un producto más sin pedido para visualizar en la tabla un registro null

INSERT INTO "Productos" ("id","nombre")
VALUES 
    (5,'Pantalon');

SELECT p."id" AS "producto_id", 
       p."nombre" AS "producto", 
       dp."pedido_id"
FROM "Productos" AS p
LEFT JOIN "Detallespedido" AS dp ON p."id" = dp."producto_id";


/*25. Crea una nueva columna llamada "telefono" de tipo cadena de texto en la tabla "Clientes".*/
ALTER TABLE "Clientes"
ADD COLUMN "telefono" VARCHAR (255) ;

/*26. Modifica la columna "telefono" en la tabla "Clientes" para cambiar su tipo de datos a entero.*/
--USING telefono::INTEGER le dice a postgreSQL que convierta los valores actuales de la columna telefono de VARCHAR a INTEGER.
-- ::INTEGER significa "convertir a número entero".
ALTER TABLE "Clientes"
ALTER COLUMN "telefono"  TYPE INT USING "telefono"::INTEGER;

/*27. Elimina la columna "telefono" de la tabla "Clientes".*/
ALTER TABLE "Clientes"
DROP COLUMN "telefono"; 

/*28. Cambia el nombre de la tabla "Clientes" a "Usuarios".*/
ALTER TABLE "Clientes" RENAME TO "Usuarios";

/*29. Cambia el nombre de la columna "nombre" en la tabla "Usuarios" a "nombre_completo".*/
ALTER TABLE "Usuarios"
RENAME COLUMN "nombre" to "nombre_completo";

/*30. Agrega una restricción de clave primaria a la columna "id" en la tabla "Usuarios".*/
ALTER TABLE "Usuarios"
ADD CONSTRAINT "PK_cliente" PRIMARY KEY  ("id") --Creada en el punto 6
;