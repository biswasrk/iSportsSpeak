USE [master]
GO
/****** Object:  Database [ISportsSpeak]    Script Date: 02/12/2011 08:56:02 ******/
CREATE DATABASE [ISportsSpeak] ON  PRIMARY 
( NAME = N'IBlogSports', FILENAME = N'c:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.SQLSERVER\MSSQL\DATA\IBlogSports.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'IBlogSports_log', FILENAME = N'c:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.SQLSERVER\MSSQL\DATA\IBlogSports_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ISportsSpeak] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ISportsSpeak].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ISportsSpeak] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [ISportsSpeak] SET ANSI_NULLS OFF
GO
ALTER DATABASE [ISportsSpeak] SET ANSI_PADDING OFF
GO
ALTER DATABASE [ISportsSpeak] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [ISportsSpeak] SET ARITHABORT OFF
GO
ALTER DATABASE [ISportsSpeak] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [ISportsSpeak] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [ISportsSpeak] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [ISportsSpeak] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [ISportsSpeak] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [ISportsSpeak] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [ISportsSpeak] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [ISportsSpeak] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [ISportsSpeak] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [ISportsSpeak] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [ISportsSpeak] SET  DISABLE_BROKER
GO
ALTER DATABASE [ISportsSpeak] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [ISportsSpeak] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [ISportsSpeak] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [ISportsSpeak] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [ISportsSpeak] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [ISportsSpeak] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [ISportsSpeak] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [ISportsSpeak] SET  READ_WRITE
GO
ALTER DATABASE [ISportsSpeak] SET RECOVERY SIMPLE
GO
ALTER DATABASE [ISportsSpeak] SET  MULTI_USER
GO
ALTER DATABASE [ISportsSpeak] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [ISportsSpeak] SET DB_CHAINING OFF
GO
USE [ISportsSpeak]
GO
/****** Object:  Table [dbo].[BlogType]    Script Date: 02/12/2011 08:56:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlogType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](10) NULL,
 CONSTRAINT [PK_BlogType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 02/12/2011 08:56:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[security_question] [nvarchar](100) NULL,
	[security_answer] [nvarchar](30) NULL,
	[created_date] [datetime] NOT NULL,
	[last_login_date] [datetime] NULL,
	[ip_address] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SportsType]    Script Date: 02/12/2011 08:56:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SportsType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NOT NULL,
	[description] [nvarchar](200) NULL,
 CONSTRAINT [PK_SportsType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 02/12/2011 08:56:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[description] [nvarchar](100) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profile]    Script Date: 02/12/2011 08:56:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profile](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[dob] [datetime] NULL,
	[Image] [image] NULL,
 CONSTRAINT [PK_Profile] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlogEntry]    Script Date: 02/12/2011 08:56:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlogEntry](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[blog_title] [nvarchar](50) NULL,
	[blog_description] [nvarchar](4000) NULL,
	[blog_date] [datetime] NULL,
	[sports_type_id] [int] NULL,
 CONSTRAINT [PK_BlogEntry] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Role]    Script Date: 02/12/2011 08:56:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[role_id] [int] NULL,
 CONSTRAINT [PK_User_Role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlogFeedback]    Script Date: 02/12/2011 08:56:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlogFeedback](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[blog_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[feedback_title] [nvarchar](50) NULL,
	[feedback_description] [nvarchar](4000) NULL,
	[feedback_date] [datetime] NOT NULL,
 CONSTRAINT [PK_BlogFeedback] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlogRate]    Script Date: 02/12/2011 08:56:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlogRate](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[blog_id] [int] NULL,
	[user_id] [int] NULL,
	[rate_date] [datetime] NULL,
	[rate_value] [int] NULL,
	[blog_type_id] [int] NULL,
 CONSTRAINT [PK_BlogRate] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlogMedia]    Script Date: 02/12/2011 08:56:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlogMedia](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[blog_id] [int] NULL,
	[image] [image] NULL,
	[image_date] [datetime] NULL,
	[image_type] [nvarchar](50) NULL,
	[image_length] [int] NULL,
	[blog_type_id] [int] NULL,
 CONSTRAINT [PK_BlogMedia] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_Profile_Profile1]    Script Date: 02/12/2011 08:56:04 ******/
ALTER TABLE [dbo].[Profile]  WITH CHECK ADD  CONSTRAINT [FK_Profile_Profile1] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Profile] CHECK CONSTRAINT [FK_Profile_Profile1]
GO
/****** Object:  ForeignKey [FK_BlogEntry_SportsType]    Script Date: 02/12/2011 08:56:04 ******/
ALTER TABLE [dbo].[BlogEntry]  WITH CHECK ADD  CONSTRAINT [FK_BlogEntry_SportsType] FOREIGN KEY([sports_type_id])
REFERENCES [dbo].[SportsType] ([id])
GO
ALTER TABLE [dbo].[BlogEntry] CHECK CONSTRAINT [FK_BlogEntry_SportsType]
GO
/****** Object:  ForeignKey [FK_BlogEntry_User]    Script Date: 02/12/2011 08:56:04 ******/
ALTER TABLE [dbo].[BlogEntry]  WITH CHECK ADD  CONSTRAINT [FK_BlogEntry_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[BlogEntry] CHECK CONSTRAINT [FK_BlogEntry_User]
GO
/****** Object:  ForeignKey [FK_User_Role_Role]    Script Date: 02/12/2011 08:56:04 ******/
ALTER TABLE [dbo].[User_Role]  WITH CHECK ADD  CONSTRAINT [FK_User_Role_Role] FOREIGN KEY([role_id])
REFERENCES [dbo].[Role] ([id])
GO
ALTER TABLE [dbo].[User_Role] CHECK CONSTRAINT [FK_User_Role_Role]
GO
/****** Object:  ForeignKey [FK_User_Role_User]    Script Date: 02/12/2011 08:56:04 ******/
ALTER TABLE [dbo].[User_Role]  WITH CHECK ADD  CONSTRAINT [FK_User_Role_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[User_Role] CHECK CONSTRAINT [FK_User_Role_User]
GO
/****** Object:  ForeignKey [FK_BlogFeedback_BlogEntry]    Script Date: 02/12/2011 08:56:04 ******/
ALTER TABLE [dbo].[BlogFeedback]  WITH CHECK ADD  CONSTRAINT [FK_BlogFeedback_BlogEntry] FOREIGN KEY([blog_id])
REFERENCES [dbo].[BlogEntry] ([id])
GO
ALTER TABLE [dbo].[BlogFeedback] CHECK CONSTRAINT [FK_BlogFeedback_BlogEntry]
GO
/****** Object:  ForeignKey [FK_BlogFeedback_User]    Script Date: 02/12/2011 08:56:04 ******/
ALTER TABLE [dbo].[BlogFeedback]  WITH CHECK ADD  CONSTRAINT [FK_BlogFeedback_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[BlogFeedback] CHECK CONSTRAINT [FK_BlogFeedback_User]
GO
/****** Object:  ForeignKey [FK_BlogRate_BlogEntry]    Script Date: 02/12/2011 08:56:04 ******/
ALTER TABLE [dbo].[BlogRate]  WITH CHECK ADD  CONSTRAINT [FK_BlogRate_BlogEntry] FOREIGN KEY([blog_id])
REFERENCES [dbo].[BlogEntry] ([id])
GO
ALTER TABLE [dbo].[BlogRate] CHECK CONSTRAINT [FK_BlogRate_BlogEntry]
GO
/****** Object:  ForeignKey [FK_BlogRate_BlogFeedback]    Script Date: 02/12/2011 08:56:04 ******/
ALTER TABLE [dbo].[BlogRate]  WITH CHECK ADD  CONSTRAINT [FK_BlogRate_BlogFeedback] FOREIGN KEY([blog_id])
REFERENCES [dbo].[BlogFeedback] ([id])
GO
ALTER TABLE [dbo].[BlogRate] CHECK CONSTRAINT [FK_BlogRate_BlogFeedback]
GO
/****** Object:  ForeignKey [FK_BlogRate_BlogType]    Script Date: 02/12/2011 08:56:04 ******/
ALTER TABLE [dbo].[BlogRate]  WITH CHECK ADD  CONSTRAINT [FK_BlogRate_BlogType] FOREIGN KEY([blog_type_id])
REFERENCES [dbo].[BlogType] ([id])
GO
ALTER TABLE [dbo].[BlogRate] CHECK CONSTRAINT [FK_BlogRate_BlogType]
GO
/****** Object:  ForeignKey [FK_BlogRate_User]    Script Date: 02/12/2011 08:56:04 ******/
ALTER TABLE [dbo].[BlogRate]  WITH CHECK ADD  CONSTRAINT [FK_BlogRate_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[BlogRate] CHECK CONSTRAINT [FK_BlogRate_User]
GO
/****** Object:  ForeignKey [FK_BlogMedia_BlogEntry]    Script Date: 02/12/2011 08:56:04 ******/
ALTER TABLE [dbo].[BlogMedia]  WITH CHECK ADD  CONSTRAINT [FK_BlogMedia_BlogEntry] FOREIGN KEY([blog_id])
REFERENCES [dbo].[BlogEntry] ([id])
GO
ALTER TABLE [dbo].[BlogMedia] CHECK CONSTRAINT [FK_BlogMedia_BlogEntry]
GO
/****** Object:  ForeignKey [FK_BlogMedia_BlogFeedback]    Script Date: 02/12/2011 08:56:04 ******/
ALTER TABLE [dbo].[BlogMedia]  WITH CHECK ADD  CONSTRAINT [FK_BlogMedia_BlogFeedback] FOREIGN KEY([blog_id])
REFERENCES [dbo].[BlogFeedback] ([id])
GO
ALTER TABLE [dbo].[BlogMedia] CHECK CONSTRAINT [FK_BlogMedia_BlogFeedback]
GO
/****** Object:  ForeignKey [FK_BlogMedia_BlogType]    Script Date: 02/12/2011 08:56:04 ******/
ALTER TABLE [dbo].[BlogMedia]  WITH CHECK ADD  CONSTRAINT [FK_BlogMedia_BlogType] FOREIGN KEY([blog_type_id])
REFERENCES [dbo].[BlogType] ([id])
GO
ALTER TABLE [dbo].[BlogMedia] CHECK CONSTRAINT [FK_BlogMedia_BlogType]
GO
