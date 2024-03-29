USE [master]
GO

/****** Object:  Database [CommentsDb]    Script Date: 18/07/2019 13:12:42 ******/
CREATE DATABASE [CommentsDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CommentsDb', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\CommentsDb.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CommentsDb_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\CommentsDb_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [CommentsDb] SET COMPATIBILITY_LEVEL = 110
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CommentsDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [CommentsDb] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [CommentsDb] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [CommentsDb] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [CommentsDb] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [CommentsDb] SET ARITHABORT OFF 
GO

ALTER DATABASE [CommentsDb] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [CommentsDb] SET AUTO_CREATE_STATISTICS ON 
GO

ALTER DATABASE [CommentsDb] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [CommentsDb] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [CommentsDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [CommentsDb] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [CommentsDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [CommentsDb] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [CommentsDb] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [CommentsDb] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [CommentsDb] SET  DISABLE_BROKER 
GO

ALTER DATABASE [CommentsDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [CommentsDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [CommentsDb] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [CommentsDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [CommentsDb] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [CommentsDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [CommentsDb] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [CommentsDb] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [CommentsDb] SET  MULTI_USER 
GO

ALTER DATABASE [CommentsDb] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [CommentsDb] SET DB_CHAINING OFF 
GO

ALTER DATABASE [CommentsDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [CommentsDb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO

ALTER DATABASE [CommentsDb] SET  READ_WRITE 
GO


