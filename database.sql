USE [master]
GO
/****** Object:  Database [CocShop]    Script Date: 13-Mar-19 8:24:29 PM ******/
CREATE DATABASE [CocShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CocShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\CocShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CocShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\CocShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CocShop] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CocShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CocShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CocShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CocShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CocShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CocShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [CocShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CocShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CocShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CocShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CocShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CocShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CocShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CocShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CocShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CocShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CocShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CocShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CocShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CocShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CocShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CocShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CocShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CocShop] SET RECOVERY FULL 
GO
ALTER DATABASE [CocShop] SET  MULTI_USER 
GO
ALTER DATABASE [CocShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CocShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CocShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CocShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CocShop] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CocShop', N'ON'
GO
ALTER DATABASE [CocShop] SET QUERY_STORE = OFF
GO
USE [CocShop]
GO
/****** Object:  Table [dbo].[tbl_Account]    Script Date: 13-Mar-19 8:24:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Account](
	[accountID] [nchar](10) NOT NULL,
	[password] [nchar](20) NOT NULL,
	[fullName] [nvarchar](50) NOT NULL,
	[address] [nvarchar](50) NOT NULL,
	[phoneNumber] [nchar](10) NOT NULL,
	[roleID] [nchar](10) NOT NULL,
	[status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_Customer] PRIMARY KEY CLUSTERED 
(
	[accountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Order]    Script Date: 13-Mar-19 8:24:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Order](
	[OrderID] [nchar](10) NOT NULL,
	[totalPrice] [float] NOT NULL,
	[accountID] [nchar](10) NOT NULL,
	[address] [nvarchar](50) NOT NULL,
	[phoneNumber] [nchar](10) NOT NULL,
	[status] [nchar](10) NOT NULL,
 CONSTRAINT [PK_tbl_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_OrderDetail]    Script Date: 13-Mar-19 8:24:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_OrderDetail](
	[id] [nchar](20) NOT NULL,
	[productID] [nchar](10) NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [float] NOT NULL,
	[totalPrice] [float] NOT NULL,
	[OrderID] [nchar](10) NOT NULL,
 CONSTRAINT [PK_tbl_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Product]    Script Date: 13-Mar-19 8:24:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Product](
	[productID] [nchar](10) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[brand] [nvarchar](20) NOT NULL,
	[price] [float] NOT NULL,
	[quantity] [int] NOT NULL,
	[status] [nvarchar](50) NULL,
	[type] [nchar](10) NOT NULL,
 CONSTRAINT [PK_tbl_ProductDetail] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Role]    Script Date: 13-Mar-19 8:24:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Role](
	[roleID] [nchar](10) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_Account] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tbl_Account] ([accountID], [password], [fullName], [address], [phoneNumber], [roleID], [status]) VALUES (N'a         ', N'aa                  ', N'a nn', N'z', N'0978452100', N'C         ', N'off')
INSERT [dbo].[tbl_Account] ([accountID], [password], [fullName], [address], [phoneNumber], [roleID], [status]) VALUES (N'An        ', N'1                   ', N'Vu Thi Hoai An', N'BR', N'0523855000', N'C         ', N'on')
INSERT [dbo].[tbl_Account] ([accountID], [password], [fullName], [address], [phoneNumber], [roleID], [status]) VALUES (N'anh       ', N'a                   ', N'aa', N'aa', N'0145222000', N'C         ', N'on')
INSERT [dbo].[tbl_Account] ([accountID], [password], [fullName], [address], [phoneNumber], [roleID], [status]) VALUES (N'Bao       ', N'1                   ', N'Le Van Bao', N'123 NAT', N'0978452100', N'C         ', N'off')
INSERT [dbo].[tbl_Account] ([accountID], [password], [fullName], [address], [phoneNumber], [roleID], [status]) VALUES (N'Hoa       ', N'1                   ', N'Nguyen Thi Hoa', N'TPHCM', N'0967854100', N'C         ', N'off')
INSERT [dbo].[tbl_Account] ([accountID], [password], [fullName], [address], [phoneNumber], [roleID], [status]) VALUES (N'Khanh     ', N'1                   ', N'Vo Van Khanh', N'DN', N'0902451474', N'A         ', N'off')
INSERT [dbo].[tbl_Account] ([accountID], [password], [fullName], [address], [phoneNumber], [roleID], [status]) VALUES (N'Lan       ', N'a                   ', N'Nguyen Thi Lan', N'DD', N'0214521000', N'C         ', N'off')
INSERT [dbo].[tbl_Account] ([accountID], [password], [fullName], [address], [phoneNumber], [roleID], [status]) VALUES (N'Nam       ', N'1                   ', N'Nguyen Van Nam', N'SG', N'0987452111', N'A         ', N'off')
INSERT [dbo].[tbl_Account] ([accountID], [password], [fullName], [address], [phoneNumber], [roleID], [status]) VALUES (N'Phung     ', N'111                 ', N'NTP', N'DD', N'0965648317', N'A         ', N'on')
INSERT [dbo].[tbl_Order] ([OrderID], [totalPrice], [accountID], [address], [phoneNumber], [status]) VALUES (N'C1        ', 240012, N'an        ', N'www', N'0785100244', N'available ')
INSERT [dbo].[tbl_Order] ([OrderID], [totalPrice], [accountID], [address], [phoneNumber], [status]) VALUES (N'C42       ', 35000, N'an        ', N'w', N'0987452100', N'available ')
INSERT [dbo].[tbl_Order] ([OrderID], [totalPrice], [accountID], [address], [phoneNumber], [status]) VALUES (N'C50       ', 48000, N'an        ', N'TF', N'0785412000', N'available ')
INSERT [dbo].[tbl_Order] ([OrderID], [totalPrice], [accountID], [address], [phoneNumber], [status]) VALUES (N'C6        ', 19000, N'bao       ', N'12 GL', N'0964785000', N'available ')
INSERT [dbo].[tbl_Order] ([OrderID], [totalPrice], [accountID], [address], [phoneNumber], [status]) VALUES (N'C66       ', 15000, N'an        ', N'4', N'7801425633', N'available ')
INSERT [dbo].[tbl_Order] ([OrderID], [totalPrice], [accountID], [address], [phoneNumber], [status]) VALUES (N'C79       ', 25, N'an        ', N'1', N'0874052100', N'available ')
INSERT [dbo].[tbl_Order] ([OrderID], [totalPrice], [accountID], [address], [phoneNumber], [status]) VALUES (N'C89       ', 240000, N'hoa       ', N'123 Quang Trung', N'0964578110', N'available ')
INSERT [dbo].[tbl_OrderDetail] ([id], [productID], [quantity], [price], [totalPrice], [OrderID]) VALUES (N'S11                 ', N'D04       ', 4, 12000, 48000, N'C50       ')
INSERT [dbo].[tbl_OrderDetail] ([id], [productID], [quantity], [price], [totalPrice], [OrderID]) VALUES (N'S22                 ', N'D01       ', 1, 15000, 15000, N'C66       ')
INSERT [dbo].[tbl_OrderDetail] ([id], [productID], [quantity], [price], [totalPrice], [OrderID]) VALUES (N'S3                  ', N'F01       ', 2, 120000, 240000, N'C89       ')
INSERT [dbo].[tbl_OrderDetail] ([id], [productID], [quantity], [price], [totalPrice], [OrderID]) VALUES (N'S36                 ', N'F000      ', 1, 12, 12, N'C1        ')
INSERT [dbo].[tbl_OrderDetail] ([id], [productID], [quantity], [price], [totalPrice], [OrderID]) VALUES (N'S3636               ', N'F01       ', 2, 120000, 240000, N'C1        ')
INSERT [dbo].[tbl_OrderDetail] ([id], [productID], [quantity], [price], [totalPrice], [OrderID]) VALUES (N'S37                 ', N'F000      ', 2, 12, 24, N'C79       ')
INSERT [dbo].[tbl_OrderDetail] ([id], [productID], [quantity], [price], [totalPrice], [OrderID]) VALUES (N'S3737               ', N'Test      ', 1, 1, 1, N'C79       ')
INSERT [dbo].[tbl_OrderDetail] ([id], [productID], [quantity], [price], [totalPrice], [OrderID]) VALUES (N'S57                 ', N'F02       ', 1, 5000, 5000, N'C6        ')
INSERT [dbo].[tbl_OrderDetail] ([id], [productID], [quantity], [price], [totalPrice], [OrderID]) VALUES (N'S5757               ', N'F04       ', 1, 14000, 14000, N'C6        ')
INSERT [dbo].[tbl_OrderDetail] ([id], [productID], [quantity], [price], [totalPrice], [OrderID]) VALUES (N'S59                 ', N'D02       ', 1, 20000, 20000, N'C42       ')
INSERT [dbo].[tbl_OrderDetail] ([id], [productID], [quantity], [price], [totalPrice], [OrderID]) VALUES (N'S5991               ', N'D01       ', 1, 15000, 15000, N'C42       ')
INSERT [dbo].[tbl_Product] ([productID], [name], [brand], [price], [quantity], [status], [type]) VALUES (N'D01       ', N'Milk', N'FF', 15000, 70, N'on', N'D         ')
INSERT [dbo].[tbl_Product] ([productID], [name], [brand], [price], [quantity], [status], [type]) VALUES (N'D02       ', N'Tea Milk', N'ThaiLand', 20000, 351, N'on', N'D         ')
INSERT [dbo].[tbl_Product] ([productID], [name], [brand], [price], [quantity], [status], [type]) VALUES (N'D03       ', N'Siro Orange', N'SS', 15000, 11, N'on', N'D         ')
INSERT [dbo].[tbl_Product] ([productID], [name], [brand], [price], [quantity], [status], [type]) VALUES (N'D04       ', N'Orange', N'SS', 12000, 6, N'on', N'F         ')
INSERT [dbo].[tbl_Product] ([productID], [name], [brand], [price], [quantity], [status], [type]) VALUES (N'D09       ', N'TH true milk', N'1', 12000, 122, N'on', N'D         ')
INSERT [dbo].[tbl_Product] ([productID], [name], [brand], [price], [quantity], [status], [type]) VALUES (N'D11       ', N'Coca', N'VN', 7000, 7, N'on', N'D         ')
INSERT [dbo].[tbl_Product] ([productID], [name], [brand], [price], [quantity], [status], [type]) VALUES (N'D12       ', N'Pepsi', N'CN', 12000, 17, N'on', N'D         ')
INSERT [dbo].[tbl_Product] ([productID], [name], [brand], [price], [quantity], [status], [type]) VALUES (N'F000      ', N'dd', N'aa', 12, 6, N'on', N'F         ')
INSERT [dbo].[tbl_Product] ([productID], [name], [brand], [price], [quantity], [status], [type]) VALUES (N'F01       ', N'Chicken', N'CS', 120000, 10, N'on', N'F         ')
INSERT [dbo].[tbl_Product] ([productID], [name], [brand], [price], [quantity], [status], [type]) VALUES (N'F02       ', N'Breed', N'CS', 5000, 0, N'on', N'F         ')
INSERT [dbo].[tbl_Product] ([productID], [name], [brand], [price], [quantity], [status], [type]) VALUES (N'F03       ', N'BTT', N'CS', 12000, 12, N'off', N'F         ')
INSERT [dbo].[tbl_Product] ([productID], [name], [brand], [price], [quantity], [status], [type]) VALUES (N'F04       ', N'Sandwich', N'WW', 14000, 1, N'off', N'F         ')
INSERT [dbo].[tbl_Product] ([productID], [name], [brand], [price], [quantity], [status], [type]) VALUES (N'F05       ', N'kk', N'UI', 14000, 19, N'on', N'F         ')
INSERT [dbo].[tbl_Product] ([productID], [name], [brand], [price], [quantity], [status], [type]) VALUES (N'F06       ', N'Sting', N'SS', 20000, 7, N'on', N'D         ')
INSERT [dbo].[tbl_Product] ([productID], [name], [brand], [price], [quantity], [status], [type]) VALUES (N'F12       ', N'Rice', N'CS', 12000, 12, N'', N'F         ')
INSERT [dbo].[tbl_Product] ([productID], [name], [brand], [price], [quantity], [status], [type]) VALUES (N'F19       ', N'mango milk', N'VN', 12000, 32, N'', N'F         ')
INSERT [dbo].[tbl_Product] ([productID], [name], [brand], [price], [quantity], [status], [type]) VALUES (N'F33       ', N'Cake', N'VN', 12000, 7, N'on', N'F         ')
INSERT [dbo].[tbl_Product] ([productID], [name], [brand], [price], [quantity], [status], [type]) VALUES (N'F99       ', N'Rice 33', N'nn', 2, 12, N'on', N'F         ')
INSERT [dbo].[tbl_Product] ([productID], [name], [brand], [price], [quantity], [status], [type]) VALUES (N'Fe        ', N'33', N'ss', 11, 1, N'', N'F         ')
INSERT [dbo].[tbl_Product] ([productID], [name], [brand], [price], [quantity], [status], [type]) VALUES (N'G01       ', N'CupCake Panda', N'CS', 10000, 3, N'on', N'G         ')
INSERT [dbo].[tbl_Product] ([productID], [name], [brand], [price], [quantity], [status], [type]) VALUES (N'G02       ', N'ice cream', N'FH', 13000, 4, N'on', N'G         ')
INSERT [dbo].[tbl_Product] ([productID], [name], [brand], [price], [quantity], [status], [type]) VALUES (N'G03       ', N'pen', N'EE', 12000, 3, N'on', N'G         ')
INSERT [dbo].[tbl_Product] ([productID], [name], [brand], [price], [quantity], [status], [type]) VALUES (N'G04       ', N'Candy ', N'CD', 10000, 2, N'on', N'G         ')
INSERT [dbo].[tbl_Product] ([productID], [name], [brand], [price], [quantity], [status], [type]) VALUES (N'G12       ', N'Strawberry Cupcake ', N'CS', 16000, 2, N'on', N'G         ')
INSERT [dbo].[tbl_Product] ([productID], [name], [brand], [price], [quantity], [status], [type]) VALUES (N'ss        ', N'ss', N'ss', 34, 2, N'2', N'F         ')
INSERT [dbo].[tbl_Product] ([productID], [name], [brand], [price], [quantity], [status], [type]) VALUES (N'Test      ', N'test', N'test', 1, 0, N'on', N'F         ')
INSERT [dbo].[tbl_Role] ([roleID], [name]) VALUES (N'A         ', N'admin')
INSERT [dbo].[tbl_Role] ([roleID], [name]) VALUES (N'C         ', N'customer')
ALTER TABLE [dbo].[tbl_Account]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Account_tbl_Role1] FOREIGN KEY([roleID])
REFERENCES [dbo].[tbl_Role] ([roleID])
GO
ALTER TABLE [dbo].[tbl_Account] CHECK CONSTRAINT [FK_tbl_Account_tbl_Role1]
GO
ALTER TABLE [dbo].[tbl_Order]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Order_tbl_Account] FOREIGN KEY([accountID])
REFERENCES [dbo].[tbl_Account] ([accountID])
GO
ALTER TABLE [dbo].[tbl_Order] CHECK CONSTRAINT [FK_tbl_Order_tbl_Account]
GO
ALTER TABLE [dbo].[tbl_OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tbl_OrderDetail_tbl_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[tbl_Order] ([OrderID])
GO
ALTER TABLE [dbo].[tbl_OrderDetail] CHECK CONSTRAINT [FK_tbl_OrderDetail_tbl_Order]
GO
ALTER TABLE [dbo].[tbl_OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tbl_OrderDetail_tbl_ProductDetail] FOREIGN KEY([productID])
REFERENCES [dbo].[tbl_Product] ([productID])
GO
ALTER TABLE [dbo].[tbl_OrderDetail] CHECK CONSTRAINT [FK_tbl_OrderDetail_tbl_ProductDetail]
GO
USE [master]
GO
ALTER DATABASE [CocShop] SET  READ_WRITE 
GO
