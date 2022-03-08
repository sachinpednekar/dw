USE [master]
GO
/****** Object:  Database [Share]    Script Date: 09-03-2022 02:07:27 ******/
CREATE DATABASE [Share]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Share', FILENAME = N'B:\SQLserverDATA\Share.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Share_log', FILENAME = N'B:\SQLserverDATA\Share_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Share] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Share].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Share] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Share] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Share] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Share] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Share] SET ARITHABORT OFF 
GO
ALTER DATABASE [Share] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Share] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Share] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Share] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Share] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Share] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Share] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Share] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Share] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Share] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Share] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Share] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Share] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Share] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Share] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Share] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Share] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Share] SET RECOVERY FULL 
GO
ALTER DATABASE [Share] SET  MULTI_USER 
GO
ALTER DATABASE [Share] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Share] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Share] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Share] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Share] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Share] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Share', N'ON'
GO
ALTER DATABASE [Share] SET QUERY_STORE = OFF
GO
USE [Share]
GO
/****** Object:  Table [dbo].[ActivityMaster]    Script Date: 09-03-2022 02:07:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivityMaster](
	[ActivityID] [numeric](18, 0) NULL,
	[ActivityDescription] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fav]    Script Date: 09-03-2022 02:07:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fav](
	[FavID] [numeric](18, 0) NULL,
	[UserID] [numeric](18, 0) NULL,
	[FolderID] [numeric](18, 0) NULL,
	[DocumentID] [nvarchar](50) NULL,
	[FavAddDate] [datetime] NULL,
	[FavRemoveDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Folder]    Script Date: 09-03-2022 02:07:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Folder](
	[FolderID] [numeric](18, 0) NULL,
	[FolderName] [nvarchar](50) NULL,
	[ParentFolder] [numeric](18, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FolderRank]    Script Date: 09-03-2022 02:07:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FolderRank](
	[FolderID] [numeric](18, 0) NULL,
	[UserID] [numeric](18, 0) NULL,
	[Rank] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleActivityPermission]    Script Date: 09-03-2022 02:07:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleActivityPermission](
	[RoleID] [numeric](18, 0) NULL,
	[RoleName] [nvarchar](50) NULL,
	[RoleActivityID] [numeric](18, 0) NULL,
	[Permission] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleFeaturePermission]    Script Date: 09-03-2022 02:07:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleFeaturePermission](
	[RoleID] [numeric](18, 0) NULL,
	[FeatureName] [nvarchar](50) NULL,
	[Permission] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleMaster]    Script Date: 09-03-2022 02:07:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleMaster](
	[RoleID] [numeric](18, 0) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Share]    Script Date: 09-03-2022 02:07:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Share](
	[SharedID] [numeric](18, 0) NULL,
	[SharedByUserID] [numeric](18, 0) NULL,
	[SharedToUserID] [numeric](18, 0) NULL,
	[SharedFolderID] [numeric](18, 0) NULL,
	[SharedDate] [datetime] NULL,
	[SharedMessage] [nvarchar](500) NULL,
	[RolePrevious] [nvarchar](50) NULL,
	[RoleNew] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserActivityonFolder]    Script Date: 09-03-2022 02:07:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserActivityonFolder](
	[FolderID] [numeric](18, 0) NULL,
	[UserID] [numeric](18, 0) NULL,
	[ActivityID] [numeric](18, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 09-03-2022 02:07:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [numeric](18, 0) NULL,
	[UserName] [nvarchar](50) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[ActivityMaster] ([ActivityID], [ActivityDescription]) VALUES (CAST(10 AS Numeric(18, 0)), N'Share Folder')
GO
INSERT [dbo].[ActivityMaster] ([ActivityID], [ActivityDescription]) VALUES (CAST(20 AS Numeric(18, 0)), N'Upgrade Role')
GO
INSERT [dbo].[ActivityMaster] ([ActivityID], [ActivityDescription]) VALUES (CAST(30 AS Numeric(18, 0)), N'Downgrade Role')
GO
INSERT [dbo].[ActivityMaster] ([ActivityID], [ActivityDescription]) VALUES (CAST(40 AS Numeric(18, 0)), N'Rename Folder')
GO
INSERT [dbo].[ActivityMaster] ([ActivityID], [ActivityDescription]) VALUES (CAST(50 AS Numeric(18, 0)), N'Add Subfolder')
GO
INSERT [dbo].[Fav] ([FavID], [UserID], [FolderID], [DocumentID], [FavAddDate], [FavRemoveDate]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'1', CAST(N'2022-03-01T10:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Fav] ([FavID], [UserID], [FolderID], [DocumentID], [FavAddDate], [FavRemoveDate]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'2', CAST(N'2022-03-02T11:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Folder] ([FolderID], [FolderName], [ParentFolder]) VALUES (CAST(1 AS Numeric(18, 0)), N'Folder1', NULL)
GO
INSERT [dbo].[Folder] ([FolderID], [FolderName], [ParentFolder]) VALUES (CAST(2 AS Numeric(18, 0)), N'Folder11', CAST(1 AS Numeric(18, 0)))
GO
INSERT [dbo].[Folder] ([FolderID], [FolderName], [ParentFolder]) VALUES (CAST(3 AS Numeric(18, 0)), N'Folder12', CAST(1 AS Numeric(18, 0)))
GO
INSERT [dbo].[Folder] ([FolderID], [FolderName], [ParentFolder]) VALUES (CAST(4 AS Numeric(18, 0)), N'Folder13', CAST(1 AS Numeric(18, 0)))
GO
INSERT [dbo].[Folder] ([FolderID], [FolderName], [ParentFolder]) VALUES (CAST(5 AS Numeric(18, 0)), N'Folder2', NULL)
GO
INSERT [dbo].[Folder] ([FolderID], [FolderName], [ParentFolder]) VALUES (CAST(6 AS Numeric(18, 0)), N'Folder21', CAST(2 AS Numeric(18, 0)))
GO
INSERT [dbo].[Folder] ([FolderID], [FolderName], [ParentFolder]) VALUES (CAST(7 AS Numeric(18, 0)), N'Folder22', CAST(2 AS Numeric(18, 0)))
GO
INSERT [dbo].[Folder] ([FolderID], [FolderName], [ParentFolder]) VALUES (CAST(8 AS Numeric(18, 0)), N'Folder3', NULL)
GO
INSERT [dbo].[Folder] ([FolderID], [FolderName], [ParentFolder]) VALUES (CAST(9 AS Numeric(18, 0)), N'Folder4', NULL)
GO
INSERT [dbo].[Folder] ([FolderID], [FolderName], [ParentFolder]) VALUES (CAST(10 AS Numeric(18, 0)), N'Folder41', CAST(4 AS Numeric(18, 0)))
GO
INSERT [dbo].[RoleMaster] ([RoleID], [RoleName]) VALUES (CAST(1 AS Numeric(18, 0)), N'Folder Manager')
GO
INSERT [dbo].[RoleMaster] ([RoleID], [RoleName]) VALUES (CAST(2 AS Numeric(18, 0)), N'Content Manager')
GO
INSERT [dbo].[RoleMaster] ([RoleID], [RoleName]) VALUES (CAST(3 AS Numeric(18, 0)), N'Contributor')
GO
INSERT [dbo].[RoleMaster] ([RoleID], [RoleName]) VALUES (CAST(4 AS Numeric(18, 0)), N'Viewer')
GO
INSERT [dbo].[Share] ([SharedID], [SharedByUserID], [SharedToUserID], [SharedFolderID], [SharedDate], [SharedMessage], [RolePrevious], [RoleNew]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), NULL, N'User2 is now FolderManager for Folder 1', NULL, N'FolderManager')
GO
INSERT [dbo].[Share] ([SharedID], [SharedByUserID], [SharedToUserID], [SharedFolderID], [SharedDate], [SharedMessage], [RolePrevious], [RoleNew]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), NULL, N'User2 has provide user3 Content Manager Permission', NULL, N'Content Manager')
GO
INSERT [dbo].[Share] ([SharedID], [SharedByUserID], [SharedToUserID], [SharedFolderID], [SharedDate], [SharedMessage], [RolePrevious], [RoleNew]) VALUES (CAST(3 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), NULL, N'User1 downgraded permissions to user3 from CM to Viewer', N'Content Manger', N'Viewer')
GO
INSERT [dbo].[Users] ([UserID], [UserName]) VALUES (CAST(1 AS Numeric(18, 0)), N'User1')
GO
INSERT [dbo].[Users] ([UserID], [UserName]) VALUES (CAST(2 AS Numeric(18, 0)), N'User2')
GO
INSERT [dbo].[Users] ([UserID], [UserName]) VALUES (CAST(3 AS Numeric(18, 0)), N'User3')
GO
INSERT [dbo].[Users] ([UserID], [UserName]) VALUES (CAST(4 AS Numeric(18, 0)), N'User4')
GO
INSERT [dbo].[Users] ([UserID], [UserName]) VALUES (CAST(5 AS Numeric(18, 0)), N'User5')
GO
INSERT [dbo].[Users] ([UserID], [UserName]) VALUES (CAST(6 AS Numeric(18, 0)), N'User6')
GO
INSERT [dbo].[Users] ([UserID], [UserName]) VALUES (CAST(7 AS Numeric(18, 0)), N'User7')
GO
INSERT [dbo].[Users] ([UserID], [UserName]) VALUES (CAST(8 AS Numeric(18, 0)), N'User8')
GO
INSERT [dbo].[Users] ([UserID], [UserName]) VALUES (CAST(9 AS Numeric(18, 0)), N'User9')
GO
INSERT [dbo].[Users] ([UserID], [UserName]) VALUES (CAST(10 AS Numeric(18, 0)), N'User10')
GO
USE [master]
GO
ALTER DATABASE [Share] SET  READ_WRITE 
GO
