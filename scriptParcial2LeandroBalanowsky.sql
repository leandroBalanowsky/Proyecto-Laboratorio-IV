USE [master]
GO
/****** Object:  Database [Parcial2]    Script Date: 6/11/2020 23:41:53 ******/
CREATE DATABASE [Parcial2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Parcial2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Parcial2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Parcial2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Parcial2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Parcial2] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Parcial2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Parcial2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Parcial2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Parcial2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Parcial2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Parcial2] SET ARITHABORT OFF 
GO
ALTER DATABASE [Parcial2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Parcial2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Parcial2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Parcial2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Parcial2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Parcial2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Parcial2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Parcial2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Parcial2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Parcial2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Parcial2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Parcial2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Parcial2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Parcial2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Parcial2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Parcial2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Parcial2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Parcial2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Parcial2] SET  MULTI_USER 
GO
ALTER DATABASE [Parcial2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Parcial2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Parcial2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Parcial2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Parcial2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Parcial2] SET QUERY_STORE = OFF
GO
USE [Parcial2]
GO
/****** Object:  Table [dbo].[Comercios]    Script Date: 6/11/2020 23:41:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comercios](
	[idComercio] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Descripcion] [varchar](500) NOT NULL,
	[Direccion] [varchar](100) NOT NULL,
	[idRubro] [int] NOT NULL,
	[imgComercio] [varchar](500) NOT NULL,
 CONSTRAINT [PK_Comercios] PRIMARY KEY CLUSTERED 
(
	[idComercio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comentarios]    Script Date: 6/11/2020 23:41:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comentarios](
	[idComentario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Mensaje] [varchar](500) NOT NULL,
	[idComercio] [int] NOT NULL,
	[idValoracion] [int] NOT NULL,
 CONSTRAINT [PK_Comentarios] PRIMARY KEY CLUSTERED 
(
	[idComentario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_comercioComentario]    Script Date: 6/11/2020 23:41:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_comercioComentario] as
Select c. idComercio, c.Nombre, count(*) AS 'CantiComentarios'
from Comercios c join comentarios com on c.idComercio = com.idComercio
group by c.idComercio, c.Nombre
GO
/****** Object:  Table [dbo].[Respuestas]    Script Date: 6/11/2020 23:41:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Respuestas](
	[idRespuesta] [int] IDENTITY(1,1) NOT NULL,
	[Respuesta] [varchar](500) NOT NULL,
	[idComentario] [int] NOT NULL,
 CONSTRAINT [PK_Respuestas] PRIMARY KEY CLUSTERED 
(
	[idRespuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_comentSinResp]    Script Date: 6/11/2020 23:41:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_comentSinResp] as
Select idComentario, com.Nombre, Mensaje, c.idComercio, c.Nombre as 'Comercio'
from Comentarios com join Comercios c on com.idComercio = c.idComercio
where idComentario not in ( select idComentario from Respuestas)
GO
/****** Object:  Table [dbo].[Valoracion]    Script Date: 6/11/2020 23:41:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Valoracion](
	[idValoracion] [int] NOT NULL,
	[Descripcion] [varchar](15) NOT NULL,
	[Valor] [int] NULL,
 CONSTRAINT [PK_Valoracion] PRIMARY KEY CLUSTERED 
(
	[idValoracion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rubros]    Script Date: 6/11/2020 23:41:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rubros](
	[idRubro] [int] IDENTITY(1,1) NOT NULL,
	[rubro] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Rubros] PRIMARY KEY CLUSTERED 
(
	[idRubro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_promValoracion]    Script Date: 6/11/2020 23:41:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_promValoracion] as
select c.idComercio, c.Nombre, Rubro, avg(Valor) as 'promEstrellas'
from Comercios c join Comentarios com on c.idComercio = com.idComercio
join Valoracion v on com.idValoracion = v.idValoracion join rubros r on r.idRubro = c.idRubro
group by c.idComercio, c.Nombre, Rubro
GO
/****** Object:  View [dbo].[v_cantidadPorValoracion]    Script Date: 6/11/2020 23:41:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_cantidadPorValoracion] as
select descripcion, count(*) 'cantidad'
from Valoracion v join Comentarios c on v.idValoracion = c.idValoracion
group by Descripcion
GO
/****** Object:  Table [dbo].[Administrador]    Script Date: 6/11/2020 23:41:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administrador](
	[idAdministrador] [int] NOT NULL,
	[Usuario] [varchar](10) NOT NULL,
	[Password] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idAdministrador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ofertas]    Script Date: 6/11/2020 23:41:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ofertas](
	[idOfertas] [int] IDENTITY(1,1) NOT NULL,
	[Producto] [varchar](100) NOT NULL,
	[idComercio] [int] NOT NULL,
	[Precio] [float] NOT NULL,
	[imgProducto] [varchar](50) NULL,
 CONSTRAINT [PK_ofertas] PRIMARY KEY CLUSTERED 
(
	[idOfertas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Administrador] ([idAdministrador], [Usuario], [Password]) VALUES (1, N'admin', N'12345')
GO
SET IDENTITY_INSERT [dbo].[Comentarios] ON 

INSERT [dbo].[Comentarios] ([idComentario], [Nombre], [Mensaje], [idComercio], [idValoracion]) VALUES (16, N'Leandro', N'Excelente servicio', 4, 4)
INSERT [dbo].[Comentarios] ([idComentario], [Nombre], [Mensaje], [idComercio], [idValoracion]) VALUES (17, N'Jose', N'Comercio conocido del barrio! recomendado', 4, 4)
INSERT [dbo].[Comentarios] ([idComentario], [Nombre], [Mensaje], [idComercio], [idValoracion]) VALUES (18, N'Juan', N'Este comercio es excelente', 6, 5)
INSERT [dbo].[Comentarios] ([idComentario], [Nombre], [Mensaje], [idComercio], [idValoracion]) VALUES (19, N'Horacio', N'Bastante decente', 4, 3)
INSERT [dbo].[Comentarios] ([idComentario], [Nombre], [Mensaje], [idComercio], [idValoracion]) VALUES (20, N'Margarita', N'No me puedo Quejar!!!', 4, 5)
INSERT [dbo].[Comentarios] ([idComentario], [Nombre], [Mensaje], [idComercio], [idValoracion]) VALUES (21, N'Jonathan', N'Siempre me trataron muy bien!! gracias', 4, 6)
INSERT [dbo].[Comentarios] ([idComentario], [Nombre], [Mensaje], [idComercio], [idValoracion]) VALUES (22, N'Anonimo', N'Muy mala atencion de parte de sus empleados!!! ', 5, 2)
INSERT [dbo].[Comentarios] ([idComentario], [Nombre], [Mensaje], [idComercio], [idValoracion]) VALUES (23, N'Oscar', N'Excelente', 5, 1)
INSERT [dbo].[Comentarios] ([idComentario], [Nombre], [Mensaje], [idComercio], [idValoracion]) VALUES (24, N'Jose', N'La mejor Promocion!!!', 6, 6)
INSERT [dbo].[Comentarios] ([idComentario], [Nombre], [Mensaje], [idComercio], [idValoracion]) VALUES (25, N'Anonimo', N'Me llego la comida friaaaaa', 2004, 2)
INSERT [dbo].[Comentarios] ([idComentario], [Nombre], [Mensaje], [idComercio], [idValoracion]) VALUES (26, N'Roberto', N'Bastante pobre la porcion', 2004, 1)
INSERT [dbo].[Comentarios] ([idComentario], [Nombre], [Mensaje], [idComercio], [idValoracion]) VALUES (27, N'Mariela', N'Comida decente... zafa', 2004, 4)
INSERT [dbo].[Comentarios] ([idComentario], [Nombre], [Mensaje], [idComercio], [idValoracion]) VALUES (28, N'Josefa', N'La mejor carne de la zona! La recomiendo', 2005, 6)
INSERT [dbo].[Comentarios] ([idComentario], [Nombre], [Mensaje], [idComercio], [idValoracion]) VALUES (29, N'Mariela', N'Muy buena atencion! recomendados', 2005, 4)
INSERT [dbo].[Comentarios] ([idComentario], [Nombre], [Mensaje], [idComercio], [idValoracion]) VALUES (30, N'Francesca', N'Muy buena variedad de productos', 8, 5)
INSERT [dbo].[Comentarios] ([idComentario], [Nombre], [Mensaje], [idComercio], [idValoracion]) VALUES (31, N'Leandro', N'Excelente Atencion!', 8, 1)
INSERT [dbo].[Comentarios] ([idComentario], [Nombre], [Mensaje], [idComercio], [idValoracion]) VALUES (32, N'Franco', N'Un almacen de barrio! como los de toda la vida', 8, 6)
SET IDENTITY_INSERT [dbo].[Comentarios] OFF
GO
SET IDENTITY_INSERT [dbo].[Comercios] ON 

INSERT [dbo].[Comercios] ([idComercio], [Nombre], [Descripcion], [Direccion], [idRubro], [imgComercio]) VALUES (4, N'MaxiKiosco la 4', N'maxi kiosco hubicado en calle eduardo newbery', N'Eduardo newbery 25', 1028, N'MaxiKiosco la 4kiosco-960x578_0.jpg')
INSERT [dbo].[Comercios] ([idComercio], [Nombre], [Descripcion], [Direccion], [idRubro], [imgComercio]) VALUES (5, N'Farmacity', N'Farmacia muy importante de cordoba capital, de larga trayectoria en el rubro', N'Avenida siempre viva 2412', 1029, N'Farmacityfarmacity-620x381.jpg')
INSERT [dbo].[Comercios] ([idComercio], [Nombre], [Descripcion], [Direccion], [idRubro], [imgComercio]) VALUES (6, N'Atalaya Gym', N'Gimnasio de barrio, con la mas alta tecnologia en el rubro', N'Av. Las Malvinas 2847', 1029, N'Atalaya Gymgim.jpg')
INSERT [dbo].[Comercios] ([idComercio], [Nombre], [Descripcion], [Direccion], [idRubro], [imgComercio]) VALUES (8, N'Almacen Los dos hermanos', N'Almacen de ramas generales', N'Los Alamos 584', 1028, N'Almacen Los dos hermanosresize_1581630427.jpg')
INSERT [dbo].[Comercios] ([idComercio], [Nombre], [Descripcion], [Direccion], [idRubro], [imgComercio]) VALUES (2004, N'Baldomero Comida Rapida', N'Establecimiento de venta de comida rapida, excelente variedad', N'Tomas de Alfonzi 4726', 1027, N'default.jpg')
INSERT [dbo].[Comercios] ([idComercio], [Nombre], [Descripcion], [Direccion], [idRubro], [imgComercio]) VALUES (2005, N'Carniceria Don Osvaldo', N'Carniceria con productos de primera calidad', N'Unquillo 3215', 1034, N'Carniceria Don Osvaldo3d4009a1ba3.jpg')
SET IDENTITY_INSERT [dbo].[Comercios] OFF
GO
SET IDENTITY_INSERT [dbo].[ofertas] ON 

INSERT [dbo].[ofertas] ([idOfertas], [Producto], [idComercio], [Precio], [imgProducto]) VALUES (2, N'Leche Sancor 1lt', 4, 65.2, N'Leche Sancor 1lt3261846_f.jpg')
INSERT [dbo].[ofertas] ([idOfertas], [Producto], [idComercio], [Precio], [imgProducto]) VALUES (2004, N'2x1 mes de Diciembre', 6, 800, N'2x1 mes de Diciembre2x1.jpg')
INSERT [dbo].[ofertas] ([idOfertas], [Producto], [idComercio], [Precio], [imgProducto]) VALUES (2005, N'Queso la paulina x100gr', 4, 35.4, N'Queso la paulina x100gr2505311000001_01.jpg')
INSERT [dbo].[ofertas] ([idOfertas], [Producto], [idComercio], [Precio], [imgProducto]) VALUES (2006, N'Jabon dove x3', 4, 75.25, N'Jabon dove x3jabon.jpg')
INSERT [dbo].[ofertas] ([idOfertas], [Producto], [idComercio], [Precio], [imgProducto]) VALUES (2007, N'Arroz mandisovi x 1kg', 4, 40.5, N'Arroz mandisovi x 1kg128.jpg')
INSERT [dbo].[ofertas] ([idOfertas], [Producto], [idComercio], [Precio], [imgProducto]) VALUES (2008, N'Pure de tomate molto x250gr', 4, 30, N'Pure de tomate molto x250grimages.jpg')
INSERT [dbo].[ofertas] ([idOfertas], [Producto], [idComercio], [Precio], [imgProducto]) VALUES (2009, N'Jabon micelar dove ', 5, 58.6, N'Jabon micelar dove 7891150057470.jpg')
INSERT [dbo].[ofertas] ([idOfertas], [Producto], [idComercio], [Precio], [imgProducto]) VALUES (2012, N'Toallitas femeninas ladysoft 16u', 5, 190, N'Toallitas femeninas ladysoft 16utoallas-n-a.jpg')
INSERT [dbo].[ofertas] ([idOfertas], [Producto], [idComercio], [Precio], [imgProducto]) VALUES (2013, N'Perfume kevin ', 5, 500.6, N'Perfume kevin 7000441-4678.jpg')
INSERT [dbo].[ofertas] ([idOfertas], [Producto], [idComercio], [Precio], [imgProducto]) VALUES (2014, N'perfume loewe', 5, 1500, N'perfume loewe526971.jpg')
INSERT [dbo].[ofertas] ([idOfertas], [Producto], [idComercio], [Precio], [imgProducto]) VALUES (2015, N'Alcohol en gel merthiolate', 5, 48.5, N'Alcohol en gel merthiolate7791984000218.jpg')
INSERT [dbo].[ofertas] ([idOfertas], [Producto], [idComercio], [Precio], [imgProducto]) VALUES (2016, N'Leche La Lacteo 1lt', 8, 45.6, N'Leche La Lacteo 1lt983d2b85d.jpg')
INSERT [dbo].[ofertas] ([idOfertas], [Producto], [idComercio], [Precio], [imgProducto]) VALUES (2017, N'Papas 2kg', 8, 90, N'Papas 2kgcomida.jpg')
INSERT [dbo].[ofertas] ([idOfertas], [Producto], [idComercio], [Precio], [imgProducto]) VALUES (2018, N'Aceite canuelas', 8, 100, N'Aceite canuelas00050520.jpg')
INSERT [dbo].[ofertas] ([idOfertas], [Producto], [idComercio], [Precio], [imgProducto]) VALUES (2019, N'Pizza especial', 2004, 350, N'Pizza especialpizza-esa.jpg')
INSERT [dbo].[ofertas] ([idOfertas], [Producto], [idComercio], [Precio], [imgProducto]) VALUES (2020, N'Hamburguesa baldomero', 2004, 450, N'Hamburguesa baldomerohambura.jpg')
INSERT [dbo].[ofertas] ([idOfertas], [Producto], [idComercio], [Precio], [imgProducto]) VALUES (2021, N'Lomito xxxl', 4, 500, N'Lomito xxxlimages.jpg')
INSERT [dbo].[ofertas] ([idOfertas], [Producto], [idComercio], [Precio], [imgProducto]) VALUES (2022, N'Lomito xxl', 2004, 600.5, N'Lomito xxl03_Jun3.jpg')
INSERT [dbo].[ofertas] ([idOfertas], [Producto], [idComercio], [Precio], [imgProducto]) VALUES (2023, N'Carne Nalga 1kg', 2005, 480, N'Nalga 1kgNalgaffdgdfg.jpg')
INSERT [dbo].[ofertas] ([idOfertas], [Producto], [idComercio], [Precio], [imgProducto]) VALUES (2024, N'carne Bola de lomo 1kg', 2005, 550, N'Bola de lomo 1kgmilanesa-de-.jpg')
INSERT [dbo].[ofertas] ([idOfertas], [Producto], [idComercio], [Precio], [imgProducto]) VALUES (2025, N'Chorizo de cerdo 1kg', 2005, 275, N'Chorizo de cerdo 1kg3400576_f.jpg')
INSERT [dbo].[ofertas] ([idOfertas], [Producto], [idComercio], [Precio], [imgProducto]) VALUES (2026, N'Carne picada 1 kg', 2005, 420, N'Carne picada 1 kgcarne-picada.jpg')
SET IDENTITY_INSERT [dbo].[ofertas] OFF
GO
SET IDENTITY_INSERT [dbo].[Respuestas] ON 

INSERT [dbo].[Respuestas] ([idRespuesta], [Respuesta], [idComentario]) VALUES (11, N'Muchas gracias!!', 16)
INSERT [dbo].[Respuestas] ([idRespuesta], [Respuesta], [idComentario]) VALUES (12, N'Estamos a tu disposicion si necesitas hablar!!', 19)
INSERT [dbo].[Respuestas] ([idRespuesta], [Respuesta], [idComentario]) VALUES (13, N'Gracias a Ustedes!', 16)
INSERT [dbo].[Respuestas] ([idRespuesta], [Respuesta], [idComentario]) VALUES (14, N'Ckiente ejemplar!', 21)
INSERT [dbo].[Respuestas] ([idRespuesta], [Respuesta], [idComentario]) VALUES (15, N'Por favor comuniquese con nosotros a ver como podemos ayudarla', 22)
INSERT [dbo].[Respuestas] ([idRespuesta], [Respuesta], [idComentario]) VALUES (16, N'Gracias por confiar!', 24)
INSERT [dbo].[Respuestas] ([idRespuesta], [Respuesta], [idComentario]) VALUES (17, N'Gracias!', 28)
INSERT [dbo].[Respuestas] ([idRespuesta], [Respuesta], [idComentario]) VALUES (18, N'Gracias', 31)
INSERT [dbo].[Respuestas] ([idRespuesta], [Respuesta], [idComentario]) VALUES (19, N'Gracias genio!!', 32)
SET IDENTITY_INSERT [dbo].[Respuestas] OFF
GO
SET IDENTITY_INSERT [dbo].[Rubros] ON 

INSERT [dbo].[Rubros] ([idRubro], [rubro]) VALUES (1027, N'Gastronomia')
INSERT [dbo].[Rubros] ([idRubro], [rubro]) VALUES (1028, N'Almacen')
INSERT [dbo].[Rubros] ([idRubro], [rubro]) VALUES (1029, N'Cuidado Personal')
INSERT [dbo].[Rubros] ([idRubro], [rubro]) VALUES (1034, N'Carniceria')
SET IDENTITY_INSERT [dbo].[Rubros] OFF
GO
INSERT [dbo].[Valoracion] ([idValoracion], [Descripcion], [Valor]) VALUES (1, N'No aplica', NULL)
INSERT [dbo].[Valoracion] ([idValoracion], [Descripcion], [Valor]) VALUES (2, N'1 Estrella', 1)
INSERT [dbo].[Valoracion] ([idValoracion], [Descripcion], [Valor]) VALUES (3, N'2 Estrellas', 2)
INSERT [dbo].[Valoracion] ([idValoracion], [Descripcion], [Valor]) VALUES (4, N'3 Estrellas', 3)
INSERT [dbo].[Valoracion] ([idValoracion], [Descripcion], [Valor]) VALUES (5, N'4 Estrellas', 4)
INSERT [dbo].[Valoracion] ([idValoracion], [Descripcion], [Valor]) VALUES (6, N'5 Estrellas', 5)
GO
ALTER TABLE [dbo].[Comentarios]  WITH CHECK ADD  CONSTRAINT [FK_Comentarios_Comercios] FOREIGN KEY([idComercio])
REFERENCES [dbo].[Comercios] ([idComercio])
GO
ALTER TABLE [dbo].[Comentarios] CHECK CONSTRAINT [FK_Comentarios_Comercios]
GO
ALTER TABLE [dbo].[Comentarios]  WITH CHECK ADD  CONSTRAINT [FK_Comentarios_Valoracion] FOREIGN KEY([idValoracion])
REFERENCES [dbo].[Valoracion] ([idValoracion])
GO
ALTER TABLE [dbo].[Comentarios] CHECK CONSTRAINT [FK_Comentarios_Valoracion]
GO
ALTER TABLE [dbo].[Comercios]  WITH CHECK ADD  CONSTRAINT [FK_Comercios_Rubros] FOREIGN KEY([idRubro])
REFERENCES [dbo].[Rubros] ([idRubro])
GO
ALTER TABLE [dbo].[Comercios] CHECK CONSTRAINT [FK_Comercios_Rubros]
GO
ALTER TABLE [dbo].[ofertas]  WITH CHECK ADD  CONSTRAINT [FK_ofertas_Comercios] FOREIGN KEY([idComercio])
REFERENCES [dbo].[Comercios] ([idComercio])
GO
ALTER TABLE [dbo].[ofertas] CHECK CONSTRAINT [FK_ofertas_Comercios]
GO
ALTER TABLE [dbo].[Respuestas]  WITH CHECK ADD  CONSTRAINT [FK_Respuestas_Comentarios] FOREIGN KEY([idComentario])
REFERENCES [dbo].[Comentarios] ([idComentario])
GO
ALTER TABLE [dbo].[Respuestas] CHECK CONSTRAINT [FK_Respuestas_Comentarios]
GO
USE [master]
GO
ALTER DATABASE [Parcial2] SET  READ_WRITE 
GO
