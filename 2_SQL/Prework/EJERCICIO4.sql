/*Nivel de dificultad: Experto
1. Crea una tabla llamada "Pedidos" con las columnas: "id" (entero, clave primaria), "id_usuario" (entero, clave foránea de la tabla "Usuarios") y "id_producto" (entero, clave foránea de la tabla "Productos").
2. Inserta al menos tres registros en la tabla "Pedidos" que relacionen usuarios con productos.*/


CREATE TABLE usuarios
(
    Id SERIAL PRIMARY KEY,
    nombre VARCHAR (255) NOT NULL
);

CREATE TABLE productos 
(
        Id SERIAL PRIMARY KEY,
        nombre VARCHAR (255) NOT NULL,
        precio INT NOT NULL       
);


CREATE TABLE pedidos (
    Id SERIAL PRIMARY KEY,
    producto VARCHAR (255),
    usuarioId INT NOT NULL,
    productoId INT NOT NULL,
    CONSTRAINT fk_usuarioId FOREIGN KEY (usuarioID) REFERENCES usuarios (id),
    CONSTRAINT fk_productoId FOREIGN KEY (productoID) REFERENCES productos (id)
); 

INSERT INTO usuarios (nombre)
VALUES 
    ('Aroa'),
    ('Pepe'),
    ('Felix'),
    ('Luis'),
    ('Eva');

INSERT INTO productos (nombre,precio)
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


INSERT INTO pedidos (producto,usuarioId,productoId)
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

SELECT u.nombre AS "cliente", 
        COALESCE (pr.nombre,'Sin compras') AS "productos",
        COALESCE(COUNT (p.productoId),0) AS "total_pedidos"
FROM usuarios AS u
LEFT JOIN pedidos AS p ON u.Id = p.usuarioId
LEFT JOIN productos AS pr ON pr.Id = p.productoId
GROUP BY u.nombre,pr.nombre
ORDER BY u.nombre;

--4. Realiza una consulta que muestre los nombres de los usuarios que han realizado un pedido, pero también los que no han realizado ningún pedido (utiliza LEFT JOIN).

SELECT u.nombre AS "cliente", 
        COALESCE(COUNT (p.productoId),0) AS "total_pedidos"
FROM usuarios AS u
LEFT JOIN pedidos AS p ON u.Id = p.usuarioId
GROUP BY u.nombre
ORDER BY u.nombre;

--5. Agrega una nueva columna llamada "cantidad" a la tabla "Pedidos" y actualiza los registros existentes con un valor (utiliza ALTER TABLE y UPDATE)*/

ALTER TABLE pedidos
ADD COLUMN "cantidad" INT;

UPDATE pedidos 
SET "cantidad" = 2
WHERE Id = 1;

UPDATE pedidos 
SET "cantidad" = 3
WHERE Id IN (2,4);

UPDATE pedidos 
SET "cantidad" = 1
WHERE Id = 3;

UPDATE pedidos 
SET "cantidad" = 1
WHERE Id = 5;

UPDATE pedidos 
SET "cantidad" = 1
WHERE Id IN (6,7,8);

------------------------------------------------

----consulta que muestra todos los clientes hayan comprado o NO,junto al producto comprado y cantidad comprada

SELECT u.nombre AS "cliente", 
        COALESCE (pr.nombre,'Sin compras') AS "productos",
        COALESCE (SUM(p.cantidad),0) AS "cantidad_comprada"
FROM usuarios AS u
LEFT JOIN pedidos AS p ON u.Id = p.usuarioId
LEFT JOIN productos AS pr ON p.productoId = pr.Id 
GROUP BY u.Id, u.nombre,pr.nombre
ORDER BY u.nombre;


-----consulta mostrar el total gastado por cliente-----------

SELECT u.nombre AS cliente, 
       COALESCE(SUM(p.cantidad * pr.precio), 0) AS total_gastado
FROM usuarios u
LEFT JOIN pedidos AS p ON u.id = p.usuarioid
LEFT JOIN productos AS pr ON p.productoid = pr.id
GROUP BY u.id, u.nombre
ORDER BY total_gastado DESC;

---CONSULTAS AVANZADAS---
-----USO del HAVING--Mostrar solo los clientes que han gastado más de 1000 en total---
SELECT u.nombre AS cliente, 
       SUM(p.cantidad * pr.precio) AS total_gastado
FROM usuarios u
JOIN pedidos p ON u.id = p.usuarioid
JOIN productos pr ON p.productoid = pr.id
GROUP BY u.id, u.nombre
HAVING SUM(p.cantidad * pr.precio) > 1000  -- Muestra solo clientes con más de 1000 de gasto
ORDER BY total_gastado DESC;

----USO DEL WHERE--Obtener los clientes que han comprado "tablet", mostrando la cantidad comprada y el total gastado-----
SELECT u.nombre AS cliente, 
       pr.nombre AS producto, 
       p.cantidad, 
       (p.cantidad * pr.precio) AS total_gastado
FROM usuarios u
JOIN pedidos p ON u.id = p.usuarioid
JOIN productos pr ON p.productoid = pr.id
WHERE pr.nombre = 'tablet'  -- Filtrar pedido--
ORDER BY total_gastado DESC;

---SUBCONSULTA---
---Mostrar los clientes que han gastado más que el gasto promedio de todos los clientes.

SELECT u.nombre AS cliente, 
       SUM(p.cantidad * pr.precio) AS total_gastado
FROM usuarios u
JOIN pedidos p ON u.id = p.usuarioid
JOIN productos pr ON p.productoid = pr.id
GROUP BY u.id, u.nombre
HAVING SUM(p.cantidad * pr.precio) > (
    SELECT AVG(total_gasto) 
    FROM (
        SELECT SUM(p.cantidad * pr.precio) AS total_gasto
        FROM usuarios u
        JOIN pedidos p ON u.id = p.usuarioid
        JOIN productos pr ON p.productoid = pr.id
        GROUP BY u.id
    ) AS gasto_promedio
)
ORDER BY total_gastado DESC;
