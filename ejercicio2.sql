-- Actividad 2

-- Ex01
SELECT apellidos FROM actividades.empleados;

-- Ex02
SELECT apellidos 
FROM actividades.empleados;

-- Ex03
SELECT * 
FROM actividades.empleados
WHERE apellidos = 'Smith';

-- Ex04
SELECT * 
FROM actividades.empleados
WHERE apellidos = 'Smith' OR apellidos = 'Rogers';

-- Ex05
SELECT * FROM empleados WHERE departamento = 14;

-- Ex06
SELECT * FROM empleados WHERE departamento = 37 OR departamento = 77;

-- Ex07
SELECT *
FROM actividades.empleados
WHERE apellidos LIKE 'P%';

-- Ex08
SELECT SUM(presupuesto) AS PresupuestoTotal FROM actividades.departamentos;

-- Ex09
SELECT departamento, COUNT(*) AS NumEmpleados FROM empleados GROUP BY departamento;

-- Ex10
SELECT empleados.nombre, empleados.apellidos, departamentos.nombre AS nombre_departamento, departamentos.presupuesto
FROM empleados
INNER JOIN departamentos
ON empleados.departamento = departamentos.codigo;

-- Ex11
SELECT empleados.nombre, empleados.apellidos, departamentos.nombre, departamentos.presupuesto 
FROM empleados, departamentos
WHERE empleados.departamento = departamentos.codigo;

-- Ex12
SELECT empleados.nombre, empleados.apellidos
FROM empleados
INNER JOIN departamentos
ON empleados.departamento = departamentos.codigo
WHERE departamentos.presupuesto > 60000;

-- Ex13
SELECT * FROM departamentos
WHERE presupuesto > (SELECT AVG(presupuesto) FROM departamentos);

-- Ex14
SELECT departamentos.nombre
FROM empleados
INNER JOIN departamentos
ON empleados.departamento = departamentos.codigo
GROUP BY departamentos.nombre
HAVING COUNT(*) > 2;

-- Ex15
INSERT INTO departamentos (codigo,nombre,presupuesto) VALUES 
(11, 'Calidad', 40000);
INSERT INTO empleados (dni,nombre,apellidos,departamento) VALUES 
(89267109, 'Esther', 'Vázquez', 11);

-- Ex16
UPDATE departamentos SET presupuesto = presupuesto*0.9 WHERE codigo > 0;

-- Ex17
UPDATE empleados SET departamento=14 WHERE departamento=77;

-- Ex18
DELETE FROM empleados WHERE departamento=14;

-- Ex19
DELETE FROM empleados WHERE departamento 
IN (SELECT codigo FROM departamentos WHERE presupuesto>60000);

-- Ex20
DELETE FROM empleados WHERE dni <> '';
