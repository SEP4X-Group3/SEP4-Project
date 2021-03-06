USE [master]
GO
/****** Object:  Database [sep4]    Script Date: 01/06/2022 22.10.23 ******/
CREATE DATABASE [sep4]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'sep4', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\sep4.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'sep4_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\sep4_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [sep4] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [sep4].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [sep4] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [sep4] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [sep4] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [sep4] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [sep4] SET ARITHABORT OFF 
GO
ALTER DATABASE [sep4] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [sep4] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [sep4] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [sep4] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [sep4] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [sep4] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [sep4] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [sep4] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [sep4] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [sep4] SET  DISABLE_BROKER 
GO
ALTER DATABASE [sep4] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [sep4] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [sep4] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [sep4] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [sep4] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [sep4] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [sep4] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [sep4] SET RECOVERY FULL 
GO
ALTER DATABASE [sep4] SET  MULTI_USER 
GO
ALTER DATABASE [sep4] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [sep4] SET DB_CHAINING OFF 
GO
ALTER DATABASE [sep4] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [sep4] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [sep4] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [sep4] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'sep4', N'ON'
GO
ALTER DATABASE [sep4] SET QUERY_STORE = OFF
GO
USE [sep4]
GO
/****** Object:  Schema [edw]    Script Date: 01/06/2022 22.10.24 ******/
CREATE SCHEMA [edw]
GO
/****** Object:  Schema [Stage]    Script Date: 01/06/2022 22.10.24 ******/
CREATE SCHEMA [Stage]
GO
/****** Object:  Table [edw].[co2]    Script Date: 01/06/2022 22.10.24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [edw].[co2](
	[id] [bigint] NOT NULL,
	[co2] [float] NOT NULL,
	[max] [float] NULL,
	[TRIAL020] [char](1) NULL,
 CONSTRAINT [co2_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [edw].co2
DROP COLUMN TRIAL020;


/****** Object:  Table [edw].[humidity]    Script Date: 01/06/2022 22.10.24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [edw].[humidity](
	[id] [bigint] NOT NULL,
	[humidity] [float] NOT NULL,
	[max] [float] NULL,
	[TRIAL027] [char](1) NULL,
 CONSTRAINT [humidity_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [edw].humidity
DROP COLUMN TRIAL027;
/****** Object:  Table [edw].[metrics]    Script Date: 01/06/2022 22.10.24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [edw].[metrics](
	[id] [bigint] NOT NULL,
	[time] [datetime] NULL,
	[co2_id] [bigint] NULL,
	[humidity_id] [bigint] NULL,
	[room] [bigint] NULL,
	[temperature_id] [bigint] NULL,
	[TRIAL157] [char](1) NULL,
 CONSTRAINT [metrics_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [edw].metrics
DROP COLUMN TRIAL157;


/****** Object:  Table [edw].[room]    Script Date: 01/06/2022 22.10.24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [edw].[room](
	[id] [bigint] NOT NULL,
	[name] [varchar](255) NULL,
	[number] [int] NULL,
	[building_id] [bigint] NULL,
	[TRIAL161] [char](1) NULL,
 CONSTRAINT [room_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [edw].room
DROP COLUMN TRIAL161;

/****** Object:  Table [edw].[temperature]    Script Date: 01/06/2022 22.10.24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [edw].[temperature](
	[id] [bigint] NOT NULL,
	[max] [float] NULL,
	[temperature] [float] NOT NULL,
	[TRIAL167] [char](1) NULL,
 CONSTRAINT [temperature_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [edw].temperature
DROP COLUMN TRIAL167;  

/****** Object:  Table [Stage].[co2]    Script Date: 01/06/2022 22.10.24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Stage].[co2](
	[co2_id] [int] NOT NULL,
	[co2] [int] NULL,
	[max] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Stage].[humidity]    Script Date: 01/06/2022 22.10.24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Stage].[humidity](
	[humidity_id] [int] NOT NULL,
	[humidity] [float] NULL,
	[max] [float] NULL,
 CONSTRAINT [PK_humidity] PRIMARY KEY CLUSTERED 
(
	[humidity_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Stage].[metrics]    Script Date: 01/06/2022 22.10.24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Stage].[metrics](
	[id] [int] NULL,
	[co2_id] [int] NULL,
	[humidity_id] [int] NULL,
	[temperature_id] [int] NULL,
	[room_id] [int] NULL,
	[Time] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Stage].[room]    Script Date: 01/06/2022 22.10.24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Stage].[room](
	[room_id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
	[number] [int] NULL,
 CONSTRAINT [PK_room] PRIMARY KEY CLUSTERED 
(
	[room_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Stage].[temperature]    Script Date: 01/06/2022 22.10.24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Stage].[temperature](
	[temperature_id] [int] NOT NULL,
	[temperature] [float] NULL,
	[max] [float] NULL,
 CONSTRAINT [PK_D_Temperature] PRIMARY KEY CLUSTERED 
(
	[temperature_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [edw].[metrics]  WITH CHECK ADD  CONSTRAINT [fk4c78wny2xgpk3ne0as2ac3peh] FOREIGN KEY([temperature_id])
REFERENCES [edw].[temperature] ([id])
GO
ALTER TABLE [edw].[metrics] CHECK CONSTRAINT [fk4c78wny2xgpk3ne0as2ac3peh]
GO
ALTER TABLE [edw].[metrics]  WITH CHECK ADD  CONSTRAINT [fk6vvyel7jg8jpfqtwecjx9whby] FOREIGN KEY([humidity_id])
REFERENCES [edw].[humidity] ([id])
GO
ALTER TABLE [edw].[metrics] CHECK CONSTRAINT [fk6vvyel7jg8jpfqtwecjx9whby]
GO
ALTER TABLE [edw].[metrics]  WITH CHECK ADD  CONSTRAINT [fkd6qar925rl31oxn91yd600fbd] FOREIGN KEY([room])
REFERENCES [edw].[room] ([id])
GO
ALTER TABLE [edw].[metrics] CHECK CONSTRAINT [fkd6qar925rl31oxn91yd600fbd]
GO
ALTER TABLE [edw].[metrics]  WITH CHECK ADD  CONSTRAINT [fkkcfvyukh6v1krh8acn8majmh8] FOREIGN KEY([co2_id])
REFERENCES [edw].[co2] ([id])
GO
ALTER TABLE [edw].[metrics] CHECK CONSTRAINT [fkkcfvyukh6v1krh8acn8majmh8]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TRIAL' , @level0type=N'SCHEMA',@level0name=N'edw', @level1type=N'TABLE',@level1name=N'co2', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TRIAL' , @level0type=N'SCHEMA',@level0name=N'edw', @level1type=N'TABLE',@level1name=N'co2', @level2type=N'COLUMN',@level2name=N'co2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TRIAL' , @level0type=N'SCHEMA',@level0name=N'edw', @level1type=N'TABLE',@level1name=N'co2', @level2type=N'COLUMN',@level2name=N'max'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TRIAL' , @level0type=N'SCHEMA',@level0name=N'edw', @level1type=N'TABLE',@level1name=N'co2', @level2type=N'COLUMN',@level2name=N'TRIAL020'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TRIAL' , @level0type=N'SCHEMA',@level0name=N'edw', @level1type=N'TABLE',@level1name=N'co2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TRIAL' , @level0type=N'SCHEMA',@level0name=N'edw', @level1type=N'TABLE',@level1name=N'humidity', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TRIAL' , @level0type=N'SCHEMA',@level0name=N'edw', @level1type=N'TABLE',@level1name=N'humidity', @level2type=N'COLUMN',@level2name=N'humidity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TRIAL' , @level0type=N'SCHEMA',@level0name=N'edw', @level1type=N'TABLE',@level1name=N'humidity', @level2type=N'COLUMN',@level2name=N'max'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TRIAL' , @level0type=N'SCHEMA',@level0name=N'edw', @level1type=N'TABLE',@level1name=N'humidity', @level2type=N'COLUMN',@level2name=N'TRIAL027'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TRIAL' , @level0type=N'SCHEMA',@level0name=N'edw', @level1type=N'TABLE',@level1name=N'humidity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TRIAL' , @level0type=N'SCHEMA',@level0name=N'edw', @level1type=N'TABLE',@level1name=N'metrics', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TRIAL' , @level0type=N'SCHEMA',@level0name=N'edw', @level1type=N'TABLE',@level1name=N'metrics', @level2type=N'COLUMN',@level2name=N'time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TRIAL' , @level0type=N'SCHEMA',@level0name=N'edw', @level1type=N'TABLE',@level1name=N'metrics', @level2type=N'COLUMN',@level2name=N'co2_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TRIAL' , @level0type=N'SCHEMA',@level0name=N'edw', @level1type=N'TABLE',@level1name=N'metrics', @level2type=N'COLUMN',@level2name=N'humidity_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TRIAL' , @level0type=N'SCHEMA',@level0name=N'edw', @level1type=N'TABLE',@level1name=N'metrics', @level2type=N'COLUMN',@level2name=N'room'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TRIAL' , @level0type=N'SCHEMA',@level0name=N'edw', @level1type=N'TABLE',@level1name=N'metrics', @level2type=N'COLUMN',@level2name=N'temperature_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TRIAL' , @level0type=N'SCHEMA',@level0name=N'edw', @level1type=N'TABLE',@level1name=N'metrics', @level2type=N'COLUMN',@level2name=N'TRIAL157'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TRIAL' , @level0type=N'SCHEMA',@level0name=N'edw', @level1type=N'TABLE',@level1name=N'metrics'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TRIAL' , @level0type=N'SCHEMA',@level0name=N'edw', @level1type=N'TABLE',@level1name=N'room', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TRIAL' , @level0type=N'SCHEMA',@level0name=N'edw', @level1type=N'TABLE',@level1name=N'room', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TRIAL' , @level0type=N'SCHEMA',@level0name=N'edw', @level1type=N'TABLE',@level1name=N'room', @level2type=N'COLUMN',@level2name=N'number'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TRIAL' , @level0type=N'SCHEMA',@level0name=N'edw', @level1type=N'TABLE',@level1name=N'room', @level2type=N'COLUMN',@level2name=N'building_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TRIAL' , @level0type=N'SCHEMA',@level0name=N'edw', @level1type=N'TABLE',@level1name=N'room', @level2type=N'COLUMN',@level2name=N'TRIAL161'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TRIAL' , @level0type=N'SCHEMA',@level0name=N'edw', @level1type=N'TABLE',@level1name=N'room'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TRIAL' , @level0type=N'SCHEMA',@level0name=N'edw', @level1type=N'TABLE',@level1name=N'temperature', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TRIAL' , @level0type=N'SCHEMA',@level0name=N'edw', @level1type=N'TABLE',@level1name=N'temperature', @level2type=N'COLUMN',@level2name=N'max'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TRIAL' , @level0type=N'SCHEMA',@level0name=N'edw', @level1type=N'TABLE',@level1name=N'temperature', @level2type=N'COLUMN',@level2name=N'temperature'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TRIAL' , @level0type=N'SCHEMA',@level0name=N'edw', @level1type=N'TABLE',@level1name=N'temperature', @level2type=N'COLUMN',@level2name=N'TRIAL167'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TRIAL' , @level0type=N'SCHEMA',@level0name=N'edw', @level1type=N'TABLE',@level1name=N'temperature'
GO
USE [master]
GO
ALTER DATABASE [sep4] SET  READ_WRITE 
GO
