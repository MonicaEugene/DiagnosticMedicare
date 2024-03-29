USE [master]
GO
/****** Object:  Database [Medicare_System]    Script Date: 11/22/2019 4:17:43 PM ******/
CREATE DATABASE [Medicare_System]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Medicare_System', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Medicare_System.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Medicare_System_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Medicare_System_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Medicare_System] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Medicare_System].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Medicare_System] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Medicare_System] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Medicare_System] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Medicare_System] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Medicare_System] SET ARITHABORT OFF 
GO
ALTER DATABASE [Medicare_System] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Medicare_System] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Medicare_System] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Medicare_System] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Medicare_System] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Medicare_System] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Medicare_System] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Medicare_System] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Medicare_System] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Medicare_System] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Medicare_System] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Medicare_System] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Medicare_System] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Medicare_System] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Medicare_System] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Medicare_System] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Medicare_System] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Medicare_System] SET RECOVERY FULL 
GO
ALTER DATABASE [Medicare_System] SET  MULTI_USER 
GO
ALTER DATABASE [Medicare_System] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Medicare_System] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Medicare_System] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Medicare_System] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Medicare_System] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Medicare_System]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 11/22/2019 4:17:43 PM ******/
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
/****** Object:  Table [dbo].[tblAdmin]    Script Date: 11/22/2019 4:17:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ARITHABORT ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblAdmin](
	[sno] [int] IDENTITY(1000,1) NOT NULL,
	[ad_AdminId]  AS ('AD'+CONVERT([nvarchar](10),[sno])) PERSISTED NOT NULL,
	[ad_FirstName] [nvarchar](10) NOT NULL,
	[ad_LastName] [nvarchar](10) NULL,
	[ad_Age] [int] NULL,
	[ad_Gender] [nvarchar](10) NULL,
	[ad_Dob] [date] NULL,
	[ad_ContactNo] [bigint] NULL,
	[ad_AltContactNo] [bigint] NULL,
	[ad_Email] [nvarchar](50) NULL,
	[ad_Password] [varchar](100) NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[ad_AdminId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblAppointment]    Script Date: 11/22/2019 4:17:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ARITHABORT ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblAppointment](
	[sno] [int] IDENTITY(1000,1) NOT NULL,
	[ap_AppointmentId]  AS ('AP'+CONVERT([nvarchar](12),[sno])) PERSISTED NOT NULL,
	[ap_dr_UserId] [nvarchar](12) NULL,
	[ap_md_MedicareServiceId] [nvarchar](12) NULL,
	[ap_pt_UserId] [nvarchar](12) NULL,
	[ap_Date] [date] NULL,
	[ap_Time] [time](7) NULL,
	[ap_Status] [bit] NULL DEFAULT ((0)),
 CONSTRAINT [PK_Appointment] PRIMARY KEY CLUSTERED 
(
	[ap_AppointmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblDoctor]    Script Date: 11/22/2019 4:17:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ARITHABORT ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblDoctor](
	[s_no] [int] IDENTITY(1000,1) NOT NULL,
	[dr_UserId]  AS ('DR'+CONVERT([nvarchar](10),[s_no])) PERSISTED NOT NULL,
	[dr_FirstName] [nvarchar](10) NOT NULL,
	[dr_LastName] [nvarchar](10) NULL,
	[dr_Age] [int] NULL,
	[dr_Gender] [nvarchar](10) NULL,
	[dr_Dob] [date] NULL,
	[dr_ContactNo] [bigint] NULL,
	[dr_AltContactNo] [bigint] NULL,
	[dr_Email] [nvarchar](50) NULL,
	[dr_Password] [varchar](100) NULL,
	[dr_Address1] [nvarchar](100) NULL,
	[dr_Address2] [nvarchar](100) NULL,
	[dr_City] [nvarchar](50) NULL,
	[dr_State] [nvarchar](100) NULL,
	[dr_Zipcode] [bigint] NULL,
	[dr_Degree] [nvarchar](50) NULL,
	[dr_Speciality] [nvarchar](50) NULL,
	[dr_WorkHours] [nvarchar](10) NULL,
	[dr_ClinicName] [nvarchar](50) NULL,
	[dr_md_MedicareServiceId] [nvarchar](12) NULL,
	[dr_Status] [bit] NULL DEFAULT ((0)),
 CONSTRAINT [PK_Doctor] PRIMARY KEY CLUSTERED 
(
	[dr_UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblMedicalTestHistory]    Script Date: 11/22/2019 4:17:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ARITHABORT ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblMedicalTestHistory](
	[sno] [int] IDENTITY(1000,1) NOT NULL,
	[mt_ReportId]  AS ('MT'+CONVERT([nvarchar](12),[sno])) PERSISTED NOT NULL,
	[mt_pt_UserId] [nvarchar](11) NULL,
	[mt_dr_UserId] [nvarchar](11) NULL,
	[mt_md_MedicareServiceId] [nvarchar](12) NULL,
	[mt_ServiceDate] [date] NULL,
	[mt_TestResultDate] [date] NULL,
	[mt_Diag1ActualValue] [decimal](10, 2) NULL,
	[mt_Diag1NormalRange] [decimal](10, 2) NULL,
	[mt_Diag2ActualValue] [decimal](10, 2) NULL,
	[mt_Diag2NormalRange] [decimal](10, 2) NULL,
	[mt_Diag3ActualValue] [decimal](10, 2) NULL,
	[mt_Diag3NormalRange] [decimal](10, 2) NULL,
	[mt_Diag4ActualValue] [decimal](10, 2) NULL,
	[mt_Diag4NormalRange] [decimal](10, 2) NULL,
	[mt_DoctorComments] [nvarchar](300) NULL,
	[mt_OtherInfo] [nvarchar](300) NULL,
 CONSTRAINT [PK_MedicalTestHistory] PRIMARY KEY CLUSTERED 
(
	[mt_ReportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblMedicare]    Script Date: 11/22/2019 4:17:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ARITHABORT ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblMedicare](
	[s_no] [int] IDENTITY(1000,1) NOT NULL,
	[md_MedicareId]  AS ('MD'+CONVERT([nvarchar](10),[s_no])) PERSISTED NOT NULL,
	[md_MedicareService] [nvarchar](50) NULL,
	[md_ServiceDesp] [nvarchar](100) NULL,
	[md_Amount] [bigint] NULL,
 CONSTRAINT [PK_medicare] PRIMARY KEY CLUSTERED 
(
	[md_MedicareId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblPatient]    Script Date: 11/22/2019 4:17:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ARITHABORT ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblPatient](
	[sno] [int] IDENTITY(1000,1) NOT NULL,
	[pt_UserId]  AS ('PT'+CONVERT([nvarchar](10),[sno])) PERSISTED NOT NULL,
	[pt_FirstName] [nvarchar](10) NOT NULL,
	[pt_LastName] [nvarchar](10) NULL,
	[pt_Age] [int] NULL,
	[pt_Gender] [nvarchar](10) NULL,
	[pt_Dob] [date] NULL,
	[pt_ContactNo] [bigint] NULL,
	[pt_AltContactNo] [bigint] NULL,
	[pt_Email] [nvarchar](50) NULL,
	[pt_Password] [varchar](100) NULL,
	[pt_Address1] [nvarchar](100) NULL,
	[pt_Address2] [nvarchar](100) NULL,
	[pt_City] [nvarchar](50) NULL,
	[pt_State] [nvarchar](100) NULL,
	[pt_Zipcode] [bigint] NULL,
	[pt_Status] [bit] NULL DEFAULT ((0)),
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[pt_UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON
GO
SET IDENTITY_INSERT [dbo].[tblAppointment] ON 

GO
INSERT [dbo].[tblAppointment] ([sno], [ap_dr_UserId], [ap_md_MedicareServiceId], [ap_pt_UserId], [ap_Date], [ap_Time], [ap_Status]) VALUES (1000, N'DR1001', N'MD1000', N'PT1003', CAST(N'2019-11-01' AS Date), CAST(N'09:30:00' AS Time), 0)
GO
INSERT [dbo].[tblAppointment] ([sno], [ap_dr_UserId], [ap_md_MedicareServiceId], [ap_pt_UserId], [ap_Date], [ap_Time], [ap_Status]) VALUES (1014, N'DR1002', N'MD1001', N'PT1002', CAST(N'2019-11-14' AS Date), CAST(N'19:00:00' AS Time), 1)
GO
INSERT [dbo].[tblAppointment] ([sno], [ap_dr_UserId], [ap_md_MedicareServiceId], [ap_pt_UserId], [ap_Date], [ap_Time], [ap_Status]) VALUES (1016, N'DR1004', N'MD1002', N'PT1002', CAST(N'2019-11-21' AS Date), CAST(N'14:00:00' AS Time), 0)
GO
INSERT [dbo].[tblAppointment] ([sno], [ap_dr_UserId], [ap_md_MedicareServiceId], [ap_pt_UserId], [ap_Date], [ap_Time], [ap_Status]) VALUES (1017, N'DR1009', N'MD1000', N'PT1003', CAST(N'2019-11-20' AS Date), CAST(N'12:00:00' AS Time), 1)
GO
INSERT [dbo].[tblAppointment] ([sno], [ap_dr_UserId], [ap_md_MedicareServiceId], [ap_pt_UserId], [ap_Date], [ap_Time], [ap_Status]) VALUES (1018, N'DR1009', N'MD1000', N'PT1003', CAST(N'2019-11-20' AS Date), CAST(N'12:00:00' AS Time), 1)
GO
INSERT [dbo].[tblAppointment] ([sno], [ap_dr_UserId], [ap_md_MedicareServiceId], [ap_pt_UserId], [ap_Date], [ap_Time], [ap_Status]) VALUES (1019, N'DR1010', N'MD1000', N'PT1003', CAST(N'2019-11-21' AS Date), CAST(N'12:00:00' AS Time), 1)
GO
INSERT [dbo].[tblAppointment] ([sno], [ap_dr_UserId], [ap_md_MedicareServiceId], [ap_pt_UserId], [ap_Date], [ap_Time], [ap_Status]) VALUES (1020, N'DR1002', N'MD1001', N'PT1002', CAST(N'2019-11-21' AS Date), CAST(N'12:00:00' AS Time), 1)
GO
INSERT [dbo].[tblAppointment] ([sno], [ap_dr_UserId], [ap_md_MedicareServiceId], [ap_pt_UserId], [ap_Date], [ap_Time], [ap_Status]) VALUES (1021, N'DR1002', N'MD1001', N'PT1002', CAST(N'2019-11-13' AS Date), CAST(N'12:00:00' AS Time), 1)
GO
INSERT [dbo].[tblAppointment] ([sno], [ap_dr_UserId], [ap_md_MedicareServiceId], [ap_pt_UserId], [ap_Date], [ap_Time], [ap_Status]) VALUES (1022, N'DR1009', N'MD1000', N'PT1002', CAST(N'2019-11-20' AS Date), CAST(N'12:00:00' AS Time), 1)
GO
INSERT [dbo].[tblAppointment] ([sno], [ap_dr_UserId], [ap_md_MedicareServiceId], [ap_pt_UserId], [ap_Date], [ap_Time], [ap_Status]) VALUES (1023, N'DR1004', N'MD1002', N'PT1002', CAST(N'2019-11-30' AS Date), CAST(N'13:00:00' AS Time), 1)
GO
INSERT [dbo].[tblAppointment] ([sno], [ap_dr_UserId], [ap_md_MedicareServiceId], [ap_pt_UserId], [ap_Date], [ap_Time], [ap_Status]) VALUES (1024, N'DR1009', N'MD1000', N'PT1002', CAST(N'2019-11-05' AS Date), CAST(N'00:00:00' AS Time), 0)
GO
INSERT [dbo].[tblAppointment] ([sno], [ap_dr_UserId], [ap_md_MedicareServiceId], [ap_pt_UserId], [ap_Date], [ap_Time], [ap_Status]) VALUES (1025, N'DR1003', N'MD1002', N'PT1003', CAST(N'2019-11-22' AS Date), CAST(N'15:00:00' AS Time), 0)
GO
INSERT [dbo].[tblAppointment] ([sno], [ap_dr_UserId], [ap_md_MedicareServiceId], [ap_pt_UserId], [ap_Date], [ap_Time], [ap_Status]) VALUES (1026, N'DR1009', N'MD1000', N'PT1012', CAST(N'2019-11-22' AS Date), CAST(N'10:00:00' AS Time), 0)
GO
INSERT [dbo].[tblAppointment] ([sno], [ap_dr_UserId], [ap_md_MedicareServiceId], [ap_pt_UserId], [ap_Date], [ap_Time], [ap_Status]) VALUES (1027, N'DR1013', N'MD1001', N'PT1003', CAST(N'2019-11-13' AS Date), CAST(N'12:00:00' AS Time), 1)
GO
INSERT [dbo].[tblAppointment] ([sno], [ap_dr_UserId], [ap_md_MedicareServiceId], [ap_pt_UserId], [ap_Date], [ap_Time], [ap_Status]) VALUES (1028, N'DR1002', N'MD1001', N'PT1003', CAST(N'2019-11-20' AS Date), CAST(N'11:00:00' AS Time), 1)
GO
SET IDENTITY_INSERT [dbo].[tblAppointment] OFF
GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON
GO
SET IDENTITY_INSERT [dbo].[tblDoctor] ON 

GO
INSERT [dbo].[tblDoctor] ([s_no], [dr_FirstName], [dr_LastName], [dr_Age], [dr_Gender], [dr_Dob], [dr_ContactNo], [dr_AltContactNo], [dr_Email], [dr_Password], [dr_Address1], [dr_Address2], [dr_City], [dr_State], [dr_Zipcode], [dr_Degree], [dr_Speciality], [dr_WorkHours], [dr_ClinicName], [dr_md_MedicareServiceId], [dr_Status]) VALUES (1001, N'Allen', N'Mathew', 28, N'Male', CAST(N'1995-06-30' AS Date), 8015976548, 9486983569, N'allem.m@gmail.com', N'allenallen', N'2nd Street, Ghilchrist Avenue', N'Anna Nagar', N'Chennai', N'Tamil Nadu', 628001, N'MS', N'Cardiologist', N'5pm-8pm', N'Apollo clinic', N'MD1000', 1)
GO
INSERT [dbo].[tblDoctor] ([s_no], [dr_FirstName], [dr_LastName], [dr_Age], [dr_Gender], [dr_Dob], [dr_ContactNo], [dr_AltContactNo], [dr_Email], [dr_Password], [dr_Address1], [dr_Address2], [dr_City], [dr_State], [dr_Zipcode], [dr_Degree], [dr_Speciality], [dr_WorkHours], [dr_ClinicName], [dr_md_MedicareServiceId], [dr_Status]) VALUES (1002, N'Manoj', N'Darsi', 30, N'Male', CAST(N'1989-06-30' AS Date), 9876543210, 9678954321, N'darsi.manoj@gmail.com', N'manojmanoj', N'5th Street, Orange Avenue', N'Avadi', N'Chennai', N'Tamil Nadu', 626371, N'MS', N'Nephrologist', N'5pm-9pm', N'Dr. Manoj Clinic', N'MD1001', 1)
GO
INSERT [dbo].[tblDoctor] ([s_no], [dr_FirstName], [dr_LastName], [dr_Age], [dr_Gender], [dr_Dob], [dr_ContactNo], [dr_AltContactNo], [dr_Email], [dr_Password], [dr_Address1], [dr_Address2], [dr_City], [dr_State], [dr_Zipcode], [dr_Degree], [dr_Speciality], [dr_WorkHours], [dr_ClinicName], [dr_md_MedicareServiceId], [dr_Status]) VALUES (1003, N'Mohammed', N'Uvaiz', 30, N'Male', CAST(N'1995-10-04' AS Date), 9876543210, 7890654321, N'mmd.uvaiz@gmail.com', N'uvaizuvaiz', N'3rd, Staff Quarters', N'Kakkanad', N'Cochin', N'Kerala', 987654, N'Phd', N'Cardiologist', N'9am-6pm', N'Sunrise Hospital', N'MD1002', 1)
GO
INSERT [dbo].[tblDoctor] ([s_no], [dr_FirstName], [dr_LastName], [dr_Age], [dr_Gender], [dr_Dob], [dr_ContactNo], [dr_AltContactNo], [dr_Email], [dr_Password], [dr_Address1], [dr_Address2], [dr_City], [dr_State], [dr_Zipcode], [dr_Degree], [dr_Speciality], [dr_WorkHours], [dr_ClinicName], [dr_md_MedicareServiceId], [dr_Status]) VALUES (1004, N'Manna', N'Mary Thoma', 25, N'Female', CAST(N'1994-01-24' AS Date), 9876543210, 9678954321, N'manna.thomas@gmail.com', N'mannamanna', N'7th Street, Apple Avenue', N'Vellore', N'Vellore', N'Tamil Nadu', 626371, N'MS', N'Pediatritian', N'2pm-9pm', N'CMC Vellore', N'MD1002', 1)
GO
INSERT [dbo].[tblDoctor] ([s_no], [dr_FirstName], [dr_LastName], [dr_Age], [dr_Gender], [dr_Dob], [dr_ContactNo], [dr_AltContactNo], [dr_Email], [dr_Password], [dr_Address1], [dr_Address2], [dr_City], [dr_State], [dr_Zipcode], [dr_Degree], [dr_Speciality], [dr_WorkHours], [dr_ClinicName], [dr_md_MedicareServiceId], [dr_Status]) VALUES (1009, N'Venessa', N'Quadros', 25, N'Female', CAST(N'1994-04-07' AS Date), 9876543210, 9678954321, N'venessa@gmail.com', N'venessavenessa', N'7th Street', N'Vennys Lane', N'Mangalore', N'Karnataka', 626371, N'MS', N'Orthopedics', N'9am-5pm', N'Vennys Clinic', N'MD1000', 1)
GO
INSERT [dbo].[tblDoctor] ([s_no], [dr_FirstName], [dr_LastName], [dr_Age], [dr_Gender], [dr_Dob], [dr_ContactNo], [dr_AltContactNo], [dr_Email], [dr_Password], [dr_Address1], [dr_Address2], [dr_City], [dr_State], [dr_Zipcode], [dr_Degree], [dr_Speciality], [dr_WorkHours], [dr_ClinicName], [dr_md_MedicareServiceId], [dr_Status]) VALUES (1010, N'Ajinkya', N'Phand', 24, N'Male', CAST(N'1995-07-11' AS Date), 7894561230, 3216549870, N'ajinkya.p@gmail.com', N'ajinkyaajinkya', N'Lemon Street', N'Watermelon Road', N'Pune', N'Maharashtra', 432561, N'MS', N'Cardiovascular', N'10am-4pm', N'Avinash Health Home', N'MD1000', 1)
GO
INSERT [dbo].[tblDoctor] ([s_no], [dr_FirstName], [dr_LastName], [dr_Age], [dr_Gender], [dr_Dob], [dr_ContactNo], [dr_AltContactNo], [dr_Email], [dr_Password], [dr_Address1], [dr_Address2], [dr_City], [dr_State], [dr_Zipcode], [dr_Degree], [dr_Speciality], [dr_WorkHours], [dr_ClinicName], [dr_md_MedicareServiceId], [dr_Status]) VALUES (1013, N'Iris', N'Jestin', 27, N'Female', CAST(N'1992-07-15' AS Date), 1234567890, 1234567098, N'iris@gmail.com', N'irisiris', N'Venny Lane', N'Penny Square', N'Mangalore', N'Karnataka', 123456, N'MS', N'Radiology', N'9am-10pm', N'Iris Clinic', N'MD1001', 1)
GO
INSERT [dbo].[tblDoctor] ([s_no], [dr_FirstName], [dr_LastName], [dr_Age], [dr_Gender], [dr_Dob], [dr_ContactNo], [dr_AltContactNo], [dr_Email], [dr_Password], [dr_Address1], [dr_Address2], [dr_City], [dr_State], [dr_Zipcode], [dr_Degree], [dr_Speciality], [dr_WorkHours], [dr_ClinicName], [dr_md_MedicareServiceId], [dr_Status]) VALUES (1014, N'Mathew', N'Jovit', 32, N'Male', CAST(N'1997-11-30' AS Date), 1234367890, 1234367891, N'mathew@gmail.com', N'mathewmathew', N'Lemon Street', N'Watermelon Road', N'Pune', N'Maharashtra', 777777, N'MS', N'Cardiology', N'9am-10pm', N'Health Center', N'MD1002', 1)
GO
INSERT [dbo].[tblDoctor] ([s_no], [dr_FirstName], [dr_LastName], [dr_Age], [dr_Gender], [dr_Dob], [dr_ContactNo], [dr_AltContactNo], [dr_Email], [dr_Password], [dr_Address1], [dr_Address2], [dr_City], [dr_State], [dr_Zipcode], [dr_Degree], [dr_Speciality], [dr_WorkHours], [dr_ClinicName], [dr_md_MedicareServiceId], [dr_Status]) VALUES (1015, N'Finu', N'Nazar', 22, N'Female', CAST(N'1997-11-03' AS Date), 7903850154, 7903850153, N'finu@gmail.com', N'finu@1', N'Fern Icon', N'Vytilla', N'Kochi', N'Kochi', 123456, N'MS', N'Cardiovascular', N'9am-10pm', N'Vennys Clinic', N'MD1000', 1)
GO
SET IDENTITY_INSERT [dbo].[tblDoctor] OFF
GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON
GO
SET IDENTITY_INSERT [dbo].[tblMedicalTestHistory] ON 

GO
INSERT [dbo].[tblMedicalTestHistory] ([sno], [mt_pt_UserId], [mt_dr_UserId], [mt_md_MedicareServiceId], [mt_ServiceDate], [mt_TestResultDate], [mt_Diag1ActualValue], [mt_Diag1NormalRange], [mt_Diag2ActualValue], [mt_Diag2NormalRange], [mt_Diag3ActualValue], [mt_Diag3NormalRange], [mt_Diag4ActualValue], [mt_Diag4NormalRange], [mt_DoctorComments], [mt_OtherInfo]) VALUES (1005, N'PT1002', N'DR1001', N'MD1001', CAST(N'2019-02-10' AS Date), CAST(N'2019-02-13' AS Date), CAST(5.40 AS Decimal(10, 2)), CAST(5.00 AS Decimal(10, 2)), CAST(0.02 AS Decimal(10, 2)), CAST(0.03 AS Decimal(10, 2)), CAST(6.03 AS Decimal(10, 2)), CAST(7.50 AS Decimal(10, 2)), CAST(6.75 AS Decimal(10, 2)), CAST(7.00 AS Decimal(10, 2)), N'Everything is normal', N'Follow up check not required')
GO
INSERT [dbo].[tblMedicalTestHistory] ([sno], [mt_pt_UserId], [mt_dr_UserId], [mt_md_MedicareServiceId], [mt_ServiceDate], [mt_TestResultDate], [mt_Diag1ActualValue], [mt_Diag1NormalRange], [mt_Diag2ActualValue], [mt_Diag2NormalRange], [mt_Diag3ActualValue], [mt_Diag3NormalRange], [mt_Diag4ActualValue], [mt_Diag4NormalRange], [mt_DoctorComments], [mt_OtherInfo]) VALUES (1006, N'PT1002', N'DR1001', N'MD1000', CAST(N'2019-02-10' AS Date), CAST(N'2019-02-13' AS Date), CAST(4.50 AS Decimal(10, 2)), CAST(5.00 AS Decimal(10, 2)), CAST(0.23 AS Decimal(10, 2)), CAST(0.03 AS Decimal(10, 2)), CAST(6.32 AS Decimal(10, 2)), CAST(6.75 AS Decimal(10, 2)), CAST(0.75 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), N'Everything is normal', N'Follow up check not required')
GO
INSERT [dbo].[tblMedicalTestHistory] ([sno], [mt_pt_UserId], [mt_dr_UserId], [mt_md_MedicareServiceId], [mt_ServiceDate], [mt_TestResultDate], [mt_Diag1ActualValue], [mt_Diag1NormalRange], [mt_Diag2ActualValue], [mt_Diag2NormalRange], [mt_Diag3ActualValue], [mt_Diag3NormalRange], [mt_Diag4ActualValue], [mt_Diag4NormalRange], [mt_DoctorComments], [mt_OtherInfo]) VALUES (1007, N'PT1003', N'DR1002', N'MD1000', CAST(N'2019-09-10' AS Date), CAST(N'2019-09-13' AS Date), CAST(4.50 AS Decimal(10, 2)), CAST(5.00 AS Decimal(10, 2)), CAST(0.23 AS Decimal(10, 2)), CAST(0.03 AS Decimal(10, 2)), CAST(6.32 AS Decimal(10, 2)), CAST(6.75 AS Decimal(10, 2)), CAST(0.75 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), N'Everything is normal', N'Follow up check not required')
GO
INSERT [dbo].[tblMedicalTestHistory] ([sno], [mt_pt_UserId], [mt_dr_UserId], [mt_md_MedicareServiceId], [mt_ServiceDate], [mt_TestResultDate], [mt_Diag1ActualValue], [mt_Diag1NormalRange], [mt_Diag2ActualValue], [mt_Diag2NormalRange], [mt_Diag3ActualValue], [mt_Diag3NormalRange], [mt_Diag4ActualValue], [mt_Diag4NormalRange], [mt_DoctorComments], [mt_OtherInfo]) VALUES (1008, N'PT1005', N'DR1002', N'MD1002', CAST(N'2019-09-10' AS Date), CAST(N'2019-09-13' AS Date), CAST(6.20 AS Decimal(10, 2)), CAST(5.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(0.03 AS Decimal(10, 2)), CAST(6.32 AS Decimal(10, 2)), CAST(6.75 AS Decimal(10, 2)), CAST(0.75 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), N'Medications prescribed', N'Follow up check required')
GO
SET IDENTITY_INSERT [dbo].[tblMedicalTestHistory] OFF
GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON
GO
SET IDENTITY_INSERT [dbo].[tblMedicare] ON 

GO
INSERT [dbo].[tblMedicare] ([s_no], [md_MedicareService], [md_ServiceDesp], [md_Amount]) VALUES (1000, N'Kidney Function Test', N'Test that checks the function of both Kidneys', 2000)
GO
INSERT [dbo].[tblMedicare] ([s_no], [md_MedicareService], [md_ServiceDesp], [md_Amount]) VALUES (1001, N'Liver Function Test1', N'Checks the function of the Liver', 500)
GO
INSERT [dbo].[tblMedicare] ([s_no], [md_MedicareService], [md_ServiceDesp], [md_Amount]) VALUES (1002, N'Blood Count Test', N'Test that checks the number of red blood cells and white blood cells', 5000)
GO
SET IDENTITY_INSERT [dbo].[tblMedicare] OFF
GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON
GO
SET IDENTITY_INSERT [dbo].[tblPatient] ON 

GO
INSERT [dbo].[tblPatient] ([sno], [pt_FirstName], [pt_LastName], [pt_Age], [pt_Gender], [pt_Dob], [pt_ContactNo], [pt_AltContactNo], [pt_Email], [pt_Password], [pt_Address1], [pt_Address2], [pt_City], [pt_State], [pt_Zipcode], [pt_Status]) VALUES (1002, N'Pranjal', N'Prasun', 22, N'Male', CAST(N'1996-07-27' AS Date), 9876543210, 5432198876, N'pranjal.prasun@gmail.com', N'pranjalpranjal', N'Flat # 314, 3rd Floor, Central Building', N'3rd Street, Velachery', N'Chennai', N'Tamil Nadu', 867543, 1)
GO
INSERT [dbo].[tblPatient] ([sno], [pt_FirstName], [pt_LastName], [pt_Age], [pt_Gender], [pt_Dob], [pt_ContactNo], [pt_AltContactNo], [pt_Email], [pt_Password], [pt_Address1], [pt_Address2], [pt_City], [pt_State], [pt_Zipcode], [pt_Status]) VALUES (1003, N'Sankari', N'M', 23, N'Female', CAST(N'1995-06-30' AS Date), 9876544510, 5432134876, N'sankari.m@gmail.com', N'sankarisankari', N'12th, 3rd Street', N'Thirunelveli Junction', N'Chennai', N'Tamil Nadu', 627543, 1)
GO
INSERT [dbo].[tblPatient] ([sno], [pt_FirstName], [pt_LastName], [pt_Age], [pt_Gender], [pt_Dob], [pt_ContactNo], [pt_AltContactNo], [pt_Email], [pt_Password], [pt_Address1], [pt_Address2], [pt_City], [pt_State], [pt_Zipcode], [pt_Status]) VALUES (1005, N'Sankariftu', N'M', 23, N'Female', CAST(N'1995-06-30' AS Date), 9876544510, 5432134876, N'sankari1.m@gmail.com', N'sankarisankari1', N'Flat # 314, 3rd Floor, Central Building', N'3rd Street, Velachery', N'Chennai', N'Tamil Nadu', 867543, 1)
GO
INSERT [dbo].[tblPatient] ([sno], [pt_FirstName], [pt_LastName], [pt_Age], [pt_Gender], [pt_Dob], [pt_ContactNo], [pt_AltContactNo], [pt_Email], [pt_Password], [pt_Address1], [pt_Address2], [pt_City], [pt_State], [pt_Zipcode], [pt_Status]) VALUES (1006, N'Sankariftu', N'M', 23, N'Female', CAST(N'1995-06-30' AS Date), 9876544510, 5432134876, N'sankari12.m@gmail.com', N'sankarisankari12', N'Flat # 314, 3rd Floor, Central Building', N'3rd Street, Velachery', N'Chennai', N'Tamil Nadu', 867543, 1)
GO
INSERT [dbo].[tblPatient] ([sno], [pt_FirstName], [pt_LastName], [pt_Age], [pt_Gender], [pt_Dob], [pt_ContactNo], [pt_AltContactNo], [pt_Email], [pt_Password], [pt_Address1], [pt_Address2], [pt_City], [pt_State], [pt_Zipcode], [pt_Status]) VALUES (1007, N'Nandu', N'S Raj', 22, N'Male', CAST(N'1997-11-30' AS Date), 9447565045, 9562829576, N'nandu.raj@gmail.com', N'nandunandu', N'Raj Nivas, Cheranallur', N'Edapally', N'Kochi', N'Kerala', 678234, 1)
GO
INSERT [dbo].[tblPatient] ([sno], [pt_FirstName], [pt_LastName], [pt_Age], [pt_Gender], [pt_Dob], [pt_ContactNo], [pt_AltContactNo], [pt_Email], [pt_Password], [pt_Address1], [pt_Address2], [pt_City], [pt_State], [pt_Zipcode], [pt_Status]) VALUES (1008, N'Monica', N'Eugene', 22, N'Female', CAST(N'2019-10-29' AS Date), 8289923080, 9207693164, N'monica@gmail.com', N'monicamonica', N'Philia tc 32/2', N'Tvm', N'Tvm', N'Kerala', 695021, 1)
GO
INSERT [dbo].[tblPatient] ([sno], [pt_FirstName], [pt_LastName], [pt_Age], [pt_Gender], [pt_Dob], [pt_ContactNo], [pt_AltContactNo], [pt_Email], [pt_Password], [pt_Address1], [pt_Address2], [pt_City], [pt_State], [pt_Zipcode], [pt_Status]) VALUES (1009, N'Samuel', N'George', 23, N'Male', CAST(N'2019-10-30' AS Date), 9876543210, 9876543210, N'samuel@gmail.com', N'samuelsamuel', N'Fern Icon', N'Vytilla', N'Kochi', N'Kochi', 123456, 1)
GO
INSERT [dbo].[tblPatient] ([sno], [pt_FirstName], [pt_LastName], [pt_Age], [pt_Gender], [pt_Dob], [pt_ContactNo], [pt_AltContactNo], [pt_Email], [pt_Password], [pt_Address1], [pt_Address2], [pt_City], [pt_State], [pt_Zipcode], [pt_Status]) VALUES (1012, N'Snowitta', N'George', 21, N'Female', CAST(N'2019-10-30' AS Date), 9876543210, 2345678901, N'snow@gmail.com', N'snowsnow', N'Fern Icon', N'Vytilla', N'Kochi', N'Kochi', 123456, 0)
GO
SET IDENTITY_INSERT [dbo].[tblPatient] OFF
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[tblAppointment]  WITH CHECK ADD  CONSTRAINT [ap_dr_FK] FOREIGN KEY([ap_dr_UserId])
REFERENCES [dbo].[tblDoctor] ([dr_UserId])
GO
ALTER TABLE [dbo].[tblAppointment] CHECK CONSTRAINT [ap_dr_FK]
GO
ALTER TABLE [dbo].[tblAppointment]  WITH CHECK ADD  CONSTRAINT [ap_md_FK] FOREIGN KEY([ap_md_MedicareServiceId])
REFERENCES [dbo].[tblMedicare] ([md_MedicareId])
GO
ALTER TABLE [dbo].[tblAppointment] CHECK CONSTRAINT [ap_md_FK]
GO
ALTER TABLE [dbo].[tblAppointment]  WITH CHECK ADD  CONSTRAINT [ap_pt_FK] FOREIGN KEY([ap_pt_UserId])
REFERENCES [dbo].[tblPatient] ([pt_UserId])
GO
ALTER TABLE [dbo].[tblAppointment] CHECK CONSTRAINT [ap_pt_FK]
GO
ALTER TABLE [dbo].[tblDoctor]  WITH CHECK ADD  CONSTRAINT [dr_md_FK] FOREIGN KEY([dr_md_MedicareServiceId])
REFERENCES [dbo].[tblMedicare] ([md_MedicareId])
GO
ALTER TABLE [dbo].[tblDoctor] CHECK CONSTRAINT [dr_md_FK]
GO
ALTER TABLE [dbo].[tblMedicalTestHistory]  WITH CHECK ADD  CONSTRAINT [mt_md_FK] FOREIGN KEY([mt_md_MedicareServiceId])
REFERENCES [dbo].[tblMedicare] ([md_MedicareId])
GO
ALTER TABLE [dbo].[tblMedicalTestHistory] CHECK CONSTRAINT [mt_md_FK]
GO
/****** Object:  StoredProcedure [dbo].[authenticateDoctor]    Script Date: 11/22/2019 4:17:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[authenticateDoctor] @username nvarchar(50), @password nvarchar(100)
as
	select s_no, dr_UserId, dr_FirstName, dr_LastName, dr_Age, dr_Gender, dr_Dob, dr_ContactNo, dr_AltContactNo, dr_Email,
	dr_Password, dr_Address1, dr_Address2, dr_City, dr_State, dr_Zipcode, dr_Degree, dr_Speciality, dr_WorkHours, dr_ClinicName, 
	dr_md_MedicareServiceId, dr_Status 
	from tblDoctor where dr_Email=@username and dr_Password=@password
GO
/****** Object:  StoredProcedure [dbo].[authenticatePatient]    Script Date: 11/22/2019 4:17:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[authenticatePatient] @username nvarchar(50), @password nvarchar(100)
as
	select sno, pt_UserId, pt_FirstName, pt_LastName, pt_Age, pt_Gender, pt_Dob, pt_ContactNo, pt_AltContactNo, pt_Email, pt_Password, pt_Address1, 
	pt_Address2, pt_City, pt_State, pt_Zipcode, pt_Status from tblPatient where pt_Email=@username and
	pt_Password=@password
GO
/****** Object:  StoredProcedure [dbo].[deleteAppointmentPatient]    Script Date: 11/22/2019 4:17:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[deleteAppointmentPatient] @AppointmentId nvarchar(14), @PtUserId nvarchar(12)
as
	delete from tblAppointment where ap_AppointmentId=@AppointmentId and ap_pt_UserId=@PtUserId
GO
/****** Object:  StoredProcedure [dbo].[getAllAppointments]    Script Date: 11/22/2019 4:17:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getAllAppointments]
as
	select [sno],[ap_AppointmentId],[ap_dr_UserId],[ap_md_MedicareServiceId],[ap_pt_UserId],[ap_Date],[ap_Time],[ap_Status] from tblAppointment

GO
/****** Object:  StoredProcedure [dbo].[getAllAppointmentsForPatient]    Script Date: 11/22/2019 4:17:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getAllAppointmentsForPatient] @PtUserId nvarchar(10)
as
	select [sno],[ap_AppointmentId],[ap_dr_UserId],[ap_md_MedicareServiceId],[ap_pt_UserId],[ap_Date],[ap_Time],[ap_Status] from tblAppointment where ap_pt_UserId=@PtUserId
GO
/****** Object:  StoredProcedure [dbo].[getAllMedicareServices]    Script Date: 11/22/2019 4:17:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[getAllMedicareServices]
as
	select s_no,md_MedicareId,md_MedicareService,md_ServiceDesp,md_Amount from tblMedicare
GO
/****** Object:  StoredProcedure [dbo].[getAllPatientDetails]    Script Date: 11/22/2019 4:17:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getAllPatientDetails]
as
select sno, pt_UserId, pt_FirstName, pt_LastName, pt_Age, pt_Gender, pt_Dob, pt_ContactNo, pt_AltContactNo, pt_Email, pt_Password, pt_Address1, 
	pt_Address2, pt_City, pt_State, pt_Zipcode, pt_Status from tblPatient where pt_Status=1

GO
/****** Object:  StoredProcedure [dbo].[getAllTestResults]    Script Date: 11/22/2019 4:17:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getAllTestResults]
as
	select [sno],[mt_ReportId],[mt_pt_UserId],[mt_dr_UserId],[mt_md_MedicareServiceId],[mt_ServiceDate],[mt_TestResultDate]
           ,[mt_Diag1ActualValue],[mt_Diag1NormalRange],[mt_Diag2ActualValue],[mt_Diag2NormalRange],[mt_Diag3ActualValue],
		   [mt_Diag3NormalRange],[mt_Diag4ActualValue],[mt_Diag4NormalRange],[mt_DoctorComments],[mt_OtherInfo]
	from tblMedicalTestHistory
GO
/****** Object:  StoredProcedure [dbo].[getAllTestResultsForPatient]    Script Date: 11/22/2019 4:17:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getAllTestResultsForPatient] @PtUserId nvarchar(12)
as
	select [sno],[mt_ReportId],[mt_pt_UserId],[mt_dr_UserId],[mt_md_MedicareServiceId],[mt_ServiceDate],[mt_TestResultDate]
           ,[mt_Diag1ActualValue],[mt_Diag1NormalRange],[mt_Diag2ActualValue],[mt_Diag2NormalRange],[mt_Diag3ActualValue],
		   [mt_Diag3NormalRange],[mt_Diag4ActualValue],[mt_Diag4NormalRange],[mt_DoctorComments],[mt_OtherInfo]
	from tblMedicalTestHistory where mt_pt_UserId=@PtUserId
GO
/****** Object:  StoredProcedure [dbo].[getAppointmentById]    Script Date: 11/22/2019 4:17:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getAppointmentById] @apId nvarchar(14)
as
	select sno,ap_AppointmentId,ap_dr_UserId,ap_md_MedicareServiceId,ap_pt_UserId,ap_Date,ap_Time,ap_Status from tblAppointment where ap_AppointmentId=@apId
GO
/****** Object:  StoredProcedure [dbo].[getAppointmentStatus]    Script Date: 11/22/2019 4:17:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getAppointmentStatus] @AppointmentID nvarchar(14)
as
	select * from tblAppointment where ap_AppointmentId=@AppointmentID
GO
/****** Object:  StoredProcedure [dbo].[getCorrespondingDoctors]    Script Date: 11/22/2019 4:17:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getCorrespondingDoctors] @medicareId nvarchar(11)
as 
select dr_FirstName,dr_UserId from tblDoctor inner join tblMedicare on dr_md_MedicareServiceId=@medicareId 
GO
/****** Object:  StoredProcedure [dbo].[getDoctorAppointments]    Script Date: 11/22/2019 4:17:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getDoctorAppointments] @drUserId nvarchar(12)
as
	select sno,ap_AppointmentId,ap_dr_UserId,ap_md_MedicareServiceId,ap_pt_UserId,ap_Date,ap_Time,ap_Status from tblAppointment where ap_dr_UserId=@drUserId
GO
/****** Object:  StoredProcedure [dbo].[getMedicareServiceById]    Script Date: 11/22/2019 4:17:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getMedicareServiceById] @MedicareId nvarchar(12)
as
	select s_no,md_MedicareId,md_MedicareService,md_ServiceDesp,md_Amount from tblMedicare where md_MedicareId=@MedicareId
GO
/****** Object:  StoredProcedure [dbo].[getMedicareServicesForDoc]    Script Date: 11/22/2019 4:17:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getMedicareServicesForDoc] @docId nvarchar(12)
as
	select tblMedicare.s_no,md_MedicareId,md_MedicareService,md_ServiceDesp,md_Amount from tblMedicare,tblDoctor where dr_UserId=@docId and dr_md_MedicareServiceId=md_MedicareId
GO
/****** Object:  StoredProcedure [dbo].[getPatientLoginDetails]    Script Date: 11/22/2019 4:17:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[getPatientLoginDetails]
as
select pt_UserId, pt_Password from tblPatient
GO
/****** Object:  StoredProcedure [dbo].[getTestResultsForDoc]    Script Date: 11/22/2019 4:17:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getTestResultsForDoc] @drId nvarchar(12)
as
	select sno, mt_ReportId, mt_pt_UserId, mt_dr_UserId, mt_md_MedicareServiceId, mt_ServiceDate,
	mt_TestResultDate, mt_Diag1ActualValue, mt_Diag1NormalRange, mt_Diag2ActualValue, mt_Diag2NormalRange, mt_Diag3ActualValue,
	mt_Diag3NormalRange, mt_Diag4ActualValue, mt_Diag4NormalRange, mt_DoctorComments, mt_OtherInfo from tblMedicalTestHistory 
	where mt_dr_UserId=@drId
GO
/****** Object:  StoredProcedure [dbo].[insertAppointment]    Script Date: 11/22/2019 4:17:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[insertAppointment] @DrUserId nvarchar(12), @MedicareServiceId nvarchar(12), @PtUserId nvarchar(12),
	@Date date, @Time time(7), @Status bit
	as
	INSERT INTO [dbo].[tblAppointment]
           ([ap_dr_UserId]
           ,[ap_md_MedicareServiceId]
           ,[ap_pt_UserId]
           ,[ap_Date]
           ,[ap_Time]
           ,[ap_Status])
     VALUES
           (@DrUserId
           ,@MedicareServiceId
           ,@PtUserId
           ,@Date
           ,@Time
           ,@Status)
GO
/****** Object:  StoredProcedure [dbo].[registerDoctor]    Script Date: 11/22/2019 4:17:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[registerDoctor] @FirstName nvarchar(10), @LastName nvarchar(10), @Age int, @Gender nvarchar(10), @Dob date, @ContactNo bigint,
	@AltContactNo bigint, @Email nvarchar(50), @Password varchar(100) , @Address1 nvarchar(100), @Address2 nvarchar(100), @City nvarchar(50),
	@State nvarchar(100), @Zipcode bigint, @Degree nvarchar(50), @Speciality nvarchar(50), @WorkHours nvarchar(10), @ClinicName nvarchar(50),
	@md_MedicareServiceId nvarchar(12), @Status bit

	as

	INSERT INTO [dbo].[tblDoctor]
           ([dr_FirstName]
           ,[dr_LastName]
           ,[dr_Age]
           ,[dr_Gender]
           ,[dr_Dob]
           ,[dr_ContactNo]
           ,[dr_AltContactNo]
           ,[dr_Email]
           ,[dr_Password]
           ,[dr_Address1]
           ,[dr_Address2]
           ,[dr_City]
           ,[dr_State]
           ,[dr_Zipcode]
           ,[dr_Degree]
           ,[dr_Speciality]
           ,[dr_WorkHours]
           ,[dr_ClinicName]
           ,[dr_md_MedicareServiceId]
           ,[dr_Status])
     VALUES
           (@FirstName
           ,@LastName
           ,@Age
           ,@Gender
           ,@Dob
           ,@ContactNo
           ,@AltContactNo
           ,@Email
           ,@Password
           ,@Address1
           ,@Address2
           ,@City
           ,@State
           ,@Zipcode
           ,@Degree
           ,@Speciality
           ,@WorkHours
           ,@ClinicName
           ,@md_MedicareServiceId
           ,@Status)
GO
/****** Object:  StoredProcedure [dbo].[registerPatientDetails]    Script Date: 11/22/2019 4:17:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[registerPatientDetails] @FirstName nvarchar(10), @LastName nvarchar(10), @Age int, @Gender nvarchar(10), @Dob date,
@ContactNo bigint, @AltContactNo bigint, @Email nvarchar(50), @Password nvarchar(100), @Address1 nvarchar(100), @Address2 nvarchar(100),
@City nvarchar(50), @State nvarchar(100), @Zipcode bigint, @Status bit
as
INSERT INTO [dbo].[tblPatient]
           ([pt_FirstName]
           ,[pt_LastName]
           ,[pt_Age]
           ,[pt_Gender]
           ,[pt_Dob]
           ,[pt_ContactNo]
           ,[pt_AltContactNo]
           ,[pt_Email]
           ,[pt_Password]
           ,[pt_Address1]
           ,[pt_Address2]
           ,[pt_City]
           ,[pt_State]
           ,[pt_Zipcode]
           ,[pt_Status])
     VALUES
           (@FirstName
           ,@LastName
           ,@Age
           ,@Gender
           ,@Dob
           ,@ContactNo
           ,@AltContactNo
           ,@Email
           ,@Password
           ,@Address1
           ,@Address2
           ,@City
           ,@State
           ,@Zipcode
           ,@Status)
GO
/****** Object:  StoredProcedure [dbo].[rejectAppointment]    Script Date: 11/22/2019 4:17:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[rejectAppointment] @apId nvarchar(14)
as
	delete from tblAppointment where ap_AppointmentId=@apId
GO
/****** Object:  StoredProcedure [dbo].[updateAppointment]    Script Date: 11/22/2019 4:17:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[updateAppointment] @AppointmentId nvarchar(14),@DrUserId nvarchar(12), @MedicareServiceId nvarchar(12), 
	@PtUserId nvarchar(12), @Date date, @Time time(7)
as
	update tblAppointment set ap_dr_UserId=@DrUserId, ap_md_MedicareServiceId=@MedicareServiceId,
		ap_Date =@Date,ap_Time=@Time where ap_AppointmentId=@AppointmentId and ap_pt_UserId=@PtUserId
GO
/****** Object:  StoredProcedure [dbo].[updateAppointmentStatus]    Script Date: 11/22/2019 4:17:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[updateAppointmentStatus] @apId nvarchar(14), @status bit
as
	update tblAppointment set ap_Status=@status where ap_AppointmentId=@apId
GO
/****** Object:  StoredProcedure [dbo].[updateMedicareService]    Script Date: 11/22/2019 4:17:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[updateMedicareService] @MedicareId nvarchar(12), @MedicareName nvarchar(50), @MedicareDescription nvarchar(100), @MedicareAmount bigint
as
	update tblMedicare set md_MedicareService=@MedicareName, md_ServiceDesp=@MedicareDescription, md_Amount=@MedicareAmount where md_MedicareId=@MedicareId
GO
USE [master]
GO
ALTER DATABASE [Medicare_System] SET  READ_WRITE 
GO
