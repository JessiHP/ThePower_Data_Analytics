/*EJERCICIO 5
 * 
1. Crea una tabla llamada "Clientes" con las columnas id (entero) y nombre (cadena de texto).*/
CREATE TABLE clientes (
    id INT,
    nombre VARCHAR (255) NOT NULL
);

/*2.Inserta un cliente con id=1 y nombre='John' en la tabla "Clientes".*/
INSERT INTO clientes (id,nombre)
VALUES (1,'John');

/*3. Actualiza el nombre del cliente con id=1 a 'John Doe' en la tabla "Clientes"*/
UPDATE clientes 
SET nombre = 'John Doe'
WHERE id = 1;

/*4. Elimina el cliente con id=1 de la tabla "Clientes"*/
DELETE FROM clientes 
WHERE id = 1;

/*5. Lee todos los clientes de la tabla "Clientes"*/
 SELECT *
 FROM clientes;
 
/*6. Crea una tabla llamada "Pedidos" con las columnas id (entero) y cliente_id(entero).*/
ALTER TABLE "clientes" 
ADD CONSTRAINT "PK_clientes" PRIMARY KEY  ("id") --Convertimos el ID de clientes en PK, para poder usar el cliente_id como FK
;
 
CREATE TABLE pedidos (
    id INT,
    cliente_id INT NOT NULL,
    CONSTRAINT fk_cliente_id FOREIGN KEY (cliente_id) REFERENCES clientes (id)); 

/*7. Inserta un pedido con id=1 y cliente_id=1 en la tabla "Pedidos".*/
INSERT INTO pedidos (id,cliente_id)
VALUES (1,1)
;

/*8. Actualiza el cliente_id del pedido con id=1 a 2 en la tabla "Pedidos".*/
INSERT INTO clientes (id,nombre) ---añadimos otro cliente para visualizar la consulta
VALUES (2,'Eva');

UPDATE pedidos
SET cliente_id = 2
WHERE id = 1; 

/*9. Elimina el pedido con id=1 de la tabla "Pedidos".*/
DELETE FROM pedidos
WHERE id = 1; 

/*10. Lee todos los pedidos de la tabla "Pedidos".*/
 SELECT *
 FROM pedidos;
 
/*11. Crea una tabla llamada "Productos" con las columnas id (entero) y nombre (cadena de texto).*/
CREATE TABLE productos (
    id INT,
    nombre VARCHAR (255)
);

/*12. Inserta un producto con id=1 y nombre='Camisa' en la tabla "Productos".*/
INSERT INTO productos (id,nombre)
VALUES 
    (1,'Camisa')
    ;

/*13. Actualiza el nombre del producto con id=1 a 'Pantalón' en la tabla "Productos".*/
UPDATE productos
SET nombre = 'Pantalon'
WHERE id = 1; 

/*14. Elimina el producto con id=1 de la tabla "Productos".*/
DELETE FROM productos
WHERE id = 1; 

/*15. Lee todos los productos de la tabla "Producto*/
SELECT *
FROM productos;

/*16. Crea una tabla llamada "DetallesPedido" con las columnas pedido_id (entero) y producto_id (entero).*/
--Convertimos el ID de pedidos y producto a UNIQUE, ya que nos muestra el siguiente error al crear la tabla, 
--(no hay restricción unique que coincida con las columnas dadas en la tabla referida «pedidos»)

ALTER TABLE "pedidos" 
ADD CONSTRAINT "PK_pedidos" PRIMARY KEY  ("id"); 

ALTER TABLE "productos" 
ADD CONSTRAINT "PK_productos" PRIMARY KEY  ("id");


CREATE TABLE detallespedidos (
    pedido_id INT NOT NULL,
    producto_id INT NOT NULL,
    CONSTRAINT fk_pedidoid FOREIGN KEY (pedido_iD) REFERENCES pedidos (id),
    CONSTRAINT fk_productoid FOREIGN KEY (producto_id) REFERENCES productos (id)
); 


/*17. Inserta un detalle de pedido con pedido_id=1 y producto_id=1 en la tabla "DetallesPedido".*/
---añadimos nuevamente datos a nuestras tablas para que funcione la tabla detadellespedido


INSERT INTO pedidos (id,cliente_id)
VALUES (1,1),
        (2,2),
        (3,1),
        (4,1);
        

INSERT INTO productos (id,nombre)
VALUES 
    (1,'Camisa'),
    (2,'Blusa'),
    (3,'Calcetin'),
    (4,'Gorra')
    ;

INSERT INTO detallespedidos (pedido_id,producto_id)
VALUES (1,1)

/*18. Actualiza el producto_id del detalle de pedido con pedido_id=1 a 2 en la tabla "DetallesPedido".*/
UPDATE detallespedidos
SET producto_id = 2
WHERE pedido_id = 1; 

/*19. Elimina el detalle de pedido con pedido_id=1 de la tabla "DetallesPedido".*/
DELETE FROM detallespedidos
WHERE pedido_id = 1; 

/*20. Lee todos los detalles de pedido de la tabla "DetallesPedido".*/
SELECT *
FROM detallespedidos;

/*21. Realiza una consulta para obtener todos los clientes y sus pedidos correspondientes utilizando un inner join.*/
INSERT INTO detallespedidos (pedido_id,producto_id)
VALUES (1,1),
        (2,3),
        (3,2),
        (4,4);

SELECT c.id AS cliente_id, 
       c.nombre AS cliente, 
       p.id AS pedido_id
FROM clientes AS c
INNER JOIN pedidos AS p ON c.id = p.cliente_id
ORDER BY c.nombre;



/*22. Realiza una consulta para obtener todos los clientes y sus pedidos correspondientes utilizando un left join.*/
SELECT c.id AS cliente_id, 
       c.nombre AS cliente, 
       p.id AS pedido_id
FROM clientes AS c
LEFT JOIN pedidos AS p ON c.id = p.cliente_id
ORDER BY c.nombre;

---Para saber cuantos pedidos ha hecho cada cliente---

SELECT c.nombre AS "cliente", 
       COUNT(p.id) AS "total_pedidos"
FROM clientes AS c
LEFT JOIN pedidos AS p ON c.id = p.cliente_id
GROUP BY c.nombre
ORDER BY c.nombre;
------------------------------------------------------


/*23. Realiza una consulta para obtener todos los productos y los detalles de pedido correspondientes utilizando un inner join.*/

SELECT p.id AS producto_id, 
       p.nombre AS producto, 
       dp.pedido_id
FROM productos AS p
INNER JOIN detallespedidos AS dp ON p.id = dp.producto_id;


------Consulta:obtener todos los productos, los detalles de pedido correspondientes y el nombre del cliente----
SELECT pr.nombre AS producto, 
       dp.pedido_id, 
       c.nombre AS cliente
FROM detallespedidos AS dp
INNER JOIN productos AS pr ON dp.producto_id = pr.id
INNER JOIN pedidos AS p ON dp.pedido_id = p.id
INNER JOIN clientes AS c ON p.cliente_id = c.id
ORDER BY c.nombre, dp.pedido_id;
------------------------------------------------------------------------------------------------------

/*24. Realiza una consulta para obtener todos los productos y los detalles de pedido correspondientes utilizando un left join.*/
--Añado un producto más sin pedido para visualizar en la tabla un registro null

INSERT INTO productos (id,nombre)
VALUES 
    (5,'Pantalon');

SELECT p.id AS producto_id, 
       p.nombre AS producto, 
       dp.pedido_id
FROM productos AS p
LEFT JOIN detallespedidos AS dp ON p.id = dp.producto_id;


/*25. Crea una nueva columna llamada "telefono" de tipo cadena de texto en la tabla "Clientes".*/
ALTER TABLE clientes
ADD COLUMN "telefono" VARCHAR (255) ;

/*26. Modifica la columna "telefono" en la tabla "Clientes" para cambiar su tipo de datos a entero.*/
--USING telefono::INTEGER le dice a postgreSQL que convierta los valores actuales de la columna telefono de VARCHAR a INTEGER.
-- ::INTEGER significa "convertir a número entero".
ALTER TABLE clientes
ALTER COLUMN telefono TYPE INT USING telefono::INTEGER;

/*27. Elimina la columna "telefono" de la tabla "Clientes".*/
ALTER TABLE clientes
DROP COLUMN "telefono" 

/*28. Cambia el nombre de la tabla "Clientes" a "Usuarios".*/
ALTER TABLE clientes RENAME TO "usuarios";

/*29. Cambia el nombre de la columna "nombre" en la tabla "Usuarios" a "nombre_completo".*/
ALTER TABLE usuarios
RENAME COLUMN "nombre" to nombre_completo;

/*30. Agrega una restricción de clave primaria a la columna "id" en la tabla "Usuarios".*/
ALTER TABLE "usuarios" 
ADD CONSTRAINT "PK_cliente" PRIMARY KEY  ("id") --Convertimos el ID de clientes en PK, para poder usar el cliente_id como FK
;