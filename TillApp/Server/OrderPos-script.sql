USE [master]
GO
/****** Object:  Database [OrderPOS]    Script Date: 1/15/2020 9:59:52 PM ******/
CREATE DATABASE [OrderPOS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OrderPOS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\OrderPOS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OrderPOS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\OrderPOS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [OrderPOS] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OrderPOS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OrderPOS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OrderPOS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OrderPOS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OrderPOS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OrderPOS] SET ARITHABORT OFF 
GO
ALTER DATABASE [OrderPOS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OrderPOS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OrderPOS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OrderPOS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OrderPOS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OrderPOS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OrderPOS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OrderPOS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OrderPOS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OrderPOS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OrderPOS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OrderPOS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OrderPOS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OrderPOS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OrderPOS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OrderPOS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OrderPOS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OrderPOS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OrderPOS] SET  MULTI_USER 
GO
ALTER DATABASE [OrderPOS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OrderPOS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OrderPOS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OrderPOS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OrderPOS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [OrderPOS] SET QUERY_STORE = OFF
GO
USE [OrderPOS]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 1/15/2020 9:59:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderName] [nvarchar](100) NOT NULL,
	[Amount] [money] NOT NULL,
	[IsPaid] [bit] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItem]    Script Date: 1/15/2020 9:59:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 1/15/2020 9:59:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Price] [money] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Order] ON 
GO
INSERT [dbo].[Order] ([Id], [OrderName], [Amount], [IsPaid]) VALUES (3, N'1', 65.0000, 1)
GO
INSERT [dbo].[Order] ([Id], [OrderName], [Amount], [IsPaid]) VALUES (4, N'2', 114.0000, 0)
GO
INSERT [dbo].[Order] ([Id], [OrderName], [Amount], [IsPaid]) VALUES (5, N'3', 52.0000, 0)
GO
INSERT [dbo].[Order] ([Id], [OrderName], [Amount], [IsPaid]) VALUES (6, N'4', 124.0000, 0)
GO
INSERT [dbo].[Order] ([Id], [OrderName], [Amount], [IsPaid]) VALUES (7, N'5', 104.0000, 0)
GO
INSERT [dbo].[Order] ([Id], [OrderName], [Amount], [IsPaid]) VALUES (8, N'6', 64.0000, 0)
GO
INSERT [dbo].[Order] ([Id], [OrderName], [Amount], [IsPaid]) VALUES (10, N'7', 53.0000, 0)
GO
INSERT [dbo].[Order] ([Id], [OrderName], [Amount], [IsPaid]) VALUES (11, N'8', 80.0000, 0)
GO
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderItem] ON 
GO
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (38, 3, 2, 32.0000, 1)
GO
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (39, 3, 4, 24.0000, 1)
GO
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (40, 4, 1, 30.0000, 2)
GO
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (41, 4, 2, 32.0000, 1)
GO
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (42, 4, 4, 22.0000, 1)
GO
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (43, 5, 3, 25.0000, 1)
GO
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (44, 5, 6, 18.0000, 1)
GO
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (45, 5, 8, 9.0000, 1)
GO
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (46, 6, 1, 30.0000, 2)
GO
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (47, 6, 2, 32.0000, 2)
GO
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (48, 7, 9, 5.0000, 2)
GO
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (49, 7, 2, 32.0000, 2)
GO
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (50, 7, 1, 30.0000, 1)
GO
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (51, 8, 6, 18.0000, 1)
GO
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (52, 8, 3, 25.0000, 1)
GO
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (53, 8, 4, 12.0000, 1)
GO
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (54, 8, 8, 9.0000, 1)
GO
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (55, 10, 2, 32.0000, 1)
GO
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (56, 10, 4, 12.0000, 1)
GO
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (57, 10, 7, 9.0000, 1)
GO
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (58, 3, 8, 9.0000, 1)
GO
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (59, 11, 3, 25.0000, 2)
GO
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (60, 11, 1, 30.0000, 1)
GO
SET IDENTITY_INSERT [dbo].[OrderItem] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 
GO
INSERT [dbo].[Product] ([Id], [Name], [Price]) VALUES (1, N'Burger Sandwich', 30.0000)
GO
INSERT [dbo].[Product] ([Id], [Name], [Price]) VALUES (2, N'Chicken Burger Sandwich', 32.0000)
GO
INSERT [dbo].[Product] ([Id], [Name], [Price]) VALUES (3, N'Pasta', 25.0000)
GO
INSERT [dbo].[Product] ([Id], [Name], [Price]) VALUES (4, N'Fries', 12.0000)
GO
INSERT [dbo].[Product] ([Id], [Name], [Price]) VALUES (6, N'Cheese Fries', 18.0000)
GO
INSERT [dbo].[Product] ([Id], [Name], [Price]) VALUES (7, N'Pepsi', 9.0000)
GO
INSERT [dbo].[Product] ([Id], [Name], [Price]) VALUES (8, N'Fanta', 9.0000)
GO
INSERT [dbo].[Product] ([Id], [Name], [Price]) VALUES (9, N'Mayonnaise', 5.0000)
GO
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Orders_IsPaid]  DEFAULT ((0)) FOR [IsPaid]
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD  CONSTRAINT [FK_OrderItem_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[OrderItem] CHECK CONSTRAINT [FK_OrderItem_Order]
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD  CONSTRAINT [FK_OrderItem_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[OrderItem] CHECK CONSTRAINT [FK_OrderItem_Product]
GO
USE [master]
GO
ALTER DATABASE [OrderPOS] SET  READ_WRITE 
GO
