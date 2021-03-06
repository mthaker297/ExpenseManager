USE [master]
GO
/****** Object:  Database [ExpenseManagement_db]    Script Date: 02-03-2020 14:29:40 ******/
CREATE DATABASE [ExpenseManagement_db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ExpenseManagement_db', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQL2017\MSSQL\DATA\ExpenseManagement_db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ExpenseManagement_db_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQL2017\MSSQL\DATA\ExpenseManagement_db_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ExpenseManagement_db] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ExpenseManagement_db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ExpenseManagement_db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ExpenseManagement_db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ExpenseManagement_db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ExpenseManagement_db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ExpenseManagement_db] SET ARITHABORT OFF 
GO
ALTER DATABASE [ExpenseManagement_db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ExpenseManagement_db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ExpenseManagement_db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ExpenseManagement_db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ExpenseManagement_db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ExpenseManagement_db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ExpenseManagement_db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ExpenseManagement_db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ExpenseManagement_db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ExpenseManagement_db] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ExpenseManagement_db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ExpenseManagement_db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ExpenseManagement_db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ExpenseManagement_db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ExpenseManagement_db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ExpenseManagement_db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ExpenseManagement_db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ExpenseManagement_db] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ExpenseManagement_db] SET  MULTI_USER 
GO
ALTER DATABASE [ExpenseManagement_db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ExpenseManagement_db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ExpenseManagement_db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ExpenseManagement_db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ExpenseManagement_db] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ExpenseManagement_db] SET QUERY_STORE = OFF
GO
USE [ExpenseManagement_db]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [ExpenseManagement_db]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 02-03-2020 14:29:40 ******/
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
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 02-03-2020 14:29:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 02-03-2020 14:29:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 02-03-2020 14:29:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 02-03-2020 14:29:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 02-03-2020 14:29:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 02-03-2020 14:29:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NOT NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 02-03-2020 14:29:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 02-03-2020 14:29:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExpenseReport]    Script Date: 02-03-2020 14:29:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExpenseReport](
	[ExpenseId] [int] IDENTITY(1,1) NOT NULL,
	[ExpenseName] [varchar](100) NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[ExpenseDate] [datetime] NOT NULL,
	[ExpenseUpdateDate] [datetime] NULL,
	[CategoryId] [int] NOT NULL,
	[ExpenseBy] [nvarchar](450) NOT NULL,
	[PaymentTypeId] [int] NOT NULL,
	[ExpenseDesc] [varchar](200) NULL,
 CONSTRAINT [PK_ExpenseReport] PRIMARY KEY CLUSTERED 
(
	[ExpenseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentType]    Script Date: 02-03-2020 14:29:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentType](
	[PaymentTypeId] [int] IDENTITY(1,1) NOT NULL,
	[PaymentType] [varchar](100) NOT NULL,
 CONSTRAINT [PK_PaymentType] PRIMARY KEY CLUSTERED 
(
	[PaymentTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 02-03-2020 14:29:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [nvarchar](450) NOT NULL,
	[Fullname] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200225091553_AddIdentity', N'2.1.14-servicing-32113')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'713e1bd2-218b-4978-923f-8bb87e70def5', N'mauli@gmail.com', N'MAULI@GMAIL.COM', N'mauli@gmail.com', N'MAULI@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEEO2uyBoRLUaCwFiY8ojfxy5Hh8Y/gmcY58e+jZ5aE8wWsBGKS64WBlM4MrLIxXCmg==', N'XB7TCLSRKUZHMXCPP4AH7DZTOAZJDRPC', N'115784d4-2f8a-4958-8bb5-de85ac52610d', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'f6a0c6f2-3dd3-4238-90cc-04581f62ee46', N'stuti@yahoo.com', N'STUTI@YAHOO.COM', N'stuti@yahoo.com', N'STUTI@YAHOO.COM', 0, N'AQAAAAEAACcQAAAAEAZohhs113nMXy+Rk9dIa1y2V2hXBgA/McTXyr3wkEXV6LH82T4K3C2YalY/iZCisg==', N'YC7UK27YBBDURHAQDHZSTII3SR4BPAJZ', N'9b971c47-cabc-4840-80da-70bd2a297cb4', NULL, 0, 0, NULL, 1, 0)
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (1, N'Food/Hotels')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (2, N'Vegetables/Fruits')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (3, N'Grocery/Household supplies')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (4, N'Clothes')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (5, N'Accessories')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (6, N'Electronics Appliances')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (7, N'Travel tickets')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (8, N'Local transportation')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (9, N'Fuel')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (10, N'Vehicles maintenance')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (11, N'Recharges/Bill Payments')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (12, N'Movies')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (13, N'Health care/Medicines')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (14, N'Insurances/Policies')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (15, N'Rents')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (16, N'Loan installments')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (17, N'Salon services')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (18, N'Tobacco/Alcohol')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (19, N'Gifts')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (20, N'Valuables(Gold, Silver, etc)')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (21, N'Money Transfer ')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[ExpenseReport] ON 

INSERT [dbo].[ExpenseReport] ([ExpenseId], [ExpenseName], [Amount], [ExpenseDate], [ExpenseUpdateDate], [CategoryId], [ExpenseBy], [PaymentTypeId], [ExpenseDesc]) VALUES (1, N'Food Packet ', CAST(10.00 AS Decimal(18, 2)), CAST(N'2020-02-27T09:44:31.777' AS DateTime), NULL, 1, N'f6a0c6f2-3dd3-4238-90cc-04581f62ee46', 1, N'Office Nasta')
INSERT [dbo].[ExpenseReport] ([ExpenseId], [ExpenseName], [Amount], [ExpenseDate], [ExpenseUpdateDate], [CategoryId], [ExpenseBy], [PaymentTypeId], [ExpenseDesc]) VALUES (5, N'Grapes', CAST(20.00 AS Decimal(18, 2)), CAST(N'2020-02-25T00:00:00.000' AS DateTime), NULL, 2, N'f6a0c6f2-3dd3-4238-90cc-04581f62ee46', 1, N'500 gms')
INSERT [dbo].[ExpenseReport] ([ExpenseId], [ExpenseName], [Amount], [ExpenseDate], [ExpenseUpdateDate], [CategoryId], [ExpenseBy], [PaymentTypeId], [ExpenseDesc]) VALUES (7, N'Denim Jeans', CAST(500.00 AS Decimal(18, 2)), CAST(N'2020-03-02T00:00:00.000' AS DateTime), NULL, 4, N'713e1bd2-218b-4978-923f-8bb87e70def5', 2, N'Blue Denim Jeans from brand factory')
INSERT [dbo].[ExpenseReport] ([ExpenseId], [ExpenseName], [Amount], [ExpenseDate], [ExpenseUpdateDate], [CategoryId], [ExpenseBy], [PaymentTypeId], [ExpenseDesc]) VALUES (8, N'Washing Powder', CAST(50.00 AS Decimal(18, 2)), CAST(N'2020-02-28T00:00:00.000' AS DateTime), NULL, 3, N'713e1bd2-218b-4978-923f-8bb87e70def5', 1, N'Rin Washing Powder (500 gm)')
SET IDENTITY_INSERT [dbo].[ExpenseReport] OFF
SET IDENTITY_INSERT [dbo].[PaymentType] ON 

INSERT [dbo].[PaymentType] ([PaymentTypeId], [PaymentType]) VALUES (1, N'Cash')
INSERT [dbo].[PaymentType] ([PaymentTypeId], [PaymentType]) VALUES (2, N'Debit Card')
INSERT [dbo].[PaymentType] ([PaymentTypeId], [PaymentType]) VALUES (3, N'Credit Card ')
INSERT [dbo].[PaymentType] ([PaymentTypeId], [PaymentType]) VALUES (4, N'UPI Payment')
INSERT [dbo].[PaymentType] ([PaymentTypeId], [PaymentType]) VALUES (5, N'Netbanking')
SET IDENTITY_INSERT [dbo].[PaymentType] OFF
INSERT [dbo].[User] ([UserId], [Fullname], [Email], [Password], [CreatedDate], [UpdatedDate]) VALUES (N'1', N'Mauli Thaker', N'mauli@gmail.com', N'mauli123', CAST(N'2020-02-21T00:00:00.000' AS DateTime), NULL)
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 02-03-2020 14:29:40 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 02-03-2020 14:29:40 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 02-03-2020 14:29:40 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 02-03-2020 14:29:40 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 02-03-2020 14:29:40 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 02-03-2020 14:29:40 ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 02-03-2020 14:29:40 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[ExpenseReport]  WITH CHECK ADD  CONSTRAINT [FK_ExpenseReport_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[ExpenseReport] CHECK CONSTRAINT [FK_ExpenseReport_Category]
GO
ALTER TABLE [dbo].[ExpenseReport]  WITH CHECK ADD  CONSTRAINT [FK_ExpenseReport_PaymentType] FOREIGN KEY([PaymentTypeId])
REFERENCES [dbo].[PaymentType] ([PaymentTypeId])
GO
ALTER TABLE [dbo].[ExpenseReport] CHECK CONSTRAINT [FK_ExpenseReport_PaymentType]
GO
ALTER TABLE [dbo].[ExpenseReport]  WITH CHECK ADD  CONSTRAINT [FK_ExpenseReport_User] FOREIGN KEY([ExpenseBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ExpenseReport] CHECK CONSTRAINT [FK_ExpenseReport_User]
GO
USE [master]
GO
ALTER DATABASE [ExpenseManagement_db] SET  READ_WRITE 
GO
