/*
Zona (IdZona, NombreZona)
Cine (IdCine, NombreCine, IdZona, Ubicación)
Sala (IdCine, NumeroSala, Capacidad)
Película (IdPelícula, Título, Año, Género, Duración, Calificación, Sinopsis)
ActorDirector (IdAD, NombreAD)
Dirección (IdPelícula, IdAD)
Actuación (IdPelícula, IdAD)
Función (IdCine, NumeroSala, IdPelícula, Fecha, Horario)
*/
/* Ejercicio 1
Listar nombre de todas las zonas que tiene el cine con nombre "Cinema La Plata"
*/
SELECT z.NombreZona
FROM Zona Z INNER JOIN Cine C ON z.IdZona = c.IdZona
WHERE c.nombre = "Cinema La Plata"
/*
Ejercicio 2
Listar titulo, género y duración de las películas con año 2017
*/
SELECT p.Titulo, p.Género, p.Duración
FROM Película p
WHERE p.año = 2017
/*
Ejercicio 3
Listar el Nombre y Ubicación de todos los cines de la zona “Quilmes” que tengan función
para la película “Temporada de Caza”. Dicho listado deberá estar ordenado por Nombre
*/
SELECT c.NombreCine, c.Ubicación
FROM Zona z INNER JOIN Cine c ON z.IdZona = c.IdZona
			INNER JOIN Función f ON c.IdCine = f.IdCine
			INNER JOIN Película p ON f.IdPelícula = p.IdPelícula
WHERE z.NombreZona = "Quilmes" AND p.Titulo = "Temporada de Caza"
ORDER BY c.NombreCine
/*
Ejercicio 4
Listar el Título, Calificación y Sinopsis de todas las películas en las que actúe ‘Vin Diesel’ y
sean dirigidas por algún director cuyo nombre comience la cadena “Alfred”. Dicho listado
deberá estar ordenado por Título
*/
SELECT p.Titulo, p.Calificación, p.Sinopsis
FROM   Película p INNER JOIN Dirección d ON p.IdPelícula = d.IdPelícula
				  INNER JOIN ActorDirector ad ON d.IdAD = ad.IdAD 
WHERE	ad.NombreAD LIKE "Alfred%" AND EXISTS
	 (	SELECT *
	 	FROM Actuación a INNER JOIN ActorDirector ad2 ON a.IdAD = ad2.IdAD
	 	WHERE ad2.NombreAD = "Vin Diesel"
		)
ORDER BY p.Titulo
/*
Ejercicio 5
Listar el Nombre y Ubicación de aquellos cines que tengan función para la película ‘Logan’ y
no tengan funciones para ‘Liga de la Justicia’
-Utilizo DISTINCT porque tuplas con el mismo cine van a aparecer
*/
SELECT DISTINCT c.NombreCine, c.Ubicación
FROM 	Cine c INNER JOIN Función f ON c.IdCine = f.IdCine
			   INNER JOIN Película p ON f.IdPelícula on p.IdPelícula
WHERE	p.Titulo = "Logan" AND NOT EXISTS
		(SELECT *
		 FROM Cine c2 INNER JOIN Función f2 ON c.IdCine = f.IdCine
			   		  INNER JOIN Película p2 ON f.IdPelícula on p.IdPelícula
		 WHERE p.Titulo = "Liga de la Justicia" AND c2.IdCine = c.IdCine
		 )
/*
Ejercicio 6
Listar los Títulos de las películas que tengan función en todas las zonas
*/
SELECT p.Titulo
FROM   Película p 
WHERE  NOT EXISTS(
		SELECT *
		FROM Función f 
		WHERE NOT EXISTS(
			SELECT *
			FROM Cine
			WHERE 
			)
		)
/*
Ejercicio 7
Listar el Nombre y Ubicación de aquellos cines que tengan función a lo sumo para 6
películas diferentes. Dicho listado deberá estar ordenado por Nombre en forma descendente
*/
SELECT c.NombreCine, c.Ubicación
FROM Cine c INNER JOIN Función f ON c.IdCine = f.IdCine
			INNER JOIN Película p ON f.IdPelícula = p.IdPelícula
GROUP BY c.NombreCine, c.Ubicación
HAVING COUNT(DISTINCT p.IdPelícula) > 6
ORDER BY c.NombreCine DESC
/*
Ejercicio 8
Listar el Nombre y Ubicación de aquellos cines que tengan función más de 3 funciones para
una misma película
*/
SELECT c.NombreCine, c.Ubicación
FROM Cine c INNER JOIN Función f ON c.IdCine = f.IdCine
			INNER JOIN Película p ON f.IdPelícula = p.IdPelícula
WHERE p.IdPelícula IN (
			SELECT p2.IdPelícula
			FROM   Película p2 INNER JOIN Función f2 ON p2.IdPelícula = f2.IdPelícula
			GROUP BY f2.IdPelícula
			HAVING COUNT(*) < 3
			)
/*
Ejercicio 9
Listar la cantidad de cines distintos en las que se exhibe cada película y proyectar además el
titulo de la misma. Dicho listado deberá estar ordenado por cantidad en orden descendente
*/
SELECT p.Titulo,COUNT(DISTINCT c.NombreCine)
FROM Cine c INNER JOIN Función f ON c.IdCine = f.IdCine
			INNER JOIN Película p ON f.IdPelícula = p.IdPelícula
GROUP BY p.Titulo
ORDER BY COUNT(DISTINCT c.NombreCine) DESC
/*
Ejercicio 10
Listar para cada cine que cantidad de películas distintas se exhiben. Informar nombre de cine
y la cantidad respectiva. Dicho listado deberá estar ordenado por cine y cantidad desc.
*/
SELECT c.NombreCine, COUNT(DISTINCT p.Titulo)
FROM Cine c INNER JOIN Función f ON c.IdCine = f.IdCine
			INNER JOIN Película p ON f.IdPelícula = p.IdPelícula
GROUP BY c.NombreCine
ORDER BY c.NombreCine, <COUNT(DISTINCT c.NombreCine) DESC