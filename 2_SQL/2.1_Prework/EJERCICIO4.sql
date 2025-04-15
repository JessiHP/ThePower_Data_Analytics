/*Nivel de dificultad: Experto
1. Crea una tabla llamada "Pedidos" con las columnas: "id" (entero, clave primaria), "id_usuario" (entero, clave foránea de la tabla "Usuarios") y "id_producto" (entero, clave foránea de la tabla "Productos").
2. Inserta al menos tres registros en la tabla "Pedidos" que relacionen usuarios con productos.*/


CREATE TABLE "Usuarios"
(
    "Id" SERIAL PRIMARY KEY,
    "nombre" VARCHAR (255) NOT NULL
);

CREATE TABLE "Productos" 
(
        "Id" SERIAL PRIMARY KEY,
        "nombre" VARCHAR (255) NOT NULL,
        "precio" INT NOT NULL       
);


CREATE TABLE "Pedidos" (
    "Id" SERIAL PRIMARY KEY,
    "producto" VARCHAR (255),
    "id_usuario" INT NOT NULL,
    "id_producto" INT NOT NULL,
    CONSTRAINT "fk_usuarioId" FOREIGN KEY ("id_usuario") REFERENCES "Usuarios" ("Id"),
    CONSTRAINT "fk_productoId" FOREIGN KEY ("id_producto") REFERENCES "Productos" ("Id")
); 

INSERT INTO "Usuarios" ("nombre")
VALUES 
    ('Aroa'),
    ('Pepe'),
    ('Felix'),
    ('Luis'),
    ('Eva');

INSERT INTO "Productos" ("nombre","precio")
VALUES 
        ('camaraSony',370),
        ('tablet',780),
        ('iphone',1200),
        ('movillg',480),
        ('patinete',380),
        ('cafetera',80),
        ('cascos',110),
        ('xbox',790),
        ('teclado',20),
        ('raton',60);


INSERT INTO "Pedidos" ("producto","id_usuario","id_producto")
VALUES 
        ('camaraSony',1,1),
        ('tablet',2,2),
        ('iphone',3,3),
        ('movillg',4,4),
        ('patinete',1,5),
        ('cafetera',3,6),
        ('cascos',4,7),
        ('xbox',1,8);
       

--3. Realiza una consulta que muestre los nombres de los usuarios y los nombres de los productos que han comprado, incluidos aquellos que no han realizado ningún pedido (utiliza LEFT JOIN y COALESCE).

SELECT u."nombre" AS "cliente", 
        COALESCE (pr."nombre",'Sin compras') AS "Productos",
        COALESCE(COUNT (p."id_producto"),0) AS "total_pedidos"
FROM "Usuarios" AS u
LEFT JOIN "Pedidos" AS p ON u."Id" = p."id_usuario"
LEFT JOIN "Productos" AS pr ON pr."Id" = p."id_producto"
GROUP BY u."nombre",pr."nombre"
ORDER BY u."nombre";
--4. Realiza una consulta que muestre los nombres de los usuarios que han realizado un pedido, pero también los que no han realizado ningún pedido (utiliza LEFT JOIN).


SELECT u."nombre" AS "cliente", 
        COALESCE(COUNT (p."id_producto"),0) AS "total_pedidos"
FROM "Usuarios" AS u
LEFT JOIN "Pedidos" AS p ON u."Id" = p."id_usuario"
GROUP BY u."nombre"
ORDER BY u."nombre";


--5. Agrega una nueva columna llamada "cantidad" a la tabla "Pedidos" y actualiza los registros existentes con un valor (utiliza ALTER TABLE y UPDATE)*/

ALTER TABLE "Pedidos"
ADD COLUMN "cantidad" INT;

UPDATE "Pedidos" 
SET "cantidad" = 2
WHERE "Id" = 1;

UPDATE "Pedidos" 
SET "cantidad" = 3
WHERE "Id" IN (2,4);

UPDATE "Pedidos" 
SET "cantidad" = 1
WHERE "Id" = 3;

UPDATE "Pedidos" 
SET "cantidad" = 1
WHERE "Id" = 5;

UPDATE "Pedidos" 
SET "cantidad" = 1
WHERE "Id" IN (6,7,8);

-------------------CONSULTAS EXTRAS-----------------------------

----consulta que muestra todos los clientes hayan comprado o NO,junto al producto comprado y cantidad comprada

SELECT u."nombre" AS "cliente", 
        COALESCE (pr."nombre",'Sin compras') AS "Productos",
        COALESCE (SUM(p."cantidad"),0) AS "cantidad_comprada"
FROM "Usuarios" AS u
LEFT JOIN "Pedidos" AS p ON u."Id" = p."id_usuario"
LEFT JOIN "Productos" AS pr ON p."id_producto" = pr."Id" 
GROUP BY u."Id", u."nombre",pr."nombre"
ORDER BY u."nombre";


-----consulta mostrar el total gastado por cliente-----------
SELECT u."nombre" AS "cliente", 
       COALESCE(SUM (p."cantidad" * pr."precio"), 0) AS "total_gastado"
FROM "Usuarios" u
LEFT JOIN "Pedidos" AS p ON u."Id" = p."id_usuario"
LEFT JOIN "Productos" AS pr ON p."id_producto" = pr."Id"
GROUP BY u."Id", u."nombre"
ORDER BY "total_gastado" DESC;

-------------------CONSULTAS AVANZADAS-----------------------------

-----USO del HAVING--Mostrar solo los clientes que han gastado más de 1600 en total---
SELECT u."nombre" AS "cliente", 
       SUM(p."cantidad" * pr."precio") AS "total_gastado"
FROM "Usuarios" u
JOIN "Pedidos" p ON u."Id" = p."id_usuario"
JOIN "Productos" pr ON p."id_producto" = pr."Id"
GROUP BY u."Id", u."nombre"
HAVING SUM(p."cantidad" * pr."precio") > 1600   -- Muestra solo clientes con más de 1000 de gasto
ORDER BY "total_gastado" DESC;

----USO DEL WHERE--Obtener los clientes que han comprado "tablet", mostrando la cantidad comprada y el total gastado-----
SELECT u."nombre" AS "cliente", 
       pr."nombre" AS "producto", 
       p."cantidad", 
       (p."cantidad" * pr."precio") AS "total_gastado"
FROM "Usuarios" u
JOIN "Pedidos" p ON u."Id" = p."id_usuario"
JOIN "Productos" pr ON p."id_producto" = pr."Id"
WHERE pr."nombre" = 'tablet'  -- "Filtrar" "pedido"--
ORDER BY "total_gastado" DESC;

-------------------SUBCONSULTA----------------------------------

---Mostrar los clientes que han gastado más que el gasto promedio de todos los clientes.

SELECT u."nombre" AS "cliente", 
       SUM(p."cantidad" * pr."precio") AS "total_gastado"
FROM "Usuarios" u
JOIN "Pedidos" p ON u."Id" = p."id_usuario"
JOIN "Productos" pr ON p."id_producto" = pr."Id"
GROUP BY u."Id", u."nombre"
HAVING SUM(p."cantidad" * pr."precio") > (
    SELECT AVG("total_gasto") 
    FROM (
        SELECT SUM(p."cantidad" * pr."precio") AS "total_gasto"
        FROM "Usuarios" u
        JOIN "Pedidos" p ON u."Id" = p."id_usuario"
        JOIN "Productos" pr ON p."id_producto" = pr."Id"
        GROUP BY u."Id"
    ) AS "gasto_promedio"
)
ORDER BY "total_gastado" DESC;
