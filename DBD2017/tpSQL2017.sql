/* Trabajo Practico DBD 2017 
Cliente (nroCte, DNI, apellido, nombre, dirección, telefono)
Empleado (nroEmp, DNI, apellido, nombre, fechaNac, nroTaller, cant_hijos)
TallerDBicicleta(nroTaller,nombreT,email, direccion, telefono)
Reparacion(nroEmp, nroCte, fecha, hora, valor, descripcion)
*/
/* Ejercicios de Algebra Relacional TP DBD */
/* 
Ejercicio 1
Reportar DNI, apellido, nombre y fecha de nacimiento de empleados que realizaron reparaciones a
clientes con DNI superior a: 30000000
 */
Clientes30Mill = σ dni≥30000000 ( Cliente )
EmpReparaciones = σ Empleado.nroEmp = Reparacion.nroEmp  (  Empleado ⨯ ( 		Clientes30Mill  ⨝ Reparacion) )
π Empleado.dni, Empleado.apellido, Empleado.nombre, Empleado.fechaNac ( EmpReparaciones ) 

/*
Ejercicio 2 
Reportar nombreT, email y teléfono de talleres con nroTaller mayor a 600.
*/
nroTallerMayor600 = σ nroTaller > 600 ( TallerDBicicleta ) 
π nombreT, email, telefono ( nroTallerMayor600 ) 

/*
Ejercicio 3 
Reportar DNI, apellido, nombre de aquellos clientes atendidos en el Taller con nombre ‘Y’ o que
tengan reparaciones con valor superior a 1000.
*/
RepValorSupMil = σ valor > 1000 ( Reparacion ) // Reparaciones cuyo valor sea > 1000
CliRepSupMil = Cliente ⨝ RepValorSupMil // Clientes cuyas reparaciones sean > 1000
TallerY = π nroTaller ( σ nombreT = 'Y' ( TallerDBicicleta)  ) // obtengo el nro de taller del Taller Y
EmpleadosTallerY = Empleado ⨝ TallerY                   // Obtengo todos los empleados que trabajan en Taller Y
CliAtendidosTallerY = σ Cliente.nroCte = Reparacion.nroCte ( Cliente ⨯ (Reparacion ⨝ EmpleadosTallerY))   // Clientes que hayan sido atendidos en Taller Y	
(π dni, apellido, nombre (CliRepSupMil)) ∪ (π Cliente.dni, Cliente.apellido, Cliente.nombre (CliAtendidosTallerY)) // Union de las tablas anteriores (previa proyeccion de atributos en comun)

/* 
Ejercicio 4 
Reportar el DNI y nombre de los empleados que no hayan participado en ningún arreglo.
*/
π dni, nombre (Empleado ⨝ ((π nroEmp (Empleado)) - ( π nroEmp (Empleado ⨝ Reparacion )))) // Diferencia entre nroEmp de la tabla Empleados y nroEmp de empleados que hayan hecho reparaciones

/* 
Ejercicio 5 
Borrar al empleado con nroEmp: 6.
*/
Reparacion = Reparacion - (σ nroEmp = 6 (Reparacion)) // baja de las reparaciones hechas por el Empleado nro 6
Empleado = Empleado  -  (σ nroEmp = 6  ( Empleado ) )  // baja del Empleado nro 6

/* EJERCICIOS SQL */
/* 
Ejercicio 5 
Borrar al empleado con nroEmp: 6
*/
DELETE FROM Reparacion
WHERE nroEmp = 6    // baja de las reparaciones que haya realizado el empleado nro6. Haciendo esto aseguramos consistencia de datos
DELETE FROM Empleado
WHERE nroEmp = 6 // baja del empleado nro6

/* 
Ejercicio 6
Reportar DNI, apellido, nombre y fecha de nacimiento de empleados con reparaciones durante 2017.
-DISTINCT se utiliza porque un empleado puede tener varias reparaciones, por ende las tupas
se van a repetir
*/
SELECT DISTINCT E.dni, E.apellido, E.nombre, E.fechaNac
FROM empleado E INNER JOIN reparacion R ON E.nroEmp = R.nroEmp
WHERE R.fecha BETWEEN '2017-01-01' AND '2017-12-31'

/* 
Ejercicio 7
Reportar para cada empleado: DNI, apellido y nombre de junto con la cantidad de reparaciones
realizadas.
-Utilizo LEFT JOIN porque necesito saber el nombre del empleado, y no me sirve reparacion
asimismo utilizo COUNT() con R.nroEmp y no E.nroEmp porque sino estaria contando de mas	
(la tupla del empleado que no tiene reparaciones)
*/
SELECT E.dni, E.apellido, E.nombre, COUNT(R.nroEmp)
FROM empleado E LEFT JOIN reparacion R ON E.nroEmp = R.nroEmp
GROUP BY E.nroEmp, E.dni, E.apellido, E.nombre 

/*
 Ej 8 
Reportar talleres cuyo nombre contenga el string ‘taller’, se deberá informar nombre, direccion y
telefono. El resultado deberá estar ordenado por nombre y dirección descendentemente.
*/
SELECT T.nombreT, T.direccion, T.telefono
FROM tallerdbicicleta T
WHERE T.nombreT LIKE "%taller%"
ORDER BY T.nombreT, T.direccion DESC

/* 
Ej 9 
Informar DNI, apellido y nombre de clientes con más de 5 reparaciones solicitadas.
COUNT(C.nroCte va a contar la cantidad de tuplas con el mismo nroCte en cada grupo)
*/
SELECT C.dni, C.apellido, C.nombre
FROM cliente C INNER JOIN reparacion R ON C.nroCte = R.nroCte
GROUP BY C.nroCte, C.dni, C.apellido, C.nombre
HAVING COUNT(C.nroCte) > 5

/* 
Ej 10 
Reportar nombre, dirección y teléfono de talleres que tengan reparaciones durante enero de 2017 y
no tengan reparaciones durante febrero del mismo año.
-Selecciono las tuplas que tienen reparaciones durante enero2017, hago una subconsulta con las mismas tablas
(renombradas distinto) cuyas tuplas no tengan reparaciones en febrero2017 y luego genero una correspondencia
entre estas tuplas y las de la primera consulta. Es necesario el DISTINCT porque van a haber tuplas repetidas 
de los talleres que estamos buscando
*/
SELECT DISTINCT T.nombreT, T.direccion, T.telefono
FROM tallerdbicicleta T INNER JOIN empleado E ON (T.nroTaller = E.nroTaller) 
						INNER JOIN reparacion R ON (E.nroEmp = R.nroEmp)
WHERE (R.fecha BETWEEN '2017-01-01' AND '2017-12-31') AND NOT EXISTS 
		(	SELECT *
			FROM tallerdbicicleta T_prima INNER JOIN empleado E_prima ON (T_prima.nroTaller = E_prima.nroTaller) 
			INNER JOIN reparacion R_prima ON (E_prima.nroEmp = R_prima.nroEmp)
                        WHERE R_prima.fecha BETWEEN '2017-02-01' AND '2017-02-28' AND T_prima.nroTaller = T.nroTaller)

