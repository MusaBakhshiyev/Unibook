USE [master]
GO
/****** Object:  Database [Unibook]    Script Date: 4/27/2024 4:22:01 PM ******/
CREATE DATABASE [Unibook]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Unibook', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Unibook.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Unibook_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Unibook_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Unibook] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Unibook].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Unibook] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Unibook] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Unibook] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Unibook] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Unibook] SET ARITHABORT OFF 
GO
ALTER DATABASE [Unibook] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Unibook] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Unibook] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Unibook] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Unibook] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Unibook] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Unibook] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Unibook] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Unibook] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Unibook] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Unibook] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Unibook] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Unibook] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Unibook] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Unibook] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Unibook] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Unibook] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Unibook] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Unibook] SET  MULTI_USER 
GO
ALTER DATABASE [Unibook] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Unibook] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Unibook] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Unibook] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Unibook] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Unibook] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Unibook] SET QUERY_STORE = ON
GO
ALTER DATABASE [Unibook] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Unibook]
GO
/****** Object:  Table [dbo].[GroupLessonTime]    Script Date: 4/27/2024 4:22:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupLessonTime](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](50) NOT NULL,
	[SubjectName] [nvarchar](50) NOT NULL,
	[DayOfWeek] [nvarchar](50) NOT NULL,
	[StartTime] [time](0) NOT NULL,
	[TeacherId] [int] NOT NULL,
 CONSTRAINT [PK_GroupLessonTime] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 4/27/2024 4:22:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[Name] [nvarchar](50) NOT NULL,
	[Major] [nvarchar](50) NOT NULL,
	[Department] [nvarchar](50) NOT NULL,
	[MaxCount] [int] NOT NULL,
	[Year] [int] NOT NULL,
	[StudentNumber] [int] NOT NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Participation]    Script Date: 4/27/2024 4:22:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Participation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](50) NOT NULL,
	[SubjectName] [nvarchar](50) NOT NULL,
	[StudentName] [nvarchar](50) NOT NULL,
	[Participation] [nvarchar](50) NOT NULL,
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_Participation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 4/27/2024 4:22:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[FatherName] [nvarchar](50) NOT NULL,
	[EntranceYear] [int] NOT NULL,
	[GraduationYear] [int] NOT NULL,
	[EntranceScore] [float] NOT NULL,
	[Major] [nvarchar](50) NOT NULL,
	[Department] [nvarchar](50) NOT NULL,
	[EducationForm] [nvarchar](50) NOT NULL,
	[PaymentType] [nvarchar](50) NOT NULL,
	[EducationDegree] [nvarchar](50) NOT NULL,
	[GroupName] [nvarchar](50) NOT NULL,
	[PhoneNumber] [nvarchar](50) NOT NULL,
	[EMail] [nvarchar](50) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Gender] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentGrades]    Script Date: 4/27/2024 4:22:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentGrades](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](50) NOT NULL,
	[SubjectName] [nvarchar](50) NOT NULL,
	[StudentName] [nvarchar](50) NOT NULL,
	[GradeOrder] [nvarchar](50) NOT NULL,
	[Grade] [int] NOT NULL,
 CONSTRAINT [PK_StudentGrades] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubjectInfo]    Script Date: 4/27/2024 4:22:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubjectInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SubjectId] [int] NOT NULL,
	[Major] [nvarchar](50) NOT NULL,
	[Course] [int] NOT NULL,
	[Semester] [nvarchar](10) NOT NULL,
	[Credit] [int] NOT NULL,
 CONSTRAINT [PK_SubjectInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subjects]    Script Date: 4/27/2024 4:22:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subjects](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[NameOfDepartment] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Subjects] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 4/27/2024 4:22:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[FatherName] [nvarchar](50) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[PhoneNumber] [nvarchar](50) NOT NULL,
	[EMail] [nvarchar](50) NOT NULL,
	[Gender] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeacherSubjects]    Script Date: 4/27/2024 4:22:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeacherSubjects](
	[TeacherId] [int] NOT NULL,
	[SubjectId] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TeacherSubjects] PRIMARY KEY CLUSTERED 
(
	[TeacherId] ASC,
	[SubjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[GroupLessonTime] ON 
GO
INSERT [dbo].[GroupLessonTime] ([Id], [GroupName], [SubjectName], [DayOfWeek], [StartTime], [TeacherId]) VALUES (1, N'CE.23E-1', N'Calculus-1', N'Monday', CAST(N'09:00:00' AS Time), 2)
GO
INSERT [dbo].[GroupLessonTime] ([Id], [GroupName], [SubjectName], [DayOfWeek], [StartTime], [TeacherId]) VALUES (2, N'CE.23E-1', N'Basics Of Computer Engineering', N'Friday', CAST(N'09:00:00' AS Time), 8)
GO
INSERT [dbo].[GroupLessonTime] ([Id], [GroupName], [SubjectName], [DayOfWeek], [StartTime], [TeacherId]) VALUES (3, N'CE.23E-1', N'Calculus-1', N'Wednesday', CAST(N'09:00:00' AS Time), 2)
GO
INSERT [dbo].[GroupLessonTime] ([Id], [GroupName], [SubjectName], [DayOfWeek], [StartTime], [TeacherId]) VALUES (4, N'CE.23E-1', N'Basics Of Computer Engineering', N'Wednesday', CAST(N'10:10:00' AS Time), 8)
GO
INSERT [dbo].[GroupLessonTime] ([Id], [GroupName], [SubjectName], [DayOfWeek], [StartTime], [TeacherId]) VALUES (5, N'CE.23E-1', N'Basics Of Computer Engineering', N'Friday', CAST(N'10:10:00' AS Time), 8)
GO
INSERT [dbo].[GroupLessonTime] ([Id], [GroupName], [SubjectName], [DayOfWeek], [StartTime], [TeacherId]) VALUES (6, N'CS.23E-1', N'Calculus-1', N'Monday', CAST(N'09:00:00' AS Time), 12)
GO
INSERT [dbo].[GroupLessonTime] ([Id], [GroupName], [SubjectName], [DayOfWeek], [StartTime], [TeacherId]) VALUES (7, N'CS.23E-1', N'Calculus-1', N'Monday', CAST(N'10:10:00' AS Time), 12)
GO
INSERT [dbo].[GroupLessonTime] ([Id], [GroupName], [SubjectName], [DayOfWeek], [StartTime], [TeacherId]) VALUES (8, N'CS.23E-1', N'Basics Of Computer Engineering', N'Wednesday', CAST(N'09:00:00' AS Time), 10)
GO
INSERT [dbo].[GroupLessonTime] ([Id], [GroupName], [SubjectName], [DayOfWeek], [StartTime], [TeacherId]) VALUES (9, N'CS.23E-1', N'Basics Of Computer Engineering', N'Wednesday', CAST(N'10:10:00' AS Time), 10)
GO
INSERT [dbo].[GroupLessonTime] ([Id], [GroupName], [SubjectName], [DayOfWeek], [StartTime], [TeacherId]) VALUES (10, N'CS.23E-1', N'Basics Of Computer Engineering', N'Friday', CAST(N'09:00:00' AS Time), 10)
GO
INSERT [dbo].[GroupLessonTime] ([Id], [GroupName], [SubjectName], [DayOfWeek], [StartTime], [TeacherId]) VALUES (11, N'CE.23E-1', N'Basics Of Programming', N'Monday', CAST(N'09:00:00' AS Time), 5)
GO
INSERT [dbo].[GroupLessonTime] ([Id], [GroupName], [SubjectName], [DayOfWeek], [StartTime], [TeacherId]) VALUES (12, N'CE.23E-1', N'Calculus-2', N'Wednesday', CAST(N'09:00:00' AS Time), 2)
GO
INSERT [dbo].[GroupLessonTime] ([Id], [GroupName], [SubjectName], [DayOfWeek], [StartTime], [TeacherId]) VALUES (13, N'CE.23E-1', N'Basics Of Programming', N'Wednesday', CAST(N'10:10:00' AS Time), 5)
GO
INSERT [dbo].[GroupLessonTime] ([Id], [GroupName], [SubjectName], [DayOfWeek], [StartTime], [TeacherId]) VALUES (14, N'CE.23E-1', N'Basics Of Programming', N'Friday', CAST(N'09:00:00' AS Time), 5)
GO
INSERT [dbo].[GroupLessonTime] ([Id], [GroupName], [SubjectName], [DayOfWeek], [StartTime], [TeacherId]) VALUES (15, N'CE.23E-1', N'Calculus-2', N'Friday', CAST(N'10:10:00' AS Time), 2)
GO
INSERT [dbo].[GroupLessonTime] ([Id], [GroupName], [SubjectName], [DayOfWeek], [StartTime], [TeacherId]) VALUES (16, N'CS.23E-1', N'Calculus-2', N'Monday', CAST(N'09:00:00' AS Time), 12)
GO
INSERT [dbo].[GroupLessonTime] ([Id], [GroupName], [SubjectName], [DayOfWeek], [StartTime], [TeacherId]) VALUES (17, N'CS.23E-1', N'Calculus-2', N'Monday', CAST(N'10:10:00' AS Time), 12)
GO
INSERT [dbo].[GroupLessonTime] ([Id], [GroupName], [SubjectName], [DayOfWeek], [StartTime], [TeacherId]) VALUES (18, N'CS.23E-1', N'Basics Of Programming', N'Wednesday', CAST(N'09:00:00' AS Time), 8)
GO
INSERT [dbo].[GroupLessonTime] ([Id], [GroupName], [SubjectName], [DayOfWeek], [StartTime], [TeacherId]) VALUES (19, N'CS.23E-1', N'Basics Of Programming', N'Wednesday', CAST(N'10:10:00' AS Time), 8)
GO
INSERT [dbo].[GroupLessonTime] ([Id], [GroupName], [SubjectName], [DayOfWeek], [StartTime], [TeacherId]) VALUES (20, N'CS.23E-1', N'Basics Of Programming', N'Friday', CAST(N'09:00:00' AS Time), 8)
GO
SET IDENTITY_INSERT [dbo].[GroupLessonTime] OFF
GO
INSERT [dbo].[Groups] ([Name], [Major], [Department], [MaxCount], [Year], [StudentNumber]) VALUES (N'CE.23E-1', N'Computer Engineering', N'English', 10, 2023, 5)
GO
INSERT [dbo].[Groups] ([Name], [Major], [Department], [MaxCount], [Year], [StudentNumber]) VALUES (N'CS.23E-1', N'Computer Science', N'English', 10, 2023, 5)
GO
SET IDENTITY_INSERT [dbo].[Participation] ON 
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1, N'CE.23E-1', N'Calculus-2', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-02-16T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (2, N'CE.23E-1', N'Calculus-2', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-02-16T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (3, N'CE.23E-1', N'Calculus-2', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-02-16T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (4, N'CE.23E-1', N'Calculus-2', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-02-16T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (5, N'CE.23E-1', N'Calculus-2', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-02-16T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (6, N'CE.23E-1', N'Calculus-2', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-02-21T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (7, N'CE.23E-1', N'Calculus-2', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-02-21T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (8, N'CE.23E-1', N'Calculus-2', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-02-21T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (9, N'CE.23E-1', N'Calculus-2', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-02-21T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (10, N'CE.23E-1', N'Calculus-2', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-02-21T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (11, N'CE.23E-1', N'Calculus-2', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-02-23T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (12, N'CE.23E-1', N'Calculus-2', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-02-23T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (13, N'CE.23E-1', N'Calculus-2', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-02-23T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (14, N'CE.23E-1', N'Calculus-2', N'Lalə Zeynallı Nihat', N'ABSENT', CAST(N'2024-02-23T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (15, N'CE.23E-1', N'Calculus-2', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-02-23T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (16, N'CE.23E-1', N'Calculus-2', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-02-28T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (17, N'CE.23E-1', N'Calculus-2', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-02-28T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (18, N'CE.23E-1', N'Calculus-2', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-02-28T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (19, N'CE.23E-1', N'Calculus-2', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-02-28T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (20, N'CE.23E-1', N'Calculus-2', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-02-28T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (21, N'CE.23E-1', N'Calculus-2', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-03-01T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (22, N'CE.23E-1', N'Calculus-2', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-03-01T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (23, N'CE.23E-1', N'Calculus-2', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-03-01T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (24, N'CE.23E-1', N'Calculus-2', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-03-01T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (25, N'CE.23E-1', N'Calculus-2', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-03-01T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (26, N'CE.23E-1', N'Calculus-2', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-03-06T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (27, N'CE.23E-1', N'Calculus-2', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-03-06T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (28, N'CE.23E-1', N'Calculus-2', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-03-06T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (29, N'CE.23E-1', N'Calculus-2', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-03-06T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (30, N'CE.23E-1', N'Calculus-2', N'Nigar Qarayeva Islam', N'ABSENT', CAST(N'2024-03-06T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (31, N'CE.23E-1', N'Calculus-2', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-03-08T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (32, N'CE.23E-1', N'Calculus-2', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-03-08T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (33, N'CE.23E-1', N'Calculus-2', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-03-08T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (34, N'CE.23E-1', N'Calculus-2', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-03-08T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (35, N'CE.23E-1', N'Calculus-2', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-03-08T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (36, N'CE.23E-1', N'Calculus-2', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-03-13T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (37, N'CE.23E-1', N'Calculus-2', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-03-13T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (38, N'CE.23E-1', N'Calculus-2', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-03-13T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (39, N'CE.23E-1', N'Calculus-2', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-03-13T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (40, N'CE.23E-1', N'Calculus-2', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-03-13T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (41, N'CE.23E-1', N'Calculus-2', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-03-15T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (42, N'CE.23E-1', N'Calculus-2', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-03-15T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (43, N'CE.23E-1', N'Calculus-2', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-03-15T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (44, N'CE.23E-1', N'Calculus-2', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-03-15T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (45, N'CE.23E-1', N'Calculus-2', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-03-15T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (46, N'CE.23E-1', N'Calculus-2', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-03-20T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (47, N'CE.23E-1', N'Calculus-2', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-03-20T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (48, N'CE.23E-1', N'Calculus-2', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-03-20T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (49, N'CE.23E-1', N'Calculus-2', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-03-20T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (50, N'CE.23E-1', N'Calculus-2', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-03-20T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (51, N'CE.23E-1', N'Calculus-2', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-03-22T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (52, N'CE.23E-1', N'Calculus-2', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-03-22T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (53, N'CE.23E-1', N'Calculus-2', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-03-22T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (54, N'CE.23E-1', N'Calculus-2', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-03-22T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (55, N'CE.23E-1', N'Calculus-2', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-03-22T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (56, N'CE.23E-1', N'Calculus-2', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-03-27T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (57, N'CE.23E-1', N'Calculus-2', N'Samir Qurbanov Qurban', N'ABSENT', CAST(N'2024-03-27T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (58, N'CE.23E-1', N'Calculus-2', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-03-27T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (59, N'CE.23E-1', N'Calculus-2', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-03-27T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (60, N'CE.23E-1', N'Calculus-2', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-03-27T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (61, N'CE.23E-1', N'Calculus-2', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-03-29T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (62, N'CE.23E-1', N'Calculus-2', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-03-29T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (63, N'CE.23E-1', N'Calculus-2', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-03-29T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (64, N'CE.23E-1', N'Calculus-2', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-03-29T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (65, N'CE.23E-1', N'Calculus-2', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-03-29T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (66, N'CE.23E-1', N'Calculus-2', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-04-03T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (67, N'CE.23E-1', N'Calculus-2', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-04-03T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (68, N'CE.23E-1', N'Calculus-2', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-04-03T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (69, N'CE.23E-1', N'Calculus-2', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-04-03T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (70, N'CE.23E-1', N'Calculus-2', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-04-03T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (71, N'CE.23E-1', N'Calculus-2', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-04-05T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (72, N'CE.23E-1', N'Calculus-2', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-04-05T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (73, N'CE.23E-1', N'Calculus-2', N'Araz Əliyev Əhmət', N'ABSENT', CAST(N'2024-04-05T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (74, N'CE.23E-1', N'Calculus-2', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-04-05T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (75, N'CE.23E-1', N'Calculus-2', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-04-05T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (76, N'CE.23E-1', N'Calculus-2', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-04-10T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (77, N'CE.23E-1', N'Calculus-2', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-04-10T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (78, N'CE.23E-1', N'Calculus-2', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-04-10T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (79, N'CE.23E-1', N'Calculus-2', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-04-10T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (80, N'CE.23E-1', N'Calculus-2', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-04-10T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (81, N'CE.23E-1', N'Calculus-2', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-04-12T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (82, N'CE.23E-1', N'Calculus-2', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-04-12T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (83, N'CE.23E-1', N'Calculus-2', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-04-12T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (84, N'CE.23E-1', N'Calculus-2', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-04-12T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (85, N'CE.23E-1', N'Calculus-2', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-04-12T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (86, N'CE.23E-1', N'Calculus-2', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-04-17T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (87, N'CE.23E-1', N'Calculus-2', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-04-17T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (88, N'CE.23E-1', N'Calculus-2', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-04-17T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (89, N'CE.23E-1', N'Calculus-2', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-04-17T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (90, N'CE.23E-1', N'Calculus-2', N'Nigar Qarayeva Islam', N'ABSENT', CAST(N'2024-04-17T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (91, N'CE.23E-1', N'Calculus-2', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-04-19T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (92, N'CE.23E-1', N'Calculus-2', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-04-19T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (93, N'CE.23E-1', N'Calculus-2', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-04-19T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (94, N'CE.23E-1', N'Calculus-2', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-04-19T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (95, N'CE.23E-1', N'Calculus-2', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-04-19T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (96, N'CE.23E-1', N'Calculus-2', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-04-24T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (97, N'CE.23E-1', N'Calculus-2', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-04-24T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (98, N'CE.23E-1', N'Calculus-2', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-04-24T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (99, N'CE.23E-1', N'Calculus-2', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-04-24T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (100, N'CE.23E-1', N'Calculus-2', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-04-24T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (101, N'CE.23E-1', N'Basics Of Programming', N'Musa Baxşiyev Eldəniz', N'ABSENT', CAST(N'2024-02-16T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (102, N'CE.23E-1', N'Basics Of Programming', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-02-16T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (103, N'CE.23E-1', N'Basics Of Programming', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-02-16T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (104, N'CE.23E-1', N'Basics Of Programming', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-02-16T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (105, N'CE.23E-1', N'Basics Of Programming', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-02-16T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (106, N'CE.23E-1', N'Basics Of Programming', N'Musa Baxşiyev Eldəniz', N'ABSENT', CAST(N'2024-02-19T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (107, N'CE.23E-1', N'Basics Of Programming', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-02-19T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (108, N'CE.23E-1', N'Basics Of Programming', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-02-19T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (109, N'CE.23E-1', N'Basics Of Programming', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-02-19T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (110, N'CE.23E-1', N'Basics Of Programming', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-02-19T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (111, N'CE.23E-1', N'Basics Of Programming', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-02-21T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (112, N'CE.23E-1', N'Basics Of Programming', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-02-21T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (113, N'CE.23E-1', N'Basics Of Programming', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-02-21T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (114, N'CE.23E-1', N'Basics Of Programming', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-02-21T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (115, N'CE.23E-1', N'Basics Of Programming', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-02-21T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (116, N'CE.23E-1', N'Basics Of Programming', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-02-23T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (117, N'CE.23E-1', N'Basics Of Programming', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-02-23T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (118, N'CE.23E-1', N'Basics Of Programming', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-02-23T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (119, N'CE.23E-1', N'Basics Of Programming', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-02-23T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (120, N'CE.23E-1', N'Basics Of Programming', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-02-23T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (121, N'CE.23E-1', N'Basics Of Programming', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-02-26T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (122, N'CE.23E-1', N'Basics Of Programming', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-02-26T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (123, N'CE.23E-1', N'Basics Of Programming', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-02-26T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (124, N'CE.23E-1', N'Basics Of Programming', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-02-26T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (125, N'CE.23E-1', N'Basics Of Programming', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-02-26T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (126, N'CE.23E-1', N'Basics Of Programming', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-02-28T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (127, N'CE.23E-1', N'Basics Of Programming', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-02-28T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (128, N'CE.23E-1', N'Basics Of Programming', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-02-28T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (129, N'CE.23E-1', N'Basics Of Programming', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-02-28T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (130, N'CE.23E-1', N'Basics Of Programming', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-02-28T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (131, N'CE.23E-1', N'Basics Of Programming', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-03-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (132, N'CE.23E-1', N'Basics Of Programming', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-03-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (133, N'CE.23E-1', N'Basics Of Programming', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-03-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (134, N'CE.23E-1', N'Basics Of Programming', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-03-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (135, N'CE.23E-1', N'Basics Of Programming', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-03-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (136, N'CE.23E-1', N'Basics Of Programming', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-03-04T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (137, N'CE.23E-1', N'Basics Of Programming', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-03-04T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (138, N'CE.23E-1', N'Basics Of Programming', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-03-04T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (139, N'CE.23E-1', N'Basics Of Programming', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-03-04T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (140, N'CE.23E-1', N'Basics Of Programming', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-03-04T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (141, N'CE.23E-1', N'Basics Of Programming', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-03-06T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (142, N'CE.23E-1', N'Basics Of Programming', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-03-06T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (143, N'CE.23E-1', N'Basics Of Programming', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-03-06T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (144, N'CE.23E-1', N'Basics Of Programming', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-03-06T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (145, N'CE.23E-1', N'Basics Of Programming', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-03-06T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (146, N'CE.23E-1', N'Basics Of Programming', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-03-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (147, N'CE.23E-1', N'Basics Of Programming', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-03-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (148, N'CE.23E-1', N'Basics Of Programming', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-03-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (149, N'CE.23E-1', N'Basics Of Programming', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-03-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (150, N'CE.23E-1', N'Basics Of Programming', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-03-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (151, N'CE.23E-1', N'Basics Of Programming', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-03-11T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (152, N'CE.23E-1', N'Basics Of Programming', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-03-11T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (153, N'CE.23E-1', N'Basics Of Programming', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-03-11T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (154, N'CE.23E-1', N'Basics Of Programming', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-03-11T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (155, N'CE.23E-1', N'Basics Of Programming', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-03-11T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (156, N'CE.23E-1', N'Basics Of Programming', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-03-13T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (157, N'CE.23E-1', N'Basics Of Programming', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-03-13T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (158, N'CE.23E-1', N'Basics Of Programming', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-03-13T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (159, N'CE.23E-1', N'Basics Of Programming', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-03-13T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (160, N'CE.23E-1', N'Basics Of Programming', N'Nigar Qarayeva Islam', N'ABSENT', CAST(N'2024-03-13T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (161, N'CE.23E-1', N'Basics Of Programming', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-03-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (162, N'CE.23E-1', N'Basics Of Programming', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-03-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (163, N'CE.23E-1', N'Basics Of Programming', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-03-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (164, N'CE.23E-1', N'Basics Of Programming', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-03-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (165, N'CE.23E-1', N'Basics Of Programming', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-03-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (166, N'CE.23E-1', N'Basics Of Programming', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-03-18T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (167, N'CE.23E-1', N'Basics Of Programming', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-03-18T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (168, N'CE.23E-1', N'Basics Of Programming', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-03-18T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (169, N'CE.23E-1', N'Basics Of Programming', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-03-18T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (170, N'CE.23E-1', N'Basics Of Programming', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-03-18T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (171, N'CE.23E-1', N'Basics Of Programming', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-03-20T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (172, N'CE.23E-1', N'Basics Of Programming', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-03-20T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (173, N'CE.23E-1', N'Basics Of Programming', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-03-20T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (174, N'CE.23E-1', N'Basics Of Programming', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-03-20T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (175, N'CE.23E-1', N'Basics Of Programming', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-03-20T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (176, N'CE.23E-1', N'Basics Of Programming', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-03-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (177, N'CE.23E-1', N'Basics Of Programming', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-03-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (178, N'CE.23E-1', N'Basics Of Programming', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-03-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (179, N'CE.23E-1', N'Basics Of Programming', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-03-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (180, N'CE.23E-1', N'Basics Of Programming', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-03-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (181, N'CE.23E-1', N'Basics Of Programming', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-03-25T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (182, N'CE.23E-1', N'Basics Of Programming', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-03-25T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (183, N'CE.23E-1', N'Basics Of Programming', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-03-25T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (184, N'CE.23E-1', N'Basics Of Programming', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-03-25T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (185, N'CE.23E-1', N'Basics Of Programming', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-03-25T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (186, N'CE.23E-1', N'Basics Of Programming', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-03-27T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (187, N'CE.23E-1', N'Basics Of Programming', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-03-27T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (188, N'CE.23E-1', N'Basics Of Programming', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-03-27T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (189, N'CE.23E-1', N'Basics Of Programming', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-03-27T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (190, N'CE.23E-1', N'Basics Of Programming', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-03-27T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (191, N'CE.23E-1', N'Basics Of Programming', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-03-29T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (192, N'CE.23E-1', N'Basics Of Programming', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-03-29T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (193, N'CE.23E-1', N'Basics Of Programming', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-03-29T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (194, N'CE.23E-1', N'Basics Of Programming', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-03-29T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (195, N'CE.23E-1', N'Basics Of Programming', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-03-29T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (196, N'CE.23E-1', N'Basics Of Programming', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-04-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (197, N'CE.23E-1', N'Basics Of Programming', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-04-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (198, N'CE.23E-1', N'Basics Of Programming', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-04-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (199, N'CE.23E-1', N'Basics Of Programming', N'Lalə Zeynallı Nihat', N'ABSENT', CAST(N'2024-04-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (200, N'CE.23E-1', N'Basics Of Programming', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-04-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (201, N'CE.23E-1', N'Basics Of Programming', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-04-03T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (202, N'CE.23E-1', N'Basics Of Programming', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-04-03T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (203, N'CE.23E-1', N'Basics Of Programming', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-04-03T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (204, N'CE.23E-1', N'Basics Of Programming', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-04-03T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (205, N'CE.23E-1', N'Basics Of Programming', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-04-03T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (206, N'CE.23E-1', N'Basics Of Programming', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-04-05T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (207, N'CE.23E-1', N'Basics Of Programming', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-04-05T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (208, N'CE.23E-1', N'Basics Of Programming', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-04-05T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (209, N'CE.23E-1', N'Basics Of Programming', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-04-05T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (210, N'CE.23E-1', N'Basics Of Programming', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-04-05T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (211, N'CE.23E-1', N'Basics Of Programming', N'Musa Baxşiyev Eldəniz', N'ABSENT', CAST(N'2024-04-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (212, N'CE.23E-1', N'Basics Of Programming', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-04-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (213, N'CE.23E-1', N'Basics Of Programming', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-04-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (214, N'CE.23E-1', N'Basics Of Programming', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-04-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (215, N'CE.23E-1', N'Basics Of Programming', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-04-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (216, N'CE.23E-1', N'Basics Of Programming', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-04-10T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (217, N'CE.23E-1', N'Basics Of Programming', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-04-10T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (218, N'CE.23E-1', N'Basics Of Programming', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-04-10T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (219, N'CE.23E-1', N'Basics Of Programming', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-04-10T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (220, N'CE.23E-1', N'Basics Of Programming', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-04-10T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (221, N'CE.23E-1', N'Basics Of Programming', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-04-12T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (222, N'CE.23E-1', N'Basics Of Programming', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-04-12T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (223, N'CE.23E-1', N'Basics Of Programming', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-04-12T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (224, N'CE.23E-1', N'Basics Of Programming', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-04-12T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (225, N'CE.23E-1', N'Basics Of Programming', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-04-12T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (226, N'CE.23E-1', N'Basics Of Programming', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-04-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (227, N'CE.23E-1', N'Basics Of Programming', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-04-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (228, N'CE.23E-1', N'Basics Of Programming', N'Araz Əliyev Əhmət', N'ABSENT', CAST(N'2024-04-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (229, N'CE.23E-1', N'Basics Of Programming', N'Lalə Zeynallı Nihat', N'ABSENT', CAST(N'2024-04-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (230, N'CE.23E-1', N'Basics Of Programming', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-04-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (231, N'CE.23E-1', N'Basics Of Programming', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-04-17T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (232, N'CE.23E-1', N'Basics Of Programming', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-04-17T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (233, N'CE.23E-1', N'Basics Of Programming', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-04-17T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (234, N'CE.23E-1', N'Basics Of Programming', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-04-17T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (235, N'CE.23E-1', N'Basics Of Programming', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-04-17T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (236, N'CE.23E-1', N'Basics Of Programming', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-04-19T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (237, N'CE.23E-1', N'Basics Of Programming', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-04-19T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (238, N'CE.23E-1', N'Basics Of Programming', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-04-19T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (239, N'CE.23E-1', N'Basics Of Programming', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-04-19T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (240, N'CE.23E-1', N'Basics Of Programming', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-04-19T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (241, N'CE.23E-1', N'Basics Of Programming', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-04-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (242, N'CE.23E-1', N'Basics Of Programming', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-04-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (243, N'CE.23E-1', N'Basics Of Programming', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-04-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (244, N'CE.23E-1', N'Basics Of Programming', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-04-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (245, N'CE.23E-1', N'Basics Of Programming', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-04-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (246, N'CE.23E-1', N'Basics Of Programming', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-04-24T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (247, N'CE.23E-1', N'Basics Of Programming', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-04-24T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (248, N'CE.23E-1', N'Basics Of Programming', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-04-24T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (249, N'CE.23E-1', N'Basics Of Programming', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-04-24T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (250, N'CE.23E-1', N'Basics Of Programming', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-04-24T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (251, N'CE.23E-1', N'Calculus-1', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-09-18T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (252, N'CE.23E-1', N'Calculus-1', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-09-18T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (253, N'CE.23E-1', N'Calculus-1', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-09-18T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (254, N'CE.23E-1', N'Calculus-1', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-09-18T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (255, N'CE.23E-1', N'Calculus-1', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-09-18T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (256, N'CE.23E-1', N'Calculus-1', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-09-20T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (257, N'CE.23E-1', N'Calculus-1', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-09-20T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (258, N'CE.23E-1', N'Calculus-1', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-09-20T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (259, N'CE.23E-1', N'Calculus-1', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-09-20T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (260, N'CE.23E-1', N'Calculus-1', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-09-20T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (261, N'CE.23E-1', N'Calculus-1', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-09-25T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (262, N'CE.23E-1', N'Calculus-1', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-09-25T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (263, N'CE.23E-1', N'Calculus-1', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-09-25T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (264, N'CE.23E-1', N'Calculus-1', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-09-25T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (265, N'CE.23E-1', N'Calculus-1', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-09-25T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (266, N'CE.23E-1', N'Calculus-1', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-09-27T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (267, N'CE.23E-1', N'Calculus-1', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-09-27T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (268, N'CE.23E-1', N'Calculus-1', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-09-27T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (269, N'CE.23E-1', N'Calculus-1', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-09-27T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (270, N'CE.23E-1', N'Calculus-1', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-09-27T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (271, N'CE.23E-1', N'Calculus-1', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-10-02T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (272, N'CE.23E-1', N'Calculus-1', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-10-02T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (273, N'CE.23E-1', N'Calculus-1', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-10-02T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (274, N'CE.23E-1', N'Calculus-1', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-10-02T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (275, N'CE.23E-1', N'Calculus-1', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-10-02T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (276, N'CE.23E-1', N'Calculus-1', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-10-04T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (277, N'CE.23E-1', N'Calculus-1', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-10-04T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (278, N'CE.23E-1', N'Calculus-1', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-10-04T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (279, N'CE.23E-1', N'Calculus-1', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-10-04T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (280, N'CE.23E-1', N'Calculus-1', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-10-04T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (281, N'CE.23E-1', N'Calculus-1', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-10-09T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (282, N'CE.23E-1', N'Calculus-1', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-10-09T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (283, N'CE.23E-1', N'Calculus-1', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-10-09T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (284, N'CE.23E-1', N'Calculus-1', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-10-09T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (285, N'CE.23E-1', N'Calculus-1', N'Nigar Qarayeva Islam', N'ABSENT', CAST(N'2023-10-09T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (286, N'CE.23E-1', N'Calculus-1', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-10-11T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (287, N'CE.23E-1', N'Calculus-1', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-10-11T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (288, N'CE.23E-1', N'Calculus-1', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-10-11T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (289, N'CE.23E-1', N'Calculus-1', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-10-11T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (290, N'CE.23E-1', N'Calculus-1', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-10-11T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (291, N'CE.23E-1', N'Calculus-1', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-10-16T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (292, N'CE.23E-1', N'Calculus-1', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-10-16T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (293, N'CE.23E-1', N'Calculus-1', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-10-16T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (294, N'CE.23E-1', N'Calculus-1', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-10-16T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (295, N'CE.23E-1', N'Calculus-1', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-10-16T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (296, N'CE.23E-1', N'Calculus-1', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-10-18T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (297, N'CE.23E-1', N'Calculus-1', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-10-18T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (298, N'CE.23E-1', N'Calculus-1', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-10-18T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (299, N'CE.23E-1', N'Calculus-1', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-10-18T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (300, N'CE.23E-1', N'Calculus-1', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-10-18T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (301, N'CE.23E-1', N'Calculus-1', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-10-23T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (302, N'CE.23E-1', N'Calculus-1', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-10-23T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (303, N'CE.23E-1', N'Calculus-1', N'Araz Əliyev Əhmət', N'ABSENT', CAST(N'2023-10-23T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (304, N'CE.23E-1', N'Calculus-1', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-10-23T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (305, N'CE.23E-1', N'Calculus-1', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-10-23T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (306, N'CE.23E-1', N'Calculus-1', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-10-25T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (307, N'CE.23E-1', N'Calculus-1', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-10-25T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (308, N'CE.23E-1', N'Calculus-1', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-10-25T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (309, N'CE.23E-1', N'Calculus-1', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-10-25T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (310, N'CE.23E-1', N'Calculus-1', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-10-25T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (311, N'CE.23E-1', N'Calculus-1', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-10-30T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (312, N'CE.23E-1', N'Calculus-1', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-10-30T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (313, N'CE.23E-1', N'Calculus-1', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-10-30T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (314, N'CE.23E-1', N'Calculus-1', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-10-30T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (315, N'CE.23E-1', N'Calculus-1', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-10-30T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (316, N'CE.23E-1', N'Calculus-1', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-11-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (317, N'CE.23E-1', N'Calculus-1', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-11-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (318, N'CE.23E-1', N'Calculus-1', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-11-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (319, N'CE.23E-1', N'Calculus-1', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-11-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (320, N'CE.23E-1', N'Calculus-1', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-11-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (321, N'CE.23E-1', N'Calculus-1', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-11-06T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (322, N'CE.23E-1', N'Calculus-1', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-11-06T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (323, N'CE.23E-1', N'Calculus-1', N'Araz Əliyev Əhmət', N'ABSENT', CAST(N'2023-11-06T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (324, N'CE.23E-1', N'Calculus-1', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-11-06T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (325, N'CE.23E-1', N'Calculus-1', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-11-06T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (326, N'CE.23E-1', N'Calculus-1', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-11-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (327, N'CE.23E-1', N'Calculus-1', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-11-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (328, N'CE.23E-1', N'Calculus-1', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-11-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (329, N'CE.23E-1', N'Calculus-1', N'Lalə Zeynallı Nihat', N'ABSENT', CAST(N'2023-11-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (330, N'CE.23E-1', N'Calculus-1', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-11-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (331, N'CE.23E-1', N'Calculus-1', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-11-13T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (332, N'CE.23E-1', N'Calculus-1', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-11-13T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (333, N'CE.23E-1', N'Calculus-1', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-11-13T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (334, N'CE.23E-1', N'Calculus-1', N'Lalə Zeynallı Nihat', N'ABSENT', CAST(N'2023-11-13T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (335, N'CE.23E-1', N'Calculus-1', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-11-13T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (336, N'CE.23E-1', N'Calculus-1', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-11-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (337, N'CE.23E-1', N'Calculus-1', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-11-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (338, N'CE.23E-1', N'Calculus-1', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-11-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (339, N'CE.23E-1', N'Calculus-1', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-11-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (340, N'CE.23E-1', N'Calculus-1', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-11-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (341, N'CE.23E-1', N'Calculus-1', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-11-20T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (342, N'CE.23E-1', N'Calculus-1', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-11-20T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (343, N'CE.23E-1', N'Calculus-1', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-11-20T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (344, N'CE.23E-1', N'Calculus-1', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-11-20T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (345, N'CE.23E-1', N'Calculus-1', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-11-20T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (346, N'CE.23E-1', N'Calculus-1', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-11-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (347, N'CE.23E-1', N'Calculus-1', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-11-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (348, N'CE.23E-1', N'Calculus-1', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-11-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (349, N'CE.23E-1', N'Calculus-1', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-11-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (350, N'CE.23E-1', N'Calculus-1', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-11-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (351, N'CE.23E-1', N'Calculus-1', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-11-27T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (352, N'CE.23E-1', N'Calculus-1', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-11-27T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (353, N'CE.23E-1', N'Calculus-1', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-11-27T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (354, N'CE.23E-1', N'Calculus-1', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-11-27T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (355, N'CE.23E-1', N'Calculus-1', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-11-27T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (356, N'CE.23E-1', N'Calculus-1', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-11-29T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (357, N'CE.23E-1', N'Calculus-1', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-11-29T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (358, N'CE.23E-1', N'Calculus-1', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-11-29T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (359, N'CE.23E-1', N'Calculus-1', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-11-29T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (360, N'CE.23E-1', N'Calculus-1', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-11-29T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (361, N'CE.23E-1', N'Calculus-1', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-12-04T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (362, N'CE.23E-1', N'Calculus-1', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-12-04T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (363, N'CE.23E-1', N'Calculus-1', N'Araz Əliyev Əhmət', N'ABSENT', CAST(N'2023-12-04T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (364, N'CE.23E-1', N'Calculus-1', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-12-04T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (365, N'CE.23E-1', N'Calculus-1', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-12-04T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (366, N'CE.23E-1', N'Calculus-1', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-12-06T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (367, N'CE.23E-1', N'Calculus-1', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-12-06T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (368, N'CE.23E-1', N'Calculus-1', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-12-06T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (369, N'CE.23E-1', N'Calculus-1', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-12-06T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (370, N'CE.23E-1', N'Calculus-1', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-12-06T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (371, N'CE.23E-1', N'Calculus-1', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-12-11T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (372, N'CE.23E-1', N'Calculus-1', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-12-11T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (373, N'CE.23E-1', N'Calculus-1', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-12-11T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (374, N'CE.23E-1', N'Calculus-1', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-12-11T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (375, N'CE.23E-1', N'Calculus-1', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-12-11T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (376, N'CE.23E-1', N'Calculus-1', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-12-13T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (377, N'CE.23E-1', N'Calculus-1', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-12-13T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (378, N'CE.23E-1', N'Calculus-1', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-12-13T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (379, N'CE.23E-1', N'Calculus-1', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-12-13T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (380, N'CE.23E-1', N'Calculus-1', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-12-13T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (381, N'CE.23E-1', N'Calculus-1', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-12-18T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (382, N'CE.23E-1', N'Calculus-1', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-12-18T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (383, N'CE.23E-1', N'Calculus-1', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-12-18T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (384, N'CE.23E-1', N'Calculus-1', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-12-18T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (385, N'CE.23E-1', N'Calculus-1', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-12-18T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (386, N'CE.23E-1', N'Calculus-1', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-12-20T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (387, N'CE.23E-1', N'Calculus-1', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-12-20T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (388, N'CE.23E-1', N'Calculus-1', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-12-20T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (389, N'CE.23E-1', N'Calculus-1', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-12-20T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (390, N'CE.23E-1', N'Calculus-1', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-12-20T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (391, N'CE.23E-1', N'Calculus-1', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-12-25T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (392, N'CE.23E-1', N'Calculus-1', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-12-25T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (393, N'CE.23E-1', N'Calculus-1', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-12-25T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (394, N'CE.23E-1', N'Calculus-1', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-12-25T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (395, N'CE.23E-1', N'Calculus-1', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-12-25T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (396, N'CE.23E-1', N'Calculus-1', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-12-27T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (397, N'CE.23E-1', N'Calculus-1', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-12-27T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (398, N'CE.23E-1', N'Calculus-1', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-12-27T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (399, N'CE.23E-1', N'Calculus-1', N'Lalə Zeynallı Nihat', N'ABSENT', CAST(N'2023-12-27T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (400, N'CE.23E-1', N'Calculus-1', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-12-27T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (401, N'CE.23E-1', N'Calculus-1', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-01-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (402, N'CE.23E-1', N'Calculus-1', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-01-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (403, N'CE.23E-1', N'Calculus-1', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-01-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (404, N'CE.23E-1', N'Calculus-1', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-01-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (405, N'CE.23E-1', N'Calculus-1', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-01-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (406, N'CE.23E-1', N'Calculus-1', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-01-03T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (407, N'CE.23E-1', N'Calculus-1', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-01-03T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (408, N'CE.23E-1', N'Calculus-1', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-01-03T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (409, N'CE.23E-1', N'Calculus-1', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-01-03T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (410, N'CE.23E-1', N'Calculus-1', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-01-03T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (411, N'CE.23E-1', N'Calculus-1', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-01-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (412, N'CE.23E-1', N'Calculus-1', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-01-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (413, N'CE.23E-1', N'Calculus-1', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-01-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (414, N'CE.23E-1', N'Calculus-1', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-01-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (415, N'CE.23E-1', N'Calculus-1', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-01-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (416, N'CE.23E-1', N'Calculus-1', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-01-10T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (417, N'CE.23E-1', N'Calculus-1', N'Samir Qurbanov Qurban', N'ABSENT', CAST(N'2024-01-10T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (418, N'CE.23E-1', N'Calculus-1', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-01-10T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (419, N'CE.23E-1', N'Calculus-1', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-01-10T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (420, N'CE.23E-1', N'Calculus-1', N'Nigar Qarayeva Islam', N'ABSENT', CAST(N'2024-01-10T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (421, N'CE.23E-1', N'Calculus-1', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-01-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (422, N'CE.23E-1', N'Calculus-1', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-01-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (423, N'CE.23E-1', N'Calculus-1', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-01-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (424, N'CE.23E-1', N'Calculus-1', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-01-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (425, N'CE.23E-1', N'Calculus-1', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-01-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (426, N'CE.23E-1', N'Calculus-1', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-01-17T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (427, N'CE.23E-1', N'Calculus-1', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-01-17T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (428, N'CE.23E-1', N'Calculus-1', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-01-17T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (429, N'CE.23E-1', N'Calculus-1', N'Lalə Zeynallı Nihat', N'ABSENT', CAST(N'2024-01-17T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (430, N'CE.23E-1', N'Calculus-1', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-01-17T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (431, N'CE.23E-1', N'Calculus-1', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-01-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (432, N'CE.23E-1', N'Calculus-1', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-01-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (433, N'CE.23E-1', N'Calculus-1', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-01-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (434, N'CE.23E-1', N'Calculus-1', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-01-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (435, N'CE.23E-1', N'Calculus-1', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-01-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (436, N'CE.23E-1', N'Calculus-1', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-01-24T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (437, N'CE.23E-1', N'Calculus-1', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-01-24T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (438, N'CE.23E-1', N'Calculus-1', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-01-24T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (439, N'CE.23E-1', N'Calculus-1', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-01-24T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (440, N'CE.23E-1', N'Calculus-1', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-01-24T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (441, N'CE.23E-1', N'Calculus-1', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-01-29T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (442, N'CE.23E-1', N'Calculus-1', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-01-29T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (443, N'CE.23E-1', N'Calculus-1', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-01-29T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (444, N'CE.23E-1', N'Calculus-1', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-01-29T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (445, N'CE.23E-1', N'Calculus-1', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-01-29T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (446, N'CE.23E-1', N'Calculus-1', N'Musa Baxşiyev Eldəniz', N'ABSENT', CAST(N'2024-01-31T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (447, N'CE.23E-1', N'Calculus-1', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-01-31T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (448, N'CE.23E-1', N'Calculus-1', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-01-31T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (449, N'CE.23E-1', N'Calculus-1', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-01-31T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (450, N'CE.23E-1', N'Calculus-1', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-01-31T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (451, N'CE.23E-1', N'Calculus-1', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-02-05T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (452, N'CE.23E-1', N'Calculus-1', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-02-05T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (453, N'CE.23E-1', N'Calculus-1', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-02-05T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (454, N'CE.23E-1', N'Calculus-1', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-02-05T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (455, N'CE.23E-1', N'Calculus-1', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-02-05T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (456, N'CE.23E-1', N'Calculus-1', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-02-07T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (457, N'CE.23E-1', N'Calculus-1', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-02-07T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (458, N'CE.23E-1', N'Calculus-1', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-02-07T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (459, N'CE.23E-1', N'Calculus-1', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-02-07T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (460, N'CE.23E-1', N'Calculus-1', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-02-07T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (461, N'CE.23E-1', N'Calculus-1', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-02-12T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (462, N'CE.23E-1', N'Calculus-1', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-02-12T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (463, N'CE.23E-1', N'Calculus-1', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-02-12T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (464, N'CE.23E-1', N'Calculus-1', N'Lalə Zeynallı Nihat', N'ABSENT', CAST(N'2024-02-12T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (465, N'CE.23E-1', N'Calculus-1', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-02-12T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (466, N'CE.23E-1', N'Calculus-1', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-02-14T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (467, N'CE.23E-1', N'Calculus-1', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-02-14T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (468, N'CE.23E-1', N'Calculus-1', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-02-14T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (469, N'CE.23E-1', N'Calculus-1', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-02-14T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (470, N'CE.23E-1', N'Calculus-1', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-02-14T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (471, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-09-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (472, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-09-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (473, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-09-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (474, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-09-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (475, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-09-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (476, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-09-15T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (477, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-09-15T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (478, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-09-15T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (479, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-09-15T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (480, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-09-15T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (481, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-09-20T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (482, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-09-20T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (483, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-09-20T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (484, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-09-20T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (485, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-09-20T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (486, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-09-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (487, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-09-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (488, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-09-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (489, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-09-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (490, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-09-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (491, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-09-22T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (492, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-09-22T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (493, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-09-22T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (494, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-09-22T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (495, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-09-22T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (496, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-09-27T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (497, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-09-27T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (498, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-09-27T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (499, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-09-27T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (500, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'ABSENT', CAST(N'2023-09-27T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (501, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-09-29T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (502, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-09-29T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (503, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-09-29T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (504, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-09-29T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (505, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-09-29T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (506, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-09-29T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (507, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-09-29T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (508, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-09-29T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (509, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-09-29T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (510, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-09-29T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (511, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-10-04T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (512, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-10-04T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (513, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-10-04T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (514, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'ABSENT', CAST(N'2023-10-04T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (515, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-10-04T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (516, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-10-06T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (517, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-10-06T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (518, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-10-06T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (519, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-10-06T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (520, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-10-06T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (521, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-10-06T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (522, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-10-06T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (523, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-10-06T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (524, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-10-06T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (525, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-10-06T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (526, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-10-11T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (527, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-10-11T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (528, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-10-11T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (529, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-10-11T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (530, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-10-11T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (531, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-10-13T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (532, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-10-13T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (533, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-10-13T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (534, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-10-13T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (535, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-10-13T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (536, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-10-13T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (537, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-10-13T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (538, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-10-13T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (539, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-10-13T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (540, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-10-13T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (541, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-10-18T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (542, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-10-18T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (543, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-10-18T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (544, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-10-18T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (545, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-10-18T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (546, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-10-20T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (547, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-10-20T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (548, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-10-20T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (549, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-10-20T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (550, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-10-20T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (551, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-10-20T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (552, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-10-20T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (553, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-10-20T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (554, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-10-20T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (555, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-10-20T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (556, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-10-25T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (557, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-10-25T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (558, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-10-25T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (559, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-10-25T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (560, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-10-25T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (561, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-10-27T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (562, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-10-27T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (563, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-10-27T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (564, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-10-27T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (565, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-10-27T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (566, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-10-27T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (567, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-10-27T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (568, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-10-27T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (569, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-10-27T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (570, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-10-27T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (571, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-11-01T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (572, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-11-01T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (573, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-11-01T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (574, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-11-01T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (575, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-11-01T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (576, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-11-03T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (577, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-11-03T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (578, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-11-03T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (579, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-11-03T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (580, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-11-03T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (581, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-11-03T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (582, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-11-03T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (583, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-11-03T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (584, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-11-03T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (585, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-11-03T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (586, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-11-08T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (587, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-11-08T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (588, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-11-08T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (589, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-11-08T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (590, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-11-08T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (591, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-11-10T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (592, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-11-10T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (593, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-11-10T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (594, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-11-10T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (595, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-11-10T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (596, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-11-10T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (597, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-11-10T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (598, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-11-10T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (599, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-11-10T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (600, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-11-10T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (601, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-11-15T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (602, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-11-15T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (603, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-11-15T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (604, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-11-15T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (605, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-11-15T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (606, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-11-17T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (607, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-11-17T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (608, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-11-17T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (609, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-11-17T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (610, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-11-17T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (611, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-11-17T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (612, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-11-17T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (613, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-11-17T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (614, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-11-17T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (615, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-11-17T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (616, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-11-22T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (617, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-11-22T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (618, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'ABSENT', CAST(N'2023-11-22T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (619, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-11-22T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (620, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-11-22T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (621, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-11-24T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (622, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-11-24T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (623, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-11-24T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (624, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-11-24T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (625, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-11-24T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (626, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-11-24T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (627, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-11-24T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (628, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-11-24T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (629, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-11-24T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (630, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-11-24T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (631, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-11-29T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (632, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-11-29T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (633, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-11-29T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (634, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-11-29T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (635, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-11-29T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (636, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-12-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (637, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-12-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (638, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-12-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (639, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-12-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (640, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-12-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (641, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-12-01T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (642, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-12-01T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (643, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-12-01T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (644, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-12-01T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (645, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-12-01T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (646, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-12-06T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (647, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-12-06T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (648, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-12-06T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (649, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-12-06T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (650, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-12-06T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (651, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-12-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (652, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-12-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (653, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-12-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (654, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-12-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (655, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-12-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (656, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-12-08T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (657, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-12-08T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (658, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'ABSENT', CAST(N'2023-12-08T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (659, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-12-08T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (660, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-12-08T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (661, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-12-13T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (662, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-12-13T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (663, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-12-13T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (664, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-12-13T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (665, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-12-13T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (666, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-12-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (667, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-12-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (668, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-12-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (669, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-12-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (670, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-12-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (671, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-12-15T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (672, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-12-15T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (673, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-12-15T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (674, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-12-15T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (675, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-12-15T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (676, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-12-20T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (677, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-12-20T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (678, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-12-20T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (679, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-12-20T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (680, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-12-20T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (681, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'ABSENT', CAST(N'2023-12-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (682, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-12-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (683, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-12-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (684, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-12-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (685, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-12-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (686, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-12-22T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (687, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-12-22T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (688, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-12-22T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (689, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-12-22T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (690, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-12-22T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (691, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-12-27T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (692, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-12-27T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (693, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-12-27T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (694, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-12-27T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (695, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-12-27T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (696, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-12-29T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (697, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-12-29T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (698, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-12-29T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (699, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-12-29T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (700, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-12-29T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (701, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2023-12-29T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (702, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2023-12-29T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (703, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2023-12-29T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (704, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2023-12-29T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (705, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2023-12-29T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (706, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-01-03T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (707, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-01-03T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (708, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-01-03T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (709, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-01-03T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (710, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'ABSENT', CAST(N'2024-01-03T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (711, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'ABSENT', CAST(N'2024-01-05T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (712, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-01-05T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (713, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-01-05T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (714, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-01-05T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (715, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-01-05T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (716, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-01-05T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (717, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-01-05T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (718, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-01-05T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (719, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-01-05T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (720, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-01-05T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (721, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-01-10T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (722, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-01-10T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (723, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-01-10T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (724, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-01-10T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (725, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-01-10T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (726, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-01-12T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (727, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-01-12T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (728, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-01-12T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (729, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-01-12T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (730, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-01-12T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (731, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-01-12T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (732, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-01-12T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (733, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'ABSENT', CAST(N'2024-01-12T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (734, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-01-12T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (735, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-01-12T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (736, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-01-17T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (737, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-01-17T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (738, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-01-17T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (739, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-01-17T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (740, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-01-17T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (741, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-01-19T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (742, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-01-19T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (743, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-01-19T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (744, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-01-19T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (745, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-01-19T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (746, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-01-19T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (747, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-01-19T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (748, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-01-19T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (749, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-01-19T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (750, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-01-19T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (751, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-01-24T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (752, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-01-24T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (753, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-01-24T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (754, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-01-24T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (755, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-01-24T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (756, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-01-26T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (757, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-01-26T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (758, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-01-26T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (759, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-01-26T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (760, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-01-26T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (761, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-01-26T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (762, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-01-26T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (763, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-01-26T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (764, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-01-26T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (765, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-01-26T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (766, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-01-31T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (767, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-01-31T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (768, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-01-31T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (769, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-01-31T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (770, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-01-31T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (771, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'ABSENT', CAST(N'2024-02-02T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (772, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'ABSENT', CAST(N'2024-02-02T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (773, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-02-02T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (774, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-02-02T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (775, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'ABSENT', CAST(N'2024-02-02T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (776, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-02-02T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (777, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'ABSENT', CAST(N'2024-02-02T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (778, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-02-02T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (779, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-02-02T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (780, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-02-02T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (781, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-02-07T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (782, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-02-07T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (783, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-02-07T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (784, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-02-07T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (785, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-02-07T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (786, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-02-09T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (787, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-02-09T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (788, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-02-09T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (789, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-02-09T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (790, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-02-09T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (791, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-02-09T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (792, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-02-09T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (793, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-02-09T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (794, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-02-09T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (795, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-02-09T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (796, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-02-14T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (797, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-02-14T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (798, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-02-14T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (799, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-02-14T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (800, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-02-14T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (801, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-02-19T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (802, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-02-19T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (803, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-02-19T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (804, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-02-19T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (805, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-02-19T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (806, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-02-19T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (807, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-02-19T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (808, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-02-19T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (809, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-02-19T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (810, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-02-19T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (811, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-02-26T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (812, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-02-26T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (813, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-02-26T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (814, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-02-26T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (815, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-02-26T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (816, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-02-26T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (817, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-02-26T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (818, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-02-26T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (819, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-02-26T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (820, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-02-26T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (821, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-03-04T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (822, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-03-04T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (823, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-03-04T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (824, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-03-04T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (825, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-03-04T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (826, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-03-04T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (827, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-03-04T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (828, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-03-04T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (829, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-03-04T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (830, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-03-04T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (831, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-03-11T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (832, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-03-11T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (833, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-03-11T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (834, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-03-11T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (835, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-03-11T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (836, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-03-11T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (837, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-03-11T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (838, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-03-11T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (839, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-03-11T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (840, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-03-11T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (841, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-03-18T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (842, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-03-18T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (843, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-03-18T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (844, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-03-18T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (845, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-03-18T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (846, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-03-18T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (847, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-03-18T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (848, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-03-18T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (849, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-03-18T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (850, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-03-18T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (851, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-03-25T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (852, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-03-25T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (853, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'ABSENT', CAST(N'2024-03-25T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (854, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-03-25T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (855, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-03-25T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (856, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-03-25T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (857, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-03-25T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (858, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-03-25T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (859, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-03-25T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (860, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-03-25T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (861, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-04-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (862, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-04-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (863, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-04-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (864, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-04-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (865, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-04-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (866, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'ABSENT', CAST(N'2024-04-01T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (867, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-04-01T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (868, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-04-01T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (869, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-04-01T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (870, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-04-01T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (871, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-04-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (872, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-04-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (873, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-04-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (874, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-04-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (875, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-04-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (876, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-04-08T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (877, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-04-08T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (878, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-04-08T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (879, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-04-08T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (880, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-04-08T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (881, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'ABSENT', CAST(N'2024-04-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (882, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-04-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (883, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-04-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (884, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-04-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (885, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-04-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (886, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-04-15T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (887, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-04-15T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (888, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-04-15T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (889, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-04-15T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (890, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-04-15T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (891, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-04-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (892, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-04-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (893, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-04-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (894, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-04-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (895, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-04-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (896, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-04-22T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (897, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-04-22T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (898, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-04-22T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (899, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-04-22T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (900, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-04-22T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (901, N'CS.23E-1', N'Discrete Mathematics', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-02-19T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (902, N'CS.23E-1', N'Discrete Mathematics', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-02-19T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (903, N'CS.23E-1', N'Discrete Mathematics', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-02-19T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (904, N'CS.23E-1', N'Discrete Mathematics', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-02-19T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (905, N'CS.23E-1', N'Discrete Mathematics', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-02-19T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (906, N'CS.23E-1', N'Discrete Mathematics', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-02-19T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (907, N'CS.23E-1', N'Discrete Mathematics', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-02-19T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (908, N'CS.23E-1', N'Discrete Mathematics', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-02-19T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (909, N'CS.23E-1', N'Discrete Mathematics', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-02-19T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (910, N'CS.23E-1', N'Discrete Mathematics', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-02-19T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (911, N'CS.23E-1', N'Discrete Mathematics', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-02-26T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (912, N'CS.23E-1', N'Discrete Mathematics', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-02-26T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (913, N'CS.23E-1', N'Discrete Mathematics', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-02-26T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (914, N'CS.23E-1', N'Discrete Mathematics', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-02-26T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (915, N'CS.23E-1', N'Discrete Mathematics', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-02-26T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (916, N'CS.23E-1', N'Discrete Mathematics', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-02-26T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (917, N'CS.23E-1', N'Discrete Mathematics', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-02-26T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (918, N'CS.23E-1', N'Discrete Mathematics', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-02-26T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (919, N'CS.23E-1', N'Discrete Mathematics', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-02-26T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (920, N'CS.23E-1', N'Discrete Mathematics', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-02-26T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (921, N'CS.23E-1', N'Discrete Mathematics', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-03-04T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (922, N'CS.23E-1', N'Discrete Mathematics', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-03-04T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (923, N'CS.23E-1', N'Discrete Mathematics', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-03-04T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (924, N'CS.23E-1', N'Discrete Mathematics', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-03-04T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (925, N'CS.23E-1', N'Discrete Mathematics', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-03-04T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (926, N'CS.23E-1', N'Discrete Mathematics', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-03-04T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (927, N'CS.23E-1', N'Discrete Mathematics', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-03-04T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (928, N'CS.23E-1', N'Discrete Mathematics', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-03-04T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (929, N'CS.23E-1', N'Discrete Mathematics', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-03-04T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (930, N'CS.23E-1', N'Discrete Mathematics', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-03-04T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (931, N'CS.23E-1', N'Discrete Mathematics', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-03-11T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (932, N'CS.23E-1', N'Discrete Mathematics', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-03-11T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (933, N'CS.23E-1', N'Discrete Mathematics', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-03-11T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (934, N'CS.23E-1', N'Discrete Mathematics', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-03-11T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (935, N'CS.23E-1', N'Discrete Mathematics', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-03-11T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (936, N'CS.23E-1', N'Discrete Mathematics', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-03-11T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (937, N'CS.23E-1', N'Discrete Mathematics', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-03-11T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (938, N'CS.23E-1', N'Discrete Mathematics', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-03-11T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (939, N'CS.23E-1', N'Discrete Mathematics', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-03-11T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (940, N'CS.23E-1', N'Discrete Mathematics', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-03-11T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (941, N'CS.23E-1', N'Discrete Mathematics', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-03-18T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (942, N'CS.23E-1', N'Discrete Mathematics', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-03-18T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (943, N'CS.23E-1', N'Discrete Mathematics', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-03-18T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (944, N'CS.23E-1', N'Discrete Mathematics', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-03-18T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (945, N'CS.23E-1', N'Discrete Mathematics', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-03-18T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (946, N'CS.23E-1', N'Discrete Mathematics', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-03-18T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (947, N'CS.23E-1', N'Discrete Mathematics', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-03-18T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (948, N'CS.23E-1', N'Discrete Mathematics', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-03-18T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (949, N'CS.23E-1', N'Discrete Mathematics', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-03-18T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (950, N'CS.23E-1', N'Discrete Mathematics', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-03-18T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (951, N'CS.23E-1', N'Discrete Mathematics', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-03-25T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (952, N'CS.23E-1', N'Discrete Mathematics', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-03-25T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (953, N'CS.23E-1', N'Discrete Mathematics', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-03-25T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (954, N'CS.23E-1', N'Discrete Mathematics', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-03-25T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (955, N'CS.23E-1', N'Discrete Mathematics', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-03-25T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (956, N'CS.23E-1', N'Discrete Mathematics', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-03-25T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (957, N'CS.23E-1', N'Discrete Mathematics', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-03-25T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (958, N'CS.23E-1', N'Discrete Mathematics', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-03-25T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (959, N'CS.23E-1', N'Discrete Mathematics', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-03-25T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (960, N'CS.23E-1', N'Discrete Mathematics', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-03-25T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (961, N'CS.23E-1', N'Discrete Mathematics', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-04-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (962, N'CS.23E-1', N'Discrete Mathematics', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-04-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (963, N'CS.23E-1', N'Discrete Mathematics', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-04-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (964, N'CS.23E-1', N'Discrete Mathematics', N'Cavid Əhmədli Nadir', N'ABSENT', CAST(N'2024-04-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (965, N'CS.23E-1', N'Discrete Mathematics', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-04-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (966, N'CS.23E-1', N'Discrete Mathematics', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-04-01T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (967, N'CS.23E-1', N'Discrete Mathematics', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-04-01T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (968, N'CS.23E-1', N'Discrete Mathematics', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-04-01T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (969, N'CS.23E-1', N'Discrete Mathematics', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-04-01T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (970, N'CS.23E-1', N'Discrete Mathematics', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-04-01T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (971, N'CS.23E-1', N'Discrete Mathematics', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-04-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (972, N'CS.23E-1', N'Discrete Mathematics', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-04-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (973, N'CS.23E-1', N'Discrete Mathematics', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-04-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (974, N'CS.23E-1', N'Discrete Mathematics', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-04-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (975, N'CS.23E-1', N'Discrete Mathematics', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-04-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (976, N'CS.23E-1', N'Discrete Mathematics', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-04-08T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (977, N'CS.23E-1', N'Discrete Mathematics', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-04-08T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (978, N'CS.23E-1', N'Discrete Mathematics', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-04-08T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (979, N'CS.23E-1', N'Discrete Mathematics', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-04-08T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (980, N'CS.23E-1', N'Discrete Mathematics', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-04-08T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (981, N'CS.23E-1', N'Discrete Mathematics', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-04-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (982, N'CS.23E-1', N'Discrete Mathematics', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-04-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (983, N'CS.23E-1', N'Discrete Mathematics', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-04-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (984, N'CS.23E-1', N'Discrete Mathematics', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-04-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (985, N'CS.23E-1', N'Discrete Mathematics', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-04-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (986, N'CS.23E-1', N'Discrete Mathematics', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-04-15T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (987, N'CS.23E-1', N'Discrete Mathematics', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-04-15T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (988, N'CS.23E-1', N'Discrete Mathematics', N'Samirə Ağalı Hüseyn', N'ABSENT', CAST(N'2024-04-15T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (989, N'CS.23E-1', N'Discrete Mathematics', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-04-15T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (990, N'CS.23E-1', N'Discrete Mathematics', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-04-15T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (991, N'CS.23E-1', N'Discrete Mathematics', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-04-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (992, N'CS.23E-1', N'Discrete Mathematics', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-04-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (993, N'CS.23E-1', N'Discrete Mathematics', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-04-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (994, N'CS.23E-1', N'Discrete Mathematics', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-04-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (995, N'CS.23E-1', N'Discrete Mathematics', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-04-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (996, N'CS.23E-1', N'Discrete Mathematics', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-04-22T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (997, N'CS.23E-1', N'Discrete Mathematics', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-04-22T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (998, N'CS.23E-1', N'Discrete Mathematics', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-04-22T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (999, N'CS.23E-1', N'Discrete Mathematics', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-04-22T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1000, N'CS.23E-1', N'Discrete Mathematics', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-04-22T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1001, N'CS.23E-1', N'Physics', N'Arzu Ağayeva Rəsul', N'ABSENT', CAST(N'2024-02-19T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1002, N'CS.23E-1', N'Physics', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-02-19T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1003, N'CS.23E-1', N'Physics', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-02-19T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1004, N'CS.23E-1', N'Physics', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-02-19T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1005, N'CS.23E-1', N'Physics', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-02-19T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1006, N'CS.23E-1', N'Physics', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-02-19T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1007, N'CS.23E-1', N'Physics', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-02-19T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1008, N'CS.23E-1', N'Physics', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-02-19T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1009, N'CS.23E-1', N'Physics', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-02-19T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1010, N'CS.23E-1', N'Physics', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-02-19T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1011, N'CS.23E-1', N'Physics', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-02-26T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1012, N'CS.23E-1', N'Physics', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-02-26T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1013, N'CS.23E-1', N'Physics', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-02-26T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1014, N'CS.23E-1', N'Physics', N'Cavid Əhmədli Nadir', N'ABSENT', CAST(N'2024-02-26T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1015, N'CS.23E-1', N'Physics', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-02-26T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1016, N'CS.23E-1', N'Physics', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-02-26T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1017, N'CS.23E-1', N'Physics', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-02-26T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1018, N'CS.23E-1', N'Physics', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-02-26T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1019, N'CS.23E-1', N'Physics', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-02-26T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1020, N'CS.23E-1', N'Physics', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-02-26T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1021, N'CS.23E-1', N'Physics', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-03-04T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1022, N'CS.23E-1', N'Physics', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-03-04T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1023, N'CS.23E-1', N'Physics', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-03-04T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1024, N'CS.23E-1', N'Physics', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-03-04T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1025, N'CS.23E-1', N'Physics', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-03-04T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1026, N'CS.23E-1', N'Physics', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-03-04T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1027, N'CS.23E-1', N'Physics', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-03-04T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1028, N'CS.23E-1', N'Physics', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-03-04T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1029, N'CS.23E-1', N'Physics', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-03-04T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1030, N'CS.23E-1', N'Physics', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-03-04T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1031, N'CS.23E-1', N'Physics', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-03-11T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1032, N'CS.23E-1', N'Physics', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-03-11T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1033, N'CS.23E-1', N'Physics', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-03-11T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1034, N'CS.23E-1', N'Physics', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-03-11T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1035, N'CS.23E-1', N'Physics', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-03-11T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1036, N'CS.23E-1', N'Physics', N'Arzu Ağayeva Rəsul', N'ABSENT', CAST(N'2024-03-11T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1037, N'CS.23E-1', N'Physics', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-03-11T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1038, N'CS.23E-1', N'Physics', N'Samirə Ağalı Hüseyn', N'ABSENT', CAST(N'2024-03-11T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1039, N'CS.23E-1', N'Physics', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-03-11T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1040, N'CS.23E-1', N'Physics', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-03-11T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1041, N'CS.23E-1', N'Physics', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-03-18T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1042, N'CS.23E-1', N'Physics', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-03-18T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1043, N'CS.23E-1', N'Physics', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-03-18T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1044, N'CS.23E-1', N'Physics', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-03-18T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1045, N'CS.23E-1', N'Physics', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-03-18T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1046, N'CS.23E-1', N'Physics', N'Arzu Ağayeva Rəsul', N'ABSENT', CAST(N'2024-03-18T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1047, N'CS.23E-1', N'Physics', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-03-18T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1048, N'CS.23E-1', N'Physics', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-03-18T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1049, N'CS.23E-1', N'Physics', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-03-18T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1050, N'CS.23E-1', N'Physics', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-03-18T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1051, N'CS.23E-1', N'Physics', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-03-25T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1052, N'CS.23E-1', N'Physics', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-03-25T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1053, N'CS.23E-1', N'Physics', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-03-25T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1054, N'CS.23E-1', N'Physics', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-03-25T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1055, N'CS.23E-1', N'Physics', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-03-25T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1056, N'CS.23E-1', N'Physics', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-03-25T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1057, N'CS.23E-1', N'Physics', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-03-25T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1058, N'CS.23E-1', N'Physics', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-03-25T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1059, N'CS.23E-1', N'Physics', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-03-25T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1060, N'CS.23E-1', N'Physics', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-03-25T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1061, N'CS.23E-1', N'Physics', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-04-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1062, N'CS.23E-1', N'Physics', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-04-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1063, N'CS.23E-1', N'Physics', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-04-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1064, N'CS.23E-1', N'Physics', N'Cavid Əhmədli Nadir', N'ABSENT', CAST(N'2024-04-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1065, N'CS.23E-1', N'Physics', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-04-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1066, N'CS.23E-1', N'Physics', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-04-01T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1067, N'CS.23E-1', N'Physics', N'Cabbar Cabbarlı İsgənədər', N'ABSENT', CAST(N'2024-04-01T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1068, N'CS.23E-1', N'Physics', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-04-01T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1069, N'CS.23E-1', N'Physics', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-04-01T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1070, N'CS.23E-1', N'Physics', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-04-01T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1071, N'CS.23E-1', N'Physics', N'Arzu Ağayeva Rəsul', N'ABSENT', CAST(N'2024-04-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1072, N'CS.23E-1', N'Physics', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-04-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1073, N'CS.23E-1', N'Physics', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-04-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1074, N'CS.23E-1', N'Physics', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-04-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1075, N'CS.23E-1', N'Physics', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-04-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1076, N'CS.23E-1', N'Physics', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-04-08T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1077, N'CS.23E-1', N'Physics', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-04-08T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1078, N'CS.23E-1', N'Physics', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-04-08T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1079, N'CS.23E-1', N'Physics', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-04-08T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1080, N'CS.23E-1', N'Physics', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-04-08T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1081, N'CS.23E-1', N'Physics', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-04-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1082, N'CS.23E-1', N'Physics', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-04-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1083, N'CS.23E-1', N'Physics', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-04-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1084, N'CS.23E-1', N'Physics', N'Cavid Əhmədli Nadir', N'ABSENT', CAST(N'2024-04-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1085, N'CS.23E-1', N'Physics', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-04-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1086, N'CS.23E-1', N'Physics', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-04-15T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1087, N'CS.23E-1', N'Physics', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-04-15T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1088, N'CS.23E-1', N'Physics', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-04-15T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1089, N'CS.23E-1', N'Physics', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-04-15T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1090, N'CS.23E-1', N'Physics', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-04-15T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1091, N'CS.23E-1', N'Physics', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-04-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1092, N'CS.23E-1', N'Physics', N'Cabbar Cabbarlı İsgənədər', N'ABSENT', CAST(N'2024-04-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1093, N'CS.23E-1', N'Physics', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-04-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1094, N'CS.23E-1', N'Physics', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-04-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1095, N'CS.23E-1', N'Physics', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-04-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1096, N'CS.23E-1', N'Physics', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-04-22T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1097, N'CS.23E-1', N'Physics', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-04-22T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1098, N'CS.23E-1', N'Physics', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-04-22T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1099, N'CS.23E-1', N'Physics', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-04-22T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1100, N'CS.23E-1', N'Physics', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-04-22T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1101, N'CS.23E-1', N'Frontend', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-02-19T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1102, N'CS.23E-1', N'Frontend', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-02-19T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1103, N'CS.23E-1', N'Frontend', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-02-19T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1104, N'CS.23E-1', N'Frontend', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-02-19T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1105, N'CS.23E-1', N'Frontend', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-02-19T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1106, N'CS.23E-1', N'Frontend', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-02-19T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1107, N'CS.23E-1', N'Frontend', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-02-19T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1108, N'CS.23E-1', N'Frontend', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-02-19T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1109, N'CS.23E-1', N'Frontend', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-02-19T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1110, N'CS.23E-1', N'Frontend', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-02-19T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1111, N'CS.23E-1', N'Frontend', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-02-26T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1112, N'CS.23E-1', N'Frontend', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-02-26T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1113, N'CS.23E-1', N'Frontend', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-02-26T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1114, N'CS.23E-1', N'Frontend', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-02-26T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1115, N'CS.23E-1', N'Frontend', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-02-26T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1116, N'CS.23E-1', N'Frontend', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-02-26T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1117, N'CS.23E-1', N'Frontend', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-02-26T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1118, N'CS.23E-1', N'Frontend', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-02-26T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1119, N'CS.23E-1', N'Frontend', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-02-26T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1120, N'CS.23E-1', N'Frontend', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-02-26T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1121, N'CS.23E-1', N'Frontend', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-03-04T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1122, N'CS.23E-1', N'Frontend', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-03-04T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1123, N'CS.23E-1', N'Frontend', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-03-04T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1124, N'CS.23E-1', N'Frontend', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-03-04T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1125, N'CS.23E-1', N'Frontend', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-03-04T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1126, N'CS.23E-1', N'Frontend', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-03-04T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1127, N'CS.23E-1', N'Frontend', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-03-04T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1128, N'CS.23E-1', N'Frontend', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-03-04T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1129, N'CS.23E-1', N'Frontend', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-03-04T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1130, N'CS.23E-1', N'Frontend', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-03-04T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1131, N'CS.23E-1', N'Frontend', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-03-11T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1132, N'CS.23E-1', N'Frontend', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-03-11T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1133, N'CS.23E-1', N'Frontend', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-03-11T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1134, N'CS.23E-1', N'Frontend', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-03-11T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1135, N'CS.23E-1', N'Frontend', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-03-11T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1136, N'CS.23E-1', N'Frontend', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-03-11T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1137, N'CS.23E-1', N'Frontend', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-03-11T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1138, N'CS.23E-1', N'Frontend', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-03-11T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1139, N'CS.23E-1', N'Frontend', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-03-11T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1140, N'CS.23E-1', N'Frontend', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-03-11T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1141, N'CS.23E-1', N'Frontend', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-03-18T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1142, N'CS.23E-1', N'Frontend', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-03-18T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1143, N'CS.23E-1', N'Frontend', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-03-18T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1144, N'CS.23E-1', N'Frontend', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-03-18T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1145, N'CS.23E-1', N'Frontend', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-03-18T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1146, N'CS.23E-1', N'Frontend', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-03-18T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1147, N'CS.23E-1', N'Frontend', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-03-18T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1148, N'CS.23E-1', N'Frontend', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-03-18T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1149, N'CS.23E-1', N'Frontend', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-03-18T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1150, N'CS.23E-1', N'Frontend', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-03-18T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1151, N'CS.23E-1', N'Frontend', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-03-25T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1152, N'CS.23E-1', N'Frontend', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-03-25T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1153, N'CS.23E-1', N'Frontend', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-03-25T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1154, N'CS.23E-1', N'Frontend', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-03-25T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1155, N'CS.23E-1', N'Frontend', N'Vaqif Nadirov Bəhlul', N'ABSENT', CAST(N'2024-03-25T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1156, N'CS.23E-1', N'Frontend', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-03-25T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1157, N'CS.23E-1', N'Frontend', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-03-25T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1158, N'CS.23E-1', N'Frontend', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-03-25T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1159, N'CS.23E-1', N'Frontend', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-03-25T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1160, N'CS.23E-1', N'Frontend', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-03-25T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1161, N'CS.23E-1', N'Frontend', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-04-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1162, N'CS.23E-1', N'Frontend', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-04-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1163, N'CS.23E-1', N'Frontend', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-04-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1164, N'CS.23E-1', N'Frontend', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-04-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1165, N'CS.23E-1', N'Frontend', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-04-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1166, N'CS.23E-1', N'Frontend', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-04-01T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1167, N'CS.23E-1', N'Frontend', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-04-01T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1168, N'CS.23E-1', N'Frontend', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-04-01T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1169, N'CS.23E-1', N'Frontend', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-04-01T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1170, N'CS.23E-1', N'Frontend', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-04-01T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1171, N'CS.23E-1', N'Frontend', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-04-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1172, N'CS.23E-1', N'Frontend', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-04-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1173, N'CS.23E-1', N'Frontend', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-04-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1174, N'CS.23E-1', N'Frontend', N'Cavid Əhmədli Nadir', N'ABSENT', CAST(N'2024-04-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1175, N'CS.23E-1', N'Frontend', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-04-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1176, N'CS.23E-1', N'Frontend', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-04-08T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1177, N'CS.23E-1', N'Frontend', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-04-08T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1178, N'CS.23E-1', N'Frontend', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-04-08T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1179, N'CS.23E-1', N'Frontend', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-04-08T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1180, N'CS.23E-1', N'Frontend', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-04-08T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1181, N'CS.23E-1', N'Frontend', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-04-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1182, N'CS.23E-1', N'Frontend', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-04-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1183, N'CS.23E-1', N'Frontend', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-04-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1184, N'CS.23E-1', N'Frontend', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-04-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1185, N'CS.23E-1', N'Frontend', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-04-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1186, N'CS.23E-1', N'Frontend', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-04-15T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1187, N'CS.23E-1', N'Frontend', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-04-15T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1188, N'CS.23E-1', N'Frontend', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-04-15T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1189, N'CS.23E-1', N'Frontend', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-04-15T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1190, N'CS.23E-1', N'Frontend', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-04-15T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1191, N'CS.23E-1', N'Frontend', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-04-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1192, N'CS.23E-1', N'Frontend', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-04-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1193, N'CS.23E-1', N'Frontend', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-04-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1194, N'CS.23E-1', N'Frontend', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-04-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1195, N'CS.23E-1', N'Frontend', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-04-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1196, N'CS.23E-1', N'Frontend', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-04-22T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1197, N'CS.23E-1', N'Frontend', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-04-22T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1198, N'CS.23E-1', N'Frontend', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-04-22T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1199, N'CS.23E-1', N'Frontend', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-04-22T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1200, N'CS.23E-1', N'Frontend', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-04-22T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1201, N'CS.23E-1', N'Calculus-2', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-02-19T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1202, N'CS.23E-1', N'Calculus-2', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-02-19T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1203, N'CS.23E-1', N'Calculus-2', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-02-19T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1204, N'CS.23E-1', N'Calculus-2', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-02-19T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1205, N'CS.23E-1', N'Calculus-2', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-02-19T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1206, N'CS.23E-1', N'Calculus-2', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-02-19T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1207, N'CS.23E-1', N'Calculus-2', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-02-19T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1208, N'CS.23E-1', N'Calculus-2', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-02-19T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1209, N'CS.23E-1', N'Calculus-2', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-02-19T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1210, N'CS.23E-1', N'Calculus-2', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-02-19T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1211, N'CS.23E-1', N'Calculus-2', N'Arzu Ağayeva Rəsul', N'ABSENT', CAST(N'2024-02-26T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1212, N'CS.23E-1', N'Calculus-2', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-02-26T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1213, N'CS.23E-1', N'Calculus-2', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-02-26T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1214, N'CS.23E-1', N'Calculus-2', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-02-26T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1215, N'CS.23E-1', N'Calculus-2', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-02-26T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1216, N'CS.23E-1', N'Calculus-2', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-02-26T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1217, N'CS.23E-1', N'Calculus-2', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-02-26T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1218, N'CS.23E-1', N'Calculus-2', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-02-26T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1219, N'CS.23E-1', N'Calculus-2', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-02-26T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1220, N'CS.23E-1', N'Calculus-2', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-02-26T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1221, N'CS.23E-1', N'Calculus-2', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-03-04T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1222, N'CS.23E-1', N'Calculus-2', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-03-04T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1223, N'CS.23E-1', N'Calculus-2', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-03-04T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1224, N'CS.23E-1', N'Calculus-2', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-03-04T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1225, N'CS.23E-1', N'Calculus-2', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-03-04T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1226, N'CS.23E-1', N'Calculus-2', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-03-04T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1227, N'CS.23E-1', N'Calculus-2', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-03-04T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1228, N'CS.23E-1', N'Calculus-2', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-03-04T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1229, N'CS.23E-1', N'Calculus-2', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-03-04T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1230, N'CS.23E-1', N'Calculus-2', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-03-04T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1231, N'CS.23E-1', N'Calculus-2', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-03-11T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1232, N'CS.23E-1', N'Calculus-2', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-03-11T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1233, N'CS.23E-1', N'Calculus-2', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-03-11T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1234, N'CS.23E-1', N'Calculus-2', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-03-11T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1235, N'CS.23E-1', N'Calculus-2', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-03-11T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1236, N'CS.23E-1', N'Calculus-2', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-03-11T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1237, N'CS.23E-1', N'Calculus-2', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-03-11T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1238, N'CS.23E-1', N'Calculus-2', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-03-11T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1239, N'CS.23E-1', N'Calculus-2', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-03-11T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1240, N'CS.23E-1', N'Calculus-2', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-03-11T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1241, N'CS.23E-1', N'Calculus-2', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-03-18T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1242, N'CS.23E-1', N'Calculus-2', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-03-18T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1243, N'CS.23E-1', N'Calculus-2', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-03-18T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1244, N'CS.23E-1', N'Calculus-2', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-03-18T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1245, N'CS.23E-1', N'Calculus-2', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-03-18T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1246, N'CS.23E-1', N'Calculus-2', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-03-18T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1247, N'CS.23E-1', N'Calculus-2', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-03-18T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1248, N'CS.23E-1', N'Calculus-2', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-03-18T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1249, N'CS.23E-1', N'Calculus-2', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-03-18T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1250, N'CS.23E-1', N'Calculus-2', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-03-18T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1251, N'CS.23E-1', N'Calculus-2', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-03-25T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1252, N'CS.23E-1', N'Calculus-2', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-03-25T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1253, N'CS.23E-1', N'Calculus-2', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-03-25T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1254, N'CS.23E-1', N'Calculus-2', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-03-25T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1255, N'CS.23E-1', N'Calculus-2', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-03-25T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1256, N'CS.23E-1', N'Calculus-2', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-03-25T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1257, N'CS.23E-1', N'Calculus-2', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-03-25T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1258, N'CS.23E-1', N'Calculus-2', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-03-25T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1259, N'CS.23E-1', N'Calculus-2', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-03-25T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1260, N'CS.23E-1', N'Calculus-2', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-03-25T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1261, N'CS.23E-1', N'Calculus-2', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-04-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1262, N'CS.23E-1', N'Calculus-2', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-04-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1263, N'CS.23E-1', N'Calculus-2', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-04-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1264, N'CS.23E-1', N'Calculus-2', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-04-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1265, N'CS.23E-1', N'Calculus-2', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-04-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1266, N'CS.23E-1', N'Calculus-2', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-04-01T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1267, N'CS.23E-1', N'Calculus-2', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-04-01T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1268, N'CS.23E-1', N'Calculus-2', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-04-01T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1269, N'CS.23E-1', N'Calculus-2', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-04-01T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1270, N'CS.23E-1', N'Calculus-2', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-04-01T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1271, N'CS.23E-1', N'Calculus-2', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-04-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1272, N'CS.23E-1', N'Calculus-2', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-04-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1273, N'CS.23E-1', N'Calculus-2', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-04-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1274, N'CS.23E-1', N'Calculus-2', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-04-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1275, N'CS.23E-1', N'Calculus-2', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-04-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1276, N'CS.23E-1', N'Calculus-2', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-04-08T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1277, N'CS.23E-1', N'Calculus-2', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-04-08T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1278, N'CS.23E-1', N'Calculus-2', N'Samirə Ağalı Hüseyn', N'ABSENT', CAST(N'2024-04-08T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1279, N'CS.23E-1', N'Calculus-2', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-04-08T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1280, N'CS.23E-1', N'Calculus-2', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-04-08T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1281, N'CS.23E-1', N'Calculus-2', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-04-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1282, N'CS.23E-1', N'Calculus-2', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-04-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1283, N'CS.23E-1', N'Calculus-2', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-04-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1284, N'CS.23E-1', N'Calculus-2', N'Cavid Əhmədli Nadir', N'ABSENT', CAST(N'2024-04-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1285, N'CS.23E-1', N'Calculus-2', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-04-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1286, N'CS.23E-1', N'Calculus-2', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-04-15T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1287, N'CS.23E-1', N'Calculus-2', N'Cabbar Cabbarlı İsgənədər', N'ABSENT', CAST(N'2024-04-15T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1288, N'CS.23E-1', N'Calculus-2', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-04-15T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1289, N'CS.23E-1', N'Calculus-2', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-04-15T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1290, N'CS.23E-1', N'Calculus-2', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-04-15T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1291, N'CS.23E-1', N'Calculus-2', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-04-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1292, N'CS.23E-1', N'Calculus-2', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-04-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1293, N'CS.23E-1', N'Calculus-2', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-04-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1294, N'CS.23E-1', N'Calculus-2', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-04-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1295, N'CS.23E-1', N'Calculus-2', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-04-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1296, N'CS.23E-1', N'Calculus-2', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-04-22T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1297, N'CS.23E-1', N'Calculus-2', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-04-22T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1298, N'CS.23E-1', N'Calculus-2', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-04-22T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1299, N'CS.23E-1', N'Calculus-2', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-04-22T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1300, N'CS.23E-1', N'Calculus-2', N'Vaqif Nadirov Bəhlul', N'ABSENT', CAST(N'2024-04-22T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1301, N'CS.23E-1', N'Basics Of Programming', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-02-16T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1302, N'CS.23E-1', N'Basics Of Programming', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-02-16T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1303, N'CS.23E-1', N'Basics Of Programming', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-02-16T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1304, N'CS.23E-1', N'Basics Of Programming', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-02-16T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1305, N'CS.23E-1', N'Basics Of Programming', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-02-16T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1306, N'CS.23E-1', N'Basics Of Programming', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-02-21T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1307, N'CS.23E-1', N'Basics Of Programming', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-02-21T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1308, N'CS.23E-1', N'Basics Of Programming', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-02-21T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1309, N'CS.23E-1', N'Basics Of Programming', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-02-21T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1310, N'CS.23E-1', N'Basics Of Programming', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-02-21T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1311, N'CS.23E-1', N'Basics Of Programming', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-02-21T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1312, N'CS.23E-1', N'Basics Of Programming', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-02-21T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1313, N'CS.23E-1', N'Basics Of Programming', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-02-21T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1314, N'CS.23E-1', N'Basics Of Programming', N'Cavid Əhmədli Nadir', N'ABSENT', CAST(N'2024-02-21T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1315, N'CS.23E-1', N'Basics Of Programming', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-02-21T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1316, N'CS.23E-1', N'Basics Of Programming', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-02-23T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1317, N'CS.23E-1', N'Basics Of Programming', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-02-23T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1318, N'CS.23E-1', N'Basics Of Programming', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-02-23T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1319, N'CS.23E-1', N'Basics Of Programming', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-02-23T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1320, N'CS.23E-1', N'Basics Of Programming', N'Vaqif Nadirov Bəhlul', N'ABSENT', CAST(N'2024-02-23T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1321, N'CS.23E-1', N'Basics Of Programming', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-02-28T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1322, N'CS.23E-1', N'Basics Of Programming', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-02-28T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1323, N'CS.23E-1', N'Basics Of Programming', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-02-28T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1324, N'CS.23E-1', N'Basics Of Programming', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-02-28T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1325, N'CS.23E-1', N'Basics Of Programming', N'Vaqif Nadirov Bəhlul', N'ABSENT', CAST(N'2024-02-28T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1326, N'CS.23E-1', N'Basics Of Programming', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-02-28T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1327, N'CS.23E-1', N'Basics Of Programming', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-02-28T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1328, N'CS.23E-1', N'Basics Of Programming', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-02-28T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1329, N'CS.23E-1', N'Basics Of Programming', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-02-28T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1330, N'CS.23E-1', N'Basics Of Programming', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-02-28T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1331, N'CS.23E-1', N'Basics Of Programming', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-03-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1332, N'CS.23E-1', N'Basics Of Programming', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-03-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1333, N'CS.23E-1', N'Basics Of Programming', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-03-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1334, N'CS.23E-1', N'Basics Of Programming', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-03-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1335, N'CS.23E-1', N'Basics Of Programming', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-03-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1336, N'CS.23E-1', N'Basics Of Programming', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-03-06T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1337, N'CS.23E-1', N'Basics Of Programming', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-03-06T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1338, N'CS.23E-1', N'Basics Of Programming', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-03-06T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1339, N'CS.23E-1', N'Basics Of Programming', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-03-06T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1340, N'CS.23E-1', N'Basics Of Programming', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-03-06T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1341, N'CS.23E-1', N'Basics Of Programming', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-03-06T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1342, N'CS.23E-1', N'Basics Of Programming', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-03-06T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1343, N'CS.23E-1', N'Basics Of Programming', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-03-06T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1344, N'CS.23E-1', N'Basics Of Programming', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-03-06T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1345, N'CS.23E-1', N'Basics Of Programming', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-03-06T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1346, N'CS.23E-1', N'Basics Of Programming', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-03-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1347, N'CS.23E-1', N'Basics Of Programming', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-03-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1348, N'CS.23E-1', N'Basics Of Programming', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-03-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1349, N'CS.23E-1', N'Basics Of Programming', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-03-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1350, N'CS.23E-1', N'Basics Of Programming', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-03-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1351, N'CS.23E-1', N'Basics Of Programming', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-03-13T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1352, N'CS.23E-1', N'Basics Of Programming', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-03-13T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1353, N'CS.23E-1', N'Basics Of Programming', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-03-13T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1354, N'CS.23E-1', N'Basics Of Programming', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-03-13T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1355, N'CS.23E-1', N'Basics Of Programming', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-03-13T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1356, N'CS.23E-1', N'Basics Of Programming', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-03-13T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1357, N'CS.23E-1', N'Basics Of Programming', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-03-13T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1358, N'CS.23E-1', N'Basics Of Programming', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-03-13T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1359, N'CS.23E-1', N'Basics Of Programming', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-03-13T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1360, N'CS.23E-1', N'Basics Of Programming', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-03-13T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1361, N'CS.23E-1', N'Basics Of Programming', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-03-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1362, N'CS.23E-1', N'Basics Of Programming', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-03-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1363, N'CS.23E-1', N'Basics Of Programming', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-03-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1364, N'CS.23E-1', N'Basics Of Programming', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-03-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1365, N'CS.23E-1', N'Basics Of Programming', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-03-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1366, N'CS.23E-1', N'Basics Of Programming', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-03-20T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1367, N'CS.23E-1', N'Basics Of Programming', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-03-20T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1368, N'CS.23E-1', N'Basics Of Programming', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-03-20T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1369, N'CS.23E-1', N'Basics Of Programming', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-03-20T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1370, N'CS.23E-1', N'Basics Of Programming', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-03-20T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1371, N'CS.23E-1', N'Basics Of Programming', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-03-20T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1372, N'CS.23E-1', N'Basics Of Programming', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-03-20T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1373, N'CS.23E-1', N'Basics Of Programming', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-03-20T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1374, N'CS.23E-1', N'Basics Of Programming', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-03-20T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1375, N'CS.23E-1', N'Basics Of Programming', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-03-20T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1376, N'CS.23E-1', N'Basics Of Programming', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-03-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1377, N'CS.23E-1', N'Basics Of Programming', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-03-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1378, N'CS.23E-1', N'Basics Of Programming', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-03-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1379, N'CS.23E-1', N'Basics Of Programming', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-03-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1380, N'CS.23E-1', N'Basics Of Programming', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-03-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1381, N'CS.23E-1', N'Basics Of Programming', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-03-27T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1382, N'CS.23E-1', N'Basics Of Programming', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-03-27T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1383, N'CS.23E-1', N'Basics Of Programming', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-03-27T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1384, N'CS.23E-1', N'Basics Of Programming', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-03-27T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1385, N'CS.23E-1', N'Basics Of Programming', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-03-27T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1386, N'CS.23E-1', N'Basics Of Programming', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-03-27T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1387, N'CS.23E-1', N'Basics Of Programming', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-03-27T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1388, N'CS.23E-1', N'Basics Of Programming', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-03-27T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1389, N'CS.23E-1', N'Basics Of Programming', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-03-27T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1390, N'CS.23E-1', N'Basics Of Programming', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-03-27T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1391, N'CS.23E-1', N'Basics Of Programming', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-03-29T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1392, N'CS.23E-1', N'Basics Of Programming', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-03-29T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1393, N'CS.23E-1', N'Basics Of Programming', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-03-29T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1394, N'CS.23E-1', N'Basics Of Programming', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-03-29T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1395, N'CS.23E-1', N'Basics Of Programming', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-03-29T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1396, N'CS.23E-1', N'Basics Of Programming', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-04-03T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1397, N'CS.23E-1', N'Basics Of Programming', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-04-03T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1398, N'CS.23E-1', N'Basics Of Programming', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-04-03T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1399, N'CS.23E-1', N'Basics Of Programming', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-04-03T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1400, N'CS.23E-1', N'Basics Of Programming', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-04-03T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1401, N'CS.23E-1', N'Basics Of Programming', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-04-03T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1402, N'CS.23E-1', N'Basics Of Programming', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-04-03T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1403, N'CS.23E-1', N'Basics Of Programming', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-04-03T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1404, N'CS.23E-1', N'Basics Of Programming', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-04-03T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1405, N'CS.23E-1', N'Basics Of Programming', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-04-03T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1406, N'CS.23E-1', N'Basics Of Programming', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-04-05T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1407, N'CS.23E-1', N'Basics Of Programming', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-04-05T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1408, N'CS.23E-1', N'Basics Of Programming', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-04-05T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1409, N'CS.23E-1', N'Basics Of Programming', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-04-05T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1410, N'CS.23E-1', N'Basics Of Programming', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-04-05T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1411, N'CS.23E-1', N'Basics Of Programming', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-04-10T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1412, N'CS.23E-1', N'Basics Of Programming', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-04-10T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1413, N'CS.23E-1', N'Basics Of Programming', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-04-10T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1414, N'CS.23E-1', N'Basics Of Programming', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-04-10T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1415, N'CS.23E-1', N'Basics Of Programming', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-04-10T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1416, N'CS.23E-1', N'Basics Of Programming', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-04-10T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1417, N'CS.23E-1', N'Basics Of Programming', N'Cabbar Cabbarlı İsgənədər', N'ABSENT', CAST(N'2024-04-10T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1418, N'CS.23E-1', N'Basics Of Programming', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-04-10T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1419, N'CS.23E-1', N'Basics Of Programming', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-04-10T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1420, N'CS.23E-1', N'Basics Of Programming', N'Vaqif Nadirov Bəhlul', N'ABSENT', CAST(N'2024-04-10T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1421, N'CS.23E-1', N'Basics Of Programming', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-04-12T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1422, N'CS.23E-1', N'Basics Of Programming', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-04-12T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1423, N'CS.23E-1', N'Basics Of Programming', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-04-12T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1424, N'CS.23E-1', N'Basics Of Programming', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-04-12T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1425, N'CS.23E-1', N'Basics Of Programming', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-04-12T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1426, N'CS.23E-1', N'Basics Of Programming', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-04-17T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1427, N'CS.23E-1', N'Basics Of Programming', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-04-17T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1428, N'CS.23E-1', N'Basics Of Programming', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-04-17T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1429, N'CS.23E-1', N'Basics Of Programming', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-04-17T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1430, N'CS.23E-1', N'Basics Of Programming', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-04-17T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1431, N'CS.23E-1', N'Basics Of Programming', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-04-17T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1432, N'CS.23E-1', N'Basics Of Programming', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-04-17T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1433, N'CS.23E-1', N'Basics Of Programming', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-04-17T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1434, N'CS.23E-1', N'Basics Of Programming', N'Cavid Əhmədli Nadir', N'ABSENT', CAST(N'2024-04-17T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1435, N'CS.23E-1', N'Basics Of Programming', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-04-17T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1436, N'CS.23E-1', N'Basics Of Programming', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-04-19T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1437, N'CS.23E-1', N'Basics Of Programming', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-04-19T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1438, N'CS.23E-1', N'Basics Of Programming', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-04-19T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1439, N'CS.23E-1', N'Basics Of Programming', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-04-19T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1440, N'CS.23E-1', N'Basics Of Programming', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-04-19T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1441, N'CS.23E-1', N'Basics Of Programming', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-04-24T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1442, N'CS.23E-1', N'Basics Of Programming', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-04-24T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1443, N'CS.23E-1', N'Basics Of Programming', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-04-24T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1444, N'CS.23E-1', N'Basics Of Programming', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-04-24T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1445, N'CS.23E-1', N'Basics Of Programming', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-04-24T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1446, N'CS.23E-1', N'Basics Of Programming', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-04-24T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1447, N'CS.23E-1', N'Basics Of Programming', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-04-24T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1448, N'CS.23E-1', N'Basics Of Programming', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-04-24T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1449, N'CS.23E-1', N'Basics Of Programming', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-04-24T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1450, N'CS.23E-1', N'Basics Of Programming', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-04-24T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1451, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-09-18T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1452, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-09-18T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1453, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-09-18T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1454, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-09-18T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1455, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-09-18T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1456, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'ABSENT', CAST(N'2023-09-18T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1457, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-09-18T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1458, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'ABSENT', CAST(N'2023-09-18T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1459, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-09-18T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1460, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-09-18T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1461, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-09-25T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1462, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-09-25T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1463, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-09-25T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1464, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-09-25T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1465, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'ABSENT', CAST(N'2023-09-25T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1466, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-09-25T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1467, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-09-25T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1468, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-09-25T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1469, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-09-25T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1470, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-09-25T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1471, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-10-02T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1472, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-10-02T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1473, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-10-02T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1474, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-10-02T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1475, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-10-02T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1476, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-10-02T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1477, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-10-02T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1478, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-10-02T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1479, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-10-02T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1480, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-10-02T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1481, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-10-09T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1482, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-10-09T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1483, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-10-09T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1484, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-10-09T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1485, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'ABSENT', CAST(N'2023-10-09T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1486, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-10-09T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1487, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-10-09T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1488, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-10-09T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1489, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-10-09T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1490, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-10-09T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1491, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-10-16T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1492, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-10-16T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1493, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-10-16T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1494, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-10-16T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1495, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-10-16T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1496, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-10-16T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1497, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-10-16T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1498, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-10-16T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1499, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-10-16T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1500, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-10-16T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1501, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-10-23T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1502, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-10-23T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1503, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-10-23T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1504, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-10-23T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1505, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-10-23T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1506, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-10-23T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1507, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-10-23T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1508, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-10-23T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1509, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'ABSENT', CAST(N'2023-10-23T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1510, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-10-23T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1511, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-10-30T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1512, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-10-30T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1513, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-10-30T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1514, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-10-30T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1515, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-10-30T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1516, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-10-30T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1517, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-10-30T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1518, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-10-30T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1519, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-10-30T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1520, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-10-30T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1521, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-11-06T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1522, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'ABSENT', CAST(N'2023-11-06T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1523, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-11-06T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1524, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-11-06T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1525, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-11-06T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1526, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-11-06T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1527, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-11-06T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1528, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'ABSENT', CAST(N'2023-11-06T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1529, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-11-06T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1530, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-11-06T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1531, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-11-13T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1532, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-11-13T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1533, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-11-13T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1534, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-11-13T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1535, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-11-13T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1536, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-11-13T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1537, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-11-13T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1538, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-11-13T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1539, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-11-13T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1540, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-11-13T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1541, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-11-20T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1542, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-11-20T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1543, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-11-20T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1544, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-11-20T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1545, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-11-20T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1546, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-11-20T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1547, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-11-20T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1548, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-11-20T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1549, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-11-20T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1550, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-11-20T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1551, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-11-27T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1552, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-11-27T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1553, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-11-27T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1554, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-11-27T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1555, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-11-27T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1556, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'ABSENT', CAST(N'2023-11-27T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1557, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-11-27T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1558, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-11-27T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1559, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-11-27T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1560, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-11-27T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1561, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-12-04T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1562, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-12-04T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1563, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-12-04T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1564, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-12-04T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1565, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-12-04T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1566, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-12-04T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1567, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-12-04T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1568, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'ABSENT', CAST(N'2023-12-04T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1569, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-12-04T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1570, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-12-04T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1571, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-12-11T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1572, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-12-11T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1573, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-12-11T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1574, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'ABSENT', CAST(N'2023-12-11T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1575, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-12-11T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1576, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'ABSENT', CAST(N'2023-12-11T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1577, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-12-11T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1578, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-12-11T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1579, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'ABSENT', CAST(N'2023-12-11T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1580, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-12-11T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1581, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-12-18T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1582, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-12-18T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1583, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-12-18T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1584, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-12-18T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1585, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-12-18T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1586, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-12-18T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1587, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-12-18T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1588, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-12-18T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1589, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-12-18T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1590, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-12-18T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1591, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-12-25T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1592, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-12-25T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1593, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-12-25T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1594, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-12-25T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1595, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-12-25T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1596, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-12-25T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1597, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-12-25T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1598, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-12-25T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1599, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-12-25T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1600, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-12-25T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1601, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-01-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1602, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-01-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1603, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-01-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1604, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-01-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1605, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-01-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1606, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-01-01T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1607, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-01-01T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1608, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'ABSENT', CAST(N'2024-01-01T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1609, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-01-01T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1610, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-01-01T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1611, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-01-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1612, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-01-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1613, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-01-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1614, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-01-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1615, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-01-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1616, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-01-08T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1617, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-01-08T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1618, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-01-08T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1619, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-01-08T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1620, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-01-08T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1621, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-01-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1622, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-01-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1623, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-01-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1624, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-01-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1625, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-01-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1626, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-01-15T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1627, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-01-15T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1628, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-01-15T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1629, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-01-15T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1630, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-01-15T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1631, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-01-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1632, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-01-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1633, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-01-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1634, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-01-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1635, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-01-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1636, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-01-22T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1637, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-01-22T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1638, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-01-22T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1639, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-01-22T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1640, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-01-22T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1641, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-01-29T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1642, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-01-29T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1643, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-01-29T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1644, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-01-29T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1645, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-01-29T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1646, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-01-29T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1647, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-01-29T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1648, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-01-29T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1649, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-01-29T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1650, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-01-29T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1651, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-02-05T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1652, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-02-05T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1653, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-02-05T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1654, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-02-05T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1655, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-02-05T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1656, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-02-05T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1657, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-02-05T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1658, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-02-05T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1659, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-02-05T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1660, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-02-05T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1661, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'ABSENT', CAST(N'2024-02-12T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1662, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-02-12T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1663, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-02-12T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1664, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-02-12T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1665, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-02-12T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1666, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-02-12T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1667, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-02-12T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1668, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-02-12T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1669, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-02-12T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1670, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-02-12T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1671, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-09-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1672, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-09-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1673, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-09-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1674, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-09-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1675, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-09-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1676, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-09-20T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1677, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-09-20T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1678, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'ABSENT', CAST(N'2023-09-20T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1679, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-09-20T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1680, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-09-20T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1681, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-09-20T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1682, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-09-20T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1683, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-09-20T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1684, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-09-20T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1685, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'ABSENT', CAST(N'2023-09-20T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1686, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-09-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1687, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-09-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1688, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-09-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1689, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-09-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1690, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-09-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1691, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-09-27T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1692, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-09-27T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1693, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-09-27T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1694, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-09-27T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1695, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-09-27T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1696, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-09-27T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1697, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-09-27T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1698, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-09-27T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1699, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-09-27T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1700, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-09-27T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1701, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-09-29T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1702, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-09-29T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1703, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-09-29T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1704, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-09-29T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1705, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-09-29T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1706, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-10-04T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1707, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-10-04T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1708, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-10-04T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1709, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-10-04T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1710, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-10-04T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1711, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-10-04T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1712, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-10-04T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1713, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-10-04T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1714, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-10-04T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1715, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'ABSENT', CAST(N'2023-10-04T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1716, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-10-06T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1717, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-10-06T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1718, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-10-06T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1719, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-10-06T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1720, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-10-06T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1721, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-10-11T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1722, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-10-11T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1723, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-10-11T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1724, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-10-11T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1725, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-10-11T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1726, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-10-11T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1727, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'ABSENT', CAST(N'2023-10-11T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1728, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-10-11T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1729, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'ABSENT', CAST(N'2023-10-11T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1730, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-10-11T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1731, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'ABSENT', CAST(N'2023-10-13T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1732, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'ABSENT', CAST(N'2023-10-13T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1733, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-10-13T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1734, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-10-13T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1735, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-10-13T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1736, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-10-18T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1737, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-10-18T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1738, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-10-18T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1739, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-10-18T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1740, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-10-18T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1741, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-10-18T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1742, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-10-18T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1743, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-10-18T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1744, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'ABSENT', CAST(N'2023-10-18T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1745, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-10-18T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1746, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-10-20T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1747, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-10-20T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1748, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'ABSENT', CAST(N'2023-10-20T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1749, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-10-20T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1750, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-10-20T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1751, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-10-25T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1752, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-10-25T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1753, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-10-25T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1754, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-10-25T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1755, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-10-25T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1756, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-10-25T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1757, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-10-25T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1758, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-10-25T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1759, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-10-25T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1760, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-10-25T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1761, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-10-27T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1762, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-10-27T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1763, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-10-27T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1764, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-10-27T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1765, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-10-27T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1766, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-11-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1767, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-11-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1768, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-11-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1769, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-11-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1770, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-11-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1771, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'ABSENT', CAST(N'2023-11-01T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1772, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-11-01T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1773, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-11-01T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1774, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-11-01T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1775, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-11-01T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1776, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-11-03T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1777, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-11-03T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1778, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-11-03T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1779, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-11-03T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1780, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-11-03T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1781, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-11-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1782, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-11-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1783, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-11-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1784, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-11-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1785, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'ABSENT', CAST(N'2023-11-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1786, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-11-08T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1787, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'ABSENT', CAST(N'2023-11-08T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1788, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-11-08T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1789, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-11-08T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1790, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-11-08T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1791, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-11-10T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1792, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-11-10T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1793, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-11-10T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1794, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-11-10T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1795, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-11-10T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1796, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-11-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1797, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-11-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1798, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-11-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1799, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-11-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1800, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-11-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1801, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-11-15T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1802, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-11-15T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1803, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-11-15T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1804, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-11-15T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1805, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'ABSENT', CAST(N'2023-11-15T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1806, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-11-17T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1807, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-11-17T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1808, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'ABSENT', CAST(N'2023-11-17T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1809, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-11-17T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1810, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-11-17T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1811, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-11-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1812, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-11-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1813, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-11-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1814, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-11-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1815, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-11-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1816, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-11-22T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1817, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-11-22T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1818, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-11-22T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1819, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-11-22T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1820, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-11-22T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1821, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-11-24T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1822, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-11-24T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1823, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-11-24T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1824, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-11-24T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1825, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-11-24T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1826, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-11-29T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1827, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-11-29T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1828, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-11-29T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1829, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-11-29T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1830, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-11-29T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1831, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'ABSENT', CAST(N'2023-11-29T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1832, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-11-29T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1833, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-11-29T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1834, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-11-29T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1835, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-11-29T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1836, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-12-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1837, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-12-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1838, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-12-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1839, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-12-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1840, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-12-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1841, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-12-06T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1842, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-12-06T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1843, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-12-06T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1844, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-12-06T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1845, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-12-06T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1846, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-12-06T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1847, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-12-06T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1848, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-12-06T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1849, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-12-06T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1850, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-12-06T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1851, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-12-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1852, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-12-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1853, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-12-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1854, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-12-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1855, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-12-08T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1856, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-12-13T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1857, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-12-13T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1858, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'ABSENT', CAST(N'2023-12-13T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1859, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-12-13T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1860, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-12-13T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1861, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-12-13T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1862, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-12-13T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1863, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-12-13T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1864, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-12-13T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1865, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-12-13T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1866, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-12-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1867, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-12-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1868, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-12-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1869, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-12-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1870, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-12-15T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1871, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-12-20T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1872, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-12-20T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1873, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-12-20T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1874, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-12-20T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1875, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-12-20T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1876, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-12-20T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1877, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-12-20T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1878, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-12-20T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1879, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-12-20T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1880, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-12-20T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1881, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-12-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1882, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-12-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1883, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-12-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1884, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-12-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1885, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-12-22T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1886, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-12-27T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1887, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-12-27T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1888, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-12-27T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1889, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-12-27T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1890, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-12-27T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1891, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-12-27T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1892, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'ABSENT', CAST(N'2023-12-27T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1893, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-12-27T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1894, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-12-27T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1895, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-12-27T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1896, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2023-12-29T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1897, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2023-12-29T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1898, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2023-12-29T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1899, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2023-12-29T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1900, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2023-12-29T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1901, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-01-03T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1902, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-01-03T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1903, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-01-03T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1904, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-01-03T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1905, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-01-03T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1906, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-01-03T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1907, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-01-03T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1908, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-01-03T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1909, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-01-03T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1910, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-01-03T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1911, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-01-05T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1912, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-01-05T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1913, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-01-05T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1914, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-01-05T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1915, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-01-05T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1916, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-01-10T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1917, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-01-10T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1918, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-01-10T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1919, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-01-10T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1920, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-01-10T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1921, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-01-10T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1922, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-01-10T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1923, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-01-10T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1924, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-01-10T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1925, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-01-10T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1926, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-01-12T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1927, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-01-12T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1928, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-01-12T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1929, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-01-12T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1930, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-01-12T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1931, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-01-17T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1932, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-01-17T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1933, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-01-17T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1934, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-01-17T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1935, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-01-17T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1936, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-01-17T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1937, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'ABSENT', CAST(N'2024-01-17T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1938, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-01-17T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1939, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-01-17T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1940, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-01-17T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1941, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'ABSENT', CAST(N'2024-01-19T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1942, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-01-19T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1943, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-01-19T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1944, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-01-19T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1945, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-01-19T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1946, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-01-24T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1947, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-01-24T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1948, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-01-24T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1949, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-01-24T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1950, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-01-24T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1951, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-01-24T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1952, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-01-24T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1953, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-01-24T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1954, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-01-24T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1955, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-01-24T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1956, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-01-26T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1957, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-01-26T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1958, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-01-26T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1959, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-01-26T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1960, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-01-26T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1961, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'ABSENT', CAST(N'2024-01-31T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1962, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-01-31T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1963, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-01-31T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1964, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-01-31T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1965, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-01-31T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1966, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-01-31T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1967, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-01-31T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1968, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'ABSENT', CAST(N'2024-01-31T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1969, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-01-31T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1970, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-01-31T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1971, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'ABSENT', CAST(N'2024-02-02T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1972, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-02-02T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1973, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-02-02T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1974, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-02-02T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1975, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'ABSENT', CAST(N'2024-02-02T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1976, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-02-07T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1977, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'ABSENT', CAST(N'2024-02-07T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1978, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-02-07T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1979, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-02-07T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1980, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-02-07T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1981, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-02-07T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1982, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-02-07T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1983, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-02-07T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1984, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-02-07T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1985, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-02-07T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1986, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-02-09T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1987, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-02-09T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1988, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-02-09T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1989, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-02-09T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1990, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-02-09T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1991, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-02-14T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1992, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-02-14T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1993, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-02-14T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1994, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-02-14T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1995, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-02-14T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1996, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'PARTICIPATE', CAST(N'2024-02-14T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1997, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'PARTICIPATE', CAST(N'2024-02-14T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1998, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'PARTICIPATE', CAST(N'2024-02-14T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (1999, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'PARTICIPATE', CAST(N'2024-02-14T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (2000, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'PARTICIPATE', CAST(N'2024-02-14T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (2001, N'CE.23E-1', N'Calculus-2', N'Musa Baxşiyev Eldəniz', N'PARTICIPATE', CAST(N'2024-04-26T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (2002, N'CE.23E-1', N'Calculus-2', N'Samir Qurbanov Qurban', N'PARTICIPATE', CAST(N'2024-04-26T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (2003, N'CE.23E-1', N'Calculus-2', N'Araz Əliyev Əhmət', N'PARTICIPATE', CAST(N'2024-04-26T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (2004, N'CE.23E-1', N'Calculus-2', N'Lalə Zeynallı Nihat', N'PARTICIPATE', CAST(N'2024-04-26T10:10:00.000' AS DateTime))
GO
INSERT [dbo].[Participation] ([Id], [GroupName], [SubjectName], [StudentName], [Participation], [Date]) VALUES (2005, N'CE.23E-1', N'Calculus-2', N'Nigar Qarayeva Islam', N'PARTICIPATE', CAST(N'2024-04-26T10:10:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Participation] OFF
GO
SET IDENTITY_INSERT [dbo].[Student] ON 
GO
INSERT [dbo].[Student] ([Id], [Name], [Surname], [DateOfBirth], [FatherName], [EntranceYear], [GraduationYear], [EntranceScore], [Major], [Department], [EducationForm], [PaymentType], [EducationDegree], [GroupName], [PhoneNumber], [EMail], [Username], [Password], [Gender]) VALUES (1, N'Musa', N'Baxşiyev', CAST(N'2005-06-29' AS Date), N'Eldəniz', 2023, 2027, 622.1, N'Computer Engineering', N'English', N'Full-time', N'Government funded', N'Bachelor', N'CE.23E-1', N'0559423512', N'musabaxsiyev2005@gmail.com', N'musa', N'3310', N'Male')
GO
INSERT [dbo].[Student] ([Id], [Name], [Surname], [DateOfBirth], [FatherName], [EntranceYear], [GraduationYear], [EntranceScore], [Major], [Department], [EducationForm], [PaymentType], [EducationDegree], [GroupName], [PhoneNumber], [EMail], [Username], [Password], [Gender]) VALUES (2, N'Samir', N'Qurbanov', CAST(N'2005-05-22' AS Date), N'Qurban', 2023, 2027, 610.5, N'Computer Engineering', N'English', N'Full-time', N'Government funded', N'Bachelor', N'CE.23E-1', N'0516481267', N'samirqurbanov@gmail.com', N'samir.qurbanov', N'samir2005', N'Male')
GO
INSERT [dbo].[Student] ([Id], [Name], [Surname], [DateOfBirth], [FatherName], [EntranceYear], [GraduationYear], [EntranceScore], [Major], [Department], [EducationForm], [PaymentType], [EducationDegree], [GroupName], [PhoneNumber], [EMail], [Username], [Password], [Gender]) VALUES (3, N'Araz', N'Əliyev', CAST(N'2005-03-27' AS Date), N'Əhmət', 2023, 2027, 604.8, N'Computer Engineering', N'English', N'Full-time', N'Government funded', N'Bachelor', N'CE.23E-1', N'0705314927', N'araz2005@gmail.com', N'arazaliyev', N'araz2005', N'Male')
GO
INSERT [dbo].[Student] ([Id], [Name], [Surname], [DateOfBirth], [FatherName], [EntranceYear], [GraduationYear], [EntranceScore], [Major], [Department], [EducationForm], [PaymentType], [EducationDegree], [GroupName], [PhoneNumber], [EMail], [Username], [Password], [Gender]) VALUES (4, N'Lalə', N'Zeynallı', CAST(N'2005-04-24' AS Date), N'Nihat', 2023, 2027, 617.5, N'Computer Engineering', N'English', N'Full-time', N'Government funded', N'Bachelor', N'CE.23E-1', N'0771493518', N'lalazeynali@gmail.com', N'lala.zeynalli', N'lala2005', N'Female')
GO
INSERT [dbo].[Student] ([Id], [Name], [Surname], [DateOfBirth], [FatherName], [EntranceYear], [GraduationYear], [EntranceScore], [Major], [Department], [EducationForm], [PaymentType], [EducationDegree], [GroupName], [PhoneNumber], [EMail], [Username], [Password], [Gender]) VALUES (5, N'Nigar', N'Qarayeva', CAST(N'2005-12-02' AS Date), N'Islam', 2023, 2027, 615.9, N'Computer Engineering', N'English', N'Full-time', N'Government funded', N'Bachelor', N'CE.23E-1', N'0512496718', N'nigar2005@gmail.com', N'nigarqarayeva2005', N'nigar.2005', N'Female')
GO
INSERT [dbo].[Student] ([Id], [Name], [Surname], [DateOfBirth], [FatherName], [EntranceYear], [GraduationYear], [EntranceScore], [Major], [Department], [EducationForm], [PaymentType], [EducationDegree], [GroupName], [PhoneNumber], [EMail], [Username], [Password], [Gender]) VALUES (6, N'Arzu', N'Ağayeva', CAST(N'2005-09-07' AS Date), N'Rəsul', 2023, 2027, 617.4, N'Computer Science', N'English', N'Full-time', N'Government funded', N'Bachelor', N'CS.23E-1', N'0554831672', N'arzuağayeva@gmail.com', N'arzuağayeva.', N'arzu', N'Female')
GO
INSERT [dbo].[Student] ([Id], [Name], [Surname], [DateOfBirth], [FatherName], [EntranceYear], [GraduationYear], [EntranceScore], [Major], [Department], [EducationForm], [PaymentType], [EducationDegree], [GroupName], [PhoneNumber], [EMail], [Username], [Password], [Gender]) VALUES (7, N'Cabbar', N'Cabbarlı', CAST(N'2005-10-03' AS Date), N'İsgənədər', 2023, 2027, 604.8, N'Computer Science', N'English', N'Full-time', N'Government funded', N'Bachelor', N'CS.23E-1', N'0771545427', N'cabbarcabbarlı@gmail.com', N'cabbarcabbarlı', N'cabbar.2005', N'Male')
GO
INSERT [dbo].[Student] ([Id], [Name], [Surname], [DateOfBirth], [FatherName], [EntranceYear], [GraduationYear], [EntranceScore], [Major], [Department], [EducationForm], [PaymentType], [EducationDegree], [GroupName], [PhoneNumber], [EMail], [Username], [Password], [Gender]) VALUES (8, N'Samirə', N'Ağalı', CAST(N'2005-01-28' AS Date), N'Hüseyn', 2023, 2027, 614.5, N'Computer Science', N'English', N'Full-time', N'Government funded', N'Bachelor', N'CS.23E-1', N'0512364921', N'samira2005@gmail.com', N'samira', N'samira2005.', N'Female')
GO
INSERT [dbo].[Student] ([Id], [Name], [Surname], [DateOfBirth], [FatherName], [EntranceYear], [GraduationYear], [EntranceScore], [Major], [Department], [EducationForm], [PaymentType], [EducationDegree], [GroupName], [PhoneNumber], [EMail], [Username], [Password], [Gender]) VALUES (9, N'Cavid', N'Əhmədli', CAST(N'2005-05-02' AS Date), N'Nadir', 2023, 2027, 614.1, N'Computer Science', N'English', N'Full-time', N'Government funded', N'Bachelor', N'CS.23E-1', N'0554826475', N'cavid2005@gmail.com', N'cavid', N'2005.', N'Male')
GO
INSERT [dbo].[Student] ([Id], [Name], [Surname], [DateOfBirth], [FatherName], [EntranceYear], [GraduationYear], [EntranceScore], [Major], [Department], [EducationForm], [PaymentType], [EducationDegree], [GroupName], [PhoneNumber], [EMail], [Username], [Password], [Gender]) VALUES (10, N'Vaqif', N'Nadirov', CAST(N'2005-03-02' AS Date), N'Bəhlul', 2023, 2027, 617.2, N'Computer Science', N'English', N'Full-time', N'Government funded', N'Bachelor', N'CS.23E-1', N'0701843578', N'vaqifnadirov@gmail.com', N'vaqifnadir', N'nadir2005', N'Male')
GO
SET IDENTITY_INSERT [dbo].[Student] OFF
GO
SET IDENTITY_INSERT [dbo].[StudentGrades] ON 
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (1, N'CE.23E-1', N'Calculus-1', N'Musa Baxşiyev Eldəniz', N'First Grade', 16)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (2, N'CE.23E-1', N'Calculus-1', N'Samir Qurbanov Qurban', N'First Grade', 19)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (3, N'CE.23E-1', N'Calculus-1', N'Araz Əliyev Əhmət', N'First Grade', 19)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (4, N'CE.23E-1', N'Calculus-1', N'Lalə Zeynallı Nihat', N'First Grade', 19)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (5, N'CE.23E-1', N'Calculus-1', N'Nigar Qarayeva Islam', N'First Grade', 19)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (6, N'CE.23E-1', N'Calculus-1', N'Musa Baxşiyev Eldəniz', N'Second Grade', 15)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (7, N'CE.23E-1', N'Calculus-1', N'Samir Qurbanov Qurban', N'Second Grade', 17)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (8, N'CE.23E-1', N'Calculus-1', N'Araz Əliyev Əhmət', N'Second Grade', 19)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (9, N'CE.23E-1', N'Calculus-1', N'Lalə Zeynallı Nihat', N'Second Grade', 6)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (10, N'CE.23E-1', N'Calculus-1', N'Nigar Qarayeva Islam', N'Second Grade', 16)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (11, N'CE.23E-1', N'Calculus-1', N'Musa Baxşiyev Eldəniz', N'Third Grade', 15)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (12, N'CE.23E-1', N'Calculus-1', N'Samir Qurbanov Qurban', N'Third Grade', 18)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (13, N'CE.23E-1', N'Calculus-1', N'Araz Əliyev Əhmət', N'Third Grade', 15)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (14, N'CE.23E-1', N'Calculus-1', N'Lalə Zeynallı Nihat', N'Third Grade', 16)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (15, N'CE.23E-1', N'Calculus-1', N'Nigar Qarayeva Islam', N'Third Grade', 19)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (16, N'CE.23E-1', N'Calculus-1', N'Musa Baxşiyev Eldəniz', N'Fourth Grade', 15)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (17, N'CE.23E-1', N'Calculus-1', N'Samir Qurbanov Qurban', N'Fourth Grade', 15)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (18, N'CE.23E-1', N'Calculus-1', N'Araz Əliyev Əhmət', N'Fourth Grade', 16)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (19, N'CE.23E-1', N'Calculus-1', N'Lalə Zeynallı Nihat', N'Fourth Grade', 15)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (20, N'CE.23E-1', N'Calculus-1', N'Nigar Qarayeva Islam', N'Fourth Grade', 15)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (21, N'CE.23E-1', N'Calculus-1', N'Musa Baxşiyev Eldəniz', N'Fifth Grade', 15)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (22, N'CE.23E-1', N'Calculus-1', N'Samir Qurbanov Qurban', N'Fifth Grade', 17)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (23, N'CE.23E-1', N'Calculus-1', N'Araz Əliyev Əhmət', N'Fifth Grade', 16)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (24, N'CE.23E-1', N'Calculus-1', N'Lalə Zeynallı Nihat', N'Fifth Grade', 18)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (25, N'CE.23E-1', N'Calculus-1', N'Nigar Qarayeva Islam', N'Fifth Grade', 15)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (26, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'First Grade', 17)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (27, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'First Grade', 18)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (28, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'First Grade', 17)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (29, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'First Grade', 19)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (30, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'First Grade', 18)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (31, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'Second Grade', 20)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (32, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'Second Grade', 20)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (33, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'Second Grade', 17)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (34, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'Second Grade', 19)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (35, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'Second Grade', 15)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (36, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'Third Grade', 15)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (37, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'Third Grade', 17)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (38, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'Third Grade', 20)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (39, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'Third Grade', 16)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (40, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'Third Grade', 20)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (41, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'Fourth Grade', 19)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (42, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'Fourth Grade', 18)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (43, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'Fourth Grade', 16)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (44, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'Fourth Grade', 17)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (45, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'Fourth Grade', 16)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (46, N'CE.23E-1', N'Basics Of Computer Engineering', N'Musa Baxşiyev Eldəniz', N'Fifth Grade', 18)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (47, N'CE.23E-1', N'Basics Of Computer Engineering', N'Samir Qurbanov Qurban', N'Fifth Grade', 15)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (48, N'CE.23E-1', N'Basics Of Computer Engineering', N'Araz Əliyev Əhmət', N'Fifth Grade', 16)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (49, N'CE.23E-1', N'Basics Of Computer Engineering', N'Lalə Zeynallı Nihat', N'Fifth Grade', 20)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (50, N'CE.23E-1', N'Basics Of Computer Engineering', N'Nigar Qarayeva Islam', N'Fifth Grade', 20)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (51, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'First Grade', 17)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (52, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'First Grade', 20)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (53, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'First Grade', 15)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (54, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'First Grade', 17)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (55, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'First Grade', 17)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (56, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'Second Grade', 18)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (57, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'Second Grade', 16)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (58, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'Second Grade', 19)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (59, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'Second Grade', 17)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (60, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'Second Grade', 15)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (61, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'Third Grade', 17)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (62, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'Third Grade', 20)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (63, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'Third Grade', 20)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (64, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'Third Grade', 18)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (65, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'Third Grade', 15)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (66, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'Fourth Grade', 20)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (67, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'Fourth Grade', 15)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (68, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'Fourth Grade', 16)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (69, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'Fourth Grade', 15)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (70, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'Fourth Grade', 19)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (71, N'CS.23E-1', N'Calculus-1', N'Arzu Ağayeva Rəsul', N'Fifth Grade', 17)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (72, N'CS.23E-1', N'Calculus-1', N'Cabbar Cabbarlı İsgənədər', N'Fifth Grade', 20)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (73, N'CS.23E-1', N'Calculus-1', N'Samirə Ağalı Hüseyn', N'Fifth Grade', 19)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (74, N'CS.23E-1', N'Calculus-1', N'Cavid Əhmədli Nadir', N'Fifth Grade', 20)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (75, N'CS.23E-1', N'Calculus-1', N'Vaqif Nadirov Bəhlul', N'Fifth Grade', 15)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (76, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'First Grade', 16)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (77, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'First Grade', 15)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (78, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'First Grade', 19)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (79, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'First Grade', 3)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (80, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'First Grade', 16)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (81, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'Second Grade', 4)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (82, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'Second Grade', 15)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (83, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'Second Grade', 16)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (84, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'Second Grade', 19)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (85, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'Second Grade', 20)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (86, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'Third Grade', 20)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (87, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'Third Grade', 18)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (88, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'Third Grade', 19)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (89, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'Third Grade', 15)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (90, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'Third Grade', 7)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (91, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'Fourth Grade', 11)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (92, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'Fourth Grade', 7)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (93, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'Fourth Grade', 17)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (94, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'Fourth Grade', 20)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (95, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'Fourth Grade', 17)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (96, N'CS.23E-1', N'Basics Of Computer Engineering', N'Arzu Ağayeva Rəsul', N'Fifth Grade', 18)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (97, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cabbar Cabbarlı İsgənədər', N'Fifth Grade', 18)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (98, N'CS.23E-1', N'Basics Of Computer Engineering', N'Samirə Ağalı Hüseyn', N'Fifth Grade', 18)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (99, N'CS.23E-1', N'Basics Of Computer Engineering', N'Cavid Əhmədli Nadir', N'Fifth Grade', 15)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (100, N'CS.23E-1', N'Basics Of Computer Engineering', N'Vaqif Nadirov Bəhlul', N'Fifth Grade', 15)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (101, N'CE.23E-1', N'Calculus-2', N'Musa Baxşiyev Eldəniz', N'First Grade', 20)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (102, N'CE.23E-1', N'Calculus-2', N'Musa Baxşiyev Eldəniz', N'Second Grade', 20)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (103, N'CE.23E-1', N'Calculus-2', N'Samir Qurbanov Qurban', N'First Grade', 20)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (104, N'CE.23E-1', N'Calculus-2', N'Araz Əliyev Əhmət', N'First Grade', 19)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (105, N'CE.23E-1', N'Calculus-2', N'Lalə Zeynallı Nihat', N'First Grade', 15)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (106, N'CE.23E-1', N'Calculus-2', N'Nigar Qarayeva Islam', N'First Grade', 19)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (107, N'CE.23E-1', N'Calculus-2', N'Samir Qurbanov Qurban', N'Second Grade', 16)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (108, N'CE.23E-1', N'Calculus-2', N'Araz Əliyev Əhmət', N'Second Grade', 19)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (109, N'CE.23E-1', N'Calculus-2', N'Lalə Zeynallı Nihat', N'Second Grade', 20)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (110, N'CE.23E-1', N'Calculus-2', N'Nigar Qarayeva Islam', N'Second Grade', 20)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (111, N'CE.23E-1', N'Calculus-2', N'Musa Baxşiyev Eldəniz', N'Third Grade', 20)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (112, N'CE.23E-1', N'Calculus-2', N'Samir Qurbanov Qurban', N'Third Grade', 18)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (113, N'CE.23E-1', N'Calculus-2', N'Araz Əliyev Əhmət', N'Third Grade', 17)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (114, N'CE.23E-1', N'Calculus-2', N'Lalə Zeynallı Nihat', N'Third Grade', 16)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (115, N'CE.23E-1', N'Calculus-2', N'Nigar Qarayeva Islam', N'Third Grade', 18)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (116, N'CE.23E-1', N'Calculus-2', N'Musa Baxşiyev Eldəniz', N'Fourth Grade', 20)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (117, N'CE.23E-1', N'Calculus-2', N'Samir Qurbanov Qurban', N'Fourth Grade', 19)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (118, N'CE.23E-1', N'Calculus-2', N'Araz Əliyev Əhmət', N'Fourth Grade', 19)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (119, N'CE.23E-1', N'Calculus-2', N'Lalə Zeynallı Nihat', N'Fourth Grade', 18)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (120, N'CE.23E-1', N'Calculus-2', N'Nigar Qarayeva Islam', N'Fourth Grade', 17)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (121, N'CE.23E-1', N'Calculus-2', N'Musa Baxşiyev Eldəniz', N'Fifth Grade', 20)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (122, N'CE.23E-1', N'Calculus-2', N'Samir Qurbanov Qurban', N'Fifth Grade', 18)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (123, N'CE.23E-1', N'Calculus-2', N'Araz Əliyev Əhmət', N'Fifth Grade', 18)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (124, N'CE.23E-1', N'Calculus-2', N'Lalə Zeynallı Nihat', N'Fifth Grade', 18)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (125, N'CE.23E-1', N'Calculus-2', N'Nigar Qarayeva Islam', N'Fifth Grade', 17)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (126, N'CE.23E-1', N'Basics Of Programming', N'Musa Baxşiyev Eldəniz', N'First Grade', 20)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (127, N'CE.23E-1', N'Basics Of Programming', N'Musa Baxşiyev Eldəniz', N'Second Grade', 20)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (128, N'CE.23E-1', N'Basics Of Programming', N'Musa Baxşiyev Eldəniz', N'Third Grade', 20)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (129, N'CE.23E-1', N'Basics Of Programming', N'Musa Baxşiyev Eldəniz', N'Fourth Grade', 20)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (130, N'CE.23E-1', N'Basics Of Programming', N'Musa Baxşiyev Eldəniz', N'Fifth Grade', 20)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (131, N'CE.23E-1', N'Basics Of Programming', N'Samir Qurbanov Qurban', N'Fifth Grade', 19)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (132, N'CE.23E-1', N'Basics Of Programming', N'Samir Qurbanov Qurban', N'Fourth Grade', 19)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (133, N'CE.23E-1', N'Basics Of Programming', N'Samir Qurbanov Qurban', N'Third Grade', 20)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (134, N'CE.23E-1', N'Basics Of Programming', N'Samir Qurbanov Qurban', N'Second Grade', 18)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (135, N'CE.23E-1', N'Basics Of Programming', N'Samir Qurbanov Qurban', N'First Grade', 20)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (136, N'CE.23E-1', N'Basics Of Programming', N'Araz Əliyev Əhmət', N'First Grade', 17)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (137, N'CE.23E-1', N'Basics Of Programming', N'Araz Əliyev Əhmət', N'Second Grade', 18)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (138, N'CE.23E-1', N'Basics Of Programming', N'Araz Əliyev Əhmət', N'Third Grade', 16)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (139, N'CE.23E-1', N'Basics Of Programming', N'Araz Əliyev Əhmət', N'Fourth Grade', 20)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (140, N'CE.23E-1', N'Basics Of Programming', N'Araz Əliyev Əhmət', N'Fifth Grade', 19)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (141, N'CE.23E-1', N'Basics Of Programming', N'Lalə Zeynallı Nihat', N'First Grade', 15)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (142, N'CE.23E-1', N'Basics Of Programming', N'Lalə Zeynallı Nihat', N'Second Grade', 18)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (143, N'CE.23E-1', N'Basics Of Programming', N'Lalə Zeynallı Nihat', N'Third Grade', 19)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (144, N'CE.23E-1', N'Basics Of Programming', N'Lalə Zeynallı Nihat', N'Fourth Grade', 19)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (145, N'CE.23E-1', N'Basics Of Programming', N'Lalə Zeynallı Nihat', N'Fifth Grade', 20)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (146, N'CE.23E-1', N'Basics Of Programming', N'Nigar Qarayeva Islam', N'Fifth Grade', 18)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (147, N'CE.23E-1', N'Basics Of Programming', N'Nigar Qarayeva Islam', N'Fourth Grade', 20)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (148, N'CE.23E-1', N'Basics Of Programming', N'Nigar Qarayeva Islam', N'Third Grade', 19)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (149, N'CE.23E-1', N'Basics Of Programming', N'Nigar Qarayeva Islam', N'Second Grade', 18)
GO
INSERT [dbo].[StudentGrades] ([Id], [GroupName], [SubjectName], [StudentName], [GradeOrder], [Grade]) VALUES (150, N'CE.23E-1', N'Basics Of Programming', N'Nigar Qarayeva Islam', N'First Grade', 19)
GO
SET IDENTITY_INSERT [dbo].[StudentGrades] OFF
GO
SET IDENTITY_INSERT [dbo].[SubjectInfo] ON 
GO
INSERT [dbo].[SubjectInfo] ([Id], [SubjectId], [Major], [Course], [Semester], [Credit]) VALUES (1, 1, N'Computer Engineering', 1, N'Autumn', 3)
GO
INSERT [dbo].[SubjectInfo] ([Id], [SubjectId], [Major], [Course], [Semester], [Credit]) VALUES (4, 9, N'Computer Engineering', 1, N'Autumn', 7)
GO
INSERT [dbo].[SubjectInfo] ([Id], [SubjectId], [Major], [Course], [Semester], [Credit]) VALUES (6, 2, N'Computer Engineering', 1, N'Spring', 3)
GO
INSERT [dbo].[SubjectInfo] ([Id], [SubjectId], [Major], [Course], [Semester], [Credit]) VALUES (7, 11, N'Computer Engineering', 1, N'Spring', 7)
GO
INSERT [dbo].[SubjectInfo] ([Id], [SubjectId], [Major], [Course], [Semester], [Credit]) VALUES (8, 3, N'Computer Engineering', 2, N'Autumn', 2)
GO
INSERT [dbo].[SubjectInfo] ([Id], [SubjectId], [Major], [Course], [Semester], [Credit]) VALUES (10, 13, N'Computer Engineering', 2, N'Autumn', 8)
GO
INSERT [dbo].[SubjectInfo] ([Id], [SubjectId], [Major], [Course], [Semester], [Credit]) VALUES (11, 6, N'Computer Engineering', 2, N'Spring', 3)
GO
INSERT [dbo].[SubjectInfo] ([Id], [SubjectId], [Major], [Course], [Semester], [Credit]) VALUES (12, 14, N'Computer Engineering', 2, N'Spring', 7)
GO
INSERT [dbo].[SubjectInfo] ([Id], [SubjectId], [Major], [Course], [Semester], [Credit]) VALUES (13, 7, N'Computer Engineering', 3, N'Autumn', 4)
GO
INSERT [dbo].[SubjectInfo] ([Id], [SubjectId], [Major], [Course], [Semester], [Credit]) VALUES (14, 10, N'Computer Engineering', 3, N'Autumn', 6)
GO
INSERT [dbo].[SubjectInfo] ([Id], [SubjectId], [Major], [Course], [Semester], [Credit]) VALUES (15, 8, N'Computer Engineering', 3, N'Spring', 2)
GO
INSERT [dbo].[SubjectInfo] ([Id], [SubjectId], [Major], [Course], [Semester], [Credit]) VALUES (16, 15, N'Computer Engineering', 3, N'Spring', 8)
GO
INSERT [dbo].[SubjectInfo] ([Id], [SubjectId], [Major], [Course], [Semester], [Credit]) VALUES (17, 4, N'Computer Engineering', 4, N'Autumn', 2)
GO
INSERT [dbo].[SubjectInfo] ([Id], [SubjectId], [Major], [Course], [Semester], [Credit]) VALUES (18, 12, N'Computer Engineering', 4, N'Autumn', 8)
GO
INSERT [dbo].[SubjectInfo] ([Id], [SubjectId], [Major], [Course], [Semester], [Credit]) VALUES (19, 16, N'Computer Engineering', 4, N'Spring', 5)
GO
INSERT [dbo].[SubjectInfo] ([Id], [SubjectId], [Major], [Course], [Semester], [Credit]) VALUES (21, 20, N'Computer Engineering', 4, N'Spring', 5)
GO
INSERT [dbo].[SubjectInfo] ([Id], [SubjectId], [Major], [Course], [Semester], [Credit]) VALUES (23, 1, N'Computer Science', 1, N'Autumn', 3)
GO
INSERT [dbo].[SubjectInfo] ([Id], [SubjectId], [Major], [Course], [Semester], [Credit]) VALUES (24, 9, N'Computer Science', 1, N'Autumn', 7)
GO
INSERT [dbo].[SubjectInfo] ([Id], [SubjectId], [Major], [Course], [Semester], [Credit]) VALUES (25, 2, N'Computer Science', 1, N'Spring', 3)
GO
INSERT [dbo].[SubjectInfo] ([Id], [SubjectId], [Major], [Course], [Semester], [Credit]) VALUES (26, 11, N'Computer Science', 1, N'Spring', 7)
GO
INSERT [dbo].[SubjectInfo] ([Id], [SubjectId], [Major], [Course], [Semester], [Credit]) VALUES (27, 3, N'Computer Science', 2, N'Autumn', 4)
GO
INSERT [dbo].[SubjectInfo] ([Id], [SubjectId], [Major], [Course], [Semester], [Credit]) VALUES (28, 10, N'Computer Science', 2, N'Autumn', 6)
GO
INSERT [dbo].[SubjectInfo] ([Id], [SubjectId], [Major], [Course], [Semester], [Credit]) VALUES (29, 4, N'Computer Science', 2, N'Spring', 3)
GO
INSERT [dbo].[SubjectInfo] ([Id], [SubjectId], [Major], [Course], [Semester], [Credit]) VALUES (30, 14, N'Computer Science', 2, N'Spring', 7)
GO
INSERT [dbo].[SubjectInfo] ([Id], [SubjectId], [Major], [Course], [Semester], [Credit]) VALUES (31, 6, N'Computer Science', 3, N'Autumn', 4)
GO
INSERT [dbo].[SubjectInfo] ([Id], [SubjectId], [Major], [Course], [Semester], [Credit]) VALUES (32, 12, N'Computer Science', 3, N'Autumn', 6)
GO
INSERT [dbo].[SubjectInfo] ([Id], [SubjectId], [Major], [Course], [Semester], [Credit]) VALUES (33, 7, N'Computer Science', 3, N'Spring', 3)
GO
INSERT [dbo].[SubjectInfo] ([Id], [SubjectId], [Major], [Course], [Semester], [Credit]) VALUES (34, 16, N'Computer Science', 3, N'Spring', 7)
GO
INSERT [dbo].[SubjectInfo] ([Id], [SubjectId], [Major], [Course], [Semester], [Credit]) VALUES (35, 8, N'Computer Science', 4, N'Autumn', 2)
GO
INSERT [dbo].[SubjectInfo] ([Id], [SubjectId], [Major], [Course], [Semester], [Credit]) VALUES (36, 21, N'Computer Science', 4, N'Autumn', 8)
GO
INSERT [dbo].[SubjectInfo] ([Id], [SubjectId], [Major], [Course], [Semester], [Credit]) VALUES (37, 19, N'Computer Science', 4, N'Spring', 5)
GO
INSERT [dbo].[SubjectInfo] ([Id], [SubjectId], [Major], [Course], [Semester], [Credit]) VALUES (39, 18, N'Computer Science', 4, N'Spring', 5)
GO
SET IDENTITY_INSERT [dbo].[SubjectInfo] OFF
GO
SET IDENTITY_INSERT [dbo].[Subjects] ON 
GO
INSERT [dbo].[Subjects] ([Id], [Name], [NameOfDepartment]) VALUES (1, N'Calculus-1', N'Math')
GO
INSERT [dbo].[Subjects] ([Id], [Name], [NameOfDepartment]) VALUES (2, N'Calculus-2', N'Math')
GO
INSERT [dbo].[Subjects] ([Id], [Name], [NameOfDepartment]) VALUES (3, N'Linear Algebra', N'Math')
GO
INSERT [dbo].[Subjects] ([Id], [Name], [NameOfDepartment]) VALUES (4, N'Discrete Mathematics', N'Math')
GO
INSERT [dbo].[Subjects] ([Id], [Name], [NameOfDepartment]) VALUES (6, N'Differential Equations', N'Math')
GO
INSERT [dbo].[Subjects] ([Id], [Name], [NameOfDepartment]) VALUES (7, N'Physics', N'Physics')
GO
INSERT [dbo].[Subjects] ([Id], [Name], [NameOfDepartment]) VALUES (8, N'Circuit Theory', N'Physics')
GO
INSERT [dbo].[Subjects] ([Id], [Name], [NameOfDepartment]) VALUES (9, N'Basics Of Computer Engineering', N'IT')
GO
INSERT [dbo].[Subjects] ([Id], [Name], [NameOfDepartment]) VALUES (10, N'Computer Graphics', N'Engineering')
GO
INSERT [dbo].[Subjects] ([Id], [Name], [NameOfDepartment]) VALUES (11, N'Basics Of Programming', N'IT')
GO
INSERT [dbo].[Subjects] ([Id], [Name], [NameOfDepartment]) VALUES (12, N'Digital Systems', N'IT')
GO
INSERT [dbo].[Subjects] ([Id], [Name], [NameOfDepartment]) VALUES (13, N'Database', N'IT')
GO
INSERT [dbo].[Subjects] ([Id], [Name], [NameOfDepartment]) VALUES (14, N'Computer Architecture', N'IT')
GO
INSERT [dbo].[Subjects] ([Id], [Name], [NameOfDepartment]) VALUES (15, N'Operating Systems', N'IT')
GO
INSERT [dbo].[Subjects] ([Id], [Name], [NameOfDepartment]) VALUES (16, N'Digital Communication', N'IT')
GO
INSERT [dbo].[Subjects] ([Id], [Name], [NameOfDepartment]) VALUES (18, N'Backend', N'IT')
GO
INSERT [dbo].[Subjects] ([Id], [Name], [NameOfDepartment]) VALUES (19, N'Frontend', N'IT')
GO
INSERT [dbo].[Subjects] ([Id], [Name], [NameOfDepartment]) VALUES (20, N'Basics Of Information Technology', N'IT')
GO
INSERT [dbo].[Subjects] ([Id], [Name], [NameOfDepartment]) VALUES (21, N'Basics Of Information Security', N'IT')
GO
SET IDENTITY_INSERT [dbo].[Subjects] OFF
GO
SET IDENTITY_INSERT [dbo].[Teacher] ON 
GO
INSERT [dbo].[Teacher] ([Id], [Name], [Surname], [FatherName], [DateOfBirth], [Username], [Password], [PhoneNumber], [EMail], [Gender]) VALUES (1, N'Elnur', N'Manafov', N'Anar', CAST(N'1998-06-22' AS Date), N'elnur', N'2024', N'0512493517', N'elnurmanafov1998@gmail.com', N'Male')
GO
INSERT [dbo].[Teacher] ([Id], [Name], [Surname], [FatherName], [DateOfBirth], [Username], [Password], [PhoneNumber], [EMail], [Gender]) VALUES (2, N'Səməd', N'Əhmədov', N'Xəlil', CAST(N'1996-03-07' AS Date), N'samad', N'samad1996', N'0771832916', N'samadxalil1998@gmail.com', N'Male')
GO
INSERT [dbo].[Teacher] ([Id], [Name], [Surname], [FatherName], [DateOfBirth], [Username], [Password], [PhoneNumber], [EMail], [Gender]) VALUES (3, N'Ziya', N'Xəlil', N'İsmayıl', CAST(N'1998-11-11' AS Date), N'xalil2024', N'19982024', N'0501297325', N'ziya1998@gmail.com', N'Male')
GO
INSERT [dbo].[Teacher] ([Id], [Name], [Surname], [FatherName], [DateOfBirth], [Username], [Password], [PhoneNumber], [EMail], [Gender]) VALUES (5, N'Samir', N'Quluyev', N'Asif', CAST(N'1999-11-09' AS Date), N'samirquluyev', N'samir1999', N'0512347568', N'samirquluyev@gmail.com', N'Male')
GO
INSERT [dbo].[Teacher] ([Id], [Name], [Surname], [FatherName], [DateOfBirth], [Username], [Password], [PhoneNumber], [EMail], [Gender]) VALUES (6, N'Ayşə', N'Əliyeva', N'Vasif', CAST(N'2000-04-22' AS Date), N'ayşa2024', N'20002024', N'0551349527', N'ayşa2000@gmail.com', N'Female')
GO
INSERT [dbo].[Teacher] ([Id], [Name], [Surname], [FatherName], [DateOfBirth], [Username], [Password], [PhoneNumber], [EMail], [Gender]) VALUES (7, N'Yasəmən', N'Məmmədova', N'Vüqar', CAST(N'1995-02-24' AS Date), N'yasaman', N'yasaman1995', N'0774395127', N'yasaman@gmail.com', N'Female')
GO
INSERT [dbo].[Teacher] ([Id], [Name], [Surname], [FatherName], [DateOfBirth], [Username], [Password], [PhoneNumber], [EMail], [Gender]) VALUES (8, N'Nurlan', N'Vəlizadə', N'Əli', CAST(N'1997-08-21' AS Date), N'nurlanvalizadə', N'nurlan.1997', N'0502364591', N'nurlan1997@gmail.com', N'Male')
GO
INSERT [dbo].[Teacher] ([Id], [Name], [Surname], [FatherName], [DateOfBirth], [Username], [Password], [PhoneNumber], [EMail], [Gender]) VALUES (9, N'Tural', N'Ağayev', N'Rəşid', CAST(N'1994-09-20' AS Date), N'turalağa', N'tural.ağa', N'0771684329', N'turalağa@gmail.com', N'Male')
GO
INSERT [dbo].[Teacher] ([Id], [Name], [Surname], [FatherName], [DateOfBirth], [Username], [Password], [PhoneNumber], [EMail], [Gender]) VALUES (10, N'Zeynəb', N'Qarayeva', N'Əmrah', CAST(N'2001-04-19' AS Date), N'zeynab', N'zeynabqarayeva', N'0771359428', N'zeynabqarayeva@gmail.com', N'Female')
GO
INSERT [dbo].[Teacher] ([Id], [Name], [Surname], [FatherName], [DateOfBirth], [Username], [Password], [PhoneNumber], [EMail], [Gender]) VALUES (11, N'Şükriyyə', N'Abbasova', N'Anar', CAST(N'1999-11-18' AS Date), N'abbasova', N'1999', N'0502487548', N'abbasova1999@gmail.com', N'Female')
GO
INSERT [dbo].[Teacher] ([Id], [Name], [Surname], [FatherName], [DateOfBirth], [Username], [Password], [PhoneNumber], [EMail], [Gender]) VALUES (12, N'Xəlil', N'Əlizadə', N'Arif', CAST(N'1999-07-16' AS Date), N'xalil', N'xalilalizada', N'0551293461', N'xalilalizada@gmail.com', N'Male')
GO
SET IDENTITY_INSERT [dbo].[Teacher] OFF
GO
INSERT [dbo].[TeacherSubjects] ([TeacherId], [SubjectId]) VALUES (1, N'14')
GO
INSERT [dbo].[TeacherSubjects] ([TeacherId], [SubjectId]) VALUES (1, N'9')
GO
INSERT [dbo].[TeacherSubjects] ([TeacherId], [SubjectId]) VALUES (2, N'1')
GO
INSERT [dbo].[TeacherSubjects] ([TeacherId], [SubjectId]) VALUES (2, N'2')
GO
INSERT [dbo].[TeacherSubjects] ([TeacherId], [SubjectId]) VALUES (2, N'3')
GO
INSERT [dbo].[TeacherSubjects] ([TeacherId], [SubjectId]) VALUES (2, N'4')
GO
INSERT [dbo].[TeacherSubjects] ([TeacherId], [SubjectId]) VALUES (2, N'6')
GO
INSERT [dbo].[TeacherSubjects] ([TeacherId], [SubjectId]) VALUES (3, N'7')
GO
INSERT [dbo].[TeacherSubjects] ([TeacherId], [SubjectId]) VALUES (3, N'8')
GO
INSERT [dbo].[TeacherSubjects] ([TeacherId], [SubjectId]) VALUES (5, N'11')
GO
INSERT [dbo].[TeacherSubjects] ([TeacherId], [SubjectId]) VALUES (5, N'13')
GO
INSERT [dbo].[TeacherSubjects] ([TeacherId], [SubjectId]) VALUES (5, N'18')
GO
INSERT [dbo].[TeacherSubjects] ([TeacherId], [SubjectId]) VALUES (5, N'19')
GO
INSERT [dbo].[TeacherSubjects] ([TeacherId], [SubjectId]) VALUES (6, N'10')
GO
INSERT [dbo].[TeacherSubjects] ([TeacherId], [SubjectId]) VALUES (6, N'16')
GO
INSERT [dbo].[TeacherSubjects] ([TeacherId], [SubjectId]) VALUES (6, N'20')
GO
INSERT [dbo].[TeacherSubjects] ([TeacherId], [SubjectId]) VALUES (7, N'12')
GO
INSERT [dbo].[TeacherSubjects] ([TeacherId], [SubjectId]) VALUES (7, N'16')
GO
INSERT [dbo].[TeacherSubjects] ([TeacherId], [SubjectId]) VALUES (8, N'11')
GO
INSERT [dbo].[TeacherSubjects] ([TeacherId], [SubjectId]) VALUES (8, N'13')
GO
INSERT [dbo].[TeacherSubjects] ([TeacherId], [SubjectId]) VALUES (8, N'18')
GO
INSERT [dbo].[TeacherSubjects] ([TeacherId], [SubjectId]) VALUES (8, N'19')
GO
INSERT [dbo].[TeacherSubjects] ([TeacherId], [SubjectId]) VALUES (8, N'9')
GO
INSERT [dbo].[TeacherSubjects] ([TeacherId], [SubjectId]) VALUES (9, N'15')
GO
INSERT [dbo].[TeacherSubjects] ([TeacherId], [SubjectId]) VALUES (9, N'20')
GO
INSERT [dbo].[TeacherSubjects] ([TeacherId], [SubjectId]) VALUES (9, N'21')
GO
INSERT [dbo].[TeacherSubjects] ([TeacherId], [SubjectId]) VALUES (10, N'10')
GO
INSERT [dbo].[TeacherSubjects] ([TeacherId], [SubjectId]) VALUES (10, N'14')
GO
INSERT [dbo].[TeacherSubjects] ([TeacherId], [SubjectId]) VALUES (10, N'16')
GO
INSERT [dbo].[TeacherSubjects] ([TeacherId], [SubjectId]) VALUES (10, N'9')
GO
INSERT [dbo].[TeacherSubjects] ([TeacherId], [SubjectId]) VALUES (11, N'3')
GO
INSERT [dbo].[TeacherSubjects] ([TeacherId], [SubjectId]) VALUES (11, N'4')
GO
INSERT [dbo].[TeacherSubjects] ([TeacherId], [SubjectId]) VALUES (11, N'6')
GO
INSERT [dbo].[TeacherSubjects] ([TeacherId], [SubjectId]) VALUES (12, N'1')
GO
INSERT [dbo].[TeacherSubjects] ([TeacherId], [SubjectId]) VALUES (12, N'14')
GO
INSERT [dbo].[TeacherSubjects] ([TeacherId], [SubjectId]) VALUES (12, N'2')
GO
INSERT [dbo].[TeacherSubjects] ([TeacherId], [SubjectId]) VALUES (12, N'3')
GO
INSERT [dbo].[TeacherSubjects] ([TeacherId], [SubjectId]) VALUES (12, N'9')
GO
USE [master]
GO
ALTER DATABASE [Unibook] SET  READ_WRITE 
GO
