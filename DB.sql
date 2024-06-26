USE [master]
GO
/****** Object:  Database [DBMiniCapstone]    Script Date: 6/26/2024 9:19:10 PM ******/
CREATE DATABASE [DBMiniCapstone]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBMiniCapstone', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.LEMINHTRI\MSSQL\DATA\DBMiniCapstone.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBMiniCapstone_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.LEMINHTRI\MSSQL\DATA\DBMiniCapstone_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DBMiniCapstone] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBMiniCapstone].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBMiniCapstone] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBMiniCapstone] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBMiniCapstone] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBMiniCapstone] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBMiniCapstone] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBMiniCapstone] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DBMiniCapstone] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBMiniCapstone] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBMiniCapstone] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBMiniCapstone] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBMiniCapstone] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBMiniCapstone] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBMiniCapstone] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBMiniCapstone] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBMiniCapstone] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DBMiniCapstone] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBMiniCapstone] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBMiniCapstone] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBMiniCapstone] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBMiniCapstone] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBMiniCapstone] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBMiniCapstone] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBMiniCapstone] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DBMiniCapstone] SET  MULTI_USER 
GO
ALTER DATABASE [DBMiniCapstone] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBMiniCapstone] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBMiniCapstone] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBMiniCapstone] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBMiniCapstone] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBMiniCapstone] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DBMiniCapstone] SET QUERY_STORE = OFF
GO
USE [DBMiniCapstone]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 6/26/2024 9:19:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[ID] [varchar](50) NOT NULL,
	[FullName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Date_Of_Birth] [date] NULL,
	[Gender] [nvarchar](50) NULL,
	[Roles] [nvarchar](50) NULL,
	[Avatar] [nvarchar](max) NULL,
	[Address] [nvarchar](50) NULL,
	[Phone] [nvarchar](10) NULL,
	[AccountBalance] [real] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 6/26/2024 9:19:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[ID] [varchar](50) NOT NULL,
	[ClassName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Complaint]    Script Date: 6/26/2024 9:19:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Complaint](
	[ID] [varchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[ID_Account] [varchar](50) NULL,
	[ID_Tutor] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EducationalQualifications]    Script Date: 6/26/2024 9:19:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EducationalQualifications](
	[ID] [varchar](50) NOT NULL,
	[QualificationName] [nvarchar](50) NULL,
	[Img] [nvarchar](150) NULL,
	[Type] [nvarchar](50) NULL,
	[ID_Tutor] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RefreshToken]    Script Date: 6/26/2024 9:19:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RefreshToken](
	[ID] [varchar](50) NOT NULL,
	[Token] [varchar](50) NULL,
	[JwtId] [varchar](50) NULL,
	[IsUsed] [bit] NULL,
	[IsRevoked] [bit] NULL,
	[ExpiredAt] [datetime] NULL,
	[IssuedAt] [datetime] NULL,
	[ID_Account] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rent]    Script Date: 6/26/2024 9:19:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rent](
	[ID] [varchar](50) NOT NULL,
	[Price] [float] NULL,
	[ID_Subject] [varchar](50) NULL,
	[ID_Request] [varchar](50) NULL,
	[ID_Tutor] [varchar](50) NULL,
	[ID_Account] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rent1]    Script Date: 6/26/2024 9:19:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rent1](
	[ID] [varchar](50) NOT NULL,
	[ID_Schedule] [varchar](50) NULL,
	[ID_Account] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Request]    Script Date: 6/26/2024 9:19:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request](
	[ID] [varchar](50) NOT NULL,
	[Price] [real] NULL,
	[Title] [nvarchar](50) NULL,
	[LearningMethod] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
	[Status] [nvarchar](50) NULL,
	[CreateDate] [date] NULL,
	[TimeTable] [nvarchar](50) NULL,
	[TotalSession] [int] NULL,
	[TimeStart] [time](7) NULL,
	[TimeEnd] [time](7) NULL,
	[ID_Account] [varchar](50) NULL,
	[ID_Class] [varchar](50) NULL,
	[ID_Subject] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Request_Learning]    Script Date: 6/26/2024 9:19:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request_Learning](
	[ID] [varchar](50) NOT NULL,
	[ID_Tutor] [varchar](50) NULL,
	[ID_Request] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 6/26/2024 9:19:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[ID] [varchar](50) NOT NULL,
	[Date] [date] NULL,
	[TimeStart] [time](7) NULL,
	[TimeEnd] [time](7) NULL,
	[ID_Service] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 6/26/2024 9:19:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ID] [varchar](50) NOT NULL,
	[Price] [real] NULL,
	[Title] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
	[Video] [varchar](50) NULL,
	[ID_Tutor] [varchar](50) NULL,
	[ID_Class] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 6/26/2024 9:19:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[ID] [varchar](50) NOT NULL,
	[SubjectName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tutor]    Script Date: 6/26/2024 9:19:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tutor](
	[ID] [varchar](50) NOT NULL,
	[SpecializedSkills] [nvarchar](50) NULL,
	[Experience] [int] NULL,
	[Status] [nvarchar](50) NULL,
	[ID_Account] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tutor_Subject]    Script Date: 6/26/2024 9:19:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tutor_Subject](
	[ID] [varchar](50) NOT NULL,
	[ID_Tutor] [varchar](50) NULL,
	[ID_Subject] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction]    Script Date: 6/26/2024 9:19:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction](
	[ID] [varchar](50) NOT NULL,
	[Amount] [real] NULL,
	[CreateDate] [datetime] NULL,
	[Status] [nvarchar](50) NULL,
	[ID_Account] [varchar](50) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([ID], [FullName], [Password], [Email], [Date_Of_Birth], [Gender], [Roles], [Avatar], [Address], [Phone], [AccountBalance]) VALUES (N'102067477964770250687', N'LÊ MINH TRÍ', NULL, N'triml1892003@gmail.com', NULL, NULL, N'User', NULL, NULL, NULL, NULL)
INSERT [dbo].[Account] ([ID], [FullName], [Password], [Email], [Date_Of_Birth], [Gender], [Roles], [Avatar], [Address], [Phone], [AccountBalance]) VALUES (N'102292554983427342282', N'Lê Hạo Đăng', NULL, N'leminhtriw@gmail.com', NULL, NULL, N'User', NULL, NULL, NULL, NULL)
INSERT [dbo].[Account] ([ID], [FullName], [Password], [Email], [Date_Of_Birth], [Gender], [Roles], [Avatar], [Address], [Phone], [AccountBalance]) VALUES (N'114fb7a2-4b52-4f6f-8999-13dae233e430', N'string', N'string', N'string10', CAST(N'2024-06-26' AS Date), N'string', N'Học sinh', NULL, NULL, N'string', 0)
INSERT [dbo].[Account] ([ID], [FullName], [Password], [Email], [Date_Of_Birth], [Gender], [Roles], [Avatar], [Address], [Phone], [AccountBalance]) VALUES (N'26ce429d-36d1-424e-a668-473bc953865f', N'Lê Thành Tài', N'1234567', N'tai@gmail.com', CAST(N'2003-09-16' AS Date), N'nam', N'Học sinh', NULL, NULL, N'0363518930', 0)
INSERT [dbo].[Account] ([ID], [FullName], [Password], [Email], [Date_Of_Birth], [Gender], [Roles], [Avatar], [Address], [Phone], [AccountBalance]) VALUES (N'2cd9d081-ffef-4465-bfe9-31b93f7e1b3d', N'string', N'string', N'string8', CAST(N'2024-06-26' AS Date), N'string', N'Gia sư', NULL, NULL, N'string', 0)
INSERT [dbo].[Account] ([ID], [FullName], [Password], [Email], [Date_Of_Birth], [Gender], [Roles], [Avatar], [Address], [Phone], [AccountBalance]) VALUES (N'2f06a4c2-be69-4f88-8623-afe439e6d632', N'string', N'string', N'string7', CAST(N'2024-06-26' AS Date), N'string', N'Gia sư', NULL, NULL, N'string', 0)
INSERT [dbo].[Account] ([ID], [FullName], [Password], [Email], [Date_Of_Birth], [Gender], [Roles], [Avatar], [Address], [Phone], [AccountBalance]) VALUES (N'4620463c-dc64-412e-b0c4-64c940b0fcca', N'stringwegrd', N'1234567', N'leminhtri@gmail.com', CAST(N'2024-06-26' AS Date), N'stringesdv', N'học sinh', N'stringefs', N'stringegrd', N'stringsdf', 0)
INSERT [dbo].[Account] ([ID], [FullName], [Password], [Email], [Date_Of_Birth], [Gender], [Roles], [Avatar], [Address], [Phone], [AccountBalance]) VALUES (N'70960874-4733-4cee-a642-1573287a001f', N'string', N'string', N'string', CAST(N'2024-06-26' AS Date), N'string', N'học sinh', NULL, NULL, N'string', 0)
INSERT [dbo].[Account] ([ID], [FullName], [Password], [Email], [Date_Of_Birth], [Gender], [Roles], [Avatar], [Address], [Phone], [AccountBalance]) VALUES (N'70b72b00-cc55-40ad-8315-6bb8a8325a17', N'string12', N'string', N'string3', CAST(N'2024-06-26' AS Date), N'string12', N'Học sinh', N'strin12g', N'string12', N'string12', 0)
INSERT [dbo].[Account] ([ID], [FullName], [Password], [Email], [Date_Of_Birth], [Gender], [Roles], [Avatar], [Address], [Phone], [AccountBalance]) VALUES (N'c7096004-dcdb-45e7-859b-3b1e36c24ff3', N'string', N'string', N'string6', CAST(N'2024-06-26' AS Date), N'string', N'gia sư', NULL, NULL, N'string', 0)
INSERT [dbo].[Account] ([ID], [FullName], [Password], [Email], [Date_Of_Birth], [Gender], [Roles], [Avatar], [Address], [Phone], [AccountBalance]) VALUES (N'edfc4822-17e9-4cab-8998-bd45eb478151', N'string', N'string', N'string5', CAST(N'2024-06-26' AS Date), N'string', N'Học sinh', NULL, NULL, N'string', 0)
INSERT [dbo].[Account] ([ID], [FullName], [Password], [Email], [Date_Of_Birth], [Gender], [Roles], [Avatar], [Address], [Phone], [AccountBalance]) VALUES (N'f7a6275c-b956-412d-9709-58f8c25c15a8', N'string1', N'string', N'string2', CAST(N'2024-06-26' AS Date), N'string', N'học sinh', NULL, NULL, N'string', 0)
GO
INSERT [dbo].[Class] ([ID], [ClassName]) VALUES (N'653DA1DE-D85B-4655-ACBE-9E289C6F161F', N'11')
INSERT [dbo].[Class] ([ID], [ClassName]) VALUES (N'CC5255B5-0D84-4725-A040-9B97FC0F7E45', N'12')
INSERT [dbo].[Class] ([ID], [ClassName]) VALUES (N'D3911A50-B01B-496A-BC1F-E8DF65B06533', N'10')
GO
INSERT [dbo].[EducationalQualifications] ([ID], [QualificationName], [Img], [Type], [ID_Tutor]) VALUES (N'151a02ed-ab9b-4886-b1d2-3d254815280f', N'string', N'string', N'string', N'32997ee5-753d-41bf-9ef2-c1f2d4e6f74e')
INSERT [dbo].[EducationalQualifications] ([ID], [QualificationName], [Img], [Type], [ID_Tutor]) VALUES (N'4ebfa3d3-e256-4bef-9220-b60f675eb5f6', N'string', N'string', N'string', N'40e66d2b-4d41-4cbc-ac4a-b37695287a77')
INSERT [dbo].[EducationalQualifications] ([ID], [QualificationName], [Img], [Type], [ID_Tutor]) VALUES (N'99eed031-8a1f-4b4a-91b9-7c699b990d8f', N'string', N'string', N'string', N'588fd74a-3181-4ce7-ae58-05325641f93c')
INSERT [dbo].[EducationalQualifications] ([ID], [QualificationName], [Img], [Type], [ID_Tutor]) VALUES (N'c1e5594c-9876-42a5-b2a5-66e3ac05b30a', N'string', N'string', N'string', N'33856ebe-248c-4a62-8c75-a98992e2100b')
INSERT [dbo].[EducationalQualifications] ([ID], [QualificationName], [Img], [Type], [ID_Tutor]) VALUES (N'cf1e5937-9eed-4574-ad02-bf1f365a5fdb', N'string', N'string', N'string', N'52cf2771-9c6b-4954-a897-e988f563d99c')
INSERT [dbo].[EducationalQualifications] ([ID], [QualificationName], [Img], [Type], [ID_Tutor]) VALUES (N'e5db3a75-0d4a-4cbf-b033-74035bc33576', N'string', N'string', N'string', N'3006bf2b-45e0-4c64-974c-cbdb733e1335')
INSERT [dbo].[EducationalQualifications] ([ID], [QualificationName], [Img], [Type], [ID_Tutor]) VALUES (N'e839e225-a0b7-468d-987e-55fd2de420c0', N'string', N'string', N'string', N'48f5b893-5bb7-48d5-8ef4-f054e89e647f')
INSERT [dbo].[EducationalQualifications] ([ID], [QualificationName], [Img], [Type], [ID_Tutor]) VALUES (N'ef92b95b-ed65-4f73-9f99-c20924e66694', N'string', N'string', N'string', N'26273917-17a3-4fbb-8303-6872275ad04c')
GO
INSERT [dbo].[RefreshToken] ([ID], [Token], [JwtId], [IsUsed], [IsRevoked], [ExpiredAt], [IssuedAt], [ID_Account]) VALUES (N'346b4c49-40fe-40b4-bee2-8e48bac92f8e', N'QQsg+SMvMasHd+FssNONi2tEI9htVyt04AVznwMz8gU=', N'e7b3379d-844f-4a86-af15-6d17eb1cae1a', 0, 0, CAST(N'2024-06-26T07:18:22.783' AS DateTime), CAST(N'2024-06-26T07:18:22.783' AS DateTime), N'2cd9d081-ffef-4465-bfe9-31b93f7e1b3d')
INSERT [dbo].[RefreshToken] ([ID], [Token], [JwtId], [IsUsed], [IsRevoked], [ExpiredAt], [IssuedAt], [ID_Account]) VALUES (N'41667b1f-b071-4a57-b757-efb5a21b2835', N'xntWODYiSETVoLpDGYBOFAafn4anVeWHJSRR4YGtoRc=', N'0b2e9b5c-4097-4e47-b252-3a9a23fbf408', 0, 0, CAST(N'2024-06-26T07:18:16.443' AS DateTime), CAST(N'2024-06-26T07:18:16.443' AS DateTime), N'2f06a4c2-be69-4f88-8623-afe439e6d632')
INSERT [dbo].[RefreshToken] ([ID], [Token], [JwtId], [IsUsed], [IsRevoked], [ExpiredAt], [IssuedAt], [ID_Account]) VALUES (N'419e62a2-6a3b-400d-a75b-2f51461d0e95', N'tbQEy2NYzNfz0hhTUP/l0ru6w0Rib5BCZIElsksyGGM=', N'584740bd-4767-4633-ba30-1b0fe17317d4', 1, 1, CAST(N'2024-06-26T07:30:53.760' AS DateTime), CAST(N'2024-06-26T07:30:53.760' AS DateTime), N'4620463c-dc64-412e-b0c4-64c940b0fcca')
INSERT [dbo].[RefreshToken] ([ID], [Token], [JwtId], [IsUsed], [IsRevoked], [ExpiredAt], [IssuedAt], [ID_Account]) VALUES (N'5b6b0544-0c72-4b59-8ac7-f78255ef018a', N'eB6fp1t49FXgfJeo7R8RlkPogZJwoPgkO3J50jg8Qm8=', N'ba82c6bf-7faf-4abf-845b-59b9a1d8d55b', 1, 1, CAST(N'2024-06-26T07:31:27.220' AS DateTime), CAST(N'2024-06-26T07:31:27.220' AS DateTime), N'4620463c-dc64-412e-b0c4-64c940b0fcca')
INSERT [dbo].[RefreshToken] ([ID], [Token], [JwtId], [IsUsed], [IsRevoked], [ExpiredAt], [IssuedAt], [ID_Account]) VALUES (N'7b1fd84d-fdb4-4ab6-84c8-c9cda6d22747', N'bwQziFGgLsEXwk0/9ZvZPAD5nAiFUQRH4JQljpymi+Y=', N'b372074c-0fef-47b1-a78a-7d92b00d7ec2', 1, 1, CAST(N'2024-06-26T07:29:16.493' AS DateTime), CAST(N'2024-06-26T07:29:16.493' AS DateTime), N'4620463c-dc64-412e-b0c4-64c940b0fcca')
INSERT [dbo].[RefreshToken] ([ID], [Token], [JwtId], [IsUsed], [IsRevoked], [ExpiredAt], [IssuedAt], [ID_Account]) VALUES (N'84a60386-37a8-4705-98ec-f618fd67a9de', N'CIbzamgBdBWC3VM68RbvJ7KXy6RqF8MkOgwwNOKK2co=', N'25de66e7-b0a6-4c07-9fd5-a81ad172a8c3', 0, 0, CAST(N'2024-06-26T06:53:37.183' AS DateTime), CAST(N'2024-06-26T06:53:37.183' AS DateTime), N'f7a6275c-b956-412d-9709-58f8c25c15a8')
INSERT [dbo].[RefreshToken] ([ID], [Token], [JwtId], [IsUsed], [IsRevoked], [ExpiredAt], [IssuedAt], [ID_Account]) VALUES (N'a3c7a253-5b89-46a9-80ee-6e714257bdfc', N'iGsfWNnXLvaXIfWf/b+SsbR+Y8b9H+LkrRIETu3dYUw=', N'c816dc85-c707-4d34-818c-4251d50674ea', 1, 1, CAST(N'2024-06-26T07:34:35.317' AS DateTime), CAST(N'2024-06-26T07:34:35.317' AS DateTime), N'26ce429d-36d1-424e-a668-473bc953865f')
INSERT [dbo].[RefreshToken] ([ID], [Token], [JwtId], [IsUsed], [IsRevoked], [ExpiredAt], [IssuedAt], [ID_Account]) VALUES (N'a849a089-955d-40ba-be0f-3a39b1a93dc7', N'uTf09Vmw4KfmzDgVZbHnv//ZYZmD3AmFGVzRRakkIj4=', N'e0219dcd-c658-4a6d-bc9a-1f6256c09792', 0, 0, CAST(N'2024-06-26T06:49:54.790' AS DateTime), CAST(N'2024-06-26T06:49:54.790' AS DateTime), N'70960874-4733-4cee-a642-1573287a001f')
INSERT [dbo].[RefreshToken] ([ID], [Token], [JwtId], [IsUsed], [IsRevoked], [ExpiredAt], [IssuedAt], [ID_Account]) VALUES (N'c9358d9f-d8f9-4b99-8cdf-bb663ba321bd', N'I7f0UViMrp5xft1N7eYzRSEkJgOv2TsN+fAKWqa/K2Y=', N'b1e990c4-f86e-4582-aa8b-fac666ee5a90', 0, 0, CAST(N'2024-06-26T07:05:21.423' AS DateTime), CAST(N'2024-06-26T07:05:21.423' AS DateTime), N'c7096004-dcdb-45e7-859b-3b1e36c24ff3')
INSERT [dbo].[RefreshToken] ([ID], [Token], [JwtId], [IsUsed], [IsRevoked], [ExpiredAt], [IssuedAt], [ID_Account]) VALUES (N'e0554a7d-8c71-4c48-89e2-3994ba94498f', N'6wy/Ez7QKpdt10ukGKs90Gkel7wn7wAhw4JQIs4Fhcs=', N'c0ad1502-dc41-4139-9c83-4ba6e0ec23bd', 0, 0, CAST(N'2024-06-25T19:32:52.930' AS DateTime), CAST(N'2024-06-25T19:32:52.930' AS DateTime), N'4620463c-dc64-412e-b0c4-64c940b0fcca')
INSERT [dbo].[RefreshToken] ([ID], [Token], [JwtId], [IsUsed], [IsRevoked], [ExpiredAt], [IssuedAt], [ID_Account]) VALUES (N'e136f0ae-db03-400d-a98e-d614e4b6350d', N'hpUERtiFOZOX/qun5oduAKHOMX2NgOdu7yf7MOqoUMA=', N'b587e80e-bfea-493f-8e15-7780524f61c3', 0, 0, CAST(N'2024-06-26T07:05:13.373' AS DateTime), CAST(N'2024-06-26T07:05:13.373' AS DateTime), N'edfc4822-17e9-4cab-8998-bd45eb478151')
INSERT [dbo].[RefreshToken] ([ID], [Token], [JwtId], [IsUsed], [IsRevoked], [ExpiredAt], [IssuedAt], [ID_Account]) VALUES (N'fc87e31e-c140-4be5-9524-ae501c047f3c', N'Dbo0JZqtC5pGYy+WFmHi00/KyTj389eAzOyzIjIRYKM=', N'84aa1e2b-aa21-4a35-b2bc-56414a76e6a2', 0, 0, CAST(N'2024-06-26T07:45:02.543' AS DateTime), CAST(N'2024-06-26T07:45:02.543' AS DateTime), N'114fb7a2-4b52-4f6f-8999-13dae233e430')
GO
INSERT [dbo].[Request] ([ID], [Price], [Title], [LearningMethod], [Description], [Status], [CreateDate], [TimeTable], [TotalSession], [TimeStart], [TimeEnd], [ID_Account], [ID_Class], [ID_Subject]) VALUES (N'c89bb04c-b901-4e65-9fac-220f62ca0f13', 0, N'string', N'string', N'string', N'Đã duyệt', CAST(N'2024-06-26' AS Date), N'string', 0, CAST(N'12:12:00' AS Time), CAST(N'12:15:00' AS Time), N'4620463c-dc64-412e-b0c4-64c940b0fcca', N'CC5255B5-0D84-4725-A040-9B97FC0F7E45', N'6F7BA0EB-7EC7-4AD4-B1AA-21DDB9EC992F')
GO
INSERT [dbo].[Subject] ([ID], [SubjectName]) VALUES (N'086258F8-30E1-4D4E-AA7D-782272EBBB16', N'Lịch sử')
INSERT [dbo].[Subject] ([ID], [SubjectName]) VALUES (N'2C224DCB-DAEE-4116-A9A9-A64D0BBBA20C', N'Địa lý')
INSERT [dbo].[Subject] ([ID], [SubjectName]) VALUES (N'3745CE4D-7AB4-4115-A349-0AFCBA5997BC', N'Ngoại ngữ')
INSERT [dbo].[Subject] ([ID], [SubjectName]) VALUES (N'46FC6357-EB3E-454F-8643-B8DAF4362435', N'Vật Lý')
INSERT [dbo].[Subject] ([ID], [SubjectName]) VALUES (N'47FB293B-DB43-4D8C-9E43-2D40D4E14F63', N'Hóa học')
INSERT [dbo].[Subject] ([ID], [SubjectName]) VALUES (N'494405BD-DC45-4E03-965A-9C30CFC5D91A', N'Sinh học')
INSERT [dbo].[Subject] ([ID], [SubjectName]) VALUES (N'6F7BA0EB-7EC7-4AD4-B1AA-21DDB9EC992F', N'Toán học')
INSERT [dbo].[Subject] ([ID], [SubjectName]) VALUES (N'758CAFF2-5A96-48C5-96FE-2C2DE9EA55AF', N'Giáo dục công dân')
INSERT [dbo].[Subject] ([ID], [SubjectName]) VALUES (N'89E3B3F4-2C0A-46BB-A401-25961E53B1C9', N'Ngữ văn')
INSERT [dbo].[Subject] ([ID], [SubjectName]) VALUES (N'92340732-E8D6-40ED-BCC5-6A7666E4E4D6', N'Tin học')
GO
INSERT [dbo].[Tutor] ([ID], [SpecializedSkills], [Experience], [Status], [ID_Account]) VALUES (N'26273917-17a3-4fbb-8303-6872275ad04c', N'string3', 0, N'Chưa được duyệt', N'70b72b00-cc55-40ad-8315-6bb8a8325a17')
INSERT [dbo].[Tutor] ([ID], [SpecializedSkills], [Experience], [Status], [ID_Account]) VALUES (N'3006bf2b-45e0-4c64-974c-cbdb733e1335', N'string', 0, N'Chưa được duyệt', N'70960874-4733-4cee-a642-1573287a001f')
INSERT [dbo].[Tutor] ([ID], [SpecializedSkills], [Experience], [Status], [ID_Account]) VALUES (N'32997ee5-753d-41bf-9ef2-c1f2d4e6f74e', N'string', 0, N'Đã duyệt', N'2f06a4c2-be69-4f88-8623-afe439e6d632')
INSERT [dbo].[Tutor] ([ID], [SpecializedSkills], [Experience], [Status], [ID_Account]) VALUES (N'33856ebe-248c-4a62-8c75-a98992e2100b', N'string', 0, N'đã duyệt', N'c7096004-dcdb-45e7-859b-3b1e36c24ff3')
INSERT [dbo].[Tutor] ([ID], [SpecializedSkills], [Experience], [Status], [ID_Account]) VALUES (N'40e66d2b-4d41-4cbc-ac4a-b37695287a77', N'string', 0, N'Từ chối', N'edfc4822-17e9-4cab-8998-bd45eb478151')
INSERT [dbo].[Tutor] ([ID], [SpecializedSkills], [Experience], [Status], [ID_Account]) VALUES (N'48f5b893-5bb7-48d5-8ef4-f054e89e647f', N'string2', 0, N'Chưa được duyệt', N'f7a6275c-b956-412d-9709-58f8c25c15a8')
INSERT [dbo].[Tutor] ([ID], [SpecializedSkills], [Experience], [Status], [ID_Account]) VALUES (N'52cf2771-9c6b-4954-a897-e988f563d99c', N'string', 0, N'Đã duyệt', N'2cd9d081-ffef-4465-bfe9-31b93f7e1b3d')
INSERT [dbo].[Tutor] ([ID], [SpecializedSkills], [Experience], [Status], [ID_Account]) VALUES (N'588fd74a-3181-4ce7-ae58-05325641f93c', N'string', 0, N'Chưa duyệt', N'114fb7a2-4b52-4f6f-8999-13dae233e430')
GO
INSERT [dbo].[Tutor_Subject] ([ID], [ID_Tutor], [ID_Subject]) VALUES (N'0e318ee0-cc52-405c-b37b-ed903cf3508a', N'32997ee5-753d-41bf-9ef2-c1f2d4e6f74e', N'6F7BA0EB-7EC7-4AD4-B1AA-21DDB9EC992F')
INSERT [dbo].[Tutor_Subject] ([ID], [ID_Tutor], [ID_Subject]) VALUES (N'23e90bcd-ff08-4ac3-8720-d47c6298d10f', N'26273917-17a3-4fbb-8303-6872275ad04c', N'6F7BA0EB-7EC7-4AD4-B1AA-21DDB9EC992F')
INSERT [dbo].[Tutor_Subject] ([ID], [ID_Tutor], [ID_Subject]) VALUES (N'3afb0acf-63b7-474b-90b4-56f61e8076c3', N'40e66d2b-4d41-4cbc-ac4a-b37695287a77', N'6F7BA0EB-7EC7-4AD4-B1AA-21DDB9EC992F')
INSERT [dbo].[Tutor_Subject] ([ID], [ID_Tutor], [ID_Subject]) VALUES (N'3d972291-75c1-4ad4-a283-963393737717', N'588fd74a-3181-4ce7-ae58-05325641f93c', N'3745CE4D-7AB4-4115-A349-0AFCBA5997BC')
INSERT [dbo].[Tutor_Subject] ([ID], [ID_Tutor], [ID_Subject]) VALUES (N'8a7fd030-7e9f-43f8-8c16-8418e2c07730', N'33856ebe-248c-4a62-8c75-a98992e2100b', N'47FB293B-DB43-4D8C-9E43-2D40D4E14F63')
INSERT [dbo].[Tutor_Subject] ([ID], [ID_Tutor], [ID_Subject]) VALUES (N'99e867ce-514f-43e0-aaf8-7c191ff378a0', N'3006bf2b-45e0-4c64-974c-cbdb733e1335', N'6F7BA0EB-7EC7-4AD4-B1AA-21DDB9EC992F')
INSERT [dbo].[Tutor_Subject] ([ID], [ID_Tutor], [ID_Subject]) VALUES (N'9ff4c104-b0d1-489a-99ab-5cd5b80c966f', N'48f5b893-5bb7-48d5-8ef4-f054e89e647f', N'6F7BA0EB-7EC7-4AD4-B1AA-21DDB9EC992F')
INSERT [dbo].[Tutor_Subject] ([ID], [ID_Tutor], [ID_Subject]) VALUES (N'd567feca-7a72-45fe-b2e6-f696f3136011', N'52cf2771-9c6b-4954-a897-e988f563d99c', N'47FB293B-DB43-4D8C-9E43-2D40D4E14F63')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Tutor__213379EA62B8FD56]    Script Date: 6/26/2024 9:19:10 PM ******/
ALTER TABLE [dbo].[Tutor] ADD UNIQUE NONCLUSTERED 
(
	[ID_Account] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Complaint]  WITH CHECK ADD FOREIGN KEY([ID_Account])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[Complaint]  WITH CHECK ADD FOREIGN KEY([ID_Tutor])
REFERENCES [dbo].[Tutor] ([ID])
GO
ALTER TABLE [dbo].[EducationalQualifications]  WITH CHECK ADD FOREIGN KEY([ID_Tutor])
REFERENCES [dbo].[Tutor] ([ID])
GO
ALTER TABLE [dbo].[RefreshToken]  WITH CHECK ADD FOREIGN KEY([ID_Account])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[Rent]  WITH CHECK ADD FOREIGN KEY([ID_Account])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[Rent]  WITH CHECK ADD FOREIGN KEY([ID_Request])
REFERENCES [dbo].[Request] ([ID])
GO
ALTER TABLE [dbo].[Rent]  WITH CHECK ADD FOREIGN KEY([ID_Subject])
REFERENCES [dbo].[Subject] ([ID])
GO
ALTER TABLE [dbo].[Rent]  WITH CHECK ADD FOREIGN KEY([ID_Tutor])
REFERENCES [dbo].[Tutor] ([ID])
GO
ALTER TABLE [dbo].[Rent1]  WITH CHECK ADD FOREIGN KEY([ID_Account])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[Rent1]  WITH CHECK ADD FOREIGN KEY([ID_Schedule])
REFERENCES [dbo].[Schedule] ([ID])
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD FOREIGN KEY([ID_Account])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD FOREIGN KEY([ID_Class])
REFERENCES [dbo].[Class] ([ID])
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD FOREIGN KEY([ID_Subject])
REFERENCES [dbo].[Subject] ([ID])
GO
ALTER TABLE [dbo].[Request_Learning]  WITH CHECK ADD FOREIGN KEY([ID_Request])
REFERENCES [dbo].[Request] ([ID])
GO
ALTER TABLE [dbo].[Request_Learning]  WITH CHECK ADD FOREIGN KEY([ID_Tutor])
REFERENCES [dbo].[Tutor] ([ID])
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD FOREIGN KEY([ID_Service])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD FOREIGN KEY([ID_Class])
REFERENCES [dbo].[Class] ([ID])
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD FOREIGN KEY([ID_Tutor])
REFERENCES [dbo].[Tutor] ([ID])
GO
ALTER TABLE [dbo].[Tutor]  WITH CHECK ADD FOREIGN KEY([ID_Account])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[Tutor_Subject]  WITH CHECK ADD FOREIGN KEY([ID_Subject])
REFERENCES [dbo].[Subject] ([ID])
GO
ALTER TABLE [dbo].[Tutor_Subject]  WITH CHECK ADD FOREIGN KEY([ID_Tutor])
REFERENCES [dbo].[Tutor] ([ID])
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD FOREIGN KEY([ID_Account])
REFERENCES [dbo].[Account] ([ID])
GO
USE [master]
GO
ALTER DATABASE [DBMiniCapstone] SET  READ_WRITE 
GO
