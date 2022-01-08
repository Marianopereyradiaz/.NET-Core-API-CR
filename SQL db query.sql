USE [master]
GO

/****** Object:  Database [final]    Script Date: 5/12/2021 17:14:52 ******/
CREATE DATABASE [final]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'final', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\final.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'final_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\final_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [final].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [final] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [final] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [final] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [final] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [final] SET ARITHABORT OFF 
GO

ALTER DATABASE [final] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [final] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [final] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [final] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [final] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [final] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [final] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [final] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [final] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [final] SET  DISABLE_BROKER 
GO

ALTER DATABASE [final] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [final] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [final] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [final] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [final] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [final] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [final] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [final] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [final] SET  MULTI_USER 
GO

ALTER DATABASE [final] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [final] SET DB_CHAINING OFF 
GO

ALTER DATABASE [final] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [final] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [final] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [final] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO

ALTER DATABASE [final] SET QUERY_STORE = OFF
GO

ALTER DATABASE [final] SET  READ_WRITE 
GO


USE [final]
GO

/****** Object:  Table [dbo].[medicos]    Script Date: 5/12/2021 17:15:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[medicos](
	[id_medico] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](100) NOT NULL,
 CONSTRAINT [PK_medicos] PRIMARY KEY CLUSTERED 
(
	[id_medico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [final]
GO

/****** Object:  Table [dbo].[telefonos]    Script Date: 5/12/2021 17:16:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[telefonos](
	[id_telefono] [int] IDENTITY(1,1) NOT NULL,
	[num_telefono] [varchar](50) NULL,
	[id_medico] [int] NOT NULL,
 CONSTRAINT [PK_telefonos] PRIMARY KEY CLUSTERED 
(
	[id_telefono] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[telefonos]  WITH CHECK ADD  CONSTRAINT [FK_telefonos_medicos] FOREIGN KEY([id_medico])
REFERENCES [dbo].[medicos] ([id_medico])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[telefonos] CHECK CONSTRAINT [FK_telefonos_medicos]
GO

USE [final]
GO

/****** Object:  Table [dbo].[titulos]    Script Date: 5/12/2021 17:16:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[titulos](
	[id_titulo] [int] IDENTITY(1,1) NOT NULL,
	[nombre_titulo] [varchar](200) NOT NULL,
 CONSTRAINT [PK_titulos] PRIMARY KEY CLUSTERED 
(
	[id_titulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


USE [final]
GO

/****** Object:  Table [dbo].[formaciones]    Script Date: 5/12/2021 17:17:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[formaciones](
	[id_formacion] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [datetime] NULL,
	[lugar] [varchar](100) NOT NULL,
	[id_medico] [int] NOT NULL,
	[id_titulo] [int] NOT NULL,
 CONSTRAINT [PK_formaciones] PRIMARY KEY CLUSTERED 
(
	[id_formacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[formaciones]  WITH CHECK ADD  CONSTRAINT [FK_formaciones_medicos] FOREIGN KEY([id_medico])
REFERENCES [dbo].[medicos] ([id_medico])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[formaciones] CHECK CONSTRAINT [FK_formaciones_medicos]
GO

ALTER TABLE [dbo].[formaciones]  WITH CHECK ADD  CONSTRAINT [FK_formaciones_titulos] FOREIGN KEY([id_titulo])
REFERENCES [dbo].[titulos] ([id_titulo])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[formaciones] CHECK CONSTRAINT [FK_formaciones_titulos]
GO

USE [final]
GO

/****** Object:  Table [dbo].[especialidades]    Script Date: 5/12/2021 17:17:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[especialidades](
	[id_especialidad] [int] IDENTITY(1,1) NOT NULL,
	[nombre_especialidad] [varchar](100) NOT NULL,
 CONSTRAINT [PK_especialidades] PRIMARY KEY CLUSTERED 
(
	[id_especialidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


USE [final]
GO

/****** Object:  Table [dbo].[especialidades_medicos]    Script Date: 5/12/2021 17:17:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[especialidades_medicos](
	[id_especialidad_medico] [int] IDENTITY(1,1) NOT NULL,
	[id_medico] [int] NOT NULL,
	[id_especialidad] [int] NOT NULL,
 CONSTRAINT [PK_especialidades_medicos] PRIMARY KEY CLUSTERED 
(
	[id_especialidad_medico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[especialidades_medicos]  WITH CHECK ADD  CONSTRAINT [FK_especialidades_medicos_especialidades] FOREIGN KEY([id_especialidad])
REFERENCES [dbo].[especialidades] ([id_especialidad])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[especialidades_medicos] CHECK CONSTRAINT [FK_especialidades_medicos_especialidades]
GO

ALTER TABLE [dbo].[especialidades_medicos]  WITH CHECK ADD  CONSTRAINT [FK_especialidades_medicos_medicos] FOREIGN KEY([id_medico])
REFERENCES [dbo].[medicos] ([id_medico])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[especialidades_medicos] CHECK CONSTRAINT [FK_especialidades_medicos_medicos]
GO

USE [final]
GO

/****** Object:  Table [dbo].[emails]    Script Date: 5/12/2021 17:17:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[emails](
	[id_email] [int] IDENTITY(1,1) NOT NULL,
	[mail] [varchar](100) NULL,
	[id_medico] [int] NOT NULL,
 CONSTRAINT [PK_emails] PRIMARY KEY CLUSTERED 
(
	[id_email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[emails]  WITH CHECK ADD  CONSTRAINT [FK_emails_medicos] FOREIGN KEY([id_medico])
REFERENCES [dbo].[medicos] ([id_medico])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[emails] CHECK CONSTRAINT [FK_emails_medicos]
GO


USE [final]
GO

/****** Object:  Table [dbo].[domicilios]    Script Date: 5/12/2021 17:18:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[domicilios](
	[id_domicilio] [int] IDENTITY(1,1) NOT NULL,
	[nombre_domicilio] [varchar](50) NOT NULL,
	[num_consultorio] [int] NULL,
	[id_medico] [int] NOT NULL,
 CONSTRAINT [PK_domicilios] PRIMARY KEY CLUSTERED 
(
	[id_domicilio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[domicilios]  WITH CHECK ADD  CONSTRAINT [FK_domicilios_medicos] FOREIGN KEY([id_medico])
REFERENCES [dbo].[medicos] ([id_medico])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[domicilios] CHECK CONSTRAINT [FK_domicilios_medicos]
GO




