-- Actividad 1

-- Ex01
SELECT nombre
FROM articulos;

-- Ex02
SELECT nombre, precio
FROM articulos;

-- Ex03
SELECT *
FROM articulos
WHERE precio <= 200;

-- Ex04
SELECT *
FROM articulos
WHERE precio BETWEEN 60 AND 120;

-- Ex05
SELECT nombre, precio*166.386
FROM articulos;

-- Ex06
SELECT AVG(precio)
FROM articulos;

-- Ex07
SELECT precio
FROM articulos
WHERE fabricante = 2;

-- Ex08
SELECT COUNT(precio)
FROM articulos
WHERE precio >= 180;

-- Ex09
SELECT nombre, precio
FROM articulos
WHERE precio >= 180
ORDER BY precio DESC, nombre ASC;


-- Ex10
SELECT *
FROM articulos 
INNER JOIN fabricantes ON fabricantes.CODIGO = articulos.FABRICANTE;

-- Ex11
SELECT a.nombre, a.precio, f.codigo AS `Nombre fabricante`
FROM articulos a
INNER JOIN fabricantes f ON f.CODIGO = a.FABRICANTE;

-- Ex12
SELECT f.CODIGO, AVG(a.PRECIO)
FROM articulos a
INNER JOIN fabricantes f ON f.CODIGO = a.FABRICANTE
GROUP BY f.CODIGO;

-- Ex13
SELECT f.NOMBRE, AVG(a.PRECIO)
FROM articulos a
INNER JOIN fabricantes f ON f.CODIGO = a.FABRICANTE
GROUP BY f.NOMBRE;

-- Ex14
SELECT f.NOMBRE
FROM articulos a
INNER JOIN fabricantes f ON f.CODIGO = a.FABRICANTE
GROUP BY f.NOMBRE
HAVING AVG(a.PRECIO) >= 150;

-- Ex15
SELECT NOMBRE AS Producto, PRECIO AS Precio
FROM articulos
WHERE PRECIO = (
    SELECT MIN(PRECIO) 
    FROM articulos
);

-- Ex16
SELECT f.NOMBRE AS Fabricante, a.NOMBRE, a.PRECIO
FROM articulos a
INNER JOIN fabricantes f ON f.CODIGO = a.FABRICANTE
WHERE (a.FABRICANTE, a.PRECIO) IN (
    SELECT FABRICANTE, MAX(PRECIO) AS PrecioMaximo
    FROM articulos
    GROUP BY FABRICANTE
);

-- Ex17
INSERT INTO articulos (NOMBRE, PRECIO, FABRICANTE) VALUES ('Altavoces', 70, 2);

-- Ex18
UPDATE articulos SET NOMBRE = 'Impresora láser' WHERE CODIGO = 8;

-- Ex19
UPDATE articulos SET PRECIO = PRECIO * 0.9;

-- Ex20
SET SQL_SAFE_UPDATES = 0;
UPDATE articulos SET precio = precio - 10 WHERE precio >= 120;
SET SQL_SAFE_UPDATES = 1;
