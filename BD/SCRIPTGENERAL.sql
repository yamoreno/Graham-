USE [master]
GO
/****** Object:  Database [Graham ]    Script Date: 08/03/2020 22:16:43 ******/
CREATE DATABASE [Graham ]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Graham', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Graham .mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Graham _log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Graham _log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Graham ] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Graham ].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Graham ] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Graham ] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Graham ] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Graham ] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Graham ] SET ARITHABORT OFF 
GO
ALTER DATABASE [Graham ] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Graham ] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Graham ] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Graham ] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Graham ] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Graham ] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Graham ] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Graham ] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Graham ] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Graham ] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Graham ] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Graham ] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Graham ] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Graham ] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Graham ] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Graham ] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Graham ] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Graham ] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Graham ] SET  MULTI_USER 
GO
ALTER DATABASE [Graham ] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Graham ] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Graham ] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Graham ] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Graham ] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Graham ]
GO
/****** Object:  UserDefinedFunction [dbo].[FunGetPromedio]    Script Date: 08/03/2020 22:16:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[FunGetPromedio] 
(
	-- Add the parameters for the function here
	@IdParametro int
)
RETURNS decimal(3,2)
AS
BEGIN
	declare @res decimal(3,2) ;

    SELECT @res = SUM(NTO.Nota)  / count(NTO.Nota)
     FROM  [dbo].[Nota] NTO WHERE NTO.IdMateria = @IdParametro

	-- Return the result of the function
	RETURN @res

END

GO
/****** Object:  Table [dbo].[Nota]    Script Date: 08/03/2020 22:16:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nota](
	[IdNota] [int] NOT NULL,
	[IdMateria] [int] NOT NULL,
	[Nota] [decimal](3, 2) NOT NULL,
	[FechaNota] [datetime] NOT NULL,
 CONSTRAINT [PK_Nota] PRIMARY KEY CLUSTERED 
(
	[IdNota] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[P_Alumno]    Script Date: 08/03/2020 22:16:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[P_Alumno](
	[IdAlumno] [int] IDENTITY(1,1) NOT NULL,
	[Identificacion] [varchar](20) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[FechaIngreso] [datetime] NOT NULL,
 CONSTRAINT [PK_P_ALUMNO] PRIMARY KEY CLUSTERED 
(
	[IdAlumno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[P_AlumnoCarrera]    Script Date: 08/03/2020 22:16:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[P_AlumnoCarrera](
	[IdAlumno] [int] NOT NULL,
	[IdCarrera] [int] NOT NULL,
 CONSTRAINT [PK_P_AlumnoCarrera] PRIMARY KEY CLUSTERED 
(
	[IdAlumno] ASC,
	[IdCarrera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[P_Carrera]    Script Date: 08/03/2020 22:16:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[P_Carrera](
	[IdCarrera] [int] NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
 CONSTRAINT [PK_P_CARRERA] PRIMARY KEY CLUSTERED 
(
	[IdCarrera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[P_CarreraMateria]    Script Date: 08/03/2020 22:16:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[P_CarreraMateria](
	[IdCarrera] [int] NOT NULL,
	[IdSemestre] [int] NOT NULL,
	[IdMateria] [int] NOT NULL,
 CONSTRAINT [PK_P_CarreraMateria] PRIMARY KEY CLUSTERED 
(
	[IdCarrera] ASC,
	[IdMateria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[P_Materia]    Script Date: 08/03/2020 22:16:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[P_Materia](
	[IdMateria] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
 CONSTRAINT [PK_P_Materia] PRIMARY KEY CLUSTERED 
(
	[IdMateria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[P_Semestre]    Script Date: 08/03/2020 22:16:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[P_Semestre](
	[IdSemestre] [int] NOT NULL,
	[Nombre] [varchar](10) NOT NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_P_Semestre] PRIMARY KEY CLUSTERED 
(
	[IdSemestre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[View_ListaAlumnos]    Script Date: 08/03/2020 22:16:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_ListaAlumnos]
AS
SELECT        TOP (100) PERCENT IdAlumno, Identificacion, FechaIngreso, Nombre
FROM            dbo.P_Alumno
ORDER BY FechaIngreso

GO
/****** Object:  View [dbo].[View_ListaPromedio]    Script Date: 08/03/2020 22:16:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*Lista de Materias promedio*/
CREATE VIEW [dbo].[View_ListaPromedio]
AS
SELECT        TOP (100) PERCENT A.Identificacion, A.Nombre AS Alumno, C.Nombre AS Carrera, M.IdMateria, M.Nombre AS Materia, NOTA.Nota, dbo.FunGetPromedio(NOTA.IdMateria) AS Promedio
FROM            dbo.P_Alumno AS A INNER JOIN
                         dbo.P_AlumnoCarrera AS AC ON AC.IdAlumno = A.IdAlumno INNER JOIN
                         dbo.P_Carrera AS C ON C.IdCarrera = AC.IdCarrera INNER JOIN
                         dbo.P_CarreraMateria AS CM ON C.IdCarrera = CM.IdCarrera INNER JOIN
                         dbo.P_Materia AS M ON M.IdMateria = CM.IdMateria INNER JOIN
                         dbo.P_Semestre AS S ON S.IdSemestre = CM.IdSemestre INNER JOIN
                         dbo.Nota AS NOTA ON NOTA.IdMateria = M.IdMateria
ORDER BY CM.IdMateria

GO
/****** Object:  View [dbo].[View_MateriaActiva]    Script Date: 08/03/2020 22:16:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_MateriaActiva]
AS
SELECT        A.Identificacion, A.Nombre AS Alumno, C.Nombre AS Carrera, M.IdMateria, M.Nombre AS Materia
FROM            dbo.P_Alumno AS A INNER JOIN
                         dbo.P_AlumnoCarrera AS AC ON AC.IdAlumno = A.IdAlumno INNER JOIN
                         dbo.P_Carrera AS C ON C.IdCarrera = AC.IdCarrera INNER JOIN
                         dbo.P_CarreraMateria AS CM ON C.IdCarrera = CM.IdCarrera INNER JOIN
                         dbo.P_Materia AS M ON M.IdMateria = CM.IdMateria INNER JOIN
                         dbo.P_Semestre AS S ON S.IdSemestre = CM.IdSemestre
WHERE        (S.Activo = 1)

GO
INSERT [dbo].[Nota] ([IdNota], [IdMateria], [Nota], [FechaNota]) VALUES (1, 1, CAST(4.00 AS Decimal(3, 2)), CAST(N'2020-03-08 00:00:00.000' AS DateTime))
INSERT [dbo].[Nota] ([IdNota], [IdMateria], [Nota], [FechaNota]) VALUES (2, 4, CAST(3.00 AS Decimal(3, 2)), CAST(N'2020-03-08 00:00:00.000' AS DateTime))
INSERT [dbo].[Nota] ([IdNota], [IdMateria], [Nota], [FechaNota]) VALUES (3, 1, CAST(3.50 AS Decimal(3, 2)), CAST(N'2020-03-08 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[P_Alumno] ON 

INSERT [dbo].[P_Alumno] ([IdAlumno], [Identificacion], [Nombre], [FechaIngreso]) VALUES (1, N'80117939', N'YIMY ALEXANDER MORENO', CAST(N'2020-03-08 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[P_Alumno] OFF
INSERT [dbo].[P_AlumnoCarrera] ([IdAlumno], [IdCarrera]) VALUES (1, 1)
INSERT [dbo].[P_Carrera] ([IdCarrera], [Nombre]) VALUES (1, N'INGENIERIA DE SISTEMAS')
INSERT [dbo].[P_Carrera] ([IdCarrera], [Nombre]) VALUES (2, N'CONTADURIA')
INSERT [dbo].[P_CarreraMateria] ([IdCarrera], [IdSemestre], [IdMateria]) VALUES (1, 1, 1)
INSERT [dbo].[P_CarreraMateria] ([IdCarrera], [IdSemestre], [IdMateria]) VALUES (1, 1, 4)
INSERT [dbo].[P_CarreraMateria] ([IdCarrera], [IdSemestre], [IdMateria]) VALUES (1, 1, 5)
SET IDENTITY_INSERT [dbo].[P_Materia] ON 

INSERT [dbo].[P_Materia] ([IdMateria], [Nombre]) VALUES (1, N'INGLES I')
INSERT [dbo].[P_Materia] ([IdMateria], [Nombre]) VALUES (4, N'INGENIERIA I')
INSERT [dbo].[P_Materia] ([IdMateria], [Nombre]) VALUES (5, N'TGS')
SET IDENTITY_INSERT [dbo].[P_Materia] OFF
INSERT [dbo].[P_Semestre] ([IdSemestre], [Nombre], [Activo]) VALUES (1, N'PRIMERO', 1)
INSERT [dbo].[P_Semestre] ([IdSemestre], [Nombre], [Activo]) VALUES (2, N'SEGUNDO', 0)
INSERT [dbo].[P_Semestre] ([IdSemestre], [Nombre], [Activo]) VALUES (3, N'TERCERO', 0)
INSERT [dbo].[P_Semestre] ([IdSemestre], [Nombre], [Activo]) VALUES (4, N'CUARTO', 0)
INSERT [dbo].[P_Semestre] ([IdSemestre], [Nombre], [Activo]) VALUES (5, N'QUINTO', 0)
INSERT [dbo].[P_Semestre] ([IdSemestre], [Nombre], [Activo]) VALUES (6, N'SEXTO', 0)
INSERT [dbo].[P_Semestre] ([IdSemestre], [Nombre], [Activo]) VALUES (7, N'SEPTIMO', 0)
INSERT [dbo].[P_Semestre] ([IdSemestre], [Nombre], [Activo]) VALUES (8, N'OCTAVO', 0)
INSERT [dbo].[P_Semestre] ([IdSemestre], [Nombre], [Activo]) VALUES (9, N'NOVENO', 0)
INSERT [dbo].[P_Semestre] ([IdSemestre], [Nombre], [Activo]) VALUES (10, N'DECIMO', 0)
/****** Object:  Index [IX_P_AlumnoCarrera]    Script Date: 08/03/2020 22:16:43 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_P_AlumnoCarrera] ON [dbo].[P_AlumnoCarrera]
(
	[IdAlumno] ASC,
	[IdCarrera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_P_CarreraMateria]    Script Date: 08/03/2020 22:16:43 ******/
ALTER TABLE [dbo].[P_CarreraMateria] ADD  CONSTRAINT [IX_P_CarreraMateria] UNIQUE NONCLUSTERED 
(
	[IdCarrera] ASC,
	[IdMateria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Nota]  WITH CHECK ADD  CONSTRAINT [FK_Nota_P_Materia] FOREIGN KEY([IdMateria])
REFERENCES [dbo].[P_Materia] ([IdMateria])
GO
ALTER TABLE [dbo].[Nota] CHECK CONSTRAINT [FK_Nota_P_Materia]
GO
ALTER TABLE [dbo].[P_AlumnoCarrera]  WITH CHECK ADD  CONSTRAINT [FK_P_AlumnoCarrera_P_Alumno] FOREIGN KEY([IdAlumno])
REFERENCES [dbo].[P_Alumno] ([IdAlumno])
GO
ALTER TABLE [dbo].[P_AlumnoCarrera] CHECK CONSTRAINT [FK_P_AlumnoCarrera_P_Alumno]
GO
ALTER TABLE [dbo].[P_AlumnoCarrera]  WITH CHECK ADD  CONSTRAINT [FK_P_AlumnoCarrera_P_Carrera] FOREIGN KEY([IdCarrera])
REFERENCES [dbo].[P_Carrera] ([IdCarrera])
GO
ALTER TABLE [dbo].[P_AlumnoCarrera] CHECK CONSTRAINT [FK_P_AlumnoCarrera_P_Carrera]
GO
ALTER TABLE [dbo].[P_CarreraMateria]  WITH CHECK ADD  CONSTRAINT [FK_P_CarreraMateria_P_Carrera] FOREIGN KEY([IdCarrera])
REFERENCES [dbo].[P_Carrera] ([IdCarrera])
GO
ALTER TABLE [dbo].[P_CarreraMateria] CHECK CONSTRAINT [FK_P_CarreraMateria_P_Carrera]
GO
ALTER TABLE [dbo].[P_CarreraMateria]  WITH CHECK ADD  CONSTRAINT [FK_P_CarreraMateria_P_Materia] FOREIGN KEY([IdMateria])
REFERENCES [dbo].[P_Materia] ([IdMateria])
GO
ALTER TABLE [dbo].[P_CarreraMateria] CHECK CONSTRAINT [FK_P_CarreraMateria_P_Materia]
GO
ALTER TABLE [dbo].[P_CarreraMateria]  WITH CHECK ADD  CONSTRAINT [FK_P_CarreraMateria_P_Semestre] FOREIGN KEY([IdSemestre])
REFERENCES [dbo].[P_Semestre] ([IdSemestre])
GO
ALTER TABLE [dbo].[P_CarreraMateria] CHECK CONSTRAINT [FK_P_CarreraMateria_P_Semestre]
GO
/****** Object:  StoredProcedure [dbo].[PA_Alumno_Consultar]    Script Date: 08/03/2020 22:16:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PA_Alumno_Consultar]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    ---LISTA DE ALUMNOS POR FECHA DEINGRESO
SELECT [IdAlumno], [Identificacion],[Nombre] ,[FechaIngreso] 
FROM [dbo].[P_Alumno] 
ORDER BY FechaIngreso 
END

GO
/****** Object:  StoredProcedure [dbo].[PA_MateriasActivas_Consultar]    Script Date: 08/03/2020 22:16:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PA_MateriasActivas_Consultar]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

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

END

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "P_Alumno"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 247
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_ListaAlumnos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_ListaAlumnos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "A"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 247
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AC"
            Begin Extent = 
               Top = 6
               Left = 285
               Bottom = 102
               Right = 494
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "C"
            Begin Extent = 
               Top = 6
               Left = 532
               Bottom = 102
               Right = 741
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CM"
            Begin Extent = 
               Top = 6
               Left = 779
               Bottom = 119
               Right = 988
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "M"
            Begin Extent = 
               Top = 102
               Left = 285
               Bottom = 198
               Right = 494
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "S"
            Begin Extent = 
               Top = 102
               Left = 532
               Bottom = 215
               Right = 741
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "NOTA"
            Begin Extent = 
               Top = 120
               Left = 779
               Bottom = 250
               Right = 988
            End
            DisplayFlags = 280
            TopColumn = 0
         En' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_ListaPromedio'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'd
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_ListaPromedio'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_ListaPromedio'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "A"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 247
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AC"
            Begin Extent = 
               Top = 6
               Left = 285
               Bottom = 102
               Right = 494
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "C"
            Begin Extent = 
               Top = 6
               Left = 532
               Bottom = 102
               Right = 741
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CM"
            Begin Extent = 
               Top = 6
               Left = 779
               Bottom = 119
               Right = 988
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "M"
            Begin Extent = 
               Top = 102
               Left = 285
               Bottom = 198
               Right = 494
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "S"
            Begin Extent = 
               Top = 102
               Left = 532
               Bottom = 215
               Right = 741
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
      ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_MateriaActiva'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'   Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_MateriaActiva'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_MateriaActiva'
GO
USE [master]
GO
ALTER DATABASE [Graham ] SET  READ_WRITE 
GO
