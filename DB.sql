USE [master]
GO
/****** Object:  Database [DBMiniCapstone]    Script Date: 7/17/2024 7:58:37 AM ******/
CREATE DATABASE [DBMiniCapstone]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBMiniCapstone', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.LEMINHTRI\MSSQL\DATA\DBMiniCapstone.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBMiniCapstone_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.LEMINHTRI\MSSQL\DATA\DBMiniCapstone_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DBMiniCapstone] SET COMPATIBILITY_LEVEL = 160
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
ALTER DATABASE [DBMiniCapstone] SET QUERY_STORE = ON
GO
ALTER DATABASE [DBMiniCapstone] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DBMiniCapstone]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 7/17/2024 7:58:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[ID] [varchar](50) NOT NULL,
	[FullName] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[Email] [varchar](50) NULL,
	[Date_Of_Birth] [date] NULL,
	[Gender] [nvarchar](10) NULL,
	[Roles] [nvarchar](50) NULL,
	[Avatar] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Phone] [nvarchar](20) NULL,
	[AccountBalance] [real] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 7/17/2024 7:58:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[ID] [varchar](50) NOT NULL,
	[Duration] [float] NULL,
	[Price] [float] NULL,
	[Status] [nvarchar](50) NULL,
	[ID_TimeSlot] [varchar](50) NULL,
	[ID_Account] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 7/17/2024 7:58:38 AM ******/
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
/****** Object:  Table [dbo].[ClassRequest]    Script Date: 7/17/2024 7:58:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassRequest](
	[ID] [varchar](50) NOT NULL,
	[ID_Tutor] [varchar](50) NULL,
	[ID_Request] [varchar](50) NULL
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Complaint]    Script Date: 7/17/2024 7:58:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Complaint](
	[ID] [varchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[ID_Account] [varchar](50) NULL,
	[ID_Tutor] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Date]    Script Date: 7/17/2024 7:58:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Date](
	[ID] [varchar](50) NOT NULL,
	[Date] [date] NULL,
	[ID_Service] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EducationalQualifications]    Script Date: 7/17/2024 7:58:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EducationalQualifications](
	[ID] [varchar](50) NOT NULL,
	[QualificationName] [nvarchar](max) NULL,
	[Img] [nvarchar](max) NULL,
	[Type] [nvarchar](50) NULL,
	[ID_Tutor] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 7/17/2024 7:58:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[ID] [varchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[ID_Account] [varchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[Status] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RefreshToken]    Script Date: 7/17/2024 7:58:38 AM ******/
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
/****** Object:  Table [dbo].[Rent]    Script Date: 7/17/2024 7:58:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rent](
	[ID] [varchar](50) NOT NULL,
	[Price] [real] NULL,
	[CreateDate] [datetime] NULL,
	[ID_Tutor] [varchar](50) NULL,
	[ID_Account] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Request]    Script Date: 7/17/2024 7:58:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request](
	[ID] [varchar](50) NOT NULL,
	[Price] [real] NULL,
	[Title] [nvarchar](max) NULL,
	[LearningMethod] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
	[Reason] [nvarchar](max) NULL,
	[Status] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[TimeTable] [nvarchar](max) NULL,
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
/****** Object:  Table [dbo].[Request_Learning]    Script Date: 7/17/2024 7:58:38 AM ******/
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
/****** Object:  Table [dbo].[Review]    Script Date: 7/17/2024 7:58:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[ID] [varchar](50) NOT NULL,
	[Feedback] [nvarchar](max) NULL,
	[Rating] [float] NULL,
	[ID_Account] [varchar](50) NULL,
	[ID_Tutor] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 7/17/2024 7:58:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ID] [varchar](50) NOT NULL,
	[PricePerHour] [real] NULL,
	[Title] [nvarchar](max) NULL,
	[LearningMethod] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
	[ID_Tutor] [varchar](50) NULL,
	[ID_Class] [varchar](50) NULL,
	[ID_Subject] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 7/17/2024 7:58:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[ID] [varchar](50) NOT NULL,
	[SubjectName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeSlot]    Script Date: 7/17/2024 7:58:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeSlot](
	[ID] [varchar](50) NOT NULL,
	[ID_Date] [varchar](50) NULL,
	[Status] [nvarchar](50) NULL,
	[TimeSlot] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tutor]    Script Date: 7/17/2024 7:58:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tutor](
	[ID] [varchar](50) NOT NULL,
	[SpecializedSkills] [nvarchar](max) NULL,
	[Introduction] [nvarchar](max) NULL,
	[Experience] [int] NULL,
	[Reason] [nvarchar](max) NULL,
	[Status] [nvarchar](20) NULL,
	[ID_Account] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tutor_Subject]    Script Date: 7/17/2024 7:58:38 AM ******/
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
/****** Object:  Table [dbo].[Transaction]    Script Date: 7/17/2024 7:58:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction](
	[ID] [varchar](50) NOT NULL,
	[Amount] [real] NULL,
	[CreateDate] [datetime] NULL,
	[Status] [nvarchar](50) NULL,
	[ID_Account] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([ID], [FullName], [Password], [Email], [Date_Of_Birth], [Gender], [Roles], [Avatar], [Address], [Phone], [AccountBalance]) VALUES (N'021AADE9-8145-4274-BEB5-5FF7178BA6AD', N'Ngô Văn Khánh', N'NgoVanI@789', N'ngovankhanh@gmail.com', CAST(N'2009-08-18' AS Date), N'Nam', N'học sinh', NULL, NULL, N'0901234569', 0)
INSERT [dbo].[Account] ([ID], [FullName], [Password], [Email], [Date_Of_Birth], [Gender], [Roles], [Avatar], [Address], [Phone], [AccountBalance]) VALUES (N'0D7D6CB8-4681-4247-A891-AF98C4D7E54D', N'Nguyễn Thị Lan', N'NguyenP@321', N'nguyenthilan@gmail.com', CAST(N'1991-07-27' AS Date), N'Nữ', N'gia sư', NULL, NULL, N'0901234575', 0)
INSERT [dbo].[Account] ([ID], [FullName], [Password], [Email], [Date_Of_Birth], [Gender], [Roles], [Avatar], [Address], [Phone], [AccountBalance]) VALUES (N'0FBAF97F-C86C-4D94-8670-19F1C4F726D5', N'Nguyễn Văn An', N'Pass123!', N'nguyenvanan@gmail.com', CAST(N'2007-01-12' AS Date), N'Nam', N'học sinh', NULL, NULL, N'0901234561', 0)
INSERT [dbo].[Account] ([ID], [FullName], [Password], [Email], [Date_Of_Birth], [Gender], [Roles], [Avatar], [Address], [Phone], [AccountBalance]) VALUES (N'16E26F46-AB5B-4E48-B390-61BEE0089D80', N'Quản Trị Viên', N'123456', N'admin@gmail.com', NULL, N'nale', N'quản trị viên', NULL, NULL, NULL, 0)
INSERT [dbo].[Account] ([ID], [FullName], [Password], [Email], [Date_Of_Birth], [Gender], [Roles], [Avatar], [Address], [Phone], [AccountBalance]) VALUES (N'2FA0C9C0-5B80-4792-B1B3-1B8F31F47290', N'Trương Văn Tuấn', N'TruongT@789', N'truongvantuan@gmail.com', CAST(N'1980-02-15' AS Date), N'Nam', N'học sinh', NULL, NULL, N'0901234578', 0)
INSERT [dbo].[Account] ([ID], [FullName], [Password], [Email], [Date_Of_Birth], [Gender], [Roles], [Avatar], [Address], [Phone], [AccountBalance]) VALUES (N'3DEE99CB-B2A9-449B-9B69-C60AB4B819EE', N'Phan Văn Quân', N'PhanM@123', N'phanvanquan@gmail.com', CAST(N'1987-03-17' AS Date), N'Nam', N'gia sư', NULL, NULL, N'0901234573', 0)
INSERT [dbo].[Account] ([ID], [FullName], [Password], [Email], [Date_Of_Birth], [Gender], [Roles], [Avatar], [Address], [Phone], [AccountBalance]) VALUES (N'4B9DCA9E-7E68-4CF3-9BFD-0E8487D9EA4B', N'Ngô Văn Khánh', N'NgoVanI@789', N'ngovankhanh@gmail.com', CAST(N'2009-08-18' AS Date), N'Nam', N'học sinh', NULL, NULL, N'0901234569', 0)
INSERT [dbo].[Account] ([ID], [FullName], [Password], [Email], [Date_Of_Birth], [Gender], [Roles], [Avatar], [Address], [Phone], [AccountBalance]) VALUES (N'4BF32603-615F-4492-B36B-6437A5F9A50C', N'Bùi Văn Hoàng', N'BuiVanG@123', N'buivanhoang@gmail.com', CAST(N'2007-02-14' AS Date), N'Nam', N'học sinh', NULL, NULL, N'0901234567', 0)
INSERT [dbo].[Account] ([ID], [FullName], [Password], [Email], [Date_Of_Birth], [Gender], [Roles], [Avatar], [Address], [Phone], [AccountBalance]) VALUES (N'58056DA0-72DC-4B77-BFC9-2AD181750CE5', N'Tạ Thị Hương', N'TaThiN@456', N'tathihuong@gmail.com', CAST(N'1994-05-22' AS Date), N'Nữ', N'gia sư', NULL, NULL, N'0901234574', 0)
INSERT [dbo].[Account] ([ID], [FullName], [Password], [Email], [Date_Of_Birth], [Gender], [Roles], [Avatar], [Address], [Phone], [AccountBalance]) VALUES (N'627A0E34-2727-49C1-8FAD-D8EE3EF7BC8E', N'Đỗ Thị Lan', N'DoThiJ@321', N'dothilan@gmail.com', CAST(N'2008-12-29' AS Date), N'Nữ', N'học sinh', NULL, NULL, N'0901234570', 0)
INSERT [dbo].[Account] ([ID], [FullName], [Password], [Email], [Date_Of_Birth], [Gender], [Roles], [Avatar], [Address], [Phone], [AccountBalance]) VALUES (N'7C7E6CCB-356F-420C-93D8-E1635D8F4205', N'Trịnh Thị Nga', N'TrinhL@987', N'trinhthinga@gmail.com', CAST(N'1996-11-11' AS Date), N'Nữ', N'gia sư', NULL, NULL, N'0901234572', 0)
INSERT [dbo].[Account] ([ID], [FullName], [Password], [Email], [Date_Of_Birth], [Gender], [Roles], [Avatar], [Address], [Phone], [AccountBalance]) VALUES (N'82D2880E-AE7D-4F8B-84C1-40C85F295609', N'Lâm Văn Bình', N'LamQ@654', N'lamvanbinh@gmail.com', CAST(N'1985-09-19' AS Date), N'Nam', N'gia sư', NULL, NULL, N'0901234576', 0)
INSERT [dbo].[Account] ([ID], [FullName], [Password], [Email], [Date_Of_Birth], [Gender], [Roles], [Avatar], [Address], [Phone], [AccountBalance]) VALUES (N'8694B5B1-523E-49AE-9FC4-1533AD3FA12F', N'Đinh Thị Mai', N'DinhR@987', N'dinhthimai@gmail.com', CAST(N'1992-12-06' AS Date), N'Nữ', N'gia sư', NULL, NULL, N'0901234577', 0)
INSERT [dbo].[Account] ([ID], [FullName], [Password], [Email], [Date_Of_Birth], [Gender], [Roles], [Avatar], [Address], [Phone], [AccountBalance]) VALUES (N'8F8B0CCA-EC71-4083-ADF7-57E09480732B', N'Trần Thị Bích', N'B123@pass', N'tranthibich@gmail.com', CAST(N'2008-03-25' AS Date), N'Nữ', N'học sinh', NULL, NULL, N'0901234562', 0)
INSERT [dbo].[Account] ([ID], [FullName], [Password], [Email], [Date_Of_Birth], [Gender], [Roles], [Avatar], [Address], [Phone], [AccountBalance]) VALUES (N'9A11F962-4536-4B9D-876A-D2C49EAE2F4D', N'Kiểm Duyệt Viên', N'123456', N'mod@gmail.com', NULL, N'nam', N'kiểm duyệt viên', NULL, NULL, NULL, 0)
INSERT [dbo].[Account] ([ID], [FullName], [Password], [Email], [Date_Of_Birth], [Gender], [Roles], [Avatar], [Address], [Phone], [AccountBalance]) VALUES (N'9DFACC6C-B816-4E94-AFDB-E90D279DC2F9', N'Đỗ Thị Lan', N'DoThiJ@321', N'dothilan@gmail.com', CAST(N'2008-12-29' AS Date), N'Nữ', N'học sinh', NULL, NULL, N'0901234570', 0)
INSERT [dbo].[Account] ([ID], [FullName], [Password], [Email], [Date_Of_Birth], [Gender], [Roles], [Avatar], [Address], [Phone], [AccountBalance]) VALUES (N'AD9B9599-EA92-4950-9FFF-445F0EB6428F', N'Lê Văn Cường', N'LeVanC@456', N'levancuong@gmail.com', CAST(N'2009-07-07' AS Date), N'Nam', N'học sinh', NULL, NULL, N'0901234563', 0)
INSERT [dbo].[Account] ([ID], [FullName], [Password], [Email], [Date_Of_Birth], [Gender], [Roles], [Avatar], [Address], [Phone], [AccountBalance]) VALUES (N'C4C1D4F6-F4C6-4BC8-84CB-1EEA66AB81EA', N'Phạm Thị Dung', N'P@ssword789', N'phamthidung@gmail.com', CAST(N'2007-11-16' AS Date), N'Nữ', N'học sinh', NULL, NULL, N'0901234564', 0)
INSERT [dbo].[Account] ([ID], [FullName], [Password], [Email], [Date_Of_Birth], [Gender], [Roles], [Avatar], [Address], [Phone], [AccountBalance]) VALUES (N'C88EFC92-0DFF-4D67-87CF-CA2A5E6EE6F0', N'Đặng Thị Phương', N'Fpassword123', N'dangthiphuong@gmail.com', CAST(N'2009-05-03' AS Date), N'Nữ', N'học sinh', NULL, NULL, N'0901234566', 0)
INSERT [dbo].[Account] ([ID], [FullName], [Password], [Email], [Date_Of_Birth], [Gender], [Roles], [Avatar], [Address], [Phone], [AccountBalance]) VALUES (N'CB42E68A-C20D-417C-A601-2B0ACC95D218', N'Vũ Thị Hạnh', N'VuThiH@456', N'vuthihanh@gmail.com', CAST(N'2008-06-30' AS Date), N'Nữ', N'học sinh', NULL, NULL, N'0901234568', 0)
INSERT [dbo].[Account] ([ID], [FullName], [Password], [Email], [Date_Of_Birth], [Gender], [Roles], [Avatar], [Address], [Phone], [AccountBalance]) VALUES (N'F2EF1717-D922-4B07-9726-0199278F42E0', N'Lý Văn Minh', N'LyVanK@654', N'lyvanminh@gmail.com', CAST(N'1982-04-10' AS Date), N'Nam', N'gia sư', NULL, NULL, N'0901234571', 0)
INSERT [dbo].[Account] ([ID], [FullName], [Password], [Email], [Date_Of_Birth], [Gender], [Roles], [Avatar], [Address], [Phone], [AccountBalance]) VALUES (N'FD6C631F-E1F5-4101-80F5-F1D5D35037C8', N'Hoàng Văn Em', N'HoangE@123', N'hoangvanem@gmail.com', CAST(N'2008-09-21' AS Date), N'Nam', N'học sinh', NULL, NULL, N'0901234565', 0)
GO
INSERT [dbo].[Class] ([ID], [ClassName]) VALUES (N'33D30F06-B906-4F5A-801F-1ED4FF04F7D4', N'11')
INSERT [dbo].[Class] ([ID], [ClassName]) VALUES (N'EC4E54C8-4C02-472A-A965-1A80DEB8C23D', N'10')
INSERT [dbo].[Class] ([ID], [ClassName]) VALUES (N'F7B3ADDB-21F8-4C46-B3FB-CDA20A4327DE', N'12')
GO
INSERT [dbo].[EducationalQualifications] ([ID], [QualificationName], [Img], [Type], [ID_Tutor]) VALUES (N'2748b53e-5d06-4c94-a8ee-7753e98d4931', N'Chứng chỉ giảng dạy Vật lý', N'https://firebasestorage.googleapis.com/v0/b/otdlearning.appspot.com/o/certificate%2Fdemo.jpgf38473b1-89ae-40b6-a8c0-0075f6f28ed0?alt=media&token=99b290c2-65ab-47cb-af1e-c3ca3e9ca0aa', N'Chứng chỉ', N'470291c8-611b-426a-8a89-1042a5249741')
INSERT [dbo].[EducationalQualifications] ([ID], [QualificationName], [Img], [Type], [ID_Tutor]) VALUES (N'3c4da9af-c84e-40a1-9fff-61b8ec1f1b22', N'Chứng chỉ giảng dạy Hóa học', N'https://firebasestorage.googleapis.com/v0/b/otdlearning.appspot.com/o/certificate%2Fdemo.jpg14b5ec45-7cb0-4962-87f3-1e67bc1cb1dd?alt=media&token=e808d204-9197-4d4d-b08c-9c0ef0c35817', N'Chứng chỉ', N'b7f4856b-f860-470b-ac6e-2be61159b874')
INSERT [dbo].[EducationalQualifications] ([ID], [QualificationName], [Img], [Type], [ID_Tutor]) VALUES (N'7ad26509-0339-4224-8dbf-db6dcfe7858d', N'Chứng chỉ giảng dạy Lịch sử', N'https://firebasestorage.googleapis.com/v0/b/otdlearning.appspot.com/o/certificate%2Fdemo.jpgbc9da4d4-116c-4ef9-965d-9649ba7a8a0f?alt=media&token=4179eb5e-2fac-4513-90a1-1b02d4da7221', N'Chứng chỉ', N'8125f31c-9e33-438d-b70c-7b8db039192c')
INSERT [dbo].[EducationalQualifications] ([ID], [QualificationName], [Img], [Type], [ID_Tutor]) VALUES (N'974bbf6b-c642-4aee-af6b-677274fbf060', N'Chứng chỉ giảng dạy Tin học', N'https://firebasestorage.googleapis.com/v0/b/otdlearning.appspot.com/o/certificate%2Fdemo.jpg0fdc4014-5645-444c-9b9d-7d69b4717ed9?alt=media&token=c450fb89-499f-473f-bb86-2c21bebaaf6f', N'Bằng Cấp', N'ae17c5bd-02f9-4970-912d-092e493a3cda')
INSERT [dbo].[EducationalQualifications] ([ID], [QualificationName], [Img], [Type], [ID_Tutor]) VALUES (N'a0d6e59d-9cbe-4674-b447-a44471327002', N'Chứng chỉ giảng dạy Toán Quốc tế', N'https://firebasestorage.googleapis.com/v0/b/otdlearning.appspot.com/o/certificate%2Fdemo.jpgaaf9857b-ed99-4b29-8aef-8fdea5da77d7?alt=media&token=5eedfd77-cd93-4698-ad0c-87986b505876', N'Chứng chỉ', N'08129f50-ef3e-420c-baa5-4334df9ee6f2')
INSERT [dbo].[EducationalQualifications] ([ID], [QualificationName], [Img], [Type], [ID_Tutor]) VALUES (N'c4cddfd8-41a1-4f2c-9dee-0db5b710cf52', N'Chứng chỉ giảng dạy Sinh học', N'https://firebasestorage.googleapis.com/v0/b/otdlearning.appspot.com/o/certificate%2Fdemo.jpgd7c472bd-e2dd-4805-8182-d9ec1b5e8a87?alt=media&token=7f1dedd3-4c3a-46c8-ac55-e90efabed174', N'Bằng Cấp', N'376bb269-7159-4ff3-a466-5dd6b8d363b4')
INSERT [dbo].[EducationalQualifications] ([ID], [QualificationName], [Img], [Type], [ID_Tutor]) VALUES (N'c7f6f62c-f091-4553-b545-467017eb2e17', N'Chứng chỉ giảng dạy Ngữ văn', N'https://firebasestorage.googleapis.com/v0/b/otdlearning.appspot.com/o/certificate%2Fdemo.jpga0cb49e7-5ccd-4aa2-88b8-f2c89d33a9f4?alt=media&token=3cacd679-0ccd-41dc-b5e4-b1224a67cd31', N'Bằng Cấp', N'0c09bbca-2ce2-4d38-b21a-3cf21a1f7b05')
GO
INSERT [dbo].[Notification] ([ID], [Description], [ID_Account], [CreateDate], [Status]) VALUES (N'04b9f81d-bf33-416f-90fc-770804a5d1b5', N'Đăng ký gia sư thành công. Vui lòng chờ duyệt.', N'7C7E6CCB-356F-420C-93D8-E1635D8F4205', CAST(N'2024-07-17T07:32:23.803' AS DateTime), N'Chưa xem')
INSERT [dbo].[Notification] ([ID], [Description], [ID_Account], [CreateDate], [Status]) VALUES (N'6024173a-4eb0-458b-b3de-b8d009b1fe43', N'Đăng ký gia sư thành công. Vui lòng chờ duyệt.', N'8694B5B1-523E-49AE-9FC4-1533AD3FA12F', CAST(N'2024-07-17T07:24:07.033' AS DateTime), N'Chưa xem')
INSERT [dbo].[Notification] ([ID], [Description], [ID_Account], [CreateDate], [Status]) VALUES (N'78740dc3-d746-44ad-a233-259af34407a8', N'Đăng ký gia sư thành công. Vui lòng chờ duyệt.', N'82D2880E-AE7D-4F8B-84C1-40C85F295609', CAST(N'2024-07-17T07:25:51.160' AS DateTime), N'Chưa xem')
INSERT [dbo].[Notification] ([ID], [Description], [ID_Account], [CreateDate], [Status]) VALUES (N'7dfa8de7-fb51-4ed7-9dd4-757f6018c2ea', N'Đăng ký gia sư thành công. Vui lòng chờ duyệt.', N'58056DA0-72DC-4B77-BFC9-2AD181750CE5', CAST(N'2024-07-17T07:30:07.120' AS DateTime), N'Chưa xem')
INSERT [dbo].[Notification] ([ID], [Description], [ID_Account], [CreateDate], [Status]) VALUES (N'8417a973-f17d-4c6f-9541-2f2dfea5107b', N'Đăng ký gia sư thành công. Vui lòng chờ duyệt.', N'F2EF1717-D922-4B07-9726-0199278F42E0', CAST(N'2024-07-17T07:31:15.093' AS DateTime), N'Chưa xem')
INSERT [dbo].[Notification] ([ID], [Description], [ID_Account], [CreateDate], [Status]) VALUES (N'a35d02c7-1c03-41d6-a0d9-556b649c2763', N'Đăng ký gia sư thành công. Vui lòng chờ duyệt.', N'3DEE99CB-B2A9-449B-9B69-C60AB4B819EE', CAST(N'2024-07-17T07:33:24.557' AS DateTime), N'Chưa xem')
INSERT [dbo].[Notification] ([ID], [Description], [ID_Account], [CreateDate], [Status]) VALUES (N'ae4a5f35-d8d6-4565-a415-74c47b37bdc0', N'Đăng ký gia sư thành công. Vui lòng chờ duyệt.', N'0D7D6CB8-4681-4247-A891-AF98C4D7E54D', CAST(N'2024-07-17T07:27:06.200' AS DateTime), N'Chưa xem')
GO
INSERT [dbo].[RefreshToken] ([ID], [Token], [JwtId], [IsUsed], [IsRevoked], [ExpiredAt], [IssuedAt], [ID_Account]) VALUES (N'0a3f7452-50ee-4f0d-8c81-e836c64866a2', N'/iBIBztxqto7E/Q/h+3Shsv82K3qGNJNoHH1a2GdOvY=', N'2db3c6a5-6340-45f1-abaa-85a2cf550c3b', 1, 1, CAST(N'2024-07-24T00:32:46.633' AS DateTime), CAST(N'2024-07-17T00:32:46.633' AS DateTime), N'3DEE99CB-B2A9-449B-9B69-C60AB4B819EE')
INSERT [dbo].[RefreshToken] ([ID], [Token], [JwtId], [IsUsed], [IsRevoked], [ExpiredAt], [IssuedAt], [ID_Account]) VALUES (N'41ef50bd-2bca-44d1-bd28-267b469019fd', N'38Whm89w2kh1XMLE6K4j3kn36tVCdQfISu3s5MXFE+I=', N'5ea8a42d-f2a1-4dda-9d59-0bb95aca5367', 0, 0, CAST(N'2024-07-24T00:35:29.943' AS DateTime), CAST(N'2024-07-17T00:35:29.943' AS DateTime), N'16E26F46-AB5B-4E48-B390-61BEE0089D80')
INSERT [dbo].[RefreshToken] ([ID], [Token], [JwtId], [IsUsed], [IsRevoked], [ExpiredAt], [IssuedAt], [ID_Account]) VALUES (N'4794dc75-18e1-4e6b-a2e0-35806f271a01', N'bYn/8mQNSTM4h6JQwOmixMNTYoOi+sit3Powlxpm154=', N'aad3bc21-a7da-48a9-8fde-938cee668f53', 1, 1, CAST(N'2024-07-24T00:30:33.087' AS DateTime), CAST(N'2024-07-17T00:30:33.087' AS DateTime), N'F2EF1717-D922-4B07-9726-0199278F42E0')
INSERT [dbo].[RefreshToken] ([ID], [Token], [JwtId], [IsUsed], [IsRevoked], [ExpiredAt], [IssuedAt], [ID_Account]) VALUES (N'5287e0d9-6276-4aa6-9e05-67e52f842e7a', N'mIHFn8bzS+mhDU2Edww6V0QnHfVQW/lld2JVIf/ytTI=', N'3269528a-f7ff-4706-ba7f-06499f79ed88', 1, 1, CAST(N'2024-07-24T00:27:37.500' AS DateTime), CAST(N'2024-07-17T00:27:37.500' AS DateTime), N'0D7D6CB8-4681-4247-A891-AF98C4D7E54D')
INSERT [dbo].[RefreshToken] ([ID], [Token], [JwtId], [IsUsed], [IsRevoked], [ExpiredAt], [IssuedAt], [ID_Account]) VALUES (N'6304950f-4d25-4d30-8105-f0c1e3ae5e23', N'sllb53z98+eN1+7gAHoNQxtJ0BcBIdjpXZYJ+XSoiRw=', N'eadb3579-f21b-42cc-9f48-b75d34b4cb9c', 1, 1, CAST(N'2024-07-24T00:31:39.250' AS DateTime), CAST(N'2024-07-17T00:31:39.250' AS DateTime), N'7C7E6CCB-356F-420C-93D8-E1635D8F4205')
INSERT [dbo].[RefreshToken] ([ID], [Token], [JwtId], [IsUsed], [IsRevoked], [ExpiredAt], [IssuedAt], [ID_Account]) VALUES (N'8c68782c-b867-40ed-9e8a-b19c05a1d428', N'Ws92kcrFvZ9GsoNpUv4p0E7wqCRaNg2REgqf5OCQETE=', N'641577b6-a56b-4865-a078-f4bf1d95a3fc', 1, 1, CAST(N'2024-07-24T00:24:44.540' AS DateTime), CAST(N'2024-07-17T00:24:44.540' AS DateTime), N'82D2880E-AE7D-4F8B-84C1-40C85F295609')
INSERT [dbo].[RefreshToken] ([ID], [Token], [JwtId], [IsUsed], [IsRevoked], [ExpiredAt], [IssuedAt], [ID_Account]) VALUES (N'904e9c57-415b-4dee-8862-1a1de0e4e03b', N'f9ggXePgAyjIHx0VGVWVnabHBXrcsNBH2TGvJqU1Ww8=', N'09a5d21e-9e92-4104-8f01-b31ba1a1dcc2', 1, 1, CAST(N'2024-07-24T00:34:13.497' AS DateTime), CAST(N'2024-07-17T00:34:13.497' AS DateTime), N'9A11F962-4536-4B9D-876A-D2C49EAE2F4D')
INSERT [dbo].[RefreshToken] ([ID], [Token], [JwtId], [IsUsed], [IsRevoked], [ExpiredAt], [IssuedAt], [ID_Account]) VALUES (N'c3b2b2a9-9516-44d6-8661-a5671a87d297', N'+Hbgfkp5BLXJyUx1TLNmqBLhTbPIz0umODBoVxozSeI=', N'9e2bd2e6-d478-404b-a339-ad3961422f13', 1, 1, CAST(N'2024-07-24T00:29:01.710' AS DateTime), CAST(N'2024-07-17T00:29:01.710' AS DateTime), N'58056DA0-72DC-4B77-BFC9-2AD181750CE5')
INSERT [dbo].[RefreshToken] ([ID], [Token], [JwtId], [IsUsed], [IsRevoked], [ExpiredAt], [IssuedAt], [ID_Account]) VALUES (N'e1154cf8-9a20-43d9-ad99-3641529c9628', N'xbh56uHN/iw4LIw6ylp04CRZO1RCQIBBZE57ZNxef9s=', N'8fa964bc-7e67-4450-a7c7-d5a9589a2d73', 1, 1, CAST(N'2024-07-24T00:26:18.997' AS DateTime), CAST(N'2024-07-17T00:26:18.997' AS DateTime), N'0D7D6CB8-4681-4247-A891-AF98C4D7E54D')
INSERT [dbo].[RefreshToken] ([ID], [Token], [JwtId], [IsUsed], [IsRevoked], [ExpiredAt], [IssuedAt], [ID_Account]) VALUES (N'f8edf549-2555-4fc7-8041-b334c8290068', N'iYj87AiiwWTLvlyuDo/3lo6sutm+siMO0jYpGDRZdbg=', N'5eafba46-546c-47ea-8f19-1b05bd849a62', 1, 1, CAST(N'2024-07-24T00:21:05.053' AS DateTime), CAST(N'2024-07-17T00:21:05.053' AS DateTime), N'8694B5B1-523E-49AE-9FC4-1533AD3FA12F')
GO
INSERT [dbo].[Subject] ([ID], [SubjectName]) VALUES (N'2B683624-C37F-43B6-B94A-BC398B9282D8', N'Giáo dục công dân')
INSERT [dbo].[Subject] ([ID], [SubjectName]) VALUES (N'4B7B21DD-0404-4644-9A8F-E5851FDAF27D', N'Hóa học')
INSERT [dbo].[Subject] ([ID], [SubjectName]) VALUES (N'4DF71CFA-36BA-48C0-A292-E1535A9233AC', N'Địa lý')
INSERT [dbo].[Subject] ([ID], [SubjectName]) VALUES (N'682E5435-775C-45DC-8B15-57AE3EE5E18D', N'Ngoại ngữ')
INSERT [dbo].[Subject] ([ID], [SubjectName]) VALUES (N'69531CDD-967B-47A2-A14B-A9095F7BD331', N'Ngữ văn')
INSERT [dbo].[Subject] ([ID], [SubjectName]) VALUES (N'A86027A9-E0F8-4B7F-8302-8E00D957A4C4', N'Lịch sử')
INSERT [dbo].[Subject] ([ID], [SubjectName]) VALUES (N'BE240153-0E7D-47CE-BEF9-FD85DCDFE4EA', N'Vật Lý')
INSERT [dbo].[Subject] ([ID], [SubjectName]) VALUES (N'D7CD9C9D-2211-4887-B568-5D21C319D3DF', N'Sinh học')
INSERT [dbo].[Subject] ([ID], [SubjectName]) VALUES (N'E3459515-8A23-45D9-81B2-710B373EB98B', N'Tin học')
INSERT [dbo].[Subject] ([ID], [SubjectName]) VALUES (N'F0B6C7C4-A419-4FD7-A9AB-11BF121D56B1', N'Toán học')
GO
INSERT [dbo].[Tutor] ([ID], [SpecializedSkills], [Introduction], [Experience], [Reason], [Status], [ID_Account]) VALUES (N'08129f50-ef3e-420c-baa5-4334df9ee6f2', N'Giảng dạy đại số, hình học, và giải tích. Sử dụng phương pháp giải bài tập và thực hành để giúp học sinh nắm vững kiến thức.', N'Tôi là một gia sư có kinh nghiệm trong lĩnh vực giảng dạy, tốt nghiệp Đại học Sư phạm Hà Nội, chuyên ngành Toán học, đạt chứng chỉ giảng dạy Toán Quốc tế và đã có 3 năm kinh nghiệm làm gia sư toán học cho học sinh cấp 2 và cấp 3', 3, NULL, N'Đã duyệt', N'F2EF1717-D922-4B07-9726-0199278F42E0')
INSERT [dbo].[Tutor] ([ID], [SpecializedSkills], [Introduction], [Experience], [Reason], [Status], [ID_Account]) VALUES (N'0c09bbca-2ce2-4d38-b21a-3cf21a1f7b05', N' Giảng dạy văn học Việt Nam, văn học thế giới, và kỹ năng viết văn. Sử dụng phương pháp phân tích văn bản và thảo luận nhóm để học sinh hiểu sâu bài học', N'Tôi là một gia sư chuyên về Ngữ văn, tốt nghiệp Đại học Sư phạm Hà Nội, chuyên ngành Ngữ văn, đã có 2 năm kinh nghiệm giảng dạy cho học sinh cấp 2 và cấp 3.', 1, NULL, N'Đã duyệt', N'82D2880E-AE7D-4F8B-84C1-40C85F295609')
INSERT [dbo].[Tutor] ([ID], [SpecializedSkills], [Introduction], [Experience], [Reason], [Status], [ID_Account]) VALUES (N'376bb269-7159-4ff3-a466-5dd6b8d363b4', N'Giảng dạy sinh học tế bào, sinh học phân tử, di truyền học và sinh thái học. Sử dụng phương pháp trực quan và thí nghiệm để minh họa bài học.', N'Tôi là một gia sư chuyên về Sinh học, tốt nghiệp Đại học Sư phạm Hà Nội, chuyên ngành Sinh học, đã có 3 năm kinh nghiệm giảng dạy cho học sinh cấp 2 và cấp 3', 3, NULL, N'Đã duyệt', N'8694B5B1-523E-49AE-9FC4-1533AD3FA12F')
INSERT [dbo].[Tutor] ([ID], [SpecializedSkills], [Introduction], [Experience], [Reason], [Status], [ID_Account]) VALUES (N'470291c8-611b-426a-8a89-1042a5249741', N'Giảng dạy cơ học, điện học, quang học và lý thuyết tương đối. Sử dụng các thí nghiệm thực tế để minh họa bài học.', N'Tôi là một gia sư chuyên về Vật lý, tốt nghiệp Đại học Sư phạm Hà Nội, chuyên ngành Vật lý, đã có 4 năm kinh nghiệm giảng dạy cho học sinh cấp 2 và cấp 3.', 4, NULL, N'Đã duyệt', N'7C7E6CCB-356F-420C-93D8-E1635D8F4205')
INSERT [dbo].[Tutor] ([ID], [SpecializedSkills], [Introduction], [Experience], [Reason], [Status], [ID_Account]) VALUES (N'8125f31c-9e33-438d-b70c-7b8db039192c', N'Giảng dạy lịch sử Việt Nam, lịch sử thế giới, lịch sử cổ đại và trung đại. Sử dụng phương pháp kể chuyện và phân tích sự kiện để học sinh hiểu sâu bài học.', N'Tôi là một gia sư chuyên về Lịch sử, tốt nghiệp Đại học Sư phạm Hà Nội, chuyên ngành Lịch sử, đã có 4 năm kinh nghiệm giảng dạy cho học sinh cấp 2 và cấp 3.', 4, NULL, N'Đã duyệt', N'58056DA0-72DC-4B77-BFC9-2AD181750CE5')
INSERT [dbo].[Tutor] ([ID], [SpecializedSkills], [Introduction], [Experience], [Reason], [Status], [ID_Account]) VALUES (N'ae17c5bd-02f9-4970-912d-092e493a3cda', N'Giảng dạy lập trình, mạng máy tính, cơ sở dữ liệu và an ninh mạng. Sử dụng phương pháp thực hành và dự án để học sinh nắm vững kiến thức', N'Tôi là một gia sư chuyên về Tin học, tốt nghiệp Đại học Sư phạm Hà Nội, chuyên ngành Tin học, đã có 3 năm kinh nghiệm giảng dạy cho học sinh cấp 2 và cấp 3', 3, NULL, N'Đã duyệt', N'0D7D6CB8-4681-4247-A891-AF98C4D7E54D')
INSERT [dbo].[Tutor] ([ID], [SpecializedSkills], [Introduction], [Experience], [Reason], [Status], [ID_Account]) VALUES (N'b7f4856b-f860-470b-ac6e-2be61159b874', N'Giảng dạy hóa hữu cơ, vô cơ, phân tích và lý thuyết. Sử dụng phương pháp thí nghiệm và thực hành để giúp học sinh hiểu sâu bài học', N'Tôi là một gia sư chuyên về Hóa học, tốt nghiệp Đại học Sư phạm Hà Nội, chuyên ngành Hóa học, đã có 2 năm kinh nghiệm giảng dạy cho học sinh cấp 3', 2, NULL, N'Đã duyệt', N'3DEE99CB-B2A9-449B-9B69-C60AB4B819EE')
GO
INSERT [dbo].[Tutor_Subject] ([ID], [ID_Tutor], [ID_Subject]) VALUES (N'42f3f069-fd2c-41c8-a125-372860154b6d', N'376bb269-7159-4ff3-a466-5dd6b8d363b4', N'D7CD9C9D-2211-4887-B568-5D21C319D3DF')
INSERT [dbo].[Tutor_Subject] ([ID], [ID_Tutor], [ID_Subject]) VALUES (N'56ceeb2f-d9d4-4de6-9824-1dec58c346fd', N'8125f31c-9e33-438d-b70c-7b8db039192c', N'A86027A9-E0F8-4B7F-8302-8E00D957A4C4')
INSERT [dbo].[Tutor_Subject] ([ID], [ID_Tutor], [ID_Subject]) VALUES (N'61a77e73-e851-422e-a188-72d78ca3c043', N'0c09bbca-2ce2-4d38-b21a-3cf21a1f7b05', N'69531CDD-967B-47A2-A14B-A9095F7BD331')
INSERT [dbo].[Tutor_Subject] ([ID], [ID_Tutor], [ID_Subject]) VALUES (N'96ca8449-b393-46bb-b2da-31785c62a134', N'ae17c5bd-02f9-4970-912d-092e493a3cda', N'E3459515-8A23-45D9-81B2-710B373EB98B')
INSERT [dbo].[Tutor_Subject] ([ID], [ID_Tutor], [ID_Subject]) VALUES (N'978d2daf-f61c-4437-b37f-0e5c0e49f39a', N'b7f4856b-f860-470b-ac6e-2be61159b874', N'4B7B21DD-0404-4644-9A8F-E5851FDAF27D')
INSERT [dbo].[Tutor_Subject] ([ID], [ID_Tutor], [ID_Subject]) VALUES (N'b2e8e306-8abc-4dee-a86e-c1d32898c4d4', N'08129f50-ef3e-420c-baa5-4334df9ee6f2', N'F0B6C7C4-A419-4FD7-A9AB-11BF121D56B1')
INSERT [dbo].[Tutor_Subject] ([ID], [ID_Tutor], [ID_Subject]) VALUES (N'edb56e5a-a0ae-4895-9941-4f92ef7ee2e7', N'470291c8-611b-426a-8a89-1042a5249741', N'BE240153-0E7D-47CE-BEF9-FD85DCDFE4EA')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__ClassReq__9D71D65BA983D82A]    Script Date: 7/17/2024 7:58:38 AM ******/
ALTER TABLE [dbo].[ClassRequest] ADD UNIQUE NONCLUSTERED 
(
	[ID_Tutor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Tutor__213379EABDBE9130]    Script Date: 7/17/2024 7:58:38 AM ******/
ALTER TABLE [dbo].[Tutor] ADD UNIQUE NONCLUSTERED 
(
	[ID_Account] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD FOREIGN KEY([ID_Account])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD FOREIGN KEY([ID_TimeSlot])
REFERENCES [dbo].[TimeSlot] ([ID])
GO
ALTER TABLE [dbo].[ClassRequest]  WITH CHECK ADD FOREIGN KEY([ID_Request])
REFERENCES [dbo].[Request] ([ID])
GO
ALTER TABLE [dbo].[ClassRequest]  WITH CHECK ADD FOREIGN KEY([ID_Tutor])
REFERENCES [dbo].[Tutor] ([ID])
GO
ALTER TABLE [dbo].[Complaint]  WITH CHECK ADD FOREIGN KEY([ID_Account])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[Complaint]  WITH CHECK ADD FOREIGN KEY([ID_Tutor])
REFERENCES [dbo].[Tutor] ([ID])
GO
ALTER TABLE [dbo].[Date]  WITH CHECK ADD FOREIGN KEY([ID_Service])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[EducationalQualifications]  WITH CHECK ADD FOREIGN KEY([ID_Tutor])
REFERENCES [dbo].[Tutor] ([ID])
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD FOREIGN KEY([ID_Account])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[RefreshToken]  WITH CHECK ADD FOREIGN KEY([ID_Account])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[Rent]  WITH CHECK ADD FOREIGN KEY([ID_Account])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[Rent]  WITH CHECK ADD FOREIGN KEY([ID_Tutor])
REFERENCES [dbo].[Tutor] ([ID])
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
ALTER TABLE [dbo].[Review]  WITH CHECK ADD FOREIGN KEY([ID_Account])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD FOREIGN KEY([ID_Tutor])
REFERENCES [dbo].[Tutor] ([ID])
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD FOREIGN KEY([ID_Class])
REFERENCES [dbo].[Class] ([ID])
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD FOREIGN KEY([ID_Subject])
REFERENCES [dbo].[Subject] ([ID])
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD FOREIGN KEY([ID_Tutor])
REFERENCES [dbo].[Tutor] ([ID])
GO
ALTER TABLE [dbo].[TimeSlot]  WITH CHECK ADD FOREIGN KEY([ID_Date])
REFERENCES [dbo].[Date] ([ID])
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
