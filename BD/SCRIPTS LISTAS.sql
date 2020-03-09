
---LISTA DE ALUMNOS POR FECHA DEINGRESO
SELECT [IdAlumno], [Identificacion],[Nombre] ,[FechaIngreso] 
FROM [dbo].[P_Alumno] 
ORDER BY FechaIngreso 

--Lista de Materias Activas
SELECT a.Identificacion , A.Nombre AS Alumno, C.Nombre AS Carrera,
 m.IdMateria ,M.Nombre AS Materia
FROM [dbo].[P_Alumno] A
INNER JOIN [dbo].[P_AlumnoCarrera] AC ON AC.IdAlumno = A.IdAlumno
INNER JOIN [dbo].[P_Carrera] C ON C.IdCarrera = AC.IdCarrera
INNER JOIN [dbo].[P_CarreraMateria] CM ON C.IdCarrera =  CM.IdCarrera
INNER JOIN [dbo].[P_Materia] M ON M.IdMateria = CM.IdMateria
INNER JOIN [dbo].[P_Semestre] S ON S.IdSemestre = CM.IdSemestre 
where s.Activo= 1

---Alumnos por numero de Identificación
SELECT [IdAlumno], [Identificacion],[Nombre] ,[FechaIngreso] 
FROM [dbo].[P_Alumno] 
WHERE Identificacion = '80117939'

--Lista de Materias POR nombre minimo 4 caracteres
SELECT a.Identificacion , A.Nombre AS Alumno, C.Nombre AS Carrera,
 m.IdMateria ,M.Nombre AS Materia
FROM [dbo].[P_Alumno] A
INNER JOIN [dbo].[P_AlumnoCarrera] AC ON AC.IdAlumno = A.IdAlumno
INNER JOIN [dbo].[P_Carrera] C ON C.IdCarrera = AC.IdCarrera
INNER JOIN [dbo].[P_CarreraMateria] CM ON C.IdCarrera =  CM.IdCarrera
INNER JOIN [dbo].[P_Materia] M ON M.IdMateria = CM.IdMateria
INNER JOIN [dbo].[P_Semestre] S ON S.IdSemestre = CM.IdSemestre 
where  M.Nombre like '%tgs%'

	--Lista de Materias promedio
	SELECT a.Identificacion , A.Nombre AS Alumno, C.Nombre AS Carrera,
	 m.IdMateria ,M.Nombre AS Materia, NOTA.Nota, 
	[dbo].[FunGetPromedio](NOTA.IdMateria) as Promedio
	FROM [dbo].[P_Alumno] A
	INNER JOIN [dbo].[P_AlumnoCarrera] AC ON AC.IdAlumno = A.IdAlumno
	INNER JOIN [dbo].[P_Carrera] C ON C.IdCarrera = AC.IdCarrera
	INNER JOIN [dbo].[P_CarreraMateria] CM ON C.IdCarrera =  CM.IdCarrera
	INNER JOIN [dbo].[P_Materia] M ON M.IdMateria = CM.IdMateria
	INNER JOIN [dbo].[P_Semestre] S ON S.IdSemestre = CM.IdSemestre 
	inner join [dbo].[Nota] NOTA ON NOTA.IdMateria = M.IdMateria
	ORDER BY IdMateria




