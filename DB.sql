USE [master]
GO
/****** Object:  Database [DBMiniCapstone]    Script Date: 7/12/2024 8:57:08 PM ******/
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
/****** Object:  Table [dbo].[Account]    Script Date: 7/12/2024 8:57:08 PM ******/
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
/****** Object:  Table [dbo].[Booking]    Script Date: 7/12/2024 8:57:08 PM ******/
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
/****** Object:  Table [dbo].[Class]    Script Date: 7/12/2024 8:57:08 PM ******/
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
/****** Object:  Table [dbo].[ClassRequest]    Script Date: 7/12/2024 8:57:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassRequest](
	[ID] [varchar](50) NOT NULL,
	[ID_Tutor] [varchar](50) NULL,
	[ID_Request] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Complaint]    Script Date: 7/12/2024 8:57:08 PM ******/
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
/****** Object:  Table [dbo].[Date]    Script Date: 7/12/2024 8:57:08 PM ******/
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
/****** Object:  Table [dbo].[EducationalQualifications]    Script Date: 7/12/2024 8:57:08 PM ******/
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
/****** Object:  Table [dbo].[Notification]    Script Date: 7/12/2024 8:57:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[ID] [varchar](50) NOT NULL,
	[Description] [varchar](max) NULL,
	[ID_Account] [varchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[Status] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RefreshToken]    Script Date: 7/12/2024 8:57:08 PM ******/
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
/****** Object:  Table [dbo].[Rent]    Script Date: 7/12/2024 8:57:08 PM ******/
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
/****** Object:  Table [dbo].[Request]    Script Date: 7/12/2024 8:57:08 PM ******/
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
/****** Object:  Table [dbo].[Request_Learning]    Script Date: 7/12/2024 8:57:08 PM ******/
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
/****** Object:  Table [dbo].[Review]    Script Date: 7/12/2024 8:57:08 PM ******/
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
/****** Object:  Table [dbo].[Service]    Script Date: 7/12/2024 8:57:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ID] [varchar](50) NOT NULL,
	[PricePerHour] [real] NULL,
	[Title] [nvarchar](max) NULL,
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
/****** Object:  Table [dbo].[Subject]    Script Date: 7/12/2024 8:57:08 PM ******/
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
/****** Object:  Table [dbo].[TimeSlot]    Script Date: 7/12/2024 8:57:08 PM ******/
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
/****** Object:  Table [dbo].[Tutor]    Script Date: 7/12/2024 8:57:08 PM ******/
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
/****** Object:  Table [dbo].[Tutor_Subject]    Script Date: 7/12/2024 8:57:08 PM ******/
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
/****** Object:  Table [dbo].[Transaction]    Script Date: 7/12/2024 8:57:08 PM ******/
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
INSERT [dbo].[Account] ([ID], [FullName], [Password], [Email], [Date_Of_Birth], [Gender], [Roles], [Avatar], [Address], [Phone], [AccountBalance]) VALUES (N'13007B1B-38F1-4B65-9A8E-3CB4DAC6171D', N'Quản Trị Viên', N'123456', N'admin@gmail.com', NULL, N'nale', N'Quản trị viên', NULL, NULL, NULL, 0)
INSERT [dbo].[Account] ([ID], [FullName], [Password], [Email], [Date_Of_Birth], [Gender], [Roles], [Avatar], [Address], [Phone], [AccountBalance]) VALUES (N'8B5E42D0-8150-4261-B783-0944D0862C91', N'Điều Hành Viên', N'123456', N'mod@gmail.com', NULL, N'nam', N'Điều hành viên', NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Class] ([ID], [ClassName]) VALUES (N'A5B28A45-C74E-425E-98D7-55410292213E', N'11')
INSERT [dbo].[Class] ([ID], [ClassName]) VALUES (N'E94FBC5A-1DB8-4B20-8C71-856B3DDB2F0B', N'12')
INSERT [dbo].[Class] ([ID], [ClassName]) VALUES (N'EA128C86-C38A-4451-A734-775AECAC95FA', N'10')
GO
INSERT [dbo].[Subject] ([ID], [SubjectName]) VALUES (N'2634D207-8171-45F6-8F73-82AF53F88D0C', N'Địa lý')
INSERT [dbo].[Subject] ([ID], [SubjectName]) VALUES (N'3227AA10-0A81-413C-BE23-EAF9925F2334', N'Giáo dục công dân')
INSERT [dbo].[Subject] ([ID], [SubjectName]) VALUES (N'5A0F7D38-526A-4CC3-A79D-655CCB28A630', N'Hóa học')
INSERT [dbo].[Subject] ([ID], [SubjectName]) VALUES (N'60F53E6A-5FD4-4038-A7AB-95219F4F8448', N'Ngữ văn')
INSERT [dbo].[Subject] ([ID], [SubjectName]) VALUES (N'6565852B-8CF9-45D9-B70A-67CE32938A79', N'Vật Lý')
INSERT [dbo].[Subject] ([ID], [SubjectName]) VALUES (N'78596CE3-F61A-4C61-9A11-1245908624F5', N'Toán học')
INSERT [dbo].[Subject] ([ID], [SubjectName]) VALUES (N'BA7B76A8-9F9B-4D53-A7E8-AA86BC1A1526', N'Lịch sử')
INSERT [dbo].[Subject] ([ID], [SubjectName]) VALUES (N'BD444C79-9EA7-4A09-80F5-2BD5A4B8B2DB', N'Tin học')
INSERT [dbo].[Subject] ([ID], [SubjectName]) VALUES (N'BF707B92-39E1-4CFF-8044-7AD6AE219FED', N'Ngoại ngữ')
INSERT [dbo].[Subject] ([ID], [SubjectName]) VALUES (N'EAEF6456-45B5-4D0A-9736-47BAFD360CB8', N'Sinh học')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__ClassReq__9D71D65BAB3E01D8]    Script Date: 7/12/2024 8:57:09 PM ******/
ALTER TABLE [dbo].[ClassRequest] ADD UNIQUE NONCLUSTERED 
(
	[ID_Tutor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Tutor__213379EA11B41517]    Script Date: 7/12/2024 8:57:09 PM ******/
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
