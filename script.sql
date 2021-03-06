USE [master]
GO
/****** Object:  Database [BestBuyApp]    Script Date: 2020-07-12 0:03:25 ******/
CREATE DATABASE [BestBuyApp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BestBuyApp_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\BestBuyApp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BestBuyApp_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\BestBuyApp.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BestBuyApp] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BestBuyApp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BestBuyApp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BestBuyApp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BestBuyApp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BestBuyApp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BestBuyApp] SET ARITHABORT OFF 
GO
ALTER DATABASE [BestBuyApp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BestBuyApp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BestBuyApp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BestBuyApp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BestBuyApp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BestBuyApp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BestBuyApp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BestBuyApp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BestBuyApp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BestBuyApp] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BestBuyApp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BestBuyApp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BestBuyApp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BestBuyApp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BestBuyApp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BestBuyApp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BestBuyApp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BestBuyApp] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BestBuyApp] SET  MULTI_USER 
GO
ALTER DATABASE [BestBuyApp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BestBuyApp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BestBuyApp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BestBuyApp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BestBuyApp] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BestBuyApp] SET QUERY_STORE = OFF
GO
USE [BestBuyApp]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 2020-07-12 0:03:25 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 2020-07-12 0:03:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Brands] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 2020-07-12 0:03:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 2020-07-12 0:03:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[PostalCode] [int] NOT NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Deliverers]    Script Date: 2020-07-12 0:03:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deliverers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Deliverers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Items]    Script Date: 2020-07-12 0:03:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Items](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[Quantity] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
	[StockId] [int] NULL,
	[Price] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Items] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2020-07-12 0:03:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[OrderDate] [datetime2](7) NOT NULL,
	[ShippedDate] [datetime2](7) NULL,
	[DelivererId] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 2020-07-12 0:03:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
	[BrandId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[ImagePath] [nvarchar](max) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stocks]    Script Date: 2020-07-12 0:03:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stocks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[Quantity] [int] NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Discount] [decimal](18, 2) NULL,
	[ProductId] [int] NOT NULL,
	[StoreId] [int] NOT NULL,
 CONSTRAINT [PK_Stocks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stores]    Script Date: 2020-07-12 0:03:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stores](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](11) NOT NULL,
	[WebSite] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[CityId] [int] NOT NULL,
 CONSTRAINT [PK_Stores] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UseCaseLogs]    Script Date: 2020-07-12 0:03:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UseCaseLogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime2](7) NOT NULL,
	[UseCaseName] [nvarchar](max) NULL,
	[Data] [nvarchar](max) NULL,
	[Actor] [nvarchar](max) NULL,
 CONSTRAINT [PK_UseCaseLogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2020-07-12 0:03:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[FirstName] [nvarchar](30) NOT NULL,
	[LastName] [nvarchar](30) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](64) NOT NULL,
	[Phone] [nvarchar](11) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[CityId] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserUseCases]    Script Date: 2020-07-12 0:03:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserUseCases](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UseCaseId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_UserUseCases] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200511143927_initial', N'3.1.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200518132052_Statuses enum update', N'3.1.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200604135500_Update Name Lengths', N'3.1.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200611173255_Table Customers updated to Users', N'3.1.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200611175915_User use case', N'3.1.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200612211953_UseCaseLogs Table', N'3.1.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200613095114_UserUseCases Update', N'3.1.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200614163036_Email key remove', N'3.1.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200614220450_Update Relations StockItems - Delete Relation ProductItems and Delete Relation StoreOrders', N'3.1.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200617164625_Update Order Address', N'3.1.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200617171553_Upload Item Price', N'3.1.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200617180113_Delete Item Price', N'3.1.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200617185216_Update Item Nullable StockId', N'3.1.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200619205908_Update Item Price', N'3.1.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200619231128_Delete AlternateKey OrderId in Item', N'3.1.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200621134655_Update Stock Quantity Nullable', N'3.1.3')
SET IDENTITY_INSERT [dbo].[Brands] ON 

INSERT [dbo].[Brands] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name]) VALUES (1, CAST(N'2020-06-03T17:26:18.6477530' AS DateTime2), NULL, 0, NULL, 1, N'Samsung')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name]) VALUES (2, CAST(N'2020-06-03T19:43:15.0021235' AS DateTime2), NULL, 0, NULL, 1, N'Canon')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name]) VALUES (3, CAST(N'2020-06-03T19:43:45.3408179' AS DateTime2), NULL, 0, NULL, 1, N'Nikon')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name]) VALUES (4, CAST(N'2020-06-03T19:43:50.8713295' AS DateTime2), NULL, 0, NULL, 1, N'Sony')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name]) VALUES (5, CAST(N'2020-06-03T19:43:58.6670227' AS DateTime2), NULL, 0, NULL, 1, N'Lenovo')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name]) VALUES (6, CAST(N'2020-06-03T19:44:12.4595873' AS DateTime2), NULL, 0, NULL, 1, N'Apple')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name]) VALUES (7, CAST(N'2020-06-03T19:44:21.2403221' AS DateTime2), NULL, 0, NULL, 1, N'Hp')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name]) VALUES (8, CAST(N'2020-06-03T19:45:29.2645825' AS DateTime2), NULL, 0, NULL, 1, N'Huawei')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name]) VALUES (10, CAST(N'2020-06-08T14:58:48.6799529' AS DateTime2), NULL, 0, NULL, 1, N'Asus')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name]) VALUES (1024, CAST(N'2020-06-22T18:25:05.8241875' AS DateTime2), CAST(N'2020-06-30T15:28:39.4155515' AS DateTime2), 1, CAST(N'2020-06-30T15:28:39.3549744' AS DateTime2), 0, N'Ms')
SET IDENTITY_INSERT [dbo].[Brands] OFF
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name]) VALUES (1, CAST(N'2020-06-04T01:06:34.2911310' AS DateTime2), CAST(N'2020-06-04T16:02:23.0280230' AS DateTime2), 0, NULL, 1, N'Computers & Accessories')
INSERT [dbo].[Categories] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name]) VALUES (2, CAST(N'2020-06-04T01:07:28.2403172' AS DateTime2), NULL, 0, NULL, 1, N'Monitors')
INSERT [dbo].[Categories] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name]) VALUES (3, CAST(N'2020-06-04T01:07:49.6434462' AS DateTime2), CAST(N'2020-06-04T16:04:36.2741793' AS DateTime2), 0, NULL, 1, N'Video Game Consoles & Accessories')
INSERT [dbo].[Categories] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name]) VALUES (4, CAST(N'2020-06-04T01:09:32.0624710' AS DateTime2), NULL, 0, NULL, 1, N'Camera & Photo')
INSERT [dbo].[Categories] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name]) VALUES (5, CAST(N'2020-06-04T01:10:17.8302247' AS DateTime2), NULL, 0, NULL, 1, N'Televisions')
INSERT [dbo].[Categories] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name]) VALUES (6, CAST(N'2020-06-04T01:12:19.4090842' AS DateTime2), CAST(N'2020-06-04T16:03:14.7374554' AS DateTime2), 0, NULL, 1, N'Cell Phones & Tablets')
INSERT [dbo].[Categories] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name]) VALUES (1008, CAST(N'2020-06-30T00:43:17.3070338' AS DateTime2), CAST(N'2020-06-30T15:29:18.4545906' AS DateTime2), 1, CAST(N'2020-06-30T15:29:18.4391044' AS DateTime2), 0, N'Neka kategorija za obrisati')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Cities] ON 

INSERT [dbo].[Cities] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name], [PostalCode]) VALUES (1, CAST(N'2020-05-12T09:59:45.6113964' AS DateTime2), CAST(N'2020-06-02T15:29:14.0174595' AS DateTime2), 0, NULL, 1, N'Beograd', 11000)
INSERT [dbo].[Cities] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name], [PostalCode]) VALUES (9, CAST(N'2020-05-13T18:58:05.8389726' AS DateTime2), CAST(N'2020-05-13T23:27:38.9966867' AS DateTime2), 0, NULL, 1, N'Uzice', 31000)
INSERT [dbo].[Cities] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name], [PostalCode]) VALUES (10, CAST(N'2020-05-13T19:09:05.7760504' AS DateTime2), NULL, 0, NULL, 1, N'Novi Sad', 21000)
INSERT [dbo].[Cities] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name], [PostalCode]) VALUES (12, CAST(N'2020-05-13T19:24:22.1275379' AS DateTime2), CAST(N'2020-05-13T19:24:36.0788042' AS DateTime2), 1, CAST(N'2020-05-13T19:24:36.0778050' AS DateTime2), 0, N'Nis', 18000)
INSERT [dbo].[Cities] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name], [PostalCode]) VALUES (13, CAST(N'2020-05-13T23:28:14.0885478' AS DateTime2), NULL, 0, NULL, 1, N'Kragujevac', 34000)
INSERT [dbo].[Cities] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name], [PostalCode]) VALUES (14, CAST(N'2020-05-15T18:57:56.1137050' AS DateTime2), NULL, 0, NULL, 1, N'Paracin', 35250)
INSERT [dbo].[Cities] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name], [PostalCode]) VALUES (21, CAST(N'2020-05-15T19:20:31.5766347' AS DateTime2), NULL, 0, NULL, 1, N'Smederevo', 11300)
INSERT [dbo].[Cities] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name], [PostalCode]) VALUES (22, CAST(N'2020-05-15T19:37:36.5530412' AS DateTime2), CAST(N'2020-06-14T18:28:28.1746064' AS DateTime2), 0, NULL, 1, N'Obrenovac', 11500)
INSERT [dbo].[Cities] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name], [PostalCode]) VALUES (34, CAST(N'2020-05-18T16:48:46.4507014' AS DateTime2), NULL, 0, NULL, 1, N'Zlatibor', 31315)
INSERT [dbo].[Cities] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name], [PostalCode]) VALUES (35, CAST(N'2020-05-22T16:25:11.2076007' AS DateTime2), NULL, 0, NULL, 1, N'Baranda', 26205)
INSERT [dbo].[Cities] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name], [PostalCode]) VALUES (37, CAST(N'2020-06-01T16:35:52.9582863' AS DateTime2), CAST(N'2020-06-02T15:36:41.2253623' AS DateTime2), 1, CAST(N'2020-06-02T15:36:41.2224588' AS DateTime2), 0, N'Pancevo', 26000)
SET IDENTITY_INSERT [dbo].[Cities] OFF
SET IDENTITY_INSERT [dbo].[Deliverers] ON 

INSERT [dbo].[Deliverers] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name], [Price]) VALUES (1, CAST(N'2020-05-22T19:59:43.6676415' AS DateTime2), NULL, 0, NULL, 1, N'PostExpress', CAST(220.30 AS Decimal(18, 2)))
INSERT [dbo].[Deliverers] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name], [Price]) VALUES (2, CAST(N'2020-05-22T20:15:53.3422471' AS DateTime2), CAST(N'2020-06-03T16:22:59.5521167' AS DateTime2), 0, NULL, 1, N'Bex Express', CAST(239.99 AS Decimal(18, 2)))
INSERT [dbo].[Deliverers] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name], [Price]) VALUES (3, CAST(N'2020-05-27T22:13:27.3466783' AS DateTime2), NULL, 0, NULL, 1, N'DailyExpress', CAST(240.50 AS Decimal(18, 2)))
INSERT [dbo].[Deliverers] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name], [Price]) VALUES (4, CAST(N'2020-06-01T16:30:27.8055210' AS DateTime2), CAST(N'2020-06-03T16:39:29.9639753' AS DateTime2), 1, CAST(N'2020-06-03T16:39:29.8481872' AS DateTime2), 0, N'Royal', CAST(12.45 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Deliverers] OFF
SET IDENTITY_INSERT [dbo].[Items] ON 

INSERT [dbo].[Items] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity], [OrderId], [StockId], [Price]) VALUES (1005, CAST(N'2020-06-30T22:41:10.1398648' AS DateTime2), NULL, 0, NULL, 1, 1, 1005, 6, CAST(115900.00 AS Decimal(18, 2)))
INSERT [dbo].[Items] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity], [OrderId], [StockId], [Price]) VALUES (1006, CAST(N'2020-06-30T22:41:10.1398667' AS DateTime2), NULL, 0, NULL, 1, 1, 1005, 24, CAST(56999.05 AS Decimal(18, 2)))
INSERT [dbo].[Items] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity], [OrderId], [StockId], [Price]) VALUES (1007, CAST(N'2020-06-30T22:41:10.1398679' AS DateTime2), NULL, 0, NULL, 1, 2, 1005, 13, CAST(55800.00 AS Decimal(18, 2)))
INSERT [dbo].[Items] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity], [OrderId], [StockId], [Price]) VALUES (1008, CAST(N'2020-06-30T22:42:22.4421747' AS DateTime2), NULL, 0, NULL, 1, 5, 1006, 17, CAST(23750.00 AS Decimal(18, 2)))
INSERT [dbo].[Items] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity], [OrderId], [StockId], [Price]) VALUES (1009, CAST(N'2020-06-30T22:42:22.4421996' AS DateTime2), NULL, 0, NULL, 1, 4, 1006, 18, CAST(23250.00 AS Decimal(18, 2)))
INSERT [dbo].[Items] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity], [OrderId], [StockId], [Price]) VALUES (1010, CAST(N'2020-06-30T22:42:22.4422204' AS DateTime2), NULL, 0, NULL, 1, 2, 1006, 14, CAST(55500.00 AS Decimal(18, 2)))
INSERT [dbo].[Items] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity], [OrderId], [StockId], [Price]) VALUES (1011, CAST(N'2020-06-30T22:44:06.7582598' AS DateTime2), NULL, 0, NULL, 1, 3, 1007, 7, CAST(112640.00 AS Decimal(18, 2)))
INSERT [dbo].[Items] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity], [OrderId], [StockId], [Price]) VALUES (1012, CAST(N'2020-07-02T10:47:50.2174752' AS DateTime2), NULL, 0, NULL, 1, 1, 1008, 21, CAST(69160.00 AS Decimal(18, 2)))
INSERT [dbo].[Items] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity], [OrderId], [StockId], [Price]) VALUES (1013, CAST(N'2020-07-02T10:47:50.2174768' AS DateTime2), NULL, 0, NULL, 1, 4, 1008, 19, CAST(18600.00 AS Decimal(18, 2)))
INSERT [dbo].[Items] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity], [OrderId], [StockId], [Price]) VALUES (1014, CAST(N'2020-07-02T10:48:23.9752673' AS DateTime2), NULL, 0, NULL, 1, 2, 1009, 17, CAST(23750.00 AS Decimal(18, 2)))
INSERT [dbo].[Items] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity], [OrderId], [StockId], [Price]) VALUES (1015, CAST(N'2020-07-02T10:48:23.9753152' AS DateTime2), NULL, 0, NULL, 1, 1, 1009, 20, CAST(21660.00 AS Decimal(18, 2)))
INSERT [dbo].[Items] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity], [OrderId], [StockId], [Price]) VALUES (1016, CAST(N'2020-07-02T10:49:14.6330032' AS DateTime2), NULL, 0, NULL, 1, 2, 1010, 21, CAST(69160.00 AS Decimal(18, 2)))
INSERT [dbo].[Items] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity], [OrderId], [StockId], [Price]) VALUES (1017, CAST(N'2020-07-02T10:49:33.7846461' AS DateTime2), NULL, 0, NULL, 1, 2, 1011, 6, CAST(115900.00 AS Decimal(18, 2)))
INSERT [dbo].[Items] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity], [OrderId], [StockId], [Price]) VALUES (1018, CAST(N'2020-07-02T10:58:49.0577691' AS DateTime2), NULL, 0, NULL, 1, 2, 1012, 11, CAST(63000.00 AS Decimal(18, 2)))
INSERT [dbo].[Items] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity], [OrderId], [StockId], [Price]) VALUES (1019, CAST(N'2020-07-02T10:59:50.1148886' AS DateTime2), NULL, 0, NULL, 1, 2, 1013, 18, CAST(23250.00 AS Decimal(18, 2)))
INSERT [dbo].[Items] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity], [OrderId], [StockId], [Price]) VALUES (1020, CAST(N'2020-07-02T10:59:50.1148899' AS DateTime2), NULL, 0, NULL, 1, 1, 1013, 9, CAST(75000.00 AS Decimal(18, 2)))
INSERT [dbo].[Items] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity], [OrderId], [StockId], [Price]) VALUES (1021, CAST(N'2020-07-02T11:01:20.7359172' AS DateTime2), NULL, 0, NULL, 1, 1, 1014, 10, CAST(70000.00 AS Decimal(18, 2)))
INSERT [dbo].[Items] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity], [OrderId], [StockId], [Price]) VALUES (1022, CAST(N'2020-07-02T11:01:20.7359188' AS DateTime2), NULL, 0, NULL, 1, 1, 1014, 16, CAST(48400.00 AS Decimal(18, 2)))
INSERT [dbo].[Items] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity], [OrderId], [StockId], [Price]) VALUES (1023, CAST(N'2020-07-02T11:04:38.3866181' AS DateTime2), NULL, 0, NULL, 1, 3, 1015, 12, CAST(56050.00 AS Decimal(18, 2)))
INSERT [dbo].[Items] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity], [OrderId], [StockId], [Price]) VALUES (1024, CAST(N'2020-07-02T11:05:29.5033277' AS DateTime2), NULL, 0, NULL, 1, 3, 1016, 9, CAST(75000.00 AS Decimal(18, 2)))
INSERT [dbo].[Items] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity], [OrderId], [StockId], [Price]) VALUES (1025, CAST(N'2020-07-02T11:08:12.5008201' AS DateTime2), NULL, 0, NULL, 1, 3, 1017, 15, CAST(55500.00 AS Decimal(18, 2)))
INSERT [dbo].[Items] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity], [OrderId], [StockId], [Price]) VALUES (1026, CAST(N'2020-07-02T11:10:27.3323450' AS DateTime2), NULL, 0, NULL, 1, 3, 1018, 11, CAST(63000.00 AS Decimal(18, 2)))
INSERT [dbo].[Items] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity], [OrderId], [StockId], [Price]) VALUES (1027, CAST(N'2020-07-02T11:12:53.2335440' AS DateTime2), NULL, 0, NULL, 1, 1, 1019, 11, CAST(63000.00 AS Decimal(18, 2)))
INSERT [dbo].[Items] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity], [OrderId], [StockId], [Price]) VALUES (1028, CAST(N'2020-07-02T11:12:53.2335454' AS DateTime2), NULL, 0, NULL, 1, 1, 1019, 13, CAST(55800.00 AS Decimal(18, 2)))
INSERT [dbo].[Items] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity], [OrderId], [StockId], [Price]) VALUES (1029, CAST(N'2020-07-02T11:13:42.1104680' AS DateTime2), NULL, 0, NULL, 1, 1, 1020, 21, CAST(69160.00 AS Decimal(18, 2)))
INSERT [dbo].[Items] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity], [OrderId], [StockId], [Price]) VALUES (1030, CAST(N'2020-07-02T11:19:23.1202038' AS DateTime2), NULL, 0, NULL, 1, 1, 1021, 21, CAST(69160.00 AS Decimal(18, 2)))
INSERT [dbo].[Items] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity], [OrderId], [StockId], [Price]) VALUES (1031, CAST(N'2020-07-02T11:21:00.4578939' AS DateTime2), NULL, 0, NULL, 1, 1, 1022, 20, CAST(21660.00 AS Decimal(18, 2)))
INSERT [dbo].[Items] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity], [OrderId], [StockId], [Price]) VALUES (1032, CAST(N'2020-07-02T11:21:03.2341964' AS DateTime2), NULL, 0, NULL, 1, 1, 1023, 20, CAST(21660.00 AS Decimal(18, 2)))
INSERT [dbo].[Items] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity], [OrderId], [StockId], [Price]) VALUES (1033, CAST(N'2020-07-02T11:23:44.3412134' AS DateTime2), NULL, 0, NULL, 1, 1, 1024, 18, CAST(23250.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Items] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [OrderDate], [ShippedDate], [DelivererId], [Status], [UserId], [Address]) VALUES (1005, CAST(N'2020-06-30T22:41:10.1398221' AS DateTime2), CAST(N'2020-06-30T22:55:15.7536103' AS DateTime2), 0, NULL, 1, CAST(N'2020-07-02T20:16:31.2400000' AS DateTime2), NULL, 1, 3, 21, N'Uzicka 1')
INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [OrderDate], [ShippedDate], [DelivererId], [Status], [UserId], [Address]) VALUES (1006, CAST(N'2020-06-30T22:42:22.4421416' AS DateTime2), CAST(N'2020-07-02T10:53:16.5630011' AS DateTime2), 0, NULL, 1, CAST(N'2020-07-03T20:16:31.2400000' AS DateTime2), CAST(N'2020-07-02T10:52:50.0659092' AS DateTime2), 1, 1, 21, N'Uzicka 1')
INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [OrderDate], [ShippedDate], [DelivererId], [Status], [UserId], [Address]) VALUES (1007, CAST(N'2020-06-30T22:44:06.7582292' AS DateTime2), CAST(N'2020-07-02T10:54:08.9488873' AS DateTime2), 0, NULL, 1, CAST(N'2020-07-03T20:16:31.2400000' AS DateTime2), CAST(N'2020-07-02T10:53:39.1304138' AS DateTime2), 1, 1, 21, N'Uzicka 1')
INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [OrderDate], [ShippedDate], [DelivererId], [Status], [UserId], [Address]) VALUES (1008, CAST(N'2020-07-02T10:47:50.2174641' AS DateTime2), CAST(N'2020-07-02T10:54:29.7355996' AS DateTime2), 0, NULL, 1, CAST(N'2020-07-05T00:00:00.0000000' AS DateTime2), CAST(N'2020-07-02T10:54:29.7350565' AS DateTime2), 3, 2, 21, N'Uzicka 1')
INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [OrderDate], [ShippedDate], [DelivererId], [Status], [UserId], [Address]) VALUES (1009, CAST(N'2020-07-02T10:48:23.9752055' AS DateTime2), NULL, 0, NULL, 1, CAST(N'2020-07-05T00:00:00.0000000' AS DateTime2), NULL, 3, 0, 21, N'Uzicka 1')
INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [OrderDate], [ShippedDate], [DelivererId], [Status], [UserId], [Address]) VALUES (1010, CAST(N'2020-07-02T10:49:14.6329619' AS DateTime2), NULL, 0, NULL, 1, CAST(N'2020-07-05T00:00:00.0000000' AS DateTime2), NULL, 3, 0, 21, N'Uzicka 1')
INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [OrderDate], [ShippedDate], [DelivererId], [Status], [UserId], [Address]) VALUES (1011, CAST(N'2020-07-02T10:49:33.7846160' AS DateTime2), NULL, 0, NULL, 1, CAST(N'2020-07-05T00:00:00.0000000' AS DateTime2), NULL, 3, 0, 21, N'Uzicka 1')
INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [OrderDate], [ShippedDate], [DelivererId], [Status], [UserId], [Address]) VALUES (1012, CAST(N'2020-07-02T10:58:49.0577623' AS DateTime2), NULL, 0, NULL, 1, CAST(N'2020-07-04T00:00:00.0000000' AS DateTime2), NULL, 3, 0, 22, N'Barandjanska 8')
INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [OrderDate], [ShippedDate], [DelivererId], [Status], [UserId], [Address]) VALUES (1013, CAST(N'2020-07-02T10:59:50.1148819' AS DateTime2), NULL, 0, NULL, 1, CAST(N'2020-07-04T00:00:00.0000000' AS DateTime2), NULL, 1, 0, 22, N'Lipovacka 23')
INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [OrderDate], [ShippedDate], [DelivererId], [Status], [UserId], [Address]) VALUES (1014, CAST(N'2020-07-02T11:01:20.7359100' AS DateTime2), NULL, 0, NULL, 1, CAST(N'2020-07-08T00:00:00.0000000' AS DateTime2), NULL, 2, 0, 22, N'Lipovacka 23')
INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [OrderDate], [ShippedDate], [DelivererId], [Status], [UserId], [Address]) VALUES (1015, CAST(N'2020-07-02T11:04:38.3866109' AS DateTime2), NULL, 0, NULL, 1, CAST(N'2020-07-08T00:00:00.0000000' AS DateTime2), NULL, 2, 0, 22, N'Lipovacka 23')
INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [OrderDate], [ShippedDate], [DelivererId], [Status], [UserId], [Address]) VALUES (1016, CAST(N'2020-07-02T11:05:29.5033191' AS DateTime2), NULL, 0, NULL, 1, CAST(N'2020-07-08T00:00:00.0000000' AS DateTime2), NULL, 2, 0, 22, N'Lipovacka 23')
INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [OrderDate], [ShippedDate], [DelivererId], [Status], [UserId], [Address]) VALUES (1017, CAST(N'2020-07-02T11:08:12.5008135' AS DateTime2), NULL, 0, NULL, 1, CAST(N'2020-07-08T00:00:00.0000000' AS DateTime2), NULL, 1, 0, 22, N'Barandjanaska 8')
INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [OrderDate], [ShippedDate], [DelivererId], [Status], [UserId], [Address]) VALUES (1018, CAST(N'2020-07-02T11:10:27.3323377' AS DateTime2), NULL, 0, NULL, 1, CAST(N'2020-07-07T00:00:00.0000000' AS DateTime2), NULL, 1, 0, 22, N'Barandjanaska 8')
INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [OrderDate], [ShippedDate], [DelivererId], [Status], [UserId], [Address]) VALUES (1019, CAST(N'2020-07-02T11:12:53.2335370' AS DateTime2), NULL, 0, NULL, 1, CAST(N'2020-07-12T00:00:00.0000000' AS DateTime2), NULL, 1, 0, 22, N'Barandjanaska 8')
INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [OrderDate], [ShippedDate], [DelivererId], [Status], [UserId], [Address]) VALUES (1020, CAST(N'2020-07-02T11:13:42.1104597' AS DateTime2), NULL, 0, NULL, 1, CAST(N'2020-07-12T00:00:00.0000000' AS DateTime2), NULL, 1, 0, 22, N'Barandjanaska 8')
INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [OrderDate], [ShippedDate], [DelivererId], [Status], [UserId], [Address]) VALUES (1021, CAST(N'2020-07-02T11:19:23.1201972' AS DateTime2), NULL, 0, NULL, 1, CAST(N'2020-07-12T00:00:00.0000000' AS DateTime2), NULL, 1, 0, 22, N'Barandjanaska 8')
INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [OrderDate], [ShippedDate], [DelivererId], [Status], [UserId], [Address]) VALUES (1022, CAST(N'2020-07-02T11:21:00.4578864' AS DateTime2), NULL, 0, NULL, 1, CAST(N'2020-07-12T00:00:00.0000000' AS DateTime2), NULL, 2, 0, 22, N'Barandjanaska 8')
INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [OrderDate], [ShippedDate], [DelivererId], [Status], [UserId], [Address]) VALUES (1023, CAST(N'2020-07-02T11:21:03.2341881' AS DateTime2), CAST(N'2020-07-02T11:23:05.2453759' AS DateTime2), 0, NULL, 1, CAST(N'2020-07-12T00:00:00.0000000' AS DateTime2), NULL, 2, 3, 22, N'Barandjanaska 8')
INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [OrderDate], [ShippedDate], [DelivererId], [Status], [UserId], [Address]) VALUES (1024, CAST(N'2020-07-02T11:23:44.3412062' AS DateTime2), NULL, 0, NULL, 1, CAST(N'2020-07-12T00:00:00.0000000' AS DateTime2), NULL, 3, 0, 22, N'Barandjanaska 8')
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name], [Description], [BrandId], [CategoryId], [ImagePath]) VALUES (2007, CAST(N'2020-06-20T19:11:18.9987353' AS DateTime2), NULL, 0, NULL, 1, N'Apple MacBook Pro 13', N'MacBook Description: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 6, 1, N'21a65577-0e6d-4f69-b6e6-8f92e647513e.jpg')
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name], [Description], [BrandId], [CategoryId], [ImagePath]) VALUES (2008, CAST(N'2020-06-20T19:17:08.4205878' AS DateTime2), CAST(N'2020-06-30T23:19:11.5233461' AS DateTime2), 0, NULL, 1, N'Lenovo IdeaCentre 510S-08IKL', N'Lenovo Description: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 5, 1, NULL)
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name], [Description], [BrandId], [CategoryId], [ImagePath]) VALUES (2009, CAST(N'2020-06-20T19:19:37.7914298' AS DateTime2), NULL, 0, NULL, 1, N'Lenovo Legion Y530-15ICH 81FV00VQYA', N'Lenovo Description: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 5, 1, N'82c30373-ee1c-47e4-a5b3-c6170852c2f9.jpg')
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name], [Description], [BrandId], [CategoryId], [ImagePath]) VALUES (2010, CAST(N'2020-06-20T19:20:28.4306615' AS DateTime2), NULL, 0, NULL, 1, N'Lenovo IdeaPad S145-15 81MV00GJYA', N'Lenovo Description: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 5, 1, N'b545a67e-8bd2-4f81-868b-1bd7aa116e6a.jpg')
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name], [Description], [BrandId], [CategoryId], [ImagePath]) VALUES (2011, CAST(N'2020-06-30T19:25:20.9106057' AS DateTime2), NULL, 0, NULL, 1, N'HP ProBook 430 G6 5PP53EA', N'HP Description: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 7, 1, N'084d773d-ccc5-4b85-a9bb-bf2ab3e911f7.jpg')
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name], [Description], [BrandId], [CategoryId], [ImagePath]) VALUES (2012, CAST(N'2020-06-20T19:30:55.8109448' AS DateTime2), NULL, 0, NULL, 1, N'Samsung C24F390FHUXEN HDMI CURVED', N'Samsung Description: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 1, 2, N'a2ebe10d-d441-4068-b7dd-94bca37b04fd.jpg')
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name], [Description], [BrandId], [CategoryId], [ImagePath]) VALUES (2013, CAST(N'2020-06-20T19:31:33.9201241' AS DateTime2), NULL, 0, NULL, 1, N'HP 22w IPS 1CA83AA', N'HP TV Description: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 7, 2, N'9e56db90-f2b8-44df-908e-88a62afd9fdb.jpg')
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name], [Description], [BrandId], [CategoryId], [ImagePath]) VALUES (2014, CAST(N'2020-06-20T19:32:25.2333330' AS DateTime2), NULL, 0, NULL, 1, N'Lenovo T22i-10 61A9MAT1EU', N'Lenovo TV  Description: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 5, 2, N'41956ca8-35cc-4617-8814-83eec98a415f.jpg')
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name], [Description], [BrandId], [CategoryId], [ImagePath]) VALUES (2015, CAST(N'2020-06-20T19:34:32.7150996' AS DateTime2), NULL, 0, NULL, 1, N'PlayStation PS4 1TB Pro + FIFA 20', N'Sony Description: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 4, 3, N'bbc8b209-2330-4361-9d3e-0fc435d70e90.jpg')
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name], [Description], [BrandId], [CategoryId], [ImagePath]) VALUES (2016, CAST(N'2020-06-20T19:34:56.5539152' AS DateTime2), NULL, 0, NULL, 1, N'PLAYSEAT PlayStation Edition', N'Sony Description: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 4, 3, N'b32383ff-f05a-4f4f-b919-700421bccdda.jpg')
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name], [Description], [BrandId], [CategoryId], [ImagePath]) VALUES (2017, CAST(N'2020-06-20T19:37:14.0584929' AS DateTime2), NULL, 0, NULL, 1, N'Sony DSCW810S', N'Sony Description: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 4, 4, N'b5e1d4c2-8460-482d-b9e4-f6867a481c53.jpg')
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name], [Description], [BrandId], [CategoryId], [ImagePath]) VALUES (2018, CAST(N'2020-06-20T19:37:48.3986244' AS DateTime2), NULL, 0, NULL, 1, N'Canon EOS RP 24-105 RUK / SEE', N'Canon Description: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 2, 4, N'19f1871e-3943-45ee-9fa5-6c68733e327d.jpg')
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name], [Description], [BrandId], [CategoryId], [ImagePath]) VALUES (2019, CAST(N'2020-06-20T19:38:23.1431391' AS DateTime2), NULL, 0, NULL, 1, N'Nikon Z50 + 16-50mm f/4.5-6.3 VR + FTZ adapter', N'Nikon Description: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 3, 4, N'e43ed1b0-3703-4342-830e-6108a35913ca.jpg')
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name], [Description], [BrandId], [CategoryId], [ImagePath]) VALUES (2020, CAST(N'2020-06-20T19:38:55.6669215' AS DateTime2), NULL, 0, NULL, 1, N'Sony DSCH300B', N'Sony Description: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 4, 4, N'2be7c9f4-572b-4ce0-abb5-b12342bce351.jpg')
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name], [Description], [BrandId], [CategoryId], [ImagePath]) VALUES (2021, CAST(N'2020-06-20T19:40:17.1439831' AS DateTime2), NULL, 0, NULL, 1, N'Nikon D780', N'Nikon Description: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 3, 4, N'd2c5885a-e759-4ab8-96a7-7e3d3802e76c.jpg')
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name], [Description], [BrandId], [CategoryId], [ImagePath]) VALUES (2022, CAST(N'2020-06-20T19:40:59.1197875' AS DateTime2), NULL, 0, NULL, 1, N'Canon EOS M50 BK M18-150 SEE', N'Canon Description: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 2, 4, N'35eb9076-73e9-4759-bb09-325c56b29d9d.jpg')
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name], [Description], [BrandId], [CategoryId], [ImagePath]) VALUES (2023, CAST(N'2020-06-20T19:46:28.8696131' AS DateTime2), NULL, 0, NULL, 1, N'Samsung UE50RU7092UXXH', N'Samsung Description: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 1, 5, N'17cdd15f-0fc7-4370-ac2c-378e55402e1e.jpg')
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name], [Description], [BrandId], [CategoryId], [ImagePath]) VALUES (2024, CAST(N'2020-06-20T19:47:01.2111411' AS DateTime2), NULL, 0, NULL, 1, N'Samsung UE55NU7093UXXH', N'Samsung Description: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 1, 5, N'ccefcb56-a0c8-44c4-aec3-f4b1de5e240c.jpg')
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name], [Description], [BrandId], [CategoryId], [ImagePath]) VALUES (2025, CAST(N'2020-06-20T19:47:33.1700083' AS DateTime2), NULL, 0, NULL, 1, N'Sony KD49XG8096BAEP', N'Sony Description: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 4, 5, N'09850a8b-5da3-4b15-b5e4-4b50a0faa46b.jpg')
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name], [Description], [BrandId], [CategoryId], [ImagePath]) VALUES (2026, CAST(N'2020-06-20T19:51:39.5891268' AS DateTime2), NULL, 0, NULL, 1, N'Apple iPad mini 5 Wi-Fi 64GB - Gold muqy2hc/a', N'Apple Description: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 6, 6, N'7dd1918c-bd2c-49e0-88cc-dcd2ffe7f118.jpg')
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name], [Description], [BrandId], [CategoryId], [ImagePath]) VALUES (2027, CAST(N'2020-06-20T19:52:15.3177062' AS DateTime2), NULL, 0, NULL, 1, N'Apple iPad 7 Cellular 128GB - Space Grey', N'Apple Description: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 6, 6, N'f89ab4b8-e8e7-4173-92d1-513d9a94d5c0.jpg')
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name], [Description], [BrandId], [CategoryId], [ImagePath]) VALUES (2028, CAST(N'2020-06-20T19:53:13.7406218' AS DateTime2), NULL, 0, NULL, 1, N'Huawei P30 Lite Plavi DS', N'Huawei Description: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 8, 6, N'015963ba-fd5f-48bd-8ba9-49ada1a89763.jpg')
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name], [Description], [BrandId], [CategoryId], [ImagePath]) VALUES (2029, CAST(N'2020-06-20T19:53:38.7841187' AS DateTime2), NULL, 0, NULL, 1, N'Huawei P smart Z Sapphire Blue', N'Huawei Description: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 8, 6, N'f0fc0800-b9cb-45a6-a985-243cf429d786.jpg')
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name], [Description], [BrandId], [CategoryId], [ImagePath]) VALUES (2030, CAST(N'2020-06-20T19:56:10.4833734' AS DateTime2), NULL, 0, NULL, 1, N'Apple iPhone 7 128GB MN942SE/A Gold', N'Apple neki Description: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 6, 6, N'9cf06bfc-7704-470f-acd8-b88a31a89357.jpg')
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name], [Description], [BrandId], [CategoryId], [ImagePath]) VALUES (2031, CAST(N'2020-06-20T19:57:15.2392453' AS DateTime2), NULL, 0, NULL, 1, N'Apple iPhone XS 64GB Silver', N'Apple neki Description: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 6, 6, N'a028e773-ce25-40f0-9ec8-99ecf20b6349.jpg')
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name], [Description], [BrandId], [CategoryId], [ImagePath]) VALUES (2032, CAST(N'2020-06-20T19:57:53.4526375' AS DateTime2), NULL, 0, NULL, 1, N'Huawei T3 10 LTE Tamno siva 127703', N'Huawei neki Description: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 8, 6, N'6b30cc2b-122a-4e68-b722-3de481156ac0.jpg')
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name], [Description], [BrandId], [CategoryId], [ImagePath]) VALUES (2033, CAST(N'2020-06-20T19:58:37.0576734' AS DateTime2), NULL, 0, NULL, 1, N'Samsung Galaxy Tab A 2019 Black WiFi', N'Samsung telefon: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 1, 6, N'fd2f8f9b-3618-4aa4-b6cf-902359ab0e29.jpg')
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[Stocks] ON 

INSERT [dbo].[Stocks] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity], [Price], [Discount], [ProductId], [StoreId]) VALUES (6, CAST(N'2020-06-30T21:46:52.0019202' AS DateTime2), CAST(N'2020-07-02T10:49:33.7846659' AS DateTime2), 0, NULL, 1, 8, CAST(122000.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 2007, 1)
INSERT [dbo].[Stocks] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity], [Price], [Discount], [ProductId], [StoreId]) VALUES (7, CAST(N'2020-06-30T21:49:23.9103402' AS DateTime2), CAST(N'2020-06-30T22:44:06.7582619' AS DateTime2), 0, NULL, 1, 47, CAST(128000.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), 2007, 2)
INSERT [dbo].[Stocks] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity], [Price], [Discount], [ProductId], [StoreId]) VALUES (8, CAST(N'2020-06-30T21:51:49.7576994' AS DateTime2), NULL, 0, NULL, 1, 10, CAST(75000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 2008, 2)
INSERT [dbo].[Stocks] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity], [Price], [Discount], [ProductId], [StoreId]) VALUES (9, CAST(N'2020-06-30T21:52:12.5819718' AS DateTime2), CAST(N'2020-07-02T11:05:29.5033294' AS DateTime2), 0, NULL, 1, 6, CAST(75000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 2008, 3)
INSERT [dbo].[Stocks] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity], [Price], [Discount], [ProductId], [StoreId]) VALUES (10, CAST(N'2020-06-30T21:52:30.9373460' AS DateTime2), CAST(N'2020-07-02T11:01:20.7359202' AS DateTime2), 0, NULL, 1, 9, CAST(70000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 2009, 2)
INSERT [dbo].[Stocks] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity], [Price], [Discount], [ProductId], [StoreId]) VALUES (11, CAST(N'2020-06-30T21:52:40.8550423' AS DateTime2), CAST(N'2020-07-02T11:12:53.2335468' AS DateTime2), 0, NULL, 1, 4, CAST(70000.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), 2009, 3)
INSERT [dbo].[Stocks] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity], [Price], [Discount], [ProductId], [StoreId]) VALUES (12, CAST(N'2020-06-30T21:53:37.7797802' AS DateTime2), CAST(N'2020-07-02T11:04:38.3866195' AS DateTime2), 0, NULL, 1, 0, CAST(59000.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 2010, 1)
INSERT [dbo].[Stocks] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity], [Price], [Discount], [ProductId], [StoreId]) VALUES (13, CAST(N'2020-06-30T21:54:06.3630966' AS DateTime2), CAST(N'2020-07-02T11:12:53.2335482' AS DateTime2), 0, NULL, 1, 14, CAST(62000.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), 2010, 2)
INSERT [dbo].[Stocks] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity], [Price], [Discount], [ProductId], [StoreId]) VALUES (14, CAST(N'2020-06-30T21:54:47.7080884' AS DateTime2), CAST(N'2020-06-30T22:42:22.4422860' AS DateTime2), 0, NULL, 1, 18, CAST(55500.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 2011, 3)
INSERT [dbo].[Stocks] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity], [Price], [Discount], [ProductId], [StoreId]) VALUES (15, CAST(N'2020-06-30T21:54:54.1406564' AS DateTime2), CAST(N'2020-07-02T11:08:12.5008218' AS DateTime2), 0, NULL, 1, 17, CAST(55500.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 2011, 1)
INSERT [dbo].[Stocks] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity], [Price], [Discount], [ProductId], [StoreId]) VALUES (16, CAST(N'2020-06-30T21:55:15.4884314' AS DateTime2), CAST(N'2020-07-02T11:01:20.7359216' AS DateTime2), 0, NULL, 1, 9, CAST(60500.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), 2011, 2)
INSERT [dbo].[Stocks] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity], [Price], [Discount], [ProductId], [StoreId]) VALUES (17, CAST(N'2020-06-30T21:56:41.8873253' AS DateTime2), CAST(N'2020-07-02T10:48:23.9753503' AS DateTime2), 0, NULL, 1, 23, CAST(25000.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 2012, 2)
INSERT [dbo].[Stocks] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity], [Price], [Discount], [ProductId], [StoreId]) VALUES (18, CAST(N'2020-06-30T21:56:52.1689014' AS DateTime2), CAST(N'2020-07-02T11:23:44.3412150' AS DateTime2), 0, NULL, 1, 13, CAST(25000.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), 2012, 1)
INSERT [dbo].[Stocks] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity], [Price], [Discount], [ProductId], [StoreId]) VALUES (19, CAST(N'2020-06-30T21:57:14.5639808' AS DateTime2), CAST(N'2020-07-02T10:47:50.2174808' AS DateTime2), 0, NULL, 1, 16, CAST(20000.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), 2013, 1)
INSERT [dbo].[Stocks] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity], [Price], [Discount], [ProductId], [StoreId]) VALUES (20, CAST(N'2020-06-30T21:57:41.4068031' AS DateTime2), CAST(N'2020-07-02T11:23:05.2453834' AS DateTime2), 0, NULL, 1, 8, CAST(22800.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 2014, 3)
INSERT [dbo].[Stocks] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity], [Price], [Discount], [ProductId], [StoreId]) VALUES (21, CAST(N'2020-06-30T21:58:14.2848192' AS DateTime2), CAST(N'2020-07-02T11:19:23.1202054' AS DateTime2), 0, NULL, 1, 5, CAST(72800.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 2015, 5)
INSERT [dbo].[Stocks] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity], [Price], [Discount], [ProductId], [StoreId]) VALUES (22, CAST(N'2020-06-30T21:58:45.7837617' AS DateTime2), NULL, 0, NULL, 1, 3, CAST(92800.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 2016, 5)
INSERT [dbo].[Stocks] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity], [Price], [Discount], [ProductId], [StoreId]) VALUES (23, CAST(N'2020-06-30T22:00:05.3838104' AS DateTime2), NULL, 0, NULL, 1, 15, CAST(42259.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 2017, 4)
INSERT [dbo].[Stocks] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity], [Price], [Discount], [ProductId], [StoreId]) VALUES (24, CAST(N'2020-06-30T22:00:28.7377726' AS DateTime2), CAST(N'2020-06-30T22:55:15.7544517' AS DateTime2), 0, NULL, 1, 15, CAST(59999.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 2018, 4)
INSERT [dbo].[Stocks] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity], [Price], [Discount], [ProductId], [StoreId]) VALUES (25, CAST(N'2020-07-02T10:38:02.1997084' AS DateTime2), NULL, 0, NULL, 1, 2, CAST(128000.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 2007, 3)
INSERT [dbo].[Stocks] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity], [Price], [Discount], [ProductId], [StoreId]) VALUES (26, CAST(N'2020-07-02T10:39:02.6807083' AS DateTime2), NULL, 0, NULL, 1, 7, CAST(62000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 2010, 3)
SET IDENTITY_INSERT [dbo].[Stocks] OFF
SET IDENTITY_INSERT [dbo].[Stores] ON 

INSERT [dbo].[Stores] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name], [Email], [Phone], [WebSite], [Address], [CityId]) VALUES (1, CAST(N'2020-06-08T20:41:20.4966631' AS DateTime2), NULL, 0, NULL, 1, N'Gigatron', N'info@gigatron.rs', N'011316845', N'www.gigatron.rs', N'Milosa Pocerca 123', 1)
INSERT [dbo].[Stores] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name], [Email], [Phone], [WebSite], [Address], [CityId]) VALUES (2, CAST(N'2020-06-08T22:57:18.0497905' AS DateTime2), NULL, 0, NULL, 1, N'Win Win', N'office@winwin.rs', N'0691234567', N'www.winwin.rs', N'Bulevar Kralja Aleksandra 105', 1)
INSERT [dbo].[Stores] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name], [Email], [Phone], [WebSite], [Address], [CityId]) VALUES (3, CAST(N'2020-06-09T00:33:37.6127453' AS DateTime2), CAST(N'2020-06-09T00:36:41.4998828' AS DateTime2), 0, NULL, 1, N'Tech', N'tech@gmail.com', N'031512345', N'www.tech.rs', N'Dimitrija Tucovica 5', 9)
INSERT [dbo].[Stores] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name], [Email], [Phone], [WebSite], [Address], [CityId]) VALUES (4, CAST(N'2020-06-30T17:46:20.4995241' AS DateTime2), NULL, 0, NULL, 1, N'Yellow', N'yellowstore@gmail.com', N'061234567', N'yellowstore.com', N'Vojvodjanska 10', 10)
INSERT [dbo].[Stores] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name], [Email], [Phone], [WebSite], [Address], [CityId]) VALUES (5, CAST(N'2020-06-30T17:47:34.5555490' AS DateTime2), NULL, 0, NULL, 1, N'GamePad NS', N'gamepad@gmail.com', N'068456456', N'gamepad.com', N'Branka Radicevica 11', 10)
SET IDENTITY_INSERT [dbo].[Stores] OFF
SET IDENTITY_INSERT [dbo].[UseCaseLogs] ON 

INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1, CAST(N'2020-06-12T21:59:30.7306813' AS DateTime2), N'Read Cities using EF', N'{"Name":null,"PostalCode":null}', N'0 Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2, CAST(N'2020-06-12T22:41:54.7995540' AS DateTime2), N'User registration using EF', N'{"Id":0,"FirstName":null,"LastName":null,"Email":null,"Password":null,"Phone":null,"Address":null,"CityId":0,"CityName":null,"UserOrders":null,"UserUseCases":null}', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (3, CAST(N'2020-06-12T22:44:30.6621791' AS DateTime2), N'User registration using EF', N'{"Id":0,"FirstName":"Laza","LastName":"lazic","Email":"testappmailmarko@gmail.com","Password":"sifra123","Phone":"132456456","Address":"Kneza Lazara 16","CityId":1,"CityName":null,"UserOrders":null,"UserUseCases":null}', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1002, CAST(N'2020-06-30T19:35:33.9041369' AS DateTime2), N'Read Use case logs using EF', N'{"Id":null,"MinDate":null,"MaxDate":null,"UseCaseName":null,"Data":null,"Actor":null,"PerPage":5,"Page":1}', N'Admin Admin admin@bestbuy.rs')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1003, CAST(N'2020-06-30T19:39:51.2768568' AS DateTime2), N'Read Stores using EF', N'{"Name":null,"CityName":null,"PerPage":5,"Page":1}', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1004, CAST(N'2020-06-30T19:40:05.3509311' AS DateTime2), N'Read Products using EF', N'{"Name":null,"BrandName":null,"BrandId":null,"CategoryName":null,"CategoryId":null,"PerPage":5,"Page":1}', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1005, CAST(N'2020-06-30T19:46:47.6263443' AS DateTime2), N'Create new Stock using EF', N'{"Id":0,"Quantity":10,"Price":122000.0,"Discount":5.0,"ProductId":2007,"StoreId":1}', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1006, CAST(N'2020-06-30T19:47:02.2054664' AS DateTime2), N'Read Stores using EF', N'{"Name":null,"CityName":null,"PerPage":5,"Page":1}', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1007, CAST(N'2020-06-30T19:47:21.7238658' AS DateTime2), N'Read Products using EF', N'{"Name":null,"BrandName":null,"BrandId":null,"CategoryName":null,"CategoryId":null,"PerPage":5,"Page":1}', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1008, CAST(N'2020-06-30T19:49:23.8769349' AS DateTime2), N'Create new Stock using EF', N'{"Id":0,"Quantity":50,"Price":128000.0,"Discount":12.0,"ProductId":2007,"StoreId":2}', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1009, CAST(N'2020-06-30T19:49:31.6944780' AS DateTime2), N'Create new Stock using EF', N'{"Id":0,"Quantity":50,"Price":128000.0,"Discount":12.0,"ProductId":2007,"StoreId":2}', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1010, CAST(N'2020-06-30T20:11:14.9673039' AS DateTime2), N'User registration using EF', N'{"Id":0,"FirstName":"Marko","LastName":"Mutavdzic","Email":"marko.mutavdzic.125.16@ict.edu.rs","Password":"sifra123","Phone":"061234567","Address":"Uzicka 1","CityId":9}', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1011, CAST(N'2020-06-30T20:16:00.9535980' AS DateTime2), N'Read Brands using EF', N'6', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1012, CAST(N'2020-06-30T20:34:46.2699625' AS DateTime2), N'Read Stocks using EF', N'{"MinPrice":null,"MaxPrice":null,"MinDiscount":null,"MaxDiscount":null,"ProductName":null,"StoreName":null,"BrandName":null,"BrandId":null,"CategoryName":null,"CategoryId":null,"PerPage":5,"Page":4}', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1013, CAST(N'2020-06-30T20:35:15.0775802' AS DateTime2), N'Read Stocks using EF', N'{"MinPrice":null,"MaxPrice":null,"MinDiscount":null,"MaxDiscount":null,"ProductName":null,"StoreName":null,"BrandName":null,"BrandId":null,"CategoryName":null,"CategoryId":null,"PerPage":5,"Page":2}', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1014, CAST(N'2020-06-30T20:40:07.8167165' AS DateTime2), N'Create new Order using EF', N'{"Id":0,"OrderDate":"2020-06-30T20:16:31.24Z","Address":"Uzicka 1","UserId":0,"DelivererId":1,"Items":[{"Id":0,"OrderId":0,"Quantity":1,"StockId":6,"Price":0.0},{"Id":0,"OrderId":0,"Quantity":1,"StockId":24,"Price":0.0},{"Id":0,"OrderId":0,"Quantity":6,"StockId":13,"Price":0.0}]}', N'Marko Mutavdzic marko.mutavdzic.125.16@ict.edu.rs')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1015, CAST(N'2020-06-30T20:41:09.9402929' AS DateTime2), N'Create new Order using EF', N'{"Id":0,"OrderDate":"2020-07-02T20:16:31.24Z","Address":"Uzicka 1","UserId":0,"DelivererId":1,"Items":[{"Id":0,"OrderId":0,"Quantity":1,"StockId":6,"Price":0.0},{"Id":0,"OrderId":0,"Quantity":1,"StockId":24,"Price":0.0},{"Id":0,"OrderId":0,"Quantity":2,"StockId":13,"Price":0.0}]}', N'Marko Mutavdzic marko.mutavdzic.125.16@ict.edu.rs')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1016, CAST(N'2020-06-30T20:42:22.3843244' AS DateTime2), N'Create new Order using EF', N'{"Id":0,"OrderDate":"2020-07-03T20:16:31.24Z","Address":"Uzicka 1","UserId":0,"DelivererId":1,"Items":[{"Id":0,"OrderId":0,"Quantity":5,"StockId":17,"Price":0.0},{"Id":0,"OrderId":0,"Quantity":4,"StockId":18,"Price":0.0},{"Id":0,"OrderId":0,"Quantity":2,"StockId":14,"Price":0.0}]}', N'Marko Mutavdzic marko.mutavdzic.125.16@ict.edu.rs')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1017, CAST(N'2020-06-30T20:44:06.7278732' AS DateTime2), N'Create new Order using EF', N'{"Id":0,"OrderDate":"2020-07-03T20:16:31.24Z","Address":"Uzicka 1","UserId":0,"DelivererId":1,"Items":[{"Id":0,"OrderId":0,"Quantity":3,"StockId":7,"Price":0.0}]}', N'Marko Mutavdzic marko.mutavdzic.125.16@ict.edu.rs')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1018, CAST(N'2020-06-30T20:45:39.9508508' AS DateTime2), N'Read Orders using EF', N'{"MinCreatedAt":null,"MaxCreatedAt":null,"MinOrderDate":null,"MaxOrderDate":null,"MinShippedDate":null,"MaxShippedDate":null,"MinTotalPrice":null,"MaxTotalPrice":null,"Address":null,"UserId":null,"DelivererId":null,"Status":null,"PerPage":5,"Page":1}', N'Admin Admin admin@bestbuy.rs')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1019, CAST(N'2020-06-30T20:46:12.2221587' AS DateTime2), N'Read Stocks using EF', N'{"MinPrice":null,"MaxPrice":null,"MinDiscount":null,"MaxDiscount":null,"ProductName":null,"StoreName":null,"BrandName":null,"BrandId":null,"CategoryName":null,"CategoryId":null,"PerPage":5,"Page":1}', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1020, CAST(N'2020-06-30T20:46:44.0088805' AS DateTime2), N'Read Stocks using EF', N'{"MinPrice":null,"MaxPrice":null,"MinDiscount":null,"MaxDiscount":null,"ProductName":null,"StoreName":null,"BrandName":null,"BrandId":null,"CategoryName":null,"CategoryId":null,"PerPage":5,"Page":3}', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1021, CAST(N'2020-06-30T20:47:50.0932317' AS DateTime2), N'Read Order using EF', N'1005', N'Admin Admin admin@bestbuy.rs')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1022, CAST(N'2020-06-30T20:48:34.7975191' AS DateTime2), N'Read Stock using EF', N'1006', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1023, CAST(N'2020-06-30T20:48:54.6016147' AS DateTime2), N'Read Stock using EF', N'24', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1024, CAST(N'2020-06-30T20:49:48.0950944' AS DateTime2), N'Read Orders using EF', N'{"MinCreatedAt":null,"MaxCreatedAt":null,"MinOrderDate":null,"MaxOrderDate":null,"MinShippedDate":null,"MaxShippedDate":null,"MinTotalPrice":null,"MaxTotalPrice":null,"Address":null,"UserId":null,"DelivererId":null,"Status":null,"PerPage":5,"Page":1}', N'Marko Mutavdzic marko.mutavdzic.125.16@ict.edu.rs')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1025, CAST(N'2020-06-30T20:50:00.5365583' AS DateTime2), N'Read Order using EF', N'1004', N'Marko Mutavdzic marko.mutavdzic.125.16@ict.edu.rs')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1026, CAST(N'2020-06-30T20:54:12.3075519' AS DateTime2), N'Read Orders using EF', N'{"MinCreatedAt":null,"MaxCreatedAt":null,"MinOrderDate":null,"MaxOrderDate":null,"MinShippedDate":null,"MaxShippedDate":null,"MinTotalPrice":null,"MaxTotalPrice":null,"Address":null,"UserId":null,"DelivererId":null,"Status":null,"PerPage":5,"Page":1}', N'Admin Admin admin@bestbuy.rs')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1027, CAST(N'2020-06-30T20:55:15.6034908' AS DateTime2), N'Change Order status using EF', N'{"OrderId":1005,"Status":3}', N'Admin Admin admin@bestbuy.rs')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1028, CAST(N'2020-06-30T20:56:14.0896334' AS DateTime2), N'Read Orders using EF', N'{"MinCreatedAt":null,"MaxCreatedAt":null,"MinOrderDate":null,"MaxOrderDate":null,"MinShippedDate":null,"MaxShippedDate":null,"MinTotalPrice":null,"MaxTotalPrice":null,"Address":null,"UserId":null,"DelivererId":null,"Status":null,"PerPage":5,"Page":1}', N'Admin Admin admin@bestbuy.rs')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1029, CAST(N'2020-06-30T20:57:12.5565603' AS DateTime2), N'Read Stocks using EF', N'{"MinPrice":null,"MaxPrice":null,"MinDiscount":null,"MaxDiscount":null,"ProductName":null,"StoreName":null,"BrandName":null,"BrandId":null,"CategoryName":null,"CategoryId":null,"PerPage":5,"Page":1}', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1030, CAST(N'2020-06-30T20:57:18.6657390' AS DateTime2), N'Read Stock using EF', N'24', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1031, CAST(N'2020-06-30T20:58:21.8184814' AS DateTime2), N'Read Use cases using EF', N'{"UseCaseId":null,"UserId":null,"PerPage":5,"Page":1}', N'Admin Admin admin@bestbuy.rs')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1032, CAST(N'2020-06-30T20:59:13.1975705' AS DateTime2), N'Read Use case logs using EF', N'{"Id":null,"MinDate":null,"MaxDate":null,"UseCaseName":null,"Data":null,"Actor":null,"PerPage":5,"Page":1}', N'Admin Admin admin@bestbuy.rs')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1033, CAST(N'2020-06-30T21:00:40.0141436' AS DateTime2), N'Read Use case logs using EF', N'{"Id":null,"MinDate":null,"MaxDate":null,"UseCaseName":null,"Data":null,"Actor":null,"PerPage":5,"Page":7}', N'Admin Admin admin@bestbuy.rs')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1034, CAST(N'2020-06-30T21:14:00.7772772' AS DateTime2), N'Read Products using EF', N'{"Name":null,"BrandName":null,"BrandId":null,"CategoryName":null,"CategoryId":null,"PerPage":5,"Page":1}', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1035, CAST(N'2020-06-30T21:19:11.3304445' AS DateTime2), N'Update Product using EF', N'{"Id":2008,"Name":"Lenovo IdeaCentre 510S-08IKL","Description":"Lenovo Description: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.","BrandId":5,"CategoryId":1,"Image":null,"ImagePath":null}', N'Admin Admin admin@bestbuy.rs')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1036, CAST(N'2020-06-30T21:19:26.5475468' AS DateTime2), N'Read Product using EF', N'2008', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1037, CAST(N'2020-07-02T08:28:13.9758034' AS DateTime2), N'Read Products using EF', N'{"Name":null,"BrandName":null,"BrandId":null,"CategoryName":null,"CategoryId":null,"PerPage":5,"Page":1}', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1038, CAST(N'2020-07-02T08:28:41.9339066' AS DateTime2), N'Read Stocks using EF', N'{"MinPrice":null,"MaxPrice":null,"MinDiscount":null,"MaxDiscount":null,"ProductName":null,"StoreName":null,"BrandName":null,"BrandId":null,"CategoryName":null,"CategoryId":null,"PerPage":5,"Page":1}', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1039, CAST(N'2020-07-02T08:30:12.8836610' AS DateTime2), N'Read Orders using EF', N'{"MinCreatedAt":null,"MaxCreatedAt":null,"MinOrderDate":null,"MaxOrderDate":null,"MinShippedDate":null,"MaxShippedDate":null,"MinTotalPrice":null,"MaxTotalPrice":null,"Address":null,"UserId":null,"DelivererId":null,"Status":null,"PerPage":5,"Page":1}', N'Admin Admin admin@bestbuy.rs')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1040, CAST(N'2020-07-02T08:30:48.8435808' AS DateTime2), N'Read Users using EF', N'{"FirstName":null,"LastName":null,"CityName":null,"PerPage":5,"Page":1}', N'Admin Admin admin@bestbuy.rs')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1041, CAST(N'2020-07-02T08:34:58.7524451' AS DateTime2), N'Read Stocks using EF', N'{"MinPrice":null,"MaxPrice":null,"MinDiscount":null,"MaxDiscount":null,"ProductName":null,"StoreName":null,"BrandName":null,"BrandId":null,"CategoryName":null,"CategoryId":null,"PerPage":5,"Page":1}', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1042, CAST(N'2020-07-02T08:36:48.6423330' AS DateTime2), N'Read Products using EF', N'{"Name":null,"BrandName":null,"BrandId":null,"CategoryName":null,"CategoryId":null,"PerPage":5,"Page":1}', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1043, CAST(N'2020-07-02T08:37:17.5426844' AS DateTime2), N'Read Products using EF', N'{"Name":null,"BrandName":null,"BrandId":null,"CategoryName":null,"CategoryId":null,"PerPage":27,"Page":1}', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1044, CAST(N'2020-07-02T08:38:01.9443593' AS DateTime2), N'Create new Stock using EF', N'{"Id":0,"Quantity":2,"Price":128000.00,"Discount":5.00,"ProductId":2007,"StoreId":3}', N'Admin Admin admin@bestbuy.rs')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1045, CAST(N'2020-07-02T08:39:02.4637422' AS DateTime2), N'Create new Stock using EF', N'{"Id":0,"Quantity":7,"Price":62000.00,"Discount":0.0,"ProductId":2010,"StoreId":3}', N'Admin Admin admin@bestbuy.rs')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1046, CAST(N'2020-07-02T08:39:12.2985773' AS DateTime2), N'Read Stocks using EF', N'{"MinPrice":null,"MaxPrice":null,"MinDiscount":null,"MaxDiscount":null,"ProductName":null,"StoreName":null,"BrandName":null,"BrandId":null,"CategoryName":null,"CategoryId":null,"PerPage":5,"Page":1}', N'Admin Admin admin@bestbuy.rs')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1047, CAST(N'2020-07-02T08:40:26.6752804' AS DateTime2), N'Read Orders using EF', N'{"MinCreatedAt":null,"MaxCreatedAt":null,"MinOrderDate":null,"MaxOrderDate":null,"MinShippedDate":null,"MaxShippedDate":null,"MinTotalPrice":null,"MaxTotalPrice":null,"Address":null,"UserId":null,"DelivererId":null,"Status":null,"PerPage":5,"Page":1}', N'Marko Mutavdzic marko.mutavdzic.125.16@ict.edu.rs')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1048, CAST(N'2020-07-02T08:41:05.0419727' AS DateTime2), N'Read Order using EF', N'1004', N'Marko Mutavdzic marko.mutavdzic.125.16@ict.edu.rs')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1049, CAST(N'2020-07-02T08:41:56.8903240' AS DateTime2), N'Read Orders using EF', N'{"MinCreatedAt":null,"MaxCreatedAt":null,"MinOrderDate":null,"MaxOrderDate":null,"MinShippedDate":null,"MaxShippedDate":null,"MinTotalPrice":null,"MaxTotalPrice":null,"Address":null,"UserId":null,"DelivererId":null,"Status":null,"PerPage":5,"Page":1}', N'Admin Admin admin@bestbuy.rs')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1050, CAST(N'2020-07-02T08:42:23.4214196' AS DateTime2), N'Read Order using EF', N'1005', N'Marko Mutavdzic marko.mutavdzic.125.16@ict.edu.rs')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1051, CAST(N'2020-07-02T08:43:04.6386144' AS DateTime2), N'Read Orders using EF', N'{"MinCreatedAt":null,"MaxCreatedAt":null,"MinOrderDate":null,"MaxOrderDate":null,"MinShippedDate":null,"MaxShippedDate":null,"MinTotalPrice":null,"MaxTotalPrice":null,"Address":null,"UserId":null,"DelivererId":null,"Status":null,"PerPage":5,"Page":1}', N'Marko Mutavdzic marko.mutavdzic.125.16@ict.edu.rs')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1052, CAST(N'2020-07-02T08:43:43.1140893' AS DateTime2), N'Read Order using EF', N'1005', N'Marko Mutavdzic marko.mutavdzic.125.16@ict.edu.rs')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1053, CAST(N'2020-07-02T08:45:25.0295834' AS DateTime2), N'Read Stocks using EF', N'{"MinPrice":null,"MaxPrice":null,"MinDiscount":null,"MaxDiscount":null,"ProductName":null,"StoreName":null,"BrandName":null,"BrandId":null,"CategoryName":null,"CategoryId":null,"PerPage":5,"Page":1}', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1054, CAST(N'2020-07-02T08:45:31.9496788' AS DateTime2), N'Read Stocks using EF', N'{"MinPrice":null,"MaxPrice":null,"MinDiscount":null,"MaxDiscount":null,"ProductName":null,"StoreName":null,"BrandName":null,"BrandId":null,"CategoryName":null,"CategoryId":null,"PerPage":5,"Page":4}', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1055, CAST(N'2020-07-02T08:46:07.5722250' AS DateTime2), N'Read Stocks using EF', N'{"MinPrice":null,"MaxPrice":null,"MinDiscount":null,"MaxDiscount":null,"ProductName":null,"StoreName":null,"BrandName":null,"BrandId":null,"CategoryName":null,"CategoryId":null,"PerPage":5,"Page":7}', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1056, CAST(N'2020-07-02T08:46:11.6440469' AS DateTime2), N'Read Stocks using EF', N'{"MinPrice":null,"MaxPrice":null,"MinDiscount":null,"MaxDiscount":null,"ProductName":null,"StoreName":null,"BrandName":null,"BrandId":null,"CategoryName":null,"CategoryId":null,"PerPage":5,"Page":5}', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1057, CAST(N'2020-07-02T08:46:20.4848456' AS DateTime2), N'Read Stocks using EF', N'{"MinPrice":null,"MaxPrice":null,"MinDiscount":null,"MaxDiscount":null,"ProductName":null,"StoreName":null,"BrandName":null,"BrandId":null,"CategoryName":null,"CategoryId":null,"PerPage":5,"Page":4}', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1058, CAST(N'2020-07-02T08:46:23.5202684' AS DateTime2), N'Read Stocks using EF', N'{"MinPrice":null,"MaxPrice":null,"MinDiscount":null,"MaxDiscount":null,"ProductName":null,"StoreName":null,"BrandName":null,"BrandId":null,"CategoryName":null,"CategoryId":null,"PerPage":5,"Page":3}', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1059, CAST(N'2020-07-02T08:47:22.1456022' AS DateTime2), N'Read Order using EF', N'1005', N'Marko Mutavdzic marko.mutavdzic.125.16@ict.edu.rs')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1060, CAST(N'2020-07-02T08:47:49.9855246' AS DateTime2), N'Create new Order using EF', N'{"Id":0,"OrderDate":"2020-07-05T00:00:00","Address":"Uzicka 1","UserId":0,"DelivererId":3,"Items":[{"Id":0,"OrderId":0,"Quantity":1,"StockId":21,"Price":0.0},{"Id":0,"OrderId":0,"Quantity":4,"StockId":19,"Price":0.0}]}', N'Marko Mutavdzic marko.mutavdzic.125.16@ict.edu.rs')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1061, CAST(N'2020-07-02T08:48:23.9004289' AS DateTime2), N'Create new Order using EF', N'{"Id":0,"OrderDate":"2020-07-05T00:00:00","Address":"Uzicka 1","UserId":0,"DelivererId":3,"Items":[{"Id":0,"OrderId":0,"Quantity":2,"StockId":17,"Price":0.0},{"Id":0,"OrderId":0,"Quantity":1,"StockId":20,"Price":0.0}]}', N'Marko Mutavdzic marko.mutavdzic.125.16@ict.edu.rs')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1062, CAST(N'2020-07-02T08:48:56.8327134' AS DateTime2), N'Create new Order using EF', N'{"Id":0,"OrderDate":"2020-07-05T00:00:00","Address":"Uzicka 1","UserId":0,"DelivererId":3,"Items":[{"Id":0,"OrderId":0,"Quantity":2,"StockId":27,"Price":0.0}]}', N'Marko Mutavdzic marko.mutavdzic.125.16@ict.edu.rs')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1063, CAST(N'2020-07-02T08:49:14.5730809' AS DateTime2), N'Create new Order using EF', N'{"Id":0,"OrderDate":"2020-07-05T00:00:00","Address":"Uzicka 1","UserId":0,"DelivererId":3,"Items":[{"Id":0,"OrderId":0,"Quantity":2,"StockId":21,"Price":0.0}]}', N'Marko Mutavdzic marko.mutavdzic.125.16@ict.edu.rs')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1064, CAST(N'2020-07-02T08:49:33.7733171' AS DateTime2), N'Create new Order using EF', N'{"Id":0,"OrderDate":"2020-07-05T00:00:00","Address":"Uzicka 1","UserId":0,"DelivererId":3,"Items":[{"Id":0,"OrderId":0,"Quantity":2,"StockId":6,"Price":0.0}]}', N'Marko Mutavdzic marko.mutavdzic.125.16@ict.edu.rs')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1065, CAST(N'2020-07-02T08:50:26.6844038' AS DateTime2), N'Read Users using EF', N'{"FirstName":null,"LastName":null,"CityName":null,"PerPage":5,"Page":1}', N'Admin Admin admin@bestbuy.rs')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1066, CAST(N'2020-07-02T08:52:36.9125047' AS DateTime2), N'Change Order status using EF', N'{"OrderId":1006,"Status":1}', N'Admin Admin admin@bestbuy.rs')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1067, CAST(N'2020-07-02T08:52:50.0583649' AS DateTime2), N'Change Order status using EF', N'{"OrderId":1006,"Status":2}', N'Admin Admin admin@bestbuy.rs')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1068, CAST(N'2020-07-02T08:53:16.5568556' AS DateTime2), N'Change Order status using EF', N'{"OrderId":1006,"Status":1}', N'Admin Admin admin@bestbuy.rs')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1069, CAST(N'2020-07-02T08:53:39.1046686' AS DateTime2), N'Change Order status using EF', N'{"OrderId":1007,"Status":2}', N'Admin Admin admin@bestbuy.rs')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1070, CAST(N'2020-07-02T08:54:08.9414659' AS DateTime2), N'Change Order status using EF', N'{"OrderId":1007,"Status":1}', N'Admin Admin admin@bestbuy.rs')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1071, CAST(N'2020-07-02T08:54:29.7077322' AS DateTime2), N'Change Order status using EF', N'{"OrderId":1008,"Status":2}', N'Admin Admin admin@bestbuy.rs')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1072, CAST(N'2020-07-02T08:55:29.1139268' AS DateTime2), N'Read Cities using EF', N'{"Name":null,"PostalCode":null,"PerPage":5,"Page":1}', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1073, CAST(N'2020-07-02T08:55:43.9121989' AS DateTime2), N'Read Cities using EF', N'{"Name":null,"PostalCode":null,"PerPage":5,"Page":2}', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1074, CAST(N'2020-07-02T08:57:05.7571699' AS DateTime2), N'User registration using EF', N'{"Id":0,"FirstName":"Pera","LastName":"Peric","Email":"pera@mail.rs","Password":null,"Phone":"061234567","Address":"Simina bb","CityId":0}', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1075, CAST(N'2020-07-02T08:57:29.9528978' AS DateTime2), N'User registration using EF', N'{"Id":0,"FirstName":"Pera","LastName":"Peric","Email":"pera@mail.rs","Password":"sifra123","Phone":"061234567","Address":"Simina bb","CityId":35}', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1076, CAST(N'2020-07-02T08:58:49.0331325' AS DateTime2), N'Create new Order using EF', N'{"Id":0,"OrderDate":"2020-07-04T00:00:00","Address":"Barandjanska 8","UserId":0,"DelivererId":3,"Items":[{"Id":0,"OrderId":0,"Quantity":2,"StockId":11,"Price":0.0}]}', N'Pera Peric pera@mail.rs')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1077, CAST(N'2020-07-02T08:59:50.0512886' AS DateTime2), N'Create new Order using EF', N'{"Id":0,"OrderDate":"2020-07-04T00:00:00","Address":"Lipovacka 23","UserId":0,"DelivererId":1,"Items":[{"Id":0,"OrderId":0,"Quantity":2,"StockId":18,"Price":0.0},{"Id":0,"OrderId":0,"Quantity":1,"StockId":9,"Price":0.0}]}', N'Pera Peric pera@mail.rs')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1078, CAST(N'2020-07-02T09:00:51.5216476' AS DateTime2), N'Create new Order using EF', N'{"Id":0,"OrderDate":"2020-07-08T00:00:00","Address":"Lipovacka 23","UserId":0,"DelivererId":2,"Items":[{"Id":0,"OrderId":0,"Quantity":1,"StockId":3,"Price":0.0},{"Id":0,"OrderId":0,"Quantity":1,"StockId":16,"Price":0.0}]}', N'Pera Peric pera@mail.rs')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1079, CAST(N'2020-07-02T09:01:20.7134249' AS DateTime2), N'Create new Order using EF', N'{"Id":0,"OrderDate":"2020-07-08T00:00:00","Address":"Lipovacka 23","UserId":0,"DelivererId":2,"Items":[{"Id":0,"OrderId":0,"Quantity":1,"StockId":10,"Price":0.0},{"Id":0,"OrderId":0,"Quantity":1,"StockId":16,"Price":0.0}]}', N'Pera Peric pera@mail.rs')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1080, CAST(N'2020-07-02T09:04:38.3596719' AS DateTime2), N'Create new Order using EF', N'{"Id":0,"OrderDate":"2020-07-08T00:00:00","Address":"Lipovacka 23","UserId":0,"DelivererId":2,"Items":[{"Id":0,"OrderId":0,"Quantity":3,"StockId":12,"Price":0.0}]}', N'Pera Peric pera@mail.rs')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1081, CAST(N'2020-07-02T09:05:29.4089733' AS DateTime2), N'Create new Order using EF', N'{"Id":0,"OrderDate":"2020-07-08T00:00:00","Address":"Lipovacka 23","UserId":0,"DelivererId":2,"Items":[{"Id":0,"OrderId":0,"Quantity":3,"StockId":9,"Price":0.0}]}', N'Pera Peric pera@mail.rs')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1082, CAST(N'2020-07-02T09:08:12.3989054' AS DateTime2), N'Create new Order using EF', N'{"Id":0,"OrderDate":"2020-07-08T00:00:00","Address":"Barandjanaska 8","UserId":0,"DelivererId":1,"Items":[{"Id":0,"OrderId":0,"Quantity":3,"StockId":15,"Price":0.0}]}', N'Pera Peric pera@mail.rs')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1083, CAST(N'2020-07-02T09:08:34.3062864' AS DateTime2), N'Read Orders using EF', N'{"MinCreatedAt":null,"MaxCreatedAt":null,"MinOrderDate":null,"MaxOrderDate":null,"MinShippedDate":null,"MaxShippedDate":null,"MinTotalPrice":null,"MaxTotalPrice":null,"Address":null,"UserId":null,"DelivererId":null,"Status":null,"PerPage":5,"Page":1}', N'Admin Admin admin@bestbuy.rs')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1084, CAST(N'2020-07-02T09:10:27.2958436' AS DateTime2), N'Create new Order using EF', N'{"Id":0,"OrderDate":"2020-07-07T00:00:00","Address":"Barandjanaska 8","UserId":0,"DelivererId":1,"Items":[{"Id":0,"OrderId":0,"Quantity":3,"StockId":11,"Price":0.0}]}', N'Pera Peric pera@mail.rs')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1085, CAST(N'2020-07-02T09:11:16.5270319' AS DateTime2), N'Create new Order using EF', N'{"Id":0,"OrderDate":"2020-07-12T00:00:00","Address":"Barandjanaska 8","UserId":0,"DelivererId":1,"Items":[{"Id":0,"OrderId":0,"Quantity":1,"StockId":11,"Price":0.0},{"Id":0,"OrderId":0,"Quantity":1,"StockId":12,"Price":0.0},{"Id":0,"OrderId":0,"Quantity":1,"StockId":13,"Price":0.0}]}', N'Pera Peric pera@mail.rs')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1086, CAST(N'2020-07-02T09:11:43.3247383' AS DateTime2), N'Read Stocks using EF', N'{"MinPrice":null,"MaxPrice":null,"MinDiscount":null,"MaxDiscount":null,"ProductName":null,"StoreName":null,"BrandName":null,"BrandId":null,"CategoryName":null,"CategoryId":null,"PerPage":5,"Page":1}', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1087, CAST(N'2020-07-02T09:11:55.0475659' AS DateTime2), N'Read Stock using EF', N'11', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1088, CAST(N'2020-07-02T09:12:26.2630772' AS DateTime2), N'Read Stock using EF', N'12', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1089, CAST(N'2020-07-02T09:12:53.1869264' AS DateTime2), N'Create new Order using EF', N'{"Id":0,"OrderDate":"2020-07-12T00:00:00","Address":"Barandjanaska 8","UserId":0,"DelivererId":1,"Items":[{"Id":0,"OrderId":0,"Quantity":1,"StockId":11,"Price":0.0},{"Id":0,"OrderId":0,"Quantity":1,"StockId":13,"Price":0.0}]}', N'Pera Peric pera@mail.rs')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1090, CAST(N'2020-07-02T09:12:59.5188622' AS DateTime2), N'Read Stock using EF', N'13', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1091, CAST(N'2020-07-02T09:13:12.9669412' AS DateTime2), N'Read Stock using EF', N'21', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1092, CAST(N'2020-07-02T09:13:42.0840441' AS DateTime2), N'Create new Order using EF', N'{"Id":0,"OrderDate":"2020-07-12T00:00:00","Address":"Barandjanaska 8","UserId":0,"DelivererId":1,"Items":[{"Id":0,"OrderId":0,"Quantity":1,"StockId":21,"Price":0.0}]}', N'Pera Peric pera@mail.rs')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1093, CAST(N'2020-07-02T09:19:23.0660994' AS DateTime2), N'Create new Order using EF', N'{"Id":0,"OrderDate":"2020-07-12T00:00:00","Address":"Barandjanaska 8","UserId":0,"DelivererId":1,"Items":[{"Id":0,"OrderId":0,"Quantity":1,"StockId":21,"Price":0.0}]}', N'Pera Peric pera@mail.rs')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1094, CAST(N'2020-07-02T09:21:00.3711738' AS DateTime2), N'Create new Order using EF', N'{"Id":0,"OrderDate":"2020-07-12T00:00:00","Address":"Barandjanaska 8","UserId":0,"DelivererId":2,"Items":[{"Id":0,"OrderId":0,"Quantity":1,"StockId":20,"Price":0.0}]}', N'Pera Peric pera@mail.rs')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1095, CAST(N'2020-07-02T09:21:03.1773537' AS DateTime2), N'Create new Order using EF', N'{"Id":0,"OrderDate":"2020-07-12T00:00:00","Address":"Barandjanaska 8","UserId":0,"DelivererId":2,"Items":[{"Id":0,"OrderId":0,"Quantity":1,"StockId":20,"Price":0.0}]}', N'Pera Peric pera@mail.rs')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1096, CAST(N'2020-07-02T09:21:41.1828085' AS DateTime2), N'Read Orders using EF', N'{"MinCreatedAt":null,"MaxCreatedAt":null,"MinOrderDate":null,"MaxOrderDate":null,"MinShippedDate":null,"MaxShippedDate":null,"MinTotalPrice":null,"MaxTotalPrice":null,"Address":null,"UserId":null,"DelivererId":null,"Status":null,"PerPage":5,"Page":1}', N'Admin Admin admin@bestbuy.rs')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1097, CAST(N'2020-07-02T09:22:18.4763879' AS DateTime2), N'Read Orders using EF', N'{"MinCreatedAt":null,"MaxCreatedAt":null,"MinOrderDate":null,"MaxOrderDate":null,"MinShippedDate":null,"MaxShippedDate":null,"MinTotalPrice":null,"MaxTotalPrice":null,"Address":null,"UserId":null,"DelivererId":null,"Status":null,"PerPage":5,"Page":4}', N'Admin Admin admin@bestbuy.rs')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1098, CAST(N'2020-07-02T09:23:05.0629047' AS DateTime2), N'Cancel Order using EF', N'1023', N'Pera Peric pera@mail.rs')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1099, CAST(N'2020-07-02T09:23:44.3054982' AS DateTime2), N'Create new Order using EF', N'{"Id":0,"OrderDate":"2020-07-12T00:00:00","Address":"Barandjanaska 8","UserId":0,"DelivererId":3,"Items":[{"Id":0,"OrderId":0,"Quantity":1,"StockId":18,"Price":0.0}]}', N'Pera Peric pera@mail.rs')
SET IDENTITY_INSERT [dbo].[UseCaseLogs] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Email], [Password], [Phone], [Address], [CityId]) VALUES (20, CAST(N'2020-06-30T20:24:44.6482040' AS DateTime2), NULL, 0, NULL, 1, N'Admin', N'Admin', N'admin@bestbuy.rs', N'240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9', N'061234567', N'Nepoznata', 1)
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Email], [Password], [Phone], [Address], [CityId]) VALUES (21, CAST(N'2020-06-30T22:11:20.7175897' AS DateTime2), NULL, 0, NULL, 1, N'Marko', N'Mutavdzic', N'marko.mutavdzic.125.16@ict.edu.rs', N'566a489658425a07b32ed07c34d7a25cb4c3b16947799fdae2e8a9715cfce412', N'061234567', N'Uzicka 1', 9)
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Email], [Password], [Phone], [Address], [CityId]) VALUES (22, CAST(N'2020-07-02T10:57:30.0045851' AS DateTime2), NULL, 0, NULL, 1, N'Pera', N'Peric', N'pera@mail.rs', N'566a489658425a07b32ed07c34d7a25cb4c3b16947799fdae2e8a9715cfce412', N'061234567', N'Simina bb', 35)
SET IDENTITY_INSERT [dbo].[Users] OFF
SET IDENTITY_INSERT [dbo].[UserUseCases] ON 

INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2012, 1, 20)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2013, 28, 20)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2014, 29, 20)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2015, 30, 20)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2016, 31, 20)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2017, 32, 20)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2018, 33, 20)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2019, 34, 20)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2020, 35, 20)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2021, 36, 20)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2022, 37, 20)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2023, 27, 20)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2024, 38, 20)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2025, 40, 20)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2026, 41, 20)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2027, 42, 20)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2028, 43, 20)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2029, 44, 20)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2030, 45, 20)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2031, 46, 20)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2032, 47, 20)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2033, 48, 20)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2034, 49, 20)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2035, 39, 20)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2036, 50, 20)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2037, 26, 20)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2038, 24, 20)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2039, 2, 20)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2040, 3, 20)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2041, 4, 20)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2042, 5, 20)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2043, 6, 20)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2044, 7, 20)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2045, 8, 20)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2046, 9, 20)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2047, 10, 20)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2048, 11, 20)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2049, 25, 20)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2050, 12, 20)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2051, 14, 20)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2052, 15, 20)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2053, 16, 20)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2054, 17, 20)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2055, 18, 20)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2056, 19, 20)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2057, 20, 20)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2058, 21, 20)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2059, 22, 20)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2060, 23, 20)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2061, 13, 20)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2062, 51, 20)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2063, 2, 21)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2064, 43, 21)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2065, 41, 21)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2066, 40, 21)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2067, 39, 21)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2068, 33, 21)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2069, 32, 21)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2070, 28, 21)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2071, 27, 21)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2072, 23, 21)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2073, 22, 21)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2074, 18, 21)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2075, 17, 21)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2076, 13, 21)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2077, 12, 21)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2078, 7, 21)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2079, 44, 21)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2080, 45, 21)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2081, 2, 22)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2082, 43, 22)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2083, 41, 22)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2084, 40, 22)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2085, 39, 22)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2086, 33, 22)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2087, 32, 22)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2088, 28, 22)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2089, 27, 22)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2090, 23, 22)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2091, 22, 22)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2092, 18, 22)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2093, 17, 22)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2094, 13, 22)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2095, 12, 22)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2096, 7, 22)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2097, 44, 22)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (2098, 45, 22)
SET IDENTITY_INSERT [dbo].[UserUseCases] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Brands_Name]    Script Date: 2020-07-12 0:03:25 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Brands_Name] ON [dbo].[Brands]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Categories_Name]    Script Date: 2020-07-12 0:03:25 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Categories_Name] ON [dbo].[Categories]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Cities_Name]    Script Date: 2020-07-12 0:03:25 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Cities_Name] ON [dbo].[Cities]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Cities_PostalCode]    Script Date: 2020-07-12 0:03:25 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Cities_PostalCode] ON [dbo].[Cities]
(
	[PostalCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Deliverers_Name]    Script Date: 2020-07-12 0:03:25 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Deliverers_Name] ON [dbo].[Deliverers]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Items_OrderId]    Script Date: 2020-07-12 0:03:25 ******/
CREATE NONCLUSTERED INDEX [IX_Items_OrderId] ON [dbo].[Items]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Items_StockId]    Script Date: 2020-07-12 0:03:25 ******/
CREATE NONCLUSTERED INDEX [IX_Items_StockId] ON [dbo].[Items]
(
	[StockId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_DelivererId]    Script Date: 2020-07-12 0:03:25 ******/
CREATE NONCLUSTERED INDEX [IX_Orders_DelivererId] ON [dbo].[Orders]
(
	[DelivererId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_UserId]    Script Date: 2020-07-12 0:03:25 ******/
CREATE NONCLUSTERED INDEX [IX_Orders_UserId] ON [dbo].[Orders]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_BrandId]    Script Date: 2020-07-12 0:03:25 ******/
CREATE NONCLUSTERED INDEX [IX_Products_BrandId] ON [dbo].[Products]
(
	[BrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_CategoryId]    Script Date: 2020-07-12 0:03:25 ******/
CREATE NONCLUSTERED INDEX [IX_Products_CategoryId] ON [dbo].[Products]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Products_Name]    Script Date: 2020-07-12 0:03:25 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Products_Name] ON [dbo].[Products]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Stocks_ProductId]    Script Date: 2020-07-12 0:03:25 ******/
CREATE NONCLUSTERED INDEX [IX_Stocks_ProductId] ON [dbo].[Stocks]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Stocks_StoreId]    Script Date: 2020-07-12 0:03:25 ******/
CREATE NONCLUSTERED INDEX [IX_Stocks_StoreId] ON [dbo].[Stocks]
(
	[StoreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Stores_CityId]    Script Date: 2020-07-12 0:03:25 ******/
CREATE NONCLUSTERED INDEX [IX_Stores_CityId] ON [dbo].[Stores]
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Stores_Email]    Script Date: 2020-07-12 0:03:25 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Stores_Email] ON [dbo].[Stores]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Stores_Name]    Script Date: 2020-07-12 0:03:25 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Stores_Name] ON [dbo].[Stores]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Users_CityId]    Script Date: 2020-07-12 0:03:25 ******/
CREATE NONCLUSTERED INDEX [IX_Users_CityId] ON [dbo].[Users]
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_Email]    Script Date: 2020-07-12 0:03:25 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_Email] ON [dbo].[Users]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserUseCases_UserId]    Script Date: 2020-07-12 0:03:25 ******/
CREATE NONCLUSTERED INDEX [IX_UserUseCases_UserId] ON [dbo].[UserUseCases]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Items] ADD  DEFAULT ((0.0)) FOR [Price]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ((0)) FOR [UserId]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (N'') FOR [Address]
GO
ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [FK_Items_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [FK_Items_Orders_OrderId]
GO
ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [FK_Items_Stocks_StockId] FOREIGN KEY([StockId])
REFERENCES [dbo].[Stocks] ([Id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [FK_Items_Stocks_StockId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Deliverers_DelivererId] FOREIGN KEY([DelivererId])
REFERENCES [dbo].[Deliverers] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Deliverers_DelivererId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users_UserId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Brands_BrandId] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brands] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Brands_BrandId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories_CategoryId]
GO
ALTER TABLE [dbo].[Stocks]  WITH CHECK ADD  CONSTRAINT [FK_Stocks_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Stocks] CHECK CONSTRAINT [FK_Stocks_Products_ProductId]
GO
ALTER TABLE [dbo].[Stocks]  WITH CHECK ADD  CONSTRAINT [FK_Stocks_Stores_StoreId] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Stores] ([Id])
GO
ALTER TABLE [dbo].[Stocks] CHECK CONSTRAINT [FK_Stocks_Stores_StoreId]
GO
ALTER TABLE [dbo].[Stores]  WITH CHECK ADD  CONSTRAINT [FK_Stores_Cities_CityId] FOREIGN KEY([CityId])
REFERENCES [dbo].[Cities] ([Id])
GO
ALTER TABLE [dbo].[Stores] CHECK CONSTRAINT [FK_Stores_Cities_CityId]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Cities_CityId] FOREIGN KEY([CityId])
REFERENCES [dbo].[Cities] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Cities_CityId]
GO
ALTER TABLE [dbo].[UserUseCases]  WITH CHECK ADD  CONSTRAINT [FK_UserUseCases_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserUseCases] CHECK CONSTRAINT [FK_UserUseCases_Users_UserId]
GO
USE [master]
GO
ALTER DATABASE [BestBuyApp] SET  READ_WRITE 
GO
