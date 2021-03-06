
CREATE SCHEMA edw
CREATE SCHEMA Stage
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
