USE [master]
GO
/****** Object:  Database [BDAlbum]    Script Date: 19/11/2023 12:40:12 ******/
CREATE DATABASE [BDAlbum]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BDAlbum', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\BDAlbum.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BDAlbum_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\BDAlbum_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BDAlbum] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BDAlbum].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BDAlbum] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BDAlbum] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BDAlbum] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BDAlbum] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BDAlbum] SET ARITHABORT OFF 
GO
ALTER DATABASE [BDAlbum] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BDAlbum] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BDAlbum] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BDAlbum] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BDAlbum] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BDAlbum] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BDAlbum] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BDAlbum] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BDAlbum] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BDAlbum] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BDAlbum] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BDAlbum] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BDAlbum] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BDAlbum] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BDAlbum] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BDAlbum] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BDAlbum] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BDAlbum] SET RECOVERY FULL 
GO
ALTER DATABASE [BDAlbum] SET  MULTI_USER 
GO
ALTER DATABASE [BDAlbum] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BDAlbum] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BDAlbum] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BDAlbum] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BDAlbum] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BDAlbum] SET QUERY_STORE = OFF
GO
USE [BDAlbum]
GO
/****** Object:  Table [dbo].[Album]    Script Date: 19/11/2023 12:40:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Album](
	[IdAlbum] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
 CONSTRAINT [PK_Album] PRIMARY KEY CLUSTERED 
(
	[IdAlbum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AlbumXFigus]    Script Date: 19/11/2023 12:40:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlbumXFigus](
	[IdAlbum] [int] NOT NULL,
	[IdFigurita] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipo]    Script Date: 19/11/2023 12:40:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipo](
	[IdEquipo] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Insigna] [varchar](100) NULL,
	[Imagen] [varchar](500) NULL,
 CONSTRAINT [PK_Equipo] PRIMARY KEY CLUSTERED 
(
	[IdEquipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Figuritas]    Script Date: 19/11/2023 12:40:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Figuritas](
	[IdFigurita] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[ImagenJugador] [varchar](500) NULL,
	[Tipo] [varchar](50) NOT NULL,
	[Precio] [int] NOT NULL,
	[Numero] [int] NOT NULL,
	[IdEquipo] [int] NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Figuritas] PRIMARY KEY CLUSTERED 
(
	[IdFigurita] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventario]    Script Date: 19/11/2023 12:40:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventario](
	[IdInventario] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
 CONSTRAINT [PK_Inventario] PRIMARY KEY CLUSTERED 
(
	[IdInventario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InventarioXFigus]    Script Date: 19/11/2023 12:40:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventarioXFigus](
	[IdInventario] [int] NOT NULL,
	[IdFigurita] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sobres]    Script Date: 19/11/2023 12:40:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sobres](
	[IdSobre] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Foto] [varchar](100) NOT NULL,
	[Valor] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Fecha_Fin] [int] NULL,
	[Descripcion] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Sobres] PRIMARY KEY CLUSTERED 
(
	[IdSobre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 19/11/2023 12:40:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Contraseña] [varchar](500) NOT NULL,
	[Email] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Album] ON 

INSERT [dbo].[Album] ([IdAlbum], [IdUsuario]) VALUES (2, 4)
SET IDENTITY_INSERT [dbo].[Album] OFF
GO
SET IDENTITY_INSERT [dbo].[Equipo] ON 

INSERT [dbo].[Equipo] ([IdEquipo], [Nombre], [Insigna], [Imagen]) VALUES (1, N'Diarco United', N'.', N'.')
INSERT [dbo].[Equipo] ([IdEquipo], [Nombre], [Insigna], [Imagen]) VALUES (2, N'Cantera', N'.', N'.')
INSERT [dbo].[Equipo] ([IdEquipo], [Nombre], [Insigna], [Imagen]) VALUES (3, N'Almagro', N'.', N'.')
INSERT [dbo].[Equipo] ([IdEquipo], [Nombre], [Insigna], [Imagen]) VALUES (4, N'Sancionados', N'.', N'.')
INSERT [dbo].[Equipo] ([IdEquipo], [Nombre], [Insigna], [Imagen]) VALUES (5, N'Leyendas', N'.', N'.')
SET IDENTITY_INSERT [dbo].[Equipo] OFF
GO
SET IDENTITY_INSERT [dbo].[Figuritas] ON 

INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (1, N'escudo diarco', N'.', N'Brillante', 2, 0, 1, N'Diarquito')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (2, N'Axel', N'.', N'Brillante', 2, 1, 1, N'Kleiman')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (3, N'Nicolas', N'.', N'Comun', 1, 2, 1, N'Becherman')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (4, N'Julian', N'.', N'Comun', 1, 3, 1, N'Wegman')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (5, N'Matias', N'.', N'Brillante', 2, 4, 1, N'Mata')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (6, N'Federico', N'.', N'Comun', 1, 5, 1, N'Zoberman')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (7, N'Ivan', N'.', N'Comun', 1, 6, 1, N'Latascheff')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (8, N'Federico', N'.', N'Comun', 1, 7, 1, N'Liberman')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (9, N'Nicolas', N'.', N'Comun', 1, 8, 1, N'Reifut')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (10, N'Tobias', N'.', N'Comun', 1, 9, 1, N'Zaselsky')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (11, N'Facundo', N'.', N'Comun', 1, 10, 1, N'Yuzefoff')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (12, N'escudo cantera', N'.', N'Brillante', 2, 11, 2, N'Cantera')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (13, N'Tomas', N'.', N'Brillante', 2, 12, 2, N'Barrot')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (14, N'Bautista', N'.', N'Comun', 1, 13, 2, N'Galucci')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (15, N'Santino', N'.', N'Comun', 1, 14, 2, N'Vaccaro')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (16, N'Nicolas', N'.', N'Comun', 1, 15, 2, N'Luna')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (17, N'Juani', N'.', N'Comun', 1, 16, 2, N'Pelucci')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (18, N'Martin', N'.', N'Brillante', 2, 17, 2, N'MNR')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (19, N'Escudo Almagro', N'.', N'Brillante', 2, 18, 3, N'Almagro')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (20, N'Joaquin', N'.', N'Comun', 1, 19, 3, N'Lasca')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (21, N'Lucas', N'.', N'Comun', 1, 20, 3, N'Rozenbaum')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (22, N'Rama', N'.', N'Comun', 1, 21, 3, N'Kwon')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (23, N'Martin', N'.', N'Comun', 1, 22, 3, N'Aran')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (24, N'Tomas', N'.', N'Comun', 1, 23, 3, N'Lerman')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (25, N'escudo sancionados', N'.', N'Brillante', 2, 24, 4, N'Sancionados')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (26, N'Lucas "YOLO"', N'.', N'Brillante', 2, 25, 4, N'Dercie')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (27, N'Ian', N'.', N'Comun', 1, 26, 4, N'Levin')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (28, N'Ian', N'.', N'Comun', 1, 27, 4, N'Roitman')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (29, N'Tomas', N'.', N'Comun', 1, 28, 4, N'Chernuzca')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (30, N'Lucas', N'.', N'Comun', 1, 29, 4, N'Yucovsky')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (31, N'Thiago', N'.', N'Comun', 1, 30, 4, N'Palacci')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (32, N'LEYENDAS', N'.', N'Brillante', 5, 31, 5, N'LEGENDS')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (33, N'Tincho', N'.', N'Leyenda', 5, 32, 5, N'Reifut')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (34, N'Pablo', N'.', N'Leyenda', 5, 33, 5, N'de hielo')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (35, N'cañete', N'.', N'Leyenda', 5, 34, 5, N'balon de oro')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (36, N'MATA', N'.', N'Leyenda', 5, 35, 5, N' ')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (37, N'yuco', N'.', N'Leyenda', 5, 36, 5, N'primer arco en cero')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (38, N'Nicolas', N'.', N'Leyenda', 5, 37, 5, N'Parga')
SET IDENTITY_INSERT [dbo].[Figuritas] OFF
GO
SET IDENTITY_INSERT [dbo].[Inventario] ON 

INSERT [dbo].[Inventario] ([IdInventario], [IdUsuario]) VALUES (1, 4)
SET IDENTITY_INSERT [dbo].[Inventario] OFF
GO
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (1, 35)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (1, 38)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (1, 5)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (1, 3)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (1, 12)
GO
SET IDENTITY_INSERT [dbo].[Sobres] ON 

INSERT [dbo].[Sobres] ([IdSobre], [Nombre], [Foto], [Valor], [Cantidad], [Fecha_Fin], [Descripcion]) VALUES (1, N'Gratis', N'.', 2, 2, 4, N'Este sobre gratis estara disponible cada 4 minutos. Adentro contendra dos figuritas.')
INSERT [dbo].[Sobres] ([IdSobre], [Nombre], [Foto], [Valor], [Cantidad], [Fecha_Fin], [Descripcion]) VALUES (2, N'Normal', N'.', 4, 4, NULL, N'Este sobre tiene un valor de 4 monedas. Adentro contendra 4 figuritas.')
INSERT [dbo].[Sobres] ([IdSobre], [Nombre], [Foto], [Valor], [Cantidad], [Fecha_Fin], [Descripcion]) VALUES (3, N'Premium', N'.', 8, 6, NULL, N'Este tiene un valor de 8 monedas. Adentro contendra 6 figuritas.')
SET IDENTITY_INSERT [dbo].[Sobres] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([IdUsuario], [Nombre], [Contraseña], [Email]) VALUES (4, N'Nicolas', N'Contraseña', N'NicoGmail')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre], [Contraseña], [Email]) VALUES (5, N'Ivo', N'River', N'SoyNico@gmail')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre], [Contraseña], [Email]) VALUES (6, N'benja', N'fornite', N'SoyNico@gmail')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre], [Contraseña], [Email]) VALUES (7, N'axel', N'boca', N'SoyNico@gmail')
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
ALTER TABLE [dbo].[Album]  WITH CHECK ADD  CONSTRAINT [FK_Album_Usuario1] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Album] CHECK CONSTRAINT [FK_Album_Usuario1]
GO
ALTER TABLE [dbo].[AlbumXFigus]  WITH CHECK ADD  CONSTRAINT [FK_AlbumXFigus_Album] FOREIGN KEY([IdAlbum])
REFERENCES [dbo].[Album] ([IdAlbum])
GO
ALTER TABLE [dbo].[AlbumXFigus] CHECK CONSTRAINT [FK_AlbumXFigus_Album]
GO
ALTER TABLE [dbo].[AlbumXFigus]  WITH CHECK ADD  CONSTRAINT [FK_AlbumXFigus_Figuritas] FOREIGN KEY([IdFigurita])
REFERENCES [dbo].[Figuritas] ([IdFigurita])
GO
ALTER TABLE [dbo].[AlbumXFigus] CHECK CONSTRAINT [FK_AlbumXFigus_Figuritas]
GO
ALTER TABLE [dbo].[Figuritas]  WITH CHECK ADD  CONSTRAINT [FK_Figuritas_Equipo] FOREIGN KEY([IdEquipo])
REFERENCES [dbo].[Equipo] ([IdEquipo])
GO
ALTER TABLE [dbo].[Figuritas] CHECK CONSTRAINT [FK_Figuritas_Equipo]
GO
ALTER TABLE [dbo].[InventarioXFigus]  WITH CHECK ADD  CONSTRAINT [FK_InventarioXFigus_Figuritas] FOREIGN KEY([IdFigurita])
REFERENCES [dbo].[Figuritas] ([IdFigurita])
GO
ALTER TABLE [dbo].[InventarioXFigus] CHECK CONSTRAINT [FK_InventarioXFigus_Figuritas]
GO
ALTER TABLE [dbo].[InventarioXFigus]  WITH CHECK ADD  CONSTRAINT [FK_InventarioXFigus_Inventario] FOREIGN KEY([IdInventario])
REFERENCES [dbo].[Inventario] ([IdInventario])
GO
ALTER TABLE [dbo].[InventarioXFigus] CHECK CONSTRAINT [FK_InventarioXFigus_Inventario]
GO
/****** Object:  StoredProcedure [dbo].[AbrirSobre]    Script Date: 19/11/2023 12:40:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[AbrirSobre]
	@user int
as
begin
	create table #TempResults (
        IdFigurita INT,
		Nombre varchar(50),
		ImagenJugador varchar(500),
		Tipo varchar(50),
		Precio int,
		Numero [int],
		IdEquipo int,
		Apellido varchar(50)
    );

    insert into #TempResults
    exec ConseguirFigurita @user;

    insert into #TempResults
    exec ConseguirFigurita @user;

    insert into #TempResults
    exec ConseguirFigurita @user;

    select * from #TempResults;

    drop table #TempResults;

end
GO
/****** Object:  StoredProcedure [dbo].[ConseguirFigurita]    Script Date: 19/11/2023 12:40:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[ConseguirFigurita]
	@user int
as
begin
	declare @numRand int = (SELECT ROUND(((37 - 0) * RAND() + 0), 0))

	select * from Figuritas where Numero = @numRand

	insert into InventarioXFigus(IdInventario, IdFigurita) Values((select IdInventario from Inventario where IdUsuario = @user), (select IdFigurita from Figuritas where Numero = @numRand))
end

GO
/****** Object:  StoredProcedure [dbo].[GetUsuario]    Script Date: 19/11/2023 12:40:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[GetUsuario]
@usuario varchar(50)
as
begin

select * from Usuario where Nombre=@usuario;


end
GO
/****** Object:  StoredProcedure [dbo].[GetUsuarioById]    Script Date: 19/11/2023 12:40:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[GetUsuarioById]
	@user int
as
begin
	select * from Usuario where IdUsuario = @user
end
GO
/****** Object:  StoredProcedure [dbo].[LoginUsuario]    Script Date: 19/11/2023 12:40:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LoginUsuario]
@NombreUsuario varchar(50),
@Contraseña varchar(500)
AS
BEGIN
declare @contraseñacorrecta varchar(100) /*declaro lo que necesito para comparar*/

SELECT @contraseñacorrecta = Contraseña from Usuario where Nombre=@NombreUsuario  /*le doy un valor*/

if (@Contraseña=@contraseñacorrecta) /*la comparo con el parametro ingresado*/
begin
print 'true'
SELECT 1 /*true*/
end

ELSE 
begin 
print 'False'
SELECT 0/*false*/
end

END;
GO
/****** Object:  StoredProcedure [dbo].[obtenerInventario]    Script Date: 19/11/2023 12:40:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[obtenerInventario]
	@user int
as
begin
	select F.IdFigurita, F.Nombre, F.ImagenJugador, F.Tipo, F.Precio, F.Numero, F.IdEquipo, F.Apellido from Figuritas F
	inner join InventarioXFigus ixf on ixf.IdFigurita = F.IdFigurita
	inner join Inventario I on I.IdInventario = ixf.IdInventario
	inner join Usuario U on U.IdUsuario = I.IdUsuario
	where U.IdUsuario = @user
end

GO
/****** Object:  StoredProcedure [dbo].[RegistrarseUsuario]    Script Date: 19/11/2023 12:40:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RegistrarseUsuario]
@NombreUsuario varchar(50),
@Contraseña varchar(500),
@Email varchar(100)
AS
BEGIN
if not exists (SELECT * FROM Usuario where Nombre = @NombreUsuario)/*nos aseguramos que NO exista ese nombre de usuario*/
begin 
insert into Usuario(Nombre,Contraseña,Email) values (@NombreUsuario,@Contraseña,@Email)/*Si no existe lo insertamos*/
end

Else
Begin
return 'El nombre de usuario ya se encuentra en uso'
end

END;
GO
/****** Object:  StoredProcedure [dbo].[SP_CambiarContraseña]    Script Date: 19/11/2023 12:40:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CambiarContraseña]
@usuario varchar(100), @contraseña varchar(100)
as
begin

if not exists (select * from Usuario where Nombre=@usuario)
begin
	select -1
end
else
begin

	UPDATE Usuario set Contraseña = @contraseña where Nombre=@usuario
	select 1
end
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_Repetidas]    Script Date: 19/11/2023 12:40:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Repetidas]
@IdAlbum int
AS
BEGIN
SELECT F.Nombre, F.Apellido, COUNT(F.IdFigurita) AS Cantidad FROM Figuritas F INNER JOIN AlbumXFigus FG ON F.IdFigurita = FG.IdFigurita INNER JOIN Album A ON A.IdAlbum = FG.IdAlbum INNER JOIN Equipo E ON F.IdEquipo = E.IdEquipo GROUP BY E.Nombre, F.Nombre,F.Apellido, F.Numero, E.IdEquipo,FG.IdAlbum HAVING COUNT(F.IdFigurita)>1 and FG.IdAlbum = @IdAlbum ORDER BY Cantidad DESC 
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_SepararFiguritasPorEquipo]    Script Date: 19/11/2023 12:40:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_SepararFiguritasPorEquipo]
@IdAlbum int
AS
BEGIN
SELECT F.Nombre, F.Apellido FROM Figuritas F INNER JOIN AlbumXFigus FG ON F.IdFigurita = FG.IdFigurita INNER JOIN Album A ON A.IdAlbum = FG.IdAlbum INNER JOIN Equipo E ON F.IdEquipo = E.IdEquipo WHERE FG.IdAlbum = @IdAlbum GROUP BY E.Nombre, F.Nombre,F.Apellido, F.Numero, E.IdEquipo ORDER BY E.IdEquipo ASC, F.Numero 
END;

EXEC SP_SepararFiguritasPorEquipo '2'
GO
USE [master]
GO
ALTER DATABASE [BDAlbum] SET  READ_WRITE 
GO
