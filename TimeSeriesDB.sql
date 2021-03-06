USE [master]
GO
/****** Object:  Database [TimeSeriesNewDB]    Script Date: 8/8/2021 9:30:07 PM ******/
CREATE DATABASE [TimeSeriesNewDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TimeSeriesNewDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TimeSeriesNewDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TimeSeriesNewDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TimeSeriesNewDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TimeSeriesNewDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TimeSeriesNewDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TimeSeriesNewDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TimeSeriesNewDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TimeSeriesNewDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TimeSeriesNewDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TimeSeriesNewDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TimeSeriesNewDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TimeSeriesNewDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TimeSeriesNewDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TimeSeriesNewDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TimeSeriesNewDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TimeSeriesNewDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TimeSeriesNewDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TimeSeriesNewDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TimeSeriesNewDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TimeSeriesNewDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TimeSeriesNewDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TimeSeriesNewDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TimeSeriesNewDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TimeSeriesNewDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TimeSeriesNewDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TimeSeriesNewDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [TimeSeriesNewDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TimeSeriesNewDB] SET RECOVERY FULL 
GO
ALTER DATABASE [TimeSeriesNewDB] SET  MULTI_USER 
GO
ALTER DATABASE [TimeSeriesNewDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TimeSeriesNewDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TimeSeriesNewDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TimeSeriesNewDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TimeSeriesNewDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TimeSeriesNewDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TimeSeriesNewDB', N'ON'
GO
ALTER DATABASE [TimeSeriesNewDB] SET QUERY_STORE = OFF
GO
USE [TimeSeriesNewDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 8/8/2021 9:30:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Buildings]    Script Date: 8/8/2021 9:30:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Buildings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Location] [nvarchar](max) NULL,
 CONSTRAINT [PK_Buildings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DataFields]    Script Date: 8/8/2021 9:30:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataFields](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_DataFields] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Objects]    Script Date: 8/8/2021 9:30:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Objects](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Objects] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Readings]    Script Date: 8/8/2021 9:30:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Readings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BuildingId] [int] NOT NULL,
	[ObjectId] [int] NOT NULL,
	[DataFieldId] [int] NOT NULL,
	[Value] [float] NOT NULL,
	[TimeStamp] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Readings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210804111240_cleanarchitectureanddbdesign', N'5.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210804154524_adddbmodel', N'5.0.8')
GO
SET IDENTITY_INSERT [dbo].[Buildings] ON 

INSERT [dbo].[Buildings] ([Id], [Name], [Location]) VALUES (1, N'A', N'ctg')
INSERT [dbo].[Buildings] ([Id], [Name], [Location]) VALUES (2, N'B', N'Dhaka')
INSERT [dbo].[Buildings] ([Id], [Name], [Location]) VALUES (3, N'C', N'Feni')
INSERT [dbo].[Buildings] ([Id], [Name], [Location]) VALUES (4, N'D', N'Comilla')
SET IDENTITY_INSERT [dbo].[Buildings] OFF
GO
SET IDENTITY_INSERT [dbo].[DataFields] ON 

INSERT [dbo].[DataFields] ([Id], [Name]) VALUES (1, N'AC')
INSERT [dbo].[DataFields] ([Id], [Name]) VALUES (2, N'NON AC')
INSERT [dbo].[DataFields] ([Id], [Name]) VALUES (3, N'Double')
INSERT [dbo].[DataFields] ([Id], [Name]) VALUES (4, N'Single')
SET IDENTITY_INSERT [dbo].[DataFields] OFF
GO
SET IDENTITY_INSERT [dbo].[Objects] ON 

INSERT [dbo].[Objects] ([Id], [Name]) VALUES (1, N'Deluxe')
INSERT [dbo].[Objects] ([Id], [Name]) VALUES (2, N'High Deluxe')
INSERT [dbo].[Objects] ([Id], [Name]) VALUES (3, N'VIP')
INSERT [dbo].[Objects] ([Id], [Name]) VALUES (4, N'Luxury')
SET IDENTITY_INSERT [dbo].[Objects] OFF
GO
SET IDENTITY_INSERT [dbo].[Readings] ON 

INSERT [dbo].[Readings] ([Id], [BuildingId], [ObjectId], [DataFieldId], [Value], [TimeStamp]) VALUES (1, 1, 1, 1, 5.1, CAST(N'2021-08-08T01:00:57.6070000' AS DateTime2))
INSERT [dbo].[Readings] ([Id], [BuildingId], [ObjectId], [DataFieldId], [Value], [TimeStamp]) VALUES (2, 1, 1, 1, 6.1, CAST(N'2021-08-08T01:00:57.6070000' AS DateTime2))
INSERT [dbo].[Readings] ([Id], [BuildingId], [ObjectId], [DataFieldId], [Value], [TimeStamp]) VALUES (3, 1, 1, 1, 7.1, CAST(N'2021-08-08T01:00:57.6070000' AS DateTime2))
INSERT [dbo].[Readings] ([Id], [BuildingId], [ObjectId], [DataFieldId], [Value], [TimeStamp]) VALUES (4, 1, 1, 1, 8.1, CAST(N'2021-08-08T01:00:57.6070000' AS DateTime2))
INSERT [dbo].[Readings] ([Id], [BuildingId], [ObjectId], [DataFieldId], [Value], [TimeStamp]) VALUES (5, 1, 1, 1, 9.1, CAST(N'2021-08-08T01:00:57.6070000' AS DateTime2))
INSERT [dbo].[Readings] ([Id], [BuildingId], [ObjectId], [DataFieldId], [Value], [TimeStamp]) VALUES (6, 1, 1, 1, 10.1, CAST(N'2021-08-08T01:00:57.6070000' AS DateTime2))
INSERT [dbo].[Readings] ([Id], [BuildingId], [ObjectId], [DataFieldId], [Value], [TimeStamp]) VALUES (7, 1, 1, 1, 11.1, CAST(N'2021-08-08T01:00:57.6070000' AS DateTime2))
INSERT [dbo].[Readings] ([Id], [BuildingId], [ObjectId], [DataFieldId], [Value], [TimeStamp]) VALUES (8, 1, 1, 1, 12.1, CAST(N'2021-08-08T01:00:57.6070000' AS DateTime2))
INSERT [dbo].[Readings] ([Id], [BuildingId], [ObjectId], [DataFieldId], [Value], [TimeStamp]) VALUES (9, 1, 1, 1, 13.1, CAST(N'2021-08-08T01:00:57.6070000' AS DateTime2))
INSERT [dbo].[Readings] ([Id], [BuildingId], [ObjectId], [DataFieldId], [Value], [TimeStamp]) VALUES (10, 1, 1, 1, 14.1, CAST(N'2021-08-08T01:00:57.6070000' AS DateTime2))
INSERT [dbo].[Readings] ([Id], [BuildingId], [ObjectId], [DataFieldId], [Value], [TimeStamp]) VALUES (11, 1, 1, 1, 5.1, CAST(N'2021-08-08T10:00:57.6070000' AS DateTime2))
INSERT [dbo].[Readings] ([Id], [BuildingId], [ObjectId], [DataFieldId], [Value], [TimeStamp]) VALUES (12, 1, 1, 1, 6.1, CAST(N'2021-08-08T10:00:57.6070000' AS DateTime2))
INSERT [dbo].[Readings] ([Id], [BuildingId], [ObjectId], [DataFieldId], [Value], [TimeStamp]) VALUES (13, 1, 1, 1, 7.1, CAST(N'2021-08-08T10:00:57.6070000' AS DateTime2))
INSERT [dbo].[Readings] ([Id], [BuildingId], [ObjectId], [DataFieldId], [Value], [TimeStamp]) VALUES (14, 1, 1, 1, 8.1, CAST(N'2021-08-08T10:00:57.6070000' AS DateTime2))
INSERT [dbo].[Readings] ([Id], [BuildingId], [ObjectId], [DataFieldId], [Value], [TimeStamp]) VALUES (15, 1, 1, 1, 9.1, CAST(N'2021-08-08T10:00:57.6070000' AS DateTime2))
INSERT [dbo].[Readings] ([Id], [BuildingId], [ObjectId], [DataFieldId], [Value], [TimeStamp]) VALUES (16, 1, 1, 1, 10.1, CAST(N'2021-08-08T10:00:57.6070000' AS DateTime2))
INSERT [dbo].[Readings] ([Id], [BuildingId], [ObjectId], [DataFieldId], [Value], [TimeStamp]) VALUES (17, 1, 1, 1, 11.1, CAST(N'2021-08-08T10:00:57.6070000' AS DateTime2))
INSERT [dbo].[Readings] ([Id], [BuildingId], [ObjectId], [DataFieldId], [Value], [TimeStamp]) VALUES (18, 1, 1, 1, 12.1, CAST(N'2021-08-08T10:00:57.6070000' AS DateTime2))
INSERT [dbo].[Readings] ([Id], [BuildingId], [ObjectId], [DataFieldId], [Value], [TimeStamp]) VALUES (19, 1, 1, 1, 13.1, CAST(N'2021-08-08T10:00:57.6070000' AS DateTime2))
INSERT [dbo].[Readings] ([Id], [BuildingId], [ObjectId], [DataFieldId], [Value], [TimeStamp]) VALUES (20, 1, 1, 1, 14.1, CAST(N'2021-08-08T10:00:57.6070000' AS DateTime2))
INSERT [dbo].[Readings] ([Id], [BuildingId], [ObjectId], [DataFieldId], [Value], [TimeStamp]) VALUES (21, 2, 2, 2, 5.1, CAST(N'2021-08-08T11:00:57.6070000' AS DateTime2))
INSERT [dbo].[Readings] ([Id], [BuildingId], [ObjectId], [DataFieldId], [Value], [TimeStamp]) VALUES (22, 2, 2, 2, 6.1, CAST(N'2021-08-08T11:00:57.6070000' AS DateTime2))
INSERT [dbo].[Readings] ([Id], [BuildingId], [ObjectId], [DataFieldId], [Value], [TimeStamp]) VALUES (23, 2, 2, 2, 7.1, CAST(N'2021-08-08T11:00:57.6070000' AS DateTime2))
INSERT [dbo].[Readings] ([Id], [BuildingId], [ObjectId], [DataFieldId], [Value], [TimeStamp]) VALUES (24, 2, 2, 2, 8.1, CAST(N'2021-08-08T11:00:57.6070000' AS DateTime2))
INSERT [dbo].[Readings] ([Id], [BuildingId], [ObjectId], [DataFieldId], [Value], [TimeStamp]) VALUES (25, 2, 2, 2, 9.1, CAST(N'2021-08-08T11:00:57.6070000' AS DateTime2))
INSERT [dbo].[Readings] ([Id], [BuildingId], [ObjectId], [DataFieldId], [Value], [TimeStamp]) VALUES (26, 2, 2, 2, 10.1, CAST(N'2021-08-08T11:00:57.6070000' AS DateTime2))
INSERT [dbo].[Readings] ([Id], [BuildingId], [ObjectId], [DataFieldId], [Value], [TimeStamp]) VALUES (27, 2, 2, 2, 11.1, CAST(N'2021-08-08T11:00:57.6070000' AS DateTime2))
INSERT [dbo].[Readings] ([Id], [BuildingId], [ObjectId], [DataFieldId], [Value], [TimeStamp]) VALUES (28, 2, 2, 2, 12.1, CAST(N'2021-08-08T11:00:57.6070000' AS DateTime2))
INSERT [dbo].[Readings] ([Id], [BuildingId], [ObjectId], [DataFieldId], [Value], [TimeStamp]) VALUES (29, 2, 2, 2, 13.1, CAST(N'2021-08-08T11:00:57.6070000' AS DateTime2))
INSERT [dbo].[Readings] ([Id], [BuildingId], [ObjectId], [DataFieldId], [Value], [TimeStamp]) VALUES (30, 2, 2, 2, 14.1, CAST(N'2021-08-08T11:00:57.6070000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Readings] OFF
GO
/****** Object:  Index [IX_Readings_BuildingId]    Script Date: 8/8/2021 9:30:09 PM ******/
CREATE NONCLUSTERED INDEX [IX_Readings_BuildingId] ON [dbo].[Readings]
(
	[BuildingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Readings_DataFieldId]    Script Date: 8/8/2021 9:30:09 PM ******/
CREATE NONCLUSTERED INDEX [IX_Readings_DataFieldId] ON [dbo].[Readings]
(
	[DataFieldId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Readings_ObjectId]    Script Date: 8/8/2021 9:30:09 PM ******/
CREATE NONCLUSTERED INDEX [IX_Readings_ObjectId] ON [dbo].[Readings]
(
	[ObjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Readings]  WITH CHECK ADD  CONSTRAINT [FK_Readings_Buildings_BuildingId] FOREIGN KEY([BuildingId])
REFERENCES [dbo].[Buildings] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Readings] CHECK CONSTRAINT [FK_Readings_Buildings_BuildingId]
GO
ALTER TABLE [dbo].[Readings]  WITH CHECK ADD  CONSTRAINT [FK_Readings_DataFields_DataFieldId] FOREIGN KEY([DataFieldId])
REFERENCES [dbo].[DataFields] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Readings] CHECK CONSTRAINT [FK_Readings_DataFields_DataFieldId]
GO
ALTER TABLE [dbo].[Readings]  WITH CHECK ADD  CONSTRAINT [FK_Readings_Objects_ObjectId] FOREIGN KEY([ObjectId])
REFERENCES [dbo].[Objects] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Readings] CHECK CONSTRAINT [FK_Readings_Objects_ObjectId]
GO
USE [master]
GO
ALTER DATABASE [TimeSeriesNewDB] SET  READ_WRITE 
GO
