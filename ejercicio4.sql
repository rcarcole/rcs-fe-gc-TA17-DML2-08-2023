-- Actividad 4

-- Ex01
SELECT nombre FROM peliculas;

-- Ex02
SELECT calificaciONedad FROM peliculas
GROUP BY calificaciONedad;

-- Ex03
SELECT * FROM peliculas
WHERE calificaciONedad IS NULL;

-- Ex04
SELECT * FROM salas
WHERE pelicula IS NULL;

-- Ex05
SELECT * FROM salas
LEFT JOIN peliculas
ON salas.pelicula=peliculas.codigo
WHERE pelicula IS NOT NULL;

-- Ex06
SELECT * FROM peliculas 
LEFT JOIN salas
ON salas.pelicula=peliculas.codigo
WHERE pelicula IS NOT NULL;

-- Ex07
SELECT nombre FROM peliculas 
WHERE codigo NOT IN
(SELECT pelicula FROM salas WHERE pelicula IS NOT NULL);

-- Ex08
INSERT INTO peliculas (codigo,nombre,calificaciONedad) VALUES 
(10, 'Un', 'Dos', 'Tres', 7);

-- Ex09
UPDATE peliculas SET calificaciONedad=13 WHERE calificaciONedad IS NULL AND codigo>0 ;

-- Ex10
DELETE FROM salas 
WHERE pelicula IN 
(SELECT codigo FROM peliculas WHERE calificaciONedad='PG');