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
	[Status] [nvarchar](50) NULL,
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
	[Img] [nvarchar](max) NULL,
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
	[TimeStart] [time] NULL,
	[TimeEnd] [time]NULL,
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
	[TimeStart] [time] NULL,
	[TimeEnd] [time] NULL,
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
 PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

INSERT [dbo].[Class] ([ID], [ClassName]) VALUES (N'653DA1DE-D85B-4655-ACBE-9E289C6F161F', N'11')
INSERT [dbo].[Class] ([ID], [ClassName]) VALUES (N'CC5255B5-0D84-4725-A040-9B97FC0F7E45', N'12')
INSERT [dbo].[Class] ([ID], [ClassName]) VALUES (N'D3911A50-B01B-496A-BC1F-E8DF65B06533', N'10')

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
