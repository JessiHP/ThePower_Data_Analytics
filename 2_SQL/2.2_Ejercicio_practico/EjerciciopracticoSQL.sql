/*Primera restricción: creamos nuestras 4 tablas con identificadores únicos y referencias entre sí*/

CREATE TABLE "alumnos"(
    "id_alumno" SERIAL PRIMARY KEY,
    "nombre" VARCHAR (150),
    "apellido" VARCHAR (150)
);

CREATE TABLE "cursos"(
    "id_curso" SERIAL PRIMARY KEY,
    "nombre_curso" VARCHAR (150),
    "semanas_curso" INT ,
    "fecha" DATE
);

CREATE TABLE "inscripciones" (
    "id_inscripciones" SERIAL PRIMARY KEY,
    "id_alumno" INT,
    "id_curso" INT,
    "fecha" DATE,
    "estado" VARCHAR (20) DEFAULT 'En curso' CHECK ("estado" IN ('En curso', 'Finalizado')),
    CONSTRAINT "FK_inscripciones_alumno" FOREIGN KEY ("id_alumno") REFERENCES "alumnos" ("id_alumno"),
    CONSTRAINT "FK_inscripciones_curso" FOREIGN KEY ("id_curso") REFERENCES "cursos" ("id_curso")
);

CREATE TABLE "participaciones" (
    "id_participaciones" SERIAL PRIMARY KEY,
    "id_alumno" INT,
    "id_curso" INT,
    "control_medios" TEXT CHECK ("control_medios" IN('Foro','Github','Ejercicios','Casospracticos')),
    "fecha" DATE,
    CONSTRAINT "FK_participaciones_alumno" FOREIGN KEY ("id_alumno") REFERENCES "alumnos" ("id_alumno"),
    CONSTRAINT "FK_participaciones_curso" FOREIGN KEY ("id_curso") REFERENCES "cursos" ("id_curso")
);


/*Segunda restricción: modificamos una de nuestras tablas y consultamos la alteración*/
ALTER TABLE "cursos"
ADD COLUMN "precio" DECIMAL (10,2);


SELECT * 
FROM "cursos";

/*Tercera restricción: la tabla participaciones debe tener datos acotados
 * Datos acotados:
 *  - CHECK → Restringe valores según una condición.
    - FOREIGN KEY → Solo permite valores que existen en otra tabla.
    - DEFAULT → Asigna un valor automático si no se proporciona uno.
 
 *Nuestra tabla participaciones tiene dos restricciones de Foreign key y un Check para controlar los medios.
 *Aprovechamos y modificamos la tabla para añadir una columna llamada calificado donde se indicara si se ha calificado
 *la participación, por defecto se añadirá FALSE.
 */
ALTER TABLE "participaciones"
ADD COLUMN "calificado" BOOLEAN DEFAULT FALSE;

SELECT * 
FROM "participaciones";

/*Cuarta restricción, añadir datos en las tablas con dos juegos de valores.*/

INSERT INTO "alumnos" ("nombre", "apellido") 
VALUES
        ('Alicia','Hernandez'),
        ('Maria','Jimenez'),
        ('Pepe','Rivero'),
        ('Sara','Cardona'),
        ('Alex','Martinez'),
        ('Richard','Jimenez'),
        ('Gonzalo','Gutierrez'),
        ('Felipe','Perdomo')       
;

INSERT INTO "cursos" ("nombre_curso","semanas_curso","fecha","precio") 
VALUES
        ('Phyton',12,'2024-10-02',250),
        ('SQL',4,'2024-12-03',80),
        ('R',6,'2025-01-10',120),
        ('PowerBI',8,'2025-02-02',190),
        ('Tableau',2,'2025-01-10',90)
;


INSERT INTO "inscripciones" ("id_alumno", "id_curso","fecha") 
VALUES  
        ('1',1,'2024-10-10'),
        ('2',4,'2024-12-15'),
        ('3',1,'2024-10-08'),
        ('4',2,'2025-02-20'),
        ('5',1,'2024-10-11'),
        ('6',4,'2024-12-20'),
        ('7',1,'2024-11-20'),
        ('8',1,'2024-12-22'),
        ('1',2,'2024-12-11'),
        ('1',4,'2025-02-15'),
        ('3',2,'2025-01-08'),
        ('5',3,'2025-02-20');

UPDATE "inscripciones"
SET "estado" = 'Finalizado'
WHERE "id_alumno" = 1 AND "id_curso" = 1;

INSERT INTO "participaciones" ("id_alumno", "id_curso","control_medios","fecha") 
VALUES   
        (1,4,'Github','2025-02-20'),
        (1,2,'Ejercicios','2025-01-03'),
        (4,2,'Github','2025-02-22'),      
        (4,2,'Casospracticos','2025-02-26'),
        (1,4,'Github','2025-02-21');

INSERT INTO "participaciones" ("id_alumno", "id_curso","control_medios","fecha","calificado") 
VALUES  
 
        (3,1,'Github','2024-12-08',True),
        (1,1,'Ejercicios','2024-11-03',True),
        (2,4,'Casospracticos','2024-12-18',True),
        (1,1,'Foro','2025-01-03',True),
        (3,1,'Foro','2024-12-08',True),
        (8,1,'Foro','2024-12-29',True),
        (5,1,'Foro','2025-02-22',True);



/*Quinta restricción: Realizar 5 consultas tipo SELECT en las que se pueda demostrar que los datos cumplen con las 
 * restricciones anteriores y el esquema. Es decir, que se vean todas las tablas, sus datos y las relaciones entre las mismas.*/

/*consulta: consulta que alumnos se han inscrito al curso de python*/
  
SELECT a."nombre" AS "alumno",
        a."apellido" AS "apellido",
        c."nombre_curso" AS "curso",
        i."fecha" AS "fecha_inscripcion"
FROM "inscripciones" AS i
INNER JOIN "alumnos" AS a ON i."id_alumno" = a."id_alumno" 
INNER JOIN "cursos" AS c ON i."id_curso" = c."id_curso"
WHERE c."nombre_curso" = 'Phyton'
ORDER BY a."nombre";

/* consulta: a cuantos cursos se ha inscrito cada alumno*/

SELECT a."nombre" AS "alumno",
        a."apellido" AS "apellido",
        count(i."id_curso") AS "Nº_total_de_cursos_inscritos"
FROM "inscripciones" AS i
LEFT JOIN "alumnos" AS a ON i."id_alumno" = a."id_alumno"
GROUP BY a."id_alumno"
ORDER BY "Nº_total_de_cursos_inscritos" DESC ;

/* consulta: cuanto se ha gastado cada alumno*/

SELECT a."nombre" AS "alumno",
        a."apellido" AS "apellido",
        SUM (c."precio") AS "dinero_gastado"
FROM "inscripciones" AS i
INNER JOIN "alumnos" AS a ON i."id_alumno" = a."id_alumno" 
INNER JOIN "cursos" AS c ON i."id_curso" = c."id_curso"
GROUP BY a."id_alumno"
ORDER BY "dinero_gastado" DESC;


/* consulta: contar las participaciones totales que ha tenido cada alumno en los medios*/

SELECT a."nombre" AS "alumno",
        a."apellido" AS "apellido",
       p."control_medios" AS "tipo",
        COUNT(p."id_participaciones") AS "total_participaciones"
FROM "participaciones" AS p
INNER JOIN "alumnos" AS a ON p."id_alumno" = a."id_alumno" 
GROUP BY a."id_alumno",p."control_medios"
ORDER BY "total_participaciones" DESC; 



/* consulta: mostrar los alumnos que no han participado en ningun medio*/

SELECT a."nombre" AS "alumno",
        a."apellido" AS "apellido"
FROM "alumnos" AS a
WHERE NOT EXISTS ( 
         SELECT 1 FROM "participaciones" AS p WHERE p."id_alumno" = a."id_alumno") 
ORDER BY a."nombre";

--Para cada alumno en alumnos, buscamos en participaciones si tiene al menos un registro.Si no hay coincidencia, el alumno se incluye en el resultado---

/* consulta: ver alumnos con participaciones sin calificar*/

SELECT a."nombre" AS "alumno",
        a."apellido" AS "apellido",
        p."control_medios" AS "tipo",
        COUNT(p."id_participaciones") AS "participaciones_sin_calificar"
FROM "alumnos" AS a
INNER JOIN  "participaciones" AS p ON a."id_alumno" = p."id_alumno"
WHERE p."calificado" = 'False'
GROUP BY a."id_alumno", p."control_medios"
ORDER BY "participaciones_sin_calificar" DESC; 


        
/* consulta: ¿Qué cursos poseen más de 3 inscripciones?*/
SELECT c."nombre_curso" AS "Curso",
        count(i."id_curso") AS "Inscripciones"
FROM "cursos" AS c
INNER JOIN "inscripciones" AS i ON c."id_curso" = i."id_curso"  
GROUP BY c."id_curso" 
HAVING COUNT("id_inscripciones") > 3 
ORDER BY c."nombre_curso";

I/* consulta: ver las participaciones en el último mes*/

SELECT 
        a."nombre" AS "alumno",
        a."apellido" AS "apellido",
        c."nombre_curso" AS "curso",
        p."control_medios" AS "tipo",
        p."fecha" AS "fecha"
FROM "participaciones" AS p
INNER JOIN "alumnos" AS a ON p."id_alumno" = a."id_alumno"
INNER JOIN "cursos" AS c ON p."id_curso" = c."id_curso"
WHERE p."fecha" >= (CURRENT_DATE - INTERVAL '1 month')
ORDER BY "fecha" DESC; 

---CURRENT_DATE - INTERVAL '1 month'--Calcula la fecha de hace un mes a partir de hoy---

/* consulta: ver si el curso ha caducado para cada alumno*/
        
SELECT a."nombre" AS "alumno", 
       c."nombre_curso" AS "curso", 
       i."fecha" AS "fecha_inscripcion",
       c."semanas_curso" AS "duracion_semanas",
       (i."fecha" + (c."semanas_curso" * INTERVAL '1 week')) AS "fecha_finalizacion",
       CASE 
           WHEN (i."fecha" + (c."semanas_curso" * INTERVAL '1 week')) < CURRENT_DATE THEN 'Caducado'
           ELSE 'Activo'
       END AS "estado_curso"
FROM "inscripciones" i
JOIN "alumnos" a ON i."id_alumno" = a."id_alumno"
JOIN "cursos" c ON i."id_curso" = c."id_curso"
ORDER BY "estado_curso" DESC, "fecha_finalizacion";

/* consulta con subconsulta: Obtener los alumnos que están inscritos en más cursos que el promedio de inscripciones por alumno.*/
SELECT a."nombre" AS "alumno",
        a."apellido" AS "apellido",
        (i."id_curso") AS "Nº_total_de_cursos_inscritos"
FROM "inscripciones" AS i
LEFT JOIN "alumnos" AS a ON i."id_alumno" = a."id_alumno"
GROUP BY a."id_alumno",i."id_curso"
ORDER BY "Nº_total_de_cursos_inscritos" DESC ;