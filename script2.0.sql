USE [master]
GO
/****** Object:  Database [INF272D3]    Script Date: 10/18/2019 10:11:13 AM ******/
CREATE DATABASE [INF272D3]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'INF272D3', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\INF272D3.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'INF272D3_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\INF272D3_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [INF272D3] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [INF272D3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [INF272D3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [INF272D3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [INF272D3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [INF272D3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [INF272D3] SET ARITHABORT OFF 
GO
ALTER DATABASE [INF272D3] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [INF272D3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [INF272D3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [INF272D3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [INF272D3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [INF272D3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [INF272D3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [INF272D3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [INF272D3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [INF272D3] SET  DISABLE_BROKER 
GO
ALTER DATABASE [INF272D3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [INF272D3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [INF272D3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [INF272D3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [INF272D3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [INF272D3] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [INF272D3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [INF272D3] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [INF272D3] SET  MULTI_USER 
GO
ALTER DATABASE [INF272D3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [INF272D3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [INF272D3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [INF272D3] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [INF272D3] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [INF272D3] SET QUERY_STORE = OFF
GO
USE [INF272D3]
GO
/****** Object:  Table [dbo].[Companies]    Script Date: 10/18/2019 10:11:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Companies](
	[CompanyID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](50) NOT NULL,
	[CompanyAdress] [varchar](100) NOT NULL,
	[CompanyPhone] [varchar](50) NOT NULL,
	[CompanyPoints] [int] NOT NULL,
	[CompanyDateJoined] [date] NOT NULL,
 CONSTRAINT [PK_Companies] PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompanyMembers]    Script Date: 10/18/2019 10:11:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyMembers](
	[CompanyID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[CMID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_CompanyMembers] PRIMARY KEY CLUSTERED 
(
	[CMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonationDetails]    Script Date: 10/18/2019 10:11:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonationDetails](
	[DonationID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[DDID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_DonationDetails] PRIMARY KEY CLUSTERED 
(
	[DDID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Donations]    Script Date: 10/18/2019 10:11:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Donations](
	[DonationID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[DonationDate] [date] NOT NULL,
 CONSTRAINT [PK_Donations] PRIMARY KEY CLUSTERED 
(
	[DonationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genders]    Script Date: 10/18/2019 10:11:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genders](
	[GenderID] [int] IDENTITY(1,1) NOT NULL,
	[Gender] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Genders] PRIMARY KEY CLUSTERED 
(
	[GenderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategories]    Script Date: 10/18/2019 10:11:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Category] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ProductCategories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductColors]    Script Date: 10/18/2019 10:11:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductColors](
	[ColorID] [int] IDENTITY(1,1) NOT NULL,
	[Color] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ProductColors] PRIMARY KEY CLUSTERED 
(
	[ColorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductConditions]    Script Date: 10/18/2019 10:11:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductConditions](
	[ConditionID] [int] IDENTITY(1,1) NOT NULL,
	[Condition] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ProductConditions] PRIMARY KEY CLUSTERED 
(
	[ConditionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 10/18/2019 10:11:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](50) NULL,
	[ProductInfo] [varchar](max) NULL,
	[TypeID] [int] NULL,
	[ConditionID] [int] NULL,
	[CategoryID] [int] NULL,
	[Cost] [real] NULL,
	[ProductAddDate] [date] NULL,
	[GenderID] [int] NULL,
	[Size] [int] NULL,
	[BestBefore] [date] NULL,
	[ColorID] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductTypes]    Script Date: 10/18/2019 10:11:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTypes](
	[TypeID] [int] IDENTITY(1,1) NOT NULL,
	[ProductType] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ProductTypes] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 10/18/2019 10:11:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[UserStatusID] [int] IDENTITY(1,1) NOT NULL,
	[UserStatus] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[UserStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/18/2019 10:11:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[UserSurname] [varchar](50) NOT NULL,
	[UserEmail] [varchar](100) NOT NULL,
	[UserPhone] [varchar](50) NOT NULL,
	[UserAdded] [datetime] NOT NULL,
	[UN] [varchar](50) NOT NULL,
	[PW] [varchar](50) NOT NULL,
	[UserTypeID] [int] NOT NULL,
	[UserPoints] [int] NOT NULL,
	[GenderID] [int] NOT NULL,
	[UserStatusID] [int] NOT NULL,
	[GUID] [varchar](100) NULL,
	[GUIDExpiry] [datetime] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTypes]    Script Date: 10/18/2019 10:11:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTypes](
	[UserTypeID] [int] IDENTITY(1,1) NOT NULL,
	[UserType] [varchar](50) NOT NULL,
 CONSTRAINT [PK_UserTypes] PRIMARY KEY CLUSTERED 
(
	[UserTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WithdrawalDetails]    Script Date: 10/18/2019 10:11:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WithdrawalDetails](
	[WithdrawalID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[WDID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_WithdrawalDetails] PRIMARY KEY CLUSTERED 
(
	[WDID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Withdrawals]    Script Date: 10/18/2019 10:11:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Withdrawals](
	[WithdrawalID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[WithdrawalDate] [date] NOT NULL,
	[TotalPoints] [int] NOT NULL,
 CONSTRAINT [PK_Withdrawals] PRIMARY KEY CLUSTERED 
(
	[WithdrawalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Companies] ON 

INSERT [dbo].[Companies] ([CompanyID], [CompanyName], [CompanyAdress], [CompanyPhone], [CompanyPoints], [CompanyDateJoined]) VALUES (1, N'De Aar', N'417 22nd Ave', N'0832279666', 50, CAST(N'2019-10-17' AS Date))
SET IDENTITY_INSERT [dbo].[Companies] OFF
SET IDENTITY_INSERT [dbo].[Genders] ON 

INSERT [dbo].[Genders] ([GenderID], [Gender]) VALUES (1, N'Male')
INSERT [dbo].[Genders] ([GenderID], [Gender]) VALUES (2, N'Female')
SET IDENTITY_INSERT [dbo].[Genders] OFF
SET IDENTITY_INSERT [dbo].[ProductCategories] ON 

INSERT [dbo].[ProductCategories] ([CategoryID], [Category]) VALUES (1, N'Food')
INSERT [dbo].[ProductCategories] ([CategoryID], [Category]) VALUES (2, N'Clothing')
INSERT [dbo].[ProductCategories] ([CategoryID], [Category]) VALUES (3, N'Toiletries')
INSERT [dbo].[ProductCategories] ([CategoryID], [Category]) VALUES (4, N'Shoes')
INSERT [dbo].[ProductCategories] ([CategoryID], [Category]) VALUES (5, N'Furniture')
INSERT [dbo].[ProductCategories] ([CategoryID], [Category]) VALUES (6, N'Supplies')
INSERT [dbo].[ProductCategories] ([CategoryID], [Category]) VALUES (7, N'Other')
SET IDENTITY_INSERT [dbo].[ProductCategories] OFF
SET IDENTITY_INSERT [dbo].[ProductColors] ON 

INSERT [dbo].[ProductColors] ([ColorID], [Color]) VALUES (1, N'Green')
INSERT [dbo].[ProductColors] ([ColorID], [Color]) VALUES (2, N'Blue')
INSERT [dbo].[ProductColors] ([ColorID], [Color]) VALUES (3, N'Yellow')
INSERT [dbo].[ProductColors] ([ColorID], [Color]) VALUES (4, N'Black')
INSERT [dbo].[ProductColors] ([ColorID], [Color]) VALUES (5, N'White')
INSERT [dbo].[ProductColors] ([ColorID], [Color]) VALUES (6, N'Brown')
SET IDENTITY_INSERT [dbo].[ProductColors] OFF
SET IDENTITY_INSERT [dbo].[ProductConditions] ON 

INSERT [dbo].[ProductConditions] ([ConditionID], [Condition]) VALUES (1, N'Good')
INSERT [dbo].[ProductConditions] ([ConditionID], [Condition]) VALUES (2, N'Fair')
INSERT [dbo].[ProductConditions] ([ConditionID], [Condition]) VALUES (3, N'Medium')
INSERT [dbo].[ProductConditions] ([ConditionID], [Condition]) VALUES (4, N'Bad')
SET IDENTITY_INSERT [dbo].[ProductConditions] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductInfo], [TypeID], [ConditionID], [CategoryID], [Cost], [ProductAddDate], [GenderID], [Size], [BestBefore], [ColorID]) VALUES (1, N'Dove Soap', N'a bar of dove soap', 1, 1, 3, 2, CAST(N'2019-10-16' AS Date), 1, 0, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductInfo], [TypeID], [ConditionID], [CategoryID], [Cost], [ProductAddDate], [GenderID], [Size], [BestBefore], [ColorID]) VALUES (2, N'Tshirt', N'medium mens black', 2, 2, 2, 4, CAST(N'2019-10-16' AS Date), 2, 0, NULL, 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductInfo], [TypeID], [ConditionID], [CategoryID], [Cost], [ProductAddDate], [GenderID], [Size], [BestBefore], [ColorID]) VALUES (3, N'Pants', N'32 womans jeans', 2, 1, 2, 4, CAST(N'2019-10-16' AS Date), 1, 0, NULL, 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductInfo], [TypeID], [ConditionID], [CategoryID], [Cost], [ProductAddDate], [GenderID], [Size], [BestBefore], [ColorID]) VALUES (4, N'Eggs', N'eggs from a chicken', 1, 1, 1, 1, CAST(N'2019-10-16' AS Date), 2, 0, NULL, 3)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductInfo], [TypeID], [ConditionID], [CategoryID], [Cost], [ProductAddDate], [GenderID], [Size], [BestBefore], [ColorID]) VALUES (5, N'asdf', N'asdf', 2, 1, 1, 2, CAST(N'2019-10-16' AS Date), 1, 32, CAST(N'2019-10-17' AS Date), 5)
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[ProductTypes] ON 

INSERT [dbo].[ProductTypes] ([TypeID], [ProductType]) VALUES (1, N'New')
INSERT [dbo].[ProductTypes] ([TypeID], [ProductType]) VALUES (2, N'Secondhand')
SET IDENTITY_INSERT [dbo].[ProductTypes] OFF
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([UserStatusID], [UserStatus]) VALUES (1, N'Active')
INSERT [dbo].[Status] ([UserStatusID], [UserStatus]) VALUES (2, N'Inactive')
SET IDENTITY_INSERT [dbo].[Status] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [UserName], [UserSurname], [UserEmail], [UserPhone], [UserAdded], [UN], [PW], [UserTypeID], [UserPoints], [GenderID], [UserStatusID], [GUID], [GUIDExpiry]) VALUES (1, N'Michael', N'van der Walt', N'michael@gohvan.co.za', N'0832279624', CAST(N'2019-10-16T00:00:00.000' AS DateTime), N'Michael95', N'Helo', 1, 10, 1, 1, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [UserName], [UserSurname], [UserEmail], [UserPhone], [UserAdded], [UN], [PW], [UserTypeID], [UserPoints], [GenderID], [UserStatusID], [GUID], [GUIDExpiry]) VALUES (2, N'Susan', N'Boyle', N'susan@gmail.com', N'0123325580', CAST(N'2019-10-16T00:00:00.000' AS DateTime), N'Susan95', N'Helo', 2, 10, 2, 1, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [UserName], [UserSurname], [UserEmail], [UserPhone], [UserAdded], [UN], [PW], [UserTypeID], [UserPoints], [GenderID], [UserStatusID], [GUID], [GUIDExpiry]) VALUES (3, N'William', N'Black', N'william@gmail.com', N'0825589658', CAST(N'2019-10-16T00:00:00.000' AS DateTime), N'William95', N'Helo', 3, 10, 1, 2, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [UserName], [UserSurname], [UserEmail], [UserPhone], [UserAdded], [UN], [PW], [UserTypeID], [UserPoints], [GenderID], [UserStatusID], [GUID], [GUIDExpiry]) VALUES (4, N'John', N'Wick', N'john@gmail.com', N'0832279625', CAST(N'2019-10-16T00:00:00.000' AS DateTime), N'John95', N'Helo', 2, 10, 1, 1, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [UserName], [UserSurname], [UserEmail], [UserPhone], [UserAdded], [UN], [PW], [UserTypeID], [UserPoints], [GenderID], [UserStatusID], [GUID], [GUIDExpiry]) VALUES (5, N'qwer', N'wert', N'qwer', N'2345', CAST(N'2019-10-17T00:00:00.000' AS DateTime), N'qwer', N'qwer', 2, 30, 1, 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
SET IDENTITY_INSERT [dbo].[UserTypes] ON 

INSERT [dbo].[UserTypes] ([UserTypeID], [UserType]) VALUES (1, N'Admin')
INSERT [dbo].[UserTypes] ([UserTypeID], [UserType]) VALUES (2, N'Donor')
INSERT [dbo].[UserTypes] ([UserTypeID], [UserType]) VALUES (3, N'Recipient')
SET IDENTITY_INSERT [dbo].[UserTypes] OFF
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_ProductName]  DEFAULT ('None') FOR [ProductName]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_ProductInfo]  DEFAULT ('None') FOR [ProductInfo]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_TypeID]  DEFAULT ((1)) FOR [TypeID]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_ConditionID]  DEFAULT ((1)) FOR [ConditionID]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_CategoryID]  DEFAULT ((1)) FOR [CategoryID]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Cost]  DEFAULT ((0)) FOR [Cost]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_GenderID]  DEFAULT ((1)) FOR [GenderID]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Size]  DEFAULT ((0)) FOR [Size]
GO
ALTER TABLE [dbo].[Withdrawals] ADD  CONSTRAINT [DF_Withdrawals_TotalPoints]  DEFAULT ((0)) FOR [TotalPoints]
GO
ALTER TABLE [dbo].[CompanyMembers]  WITH CHECK ADD  CONSTRAINT [FK_CompanyMembers_Companies] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Companies] ([CompanyID])
GO
ALTER TABLE [dbo].[CompanyMembers] CHECK CONSTRAINT [FK_CompanyMembers_Companies]
GO
ALTER TABLE [dbo].[CompanyMembers]  WITH CHECK ADD  CONSTRAINT [FK_CompanyMembers_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[CompanyMembers] CHECK CONSTRAINT [FK_CompanyMembers_Users]
GO
ALTER TABLE [dbo].[DonationDetails]  WITH CHECK ADD  CONSTRAINT [FK_DonationDetails_Donations] FOREIGN KEY([DonationID])
REFERENCES [dbo].[Donations] ([DonationID])
GO
ALTER TABLE [dbo].[DonationDetails] CHECK CONSTRAINT [FK_DonationDetails_Donations]
GO
ALTER TABLE [dbo].[DonationDetails]  WITH CHECK ADD  CONSTRAINT [FK_DonationDetails_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[DonationDetails] CHECK CONSTRAINT [FK_DonationDetails_Products]
GO
ALTER TABLE [dbo].[Donations]  WITH CHECK ADD  CONSTRAINT [FK_Donations_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Donations] CHECK CONSTRAINT [FK_Donations_Users]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Genders] FOREIGN KEY([GenderID])
REFERENCES [dbo].[Genders] ([GenderID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Genders]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductCategories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[ProductCategories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductCategories]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductColors] FOREIGN KEY([ColorID])
REFERENCES [dbo].[ProductColors] ([ColorID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductColors]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductConditions] FOREIGN KEY([ConditionID])
REFERENCES [dbo].[ProductConditions] ([ConditionID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductConditions]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductTypes] FOREIGN KEY([TypeID])
REFERENCES [dbo].[ProductTypes] ([TypeID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductTypes]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Genders] FOREIGN KEY([GenderID])
REFERENCES [dbo].[Genders] ([GenderID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Genders]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Status] FOREIGN KEY([UserStatusID])
REFERENCES [dbo].[Status] ([UserStatusID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Status]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_UserTypes] FOREIGN KEY([UserTypeID])
REFERENCES [dbo].[UserTypes] ([UserTypeID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_UserTypes]
GO
ALTER TABLE [dbo].[WithdrawalDetails]  WITH CHECK ADD  CONSTRAINT [FK_WithdrawalDetails_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[WithdrawalDetails] CHECK CONSTRAINT [FK_WithdrawalDetails_Products]
GO
ALTER TABLE [dbo].[WithdrawalDetails]  WITH CHECK ADD  CONSTRAINT [FK_WithdrawalDetails_Withdrawals] FOREIGN KEY([WithdrawalID])
REFERENCES [dbo].[Withdrawals] ([WithdrawalID])
GO
ALTER TABLE [dbo].[WithdrawalDetails] CHECK CONSTRAINT [FK_WithdrawalDetails_Withdrawals]
GO
ALTER TABLE [dbo].[Withdrawals]  WITH CHECK ADD  CONSTRAINT [FK_Withdrawals_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Withdrawals] CHECK CONSTRAINT [FK_Withdrawals_Users]
GO
USE [master]
GO
ALTER DATABASE [INF272D3] SET  READ_WRITE 
GO
