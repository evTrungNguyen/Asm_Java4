USE [master]
GO
/****** Object:  Database [ASM_JAVA4]    Script Date: 17/8/2023 2:37:44 PM ******/
CREATE DATABASE [ASM_JAVA4]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ASM_JAVA4', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ASM_JAVA4.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ASM_JAVA4_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ASM_JAVA4_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ASM_JAVA4] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ASM_JAVA4].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ASM_JAVA4] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ASM_JAVA4] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ASM_JAVA4] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ASM_JAVA4] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ASM_JAVA4] SET ARITHABORT OFF 
GO
ALTER DATABASE [ASM_JAVA4] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ASM_JAVA4] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ASM_JAVA4] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ASM_JAVA4] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ASM_JAVA4] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ASM_JAVA4] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ASM_JAVA4] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ASM_JAVA4] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ASM_JAVA4] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ASM_JAVA4] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ASM_JAVA4] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ASM_JAVA4] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ASM_JAVA4] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ASM_JAVA4] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ASM_JAVA4] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ASM_JAVA4] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ASM_JAVA4] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ASM_JAVA4] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ASM_JAVA4] SET  MULTI_USER 
GO
ALTER DATABASE [ASM_JAVA4] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ASM_JAVA4] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ASM_JAVA4] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ASM_JAVA4] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ASM_JAVA4] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ASM_JAVA4] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ASM_JAVA4] SET QUERY_STORE = ON
GO
ALTER DATABASE [ASM_JAVA4] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ASM_JAVA4]
GO
/****** Object:  Table [dbo].[Favorites]    Script Date: 17/8/2023 2:37:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favorites](
	[FavoriteId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](20) NULL,
	[VideoId] [nvarchar](20) NULL,
	[LikedDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FavoriteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shares]    Script Date: 17/8/2023 2:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shares](
	[ShareId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](20) NULL,
	[VideoId] [nvarchar](20) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[SharedDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ShareId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 17/8/2023 2:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Username] [nvarchar](20) NOT NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](10) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Admin] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Videos]    Script Date: 17/8/2023 2:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Videos](
	[VideoId] [nvarchar](20) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Poster] [nvarchar](50) NOT NULL,
	[Views] [int] NOT NULL,
	[Description] [nvarchar](255) NULL,
	[Active] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[VideoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Favorites] ON 

INSERT [dbo].[Favorites] ([FavoriteId], [Username], [VideoId], [LikedDate]) VALUES (270, N'ngochan', N'3UQN_dgXsHA', CAST(N'2018-03-05' AS Date))
INSERT [dbo].[Favorites] ([FavoriteId], [Username], [VideoId], [LikedDate]) VALUES (271, N'hieunt', N'FUK2kdPsBws', CAST(N'2020-06-07' AS Date))
INSERT [dbo].[Favorites] ([FavoriteId], [Username], [VideoId], [LikedDate]) VALUES (272, N'trungnv', N'FUK2kdPsBws', CAST(N'2020-07-03' AS Date))
INSERT [dbo].[Favorites] ([FavoriteId], [Username], [VideoId], [LikedDate]) VALUES (273, N'pheonv', N'Go8nTmfrQd8', CAST(N'2020-04-06' AS Date))
INSERT [dbo].[Favorites] ([FavoriteId], [Username], [VideoId], [LikedDate]) VALUES (274, N'huongtit', N'33-KvBH_en8', CAST(N'2023-04-08' AS Date))
INSERT [dbo].[Favorites] ([FavoriteId], [Username], [VideoId], [LikedDate]) VALUES (275, N'teonv', N'TcMBFSGVi1c', CAST(N'2023-02-02' AS Date))
INSERT [dbo].[Favorites] ([FavoriteId], [Username], [VideoId], [LikedDate]) VALUES (276, N'cuonggia', N'WWWDskI46Js', CAST(N'2019-04-05' AS Date))
INSERT [dbo].[Favorites] ([FavoriteId], [Username], [VideoId], [LikedDate]) VALUES (277, N'database', N'XqLAexu4OOE', CAST(N'2023-04-08' AS Date))
INSERT [dbo].[Favorites] ([FavoriteId], [Username], [VideoId], [LikedDate]) VALUES (278, N'database', N'6ZfuNTqbHE8', CAST(N'2022-01-04' AS Date))
INSERT [dbo].[Favorites] ([FavoriteId], [Username], [VideoId], [LikedDate]) VALUES (279, N'vanchi22', N'o6fswdVdW9U', CAST(N'2021-05-02' AS Date))
INSERT [dbo].[Favorites] ([FavoriteId], [Username], [VideoId], [LikedDate]) VALUES (280, N'ngochan', N'WWWDskI46Js', CAST(N'2019-07-09' AS Date))
INSERT [dbo].[Favorites] ([FavoriteId], [Username], [VideoId], [LikedDate]) VALUES (281, N'vanchi22', N'33-KvBH_en8', CAST(N'2023-04-08' AS Date))
INSERT [dbo].[Favorites] ([FavoriteId], [Username], [VideoId], [LikedDate]) VALUES (282, N'huongtit', N'o6fswdVdW9U', CAST(N'2021-03-01' AS Date))
INSERT [dbo].[Favorites] ([FavoriteId], [Username], [VideoId], [LikedDate]) VALUES (283, N'nopt', N'dYDGqmxMZFI', CAST(N'2022-12-02' AS Date))
INSERT [dbo].[Favorites] ([FavoriteId], [Username], [VideoId], [LikedDate]) VALUES (284, N'teonv', N'dYDGqmxMZFI', CAST(N'2023-03-02' AS Date))
INSERT [dbo].[Favorites] ([FavoriteId], [Username], [VideoId], [LikedDate]) VALUES (285, N'teonv', N'o6fswdVdW9U', CAST(N'2023-04-02' AS Date))
INSERT [dbo].[Favorites] ([FavoriteId], [Username], [VideoId], [LikedDate]) VALUES (286, N'teonv', N'WWWDskI46Js', CAST(N'2023-01-02' AS Date))
INSERT [dbo].[Favorites] ([FavoriteId], [Username], [VideoId], [LikedDate]) VALUES (287, N'teonv', N'XqLAexu4OOE', CAST(N'2023-02-12' AS Date))
INSERT [dbo].[Favorites] ([FavoriteId], [Username], [VideoId], [LikedDate]) VALUES (288, N'teonv', N'3UQN_dgXsHA', CAST(N'2023-02-22' AS Date))
INSERT [dbo].[Favorites] ([FavoriteId], [Username], [VideoId], [LikedDate]) VALUES (289, N'teonv', N'Go8nTmfrQd8', CAST(N'2023-02-03' AS Date))
INSERT [dbo].[Favorites] ([FavoriteId], [Username], [VideoId], [LikedDate]) VALUES (290, N'teonv', N'33-KvBH_en8', CAST(N'2023-02-05' AS Date))
INSERT [dbo].[Favorites] ([FavoriteId], [Username], [VideoId], [LikedDate]) VALUES (291, N'teonv', N'6ZfuNTqbHE8', CAST(N'2023-02-07' AS Date))
INSERT [dbo].[Favorites] ([FavoriteId], [Username], [VideoId], [LikedDate]) VALUES (293, N'q', N'o6fswdVdW9U', CAST(N'2023-02-09' AS Date))
INSERT [dbo].[Favorites] ([FavoriteId], [Username], [VideoId], [LikedDate]) VALUES (294, N'q', N'WWWDskI46Js', CAST(N'2023-02-03' AS Date))
INSERT [dbo].[Favorites] ([FavoriteId], [Username], [VideoId], [LikedDate]) VALUES (295, N'q', N'XqLAexu4OOE', CAST(N'2023-02-01' AS Date))
INSERT [dbo].[Favorites] ([FavoriteId], [Username], [VideoId], [LikedDate]) VALUES (296, N'q', N'3UQN_dgXsHA', CAST(N'2023-02-04' AS Date))
INSERT [dbo].[Favorites] ([FavoriteId], [Username], [VideoId], [LikedDate]) VALUES (297, N'q', N'Go8nTmfrQd8', CAST(N'2023-02-05' AS Date))
INSERT [dbo].[Favorites] ([FavoriteId], [Username], [VideoId], [LikedDate]) VALUES (298, N'q', N'33-KvBH_en8', CAST(N'2023-02-06' AS Date))
INSERT [dbo].[Favorites] ([FavoriteId], [Username], [VideoId], [LikedDate]) VALUES (299, N'q', N'6ZfuNTqbHE8', CAST(N'2023-02-07' AS Date))
INSERT [dbo].[Favorites] ([FavoriteId], [Username], [VideoId], [LikedDate]) VALUES (309, N'ad1', N'33-KvBH_en8', CAST(N'2023-04-10' AS Date))
SET IDENTITY_INSERT [dbo].[Favorites] OFF
GO
SET IDENTITY_INSERT [dbo].[Shares] ON 

INSERT [dbo].[Shares] ([ShareId], [Username], [VideoId], [Email], [SharedDate]) VALUES (1, N'database', N'XqLAexu4OOE', N'abc@gmail.com', CAST(N'2023-04-01' AS Date))
INSERT [dbo].[Shares] ([ShareId], [Username], [VideoId], [Email], [SharedDate]) VALUES (2, N'database', N'6ZfuNTqbHE8', N'abc@gmail.com', CAST(N'2022-01-04' AS Date))
INSERT [dbo].[Shares] ([ShareId], [Username], [VideoId], [Email], [SharedDate]) VALUES (3, N'vanchi22', N'o6fswdVdW9U', N'abc@gmail.com', CAST(N'2021-05-02' AS Date))
INSERT [dbo].[Shares] ([ShareId], [Username], [VideoId], [Email], [SharedDate]) VALUES (4, N'huongtit', N'33-KvBH_en8', N'abc@gmail.com', CAST(N'2023-04-01' AS Date))
INSERT [dbo].[Shares] ([ShareId], [Username], [VideoId], [Email], [SharedDate]) VALUES (5, N'teonv', N'TcMBFSGVi1c', N'abc@gmail.com', CAST(N'2023-02-02' AS Date))
INSERT [dbo].[Shares] ([ShareId], [Username], [VideoId], [Email], [SharedDate]) VALUES (6, N'cuonggia', N'WWWDskI46Js', N'abc@gmail.com', CAST(N'2019-04-05' AS Date))
INSERT [dbo].[Shares] ([ShareId], [Username], [VideoId], [Email], [SharedDate]) VALUES (7, N'trungnv', N'FUK2kdPsBws', N'abc@gmail.com', CAST(N'2020-07-03' AS Date))
INSERT [dbo].[Shares] ([ShareId], [Username], [VideoId], [Email], [SharedDate]) VALUES (8, N'pheonv', N'Go8nTmfrQd8', N'abc@gmail.com', CAST(N'2020-04-06' AS Date))
INSERT [dbo].[Shares] ([ShareId], [Username], [VideoId], [Email], [SharedDate]) VALUES (9, N'huongtit', N'o6fswdVdW9U', N'abc@gmail.com', CAST(N'2021-03-01' AS Date))
INSERT [dbo].[Shares] ([ShareId], [Username], [VideoId], [Email], [SharedDate]) VALUES (10, N'nopt', N'dYDGqmxMZFI', N'abc@gmail.com', CAST(N'2022-12-02' AS Date))
INSERT [dbo].[Shares] ([ShareId], [Username], [VideoId], [Email], [SharedDate]) VALUES (11, N'ngochan', N'WWWDskI46Js', N'abc@gmail.com', CAST(N'2019-07-09' AS Date))
INSERT [dbo].[Shares] ([ShareId], [Username], [VideoId], [Email], [SharedDate]) VALUES (12, N'vanchi22', N'33-KvBH_en8', N'abc@gmail.com', CAST(N'2023-04-01' AS Date))
INSERT [dbo].[Shares] ([ShareId], [Username], [VideoId], [Email], [SharedDate]) VALUES (13, N'ngochan', N'3UQN_dgXsHA', N'abc@gmail.com', CAST(N'2018-03-05' AS Date))
INSERT [dbo].[Shares] ([ShareId], [Username], [VideoId], [Email], [SharedDate]) VALUES (14, N'hieunt', N'FUK2kdPsBws', N'abc@gmail.com', CAST(N'2020-06-07' AS Date))
INSERT [dbo].[Shares] ([ShareId], [Username], [VideoId], [Email], [SharedDate]) VALUES (18, N'q', NULL, N'nguyentrung259991@gmail.com', CAST(N'2023-04-09' AS Date))
INSERT [dbo].[Shares] ([ShareId], [Username], [VideoId], [Email], [SharedDate]) VALUES (19, N'q', NULL, N'nguyentrung1999@gmail.com', CAST(N'2023-04-09' AS Date))
INSERT [dbo].[Shares] ([ShareId], [Username], [VideoId], [Email], [SharedDate]) VALUES (20, N'q', NULL, N'nguyentrung251999@gmail.com', CAST(N'2023-04-09' AS Date))
INSERT [dbo].[Shares] ([ShareId], [Username], [VideoId], [Email], [SharedDate]) VALUES (21, N'q', NULL, N'ev.trungnguyen@gmail.com', CAST(N'2023-04-09' AS Date))
SET IDENTITY_INSERT [dbo].[Shares] OFF
GO
INSERT [dbo].[Users] ([Username], [Fullname], [Password], [Email], [Admin]) VALUES (N'ad1', N'Thanh Tung', N'123', N'ab2@gmail.com', 0)
INSERT [dbo].[Users] ([Username], [Fullname], [Password], [Email], [Admin]) VALUES (N'cuonggia', N'Tran Cuong', N'1357909', N'cunggia@gmail.com', 0)
INSERT [dbo].[Users] ([Username], [Fullname], [Password], [Email], [Admin]) VALUES (N'database', N'Hai Dang', N'sqlserver', N'email@gmail.com', 0)
INSERT [dbo].[Users] ([Username], [Fullname], [Password], [Email], [Admin]) VALUES (N'hieunt', N'Nguyen Trong Hieu', N'prodata', N'hieunt@fpt.edu.vn', 0)
INSERT [dbo].[Users] ([Username], [Fullname], [Password], [Email], [Admin]) VALUES (N'huongtit', N'Khúc Thị Hương', N'xyz', N'huong@fpt.edu.vn', 0)
INSERT [dbo].[Users] ([Username], [Fullname], [Password], [Email], [Admin]) VALUES (N'ngochan', N'Ngoc Han', N'12345', N'hanngoc@gmail.com', 0)
INSERT [dbo].[Users] ([Username], [Fullname], [Password], [Email], [Admin]) VALUES (N'nopt', N'Phạm Thị Nở', N'abc', N'nopt123@gmail.com', 0)
INSERT [dbo].[Users] ([Username], [Fullname], [Password], [Email], [Admin]) VALUES (N'pheonv', N'Chi Pheo', N'123456', N'pheonv@gmail.com', 0)
INSERT [dbo].[Users] ([Username], [Fullname], [Password], [Email], [Admin]) VALUES (N'q', N'hân á', N'123', N'nwl.abc@gmail.com', 1)
INSERT [dbo].[Users] ([Username], [Fullname], [Password], [Email], [Admin]) VALUES (N'teonv', N'Nguyễn Văn Tèo', N'123', N'teonv@gmail.com', 1)
INSERT [dbo].[Users] ([Username], [Fullname], [Password], [Email], [Admin]) VALUES (N'trungnv', N'Trung Nguyen', N'123', N'trungnv@gmail.com', 0)
INSERT [dbo].[Users] ([Username], [Fullname], [Password], [Email], [Admin]) VALUES (N'vanchi22', N'Le Van', N'chi001', N'chixink@gmail.com', 0)
GO
INSERT [dbo].[Videos] ([VideoId], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'33-KvBH_en8', N'IRON MAN', N'ironman.jpg', 0, N'Robert Downey Jr aka Iron Man build an iron suit to protect the world war', 0)
INSERT [dbo].[Videos] ([VideoId], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'3UQN_dgXsHA', N'Moon: Return of nobody', N'moon.jpg', 0, N'Adventure of astronauts', 1)
INSERT [dbo].[Videos] ([VideoId], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'6ZfuNTqbHE8', N'Medora', N'medora.jpg', 0, N'Daily life after the biggest disaster', 1)
INSERT [dbo].[Videos] ([VideoId], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'dYDGqmxMZFI', N'Jurassic Park', N'jurassicpark.jpg', 0, N'Animal from the past revive one more time', 1)
INSERT [dbo].[Videos] ([VideoId], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'FUK2kdPsBws', N'Jaws', N'jaws.jpg', 0, N'under blue sea, what things waiting them', 1)
INSERT [dbo].[Videos] ([VideoId], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'Go8nTmfrQd8', N'Star War', N'starwars.jpg', 0, N'The world have came to the end with massive war between stars', 1)
INSERT [dbo].[Videos] ([VideoId], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'o6fswdVdW9U', N'Batman', N'batman.jpg', 0, N'No parents, no problem', 1)
INSERT [dbo].[Videos] ([VideoId], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'TcMBFSGVi1c', N'Ant Man', N'antman.jpg', 0, N'Human can turn small as an ant, is it possible', 1)
INSERT [dbo].[Videos] ([VideoId], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'WWWDskI46Js', N'Joker', N'joker.jpg', 0, N'Begin of the evil clown', 1)
INSERT [dbo].[Videos] ([VideoId], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'XqLAexu4OOE', N'Project Power', N'projectpower.jpg', 0, N'what will happend if human got superpower', 1)
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0)) FOR [Admin]
GO
ALTER TABLE [dbo].[Videos] ADD  DEFAULT ((0)) FOR [Views]
GO
ALTER TABLE [dbo].[Videos] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD FOREIGN KEY([Username])
REFERENCES [dbo].[Users] ([Username])
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD FOREIGN KEY([VideoId])
REFERENCES [dbo].[Videos] ([VideoId])
GO
ALTER TABLE [dbo].[Shares]  WITH CHECK ADD FOREIGN KEY([Username])
REFERENCES [dbo].[Users] ([Username])
GO
ALTER TABLE [dbo].[Shares]  WITH CHECK ADD FOREIGN KEY([VideoId])
REFERENCES [dbo].[Videos] ([VideoId])
GO
USE [master]
GO
ALTER DATABASE [ASM_JAVA4] SET  READ_WRITE 
GO
