-- Actividad 3

-- Ex01
SELECT * FROM almacenes;

-- Ex02
SELECT * FROM cajas
WHERE valor>150;

-- Ex03
SELECT DISTINCT CONTENIDO
FROM cajas;

-- Ex04
SELECT AVG(valor)
FROM cajas;

-- Ex05
SELECT AVG(valor) FROM cajas
GROUP BY almacen;

-- Ex06
SELECT almacen FROM cajas
GROUP BY almacen
HAVING AVG(valor)>150;

-- Ex07
SELECT numreferencia, lugar FROM cajas,almacenes
WHERE cajas.ALMACEN = almacenes.CODIGO;

-- Ex08
SELECT almacen, count(numreferencia) FROM cajas
GROUP BY almacen;

-- Ex09
SELECT codigo FROM almacenes
WHERE capacidad < (SELECT count(numreferencia) FROM cajas WHERE almacen= codigo);

-- Ex10
SELECT numreferencia FROM cajas
WHERE almacen 
IN (SELECT codigo FROM almacenes WHERE lugar='Bilbao');

-- Ex11
INSERT INTO almacenes (codigo,lugar,capacidad) VALUES 
(6,'Barcelona',3);

-- Ex12
INSERT INTO cajas (numreferencia,contenido,valor,almacen) VALUES 
('H5RT','Papel',200,2);

-- Ex13
UPDATE cajas SET valor = valor*1.15 WHERE numreferencia<>'';

-- Ex14
UPDATE cajas SET VALOR = VALOR * 0.8 WHERE VALOR > (SELECT AVG(VALOR) FROM cajas);

-- Ex15
DELETE FROM cajas WHERE valor < 100 AND numreferencia<>''; 

-- EX16
DELETE FROM cajas WHERE almacen IN (
  SELECT codigo FROM (
    SELECT a.codigo FROM almacenes AS a
    WHERE a.capacidad < (
    SELECT COUNT(*) FROM cajas AS c WHERE c.almacen = a.codigo))
    AS subquery
);