/* Ejercicios de Algebra Relacional TP DBD */
/* Ejercicio 1 */
Clientes30Mill = σ dni≥30000000 ( Cliente )
EmpReparaciones = σ Empleado.nroEmp = Reparacion.nroEmp  (  Empleado ⨯ (Clientes30Mill  ⨝ Reparacion) )
π Empleado.dni, Empleado.apellido, Empleado.nombre, Empleado.fechaNac ( EmpReparaciones ) 

/* Ejercicio 2 */
nroTallerMayor600 = σ nroTaller > 600 ( TallerDBicicleta ) 
π nombreT, email, telefono ( nroTallerMayor600 ) 

/* Ejercicio 3 */
RepValorSupMil = σ valor > 1000 ( Reparacion ) // Reparaciones cuyo valor sea > 1000
CliRepSupMil = Cliente ⨝ RepValorSupMil // Clientes cuyas reparaciones sean > 1000
TallerY = π nroTaller ( σ nombreT = 'Y' ( TallerDBicicleta)  ) // obtengo el nro de taller del Taller Y
EmpleadosTallerY = Empleado ⨝ TallerY                   // Obtengo todos los empleados que trabajan en Taller Y
CliAtendidosTallerY = σ Cliente.nroCte = Reparacion.nroCte ( Cliente ⨯ (Reparacion ⨝ EmpleadosTallerY))   // Clientes que hayan sido atendidos en Taller Y
(π dni, apellido, nombre (CliRepSupMil)) ∪ (π Cliente.dni, Cliente.apellido, Cliente.nombre (CliAtendidosTallerY)) // Union de las tablas anteriores (previa proyeccion de atributos en comun)

/* Ejercicio 4 */
π dni, nombre (Empleado ⨝ ((π nroEmp (Empleado)) - ( π nroEmp (Empleado ⨝ Reparacion )))) // Diferencia entre nroEmp de la tabla Empleados y nroEmp de empleados que hayan hecho reparaciones

/* Ejercicio 5 */
Reparacion = Reparacion - (σ nroEmp = 6 (Reparacion)) // baja de las reparaciones hechas por el Empleado nro 6
Empleado = Empleado  -  (σ nroEmp = 6  ( Empleado ) )  // baja del Empleado nro 6

/* EJERCICIOS SQL */

/* Ej 5 */
DELETE FROM Reparacion
WHERE nroEmp = 6    // baja de las reparaciones que haya realizado el empleado nro6. Haciendo esto aseguramos consistencia de datos
DELETE FROM Empleado
WHERE nroEmp = 6 // baja del empleado nro6

/* Ej 6 */
SELECT DISTINCT E.dni, E.apellido, E.nombre, E.fechaNac
FROM Empleado E INNER JOIN Reparacion R ON E.nroEmp = R.nroEmp
WHERE R.fecha BETWEEN 2017-01-01 AND 2017-12-31

/* Ej 7 */
SELECT E.dni, E.apellido, E.nombre, COUNT(*)
FROM Empleado E INNER JOIN Reparacion R ON E.nroEmp = R.nroEmp
GROUP BY E.nroEmp, E.dni, E.apellido, E.nombre

/* Ej 8 */
SELECT T.nombreT, T.direccion, T.telefono
FROM TallerDBicicleta T
WHERE T.nombre LIKE "%taller%"
ORDER BY T.nroTaller, T.nombre, T.direccion DESC

/* Ej 9 */
SELECT C.dni, C.apellido, C.nombre
FROM Clientes C INNER JOIN Reparacion R ON C.nroCte = R.nroCte
GROUP BY C.nroCte, C.dni, C.apellido, C.nombre
HAVING COUNT(C.nroCte) > 5 // tenia anotado HAVING COUNT(C.nroCte > 5)

/* Ej 10 */
SELECT T.nombreT, T.direccion, T.telefono
FROM TallerDBicicleta T INNER JOIN Empleado E ON (T.nroTaller = E.nroTaller) 
			INNER JOIN Reparacion R ON (E.nroEmp = R.nroEmp)
WHERE (R.fecha BETWEEN 2017-01-01 AND 2017-12-31) AND NOT EXISTS 
		(	SELECT *
			FROM TallerDBicicleta T_prima INNER JOIN Empleado E_prima ON (T_prima.nroTaller = E_prima.nroTaller) 
                                                      INNER JOIN Reparacion R_prima ON (E_prima.nroEmp = R_prima.nroEmp)
                        WHERE R_prima.fecha BETWEEN 2017-02-01 AND 2017-02-28 AND T_prima.nroTaller = T.nroTaller)
GROUP BY T.nroTaller,T.nombreT, T.direccion, T.telefono

