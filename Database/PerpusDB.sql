USE [master]
GO
/****** Object:  Database [PerpusDB]    Script Date: 01/07/2023 18:37:52 ******/
CREATE DATABASE [PerpusDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PerpusDB', FILENAME = N'C:\Users\Niel\PerpusDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PerpusDB_log', FILENAME = N'C:\Users\Niel\PerpusDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PerpusDB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PerpusDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PerpusDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PerpusDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PerpusDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PerpusDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PerpusDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [PerpusDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [PerpusDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PerpusDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PerpusDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PerpusDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PerpusDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PerpusDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PerpusDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PerpusDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PerpusDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PerpusDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PerpusDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PerpusDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PerpusDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PerpusDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PerpusDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PerpusDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PerpusDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PerpusDB] SET  MULTI_USER 
GO
ALTER DATABASE [PerpusDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PerpusDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PerpusDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PerpusDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PerpusDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PerpusDB] SET QUERY_STORE = OFF
GO
USE [PerpusDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [PerpusDB]
GO
/****** Object:  Table [dbo].[tbl_buku]    Script Date: 01/07/2023 18:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_buku](
	[id_buku] [int] IDENTITY(1,1) NOT NULL,
	[kode] [varchar](255) NULL,
	[judul] [varchar](255) NULL,
	[tahun] [varchar](255) NULL,
	[isi] [varchar](255) NULL,
	[pengarang] [varchar](255) NULL,
	[penerbit] [varchar](255) NULL,
	[jumlah] [int] NULL,
	[tanggal] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_buku] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_buku] ADD  DEFAULT (NULL) FOR [kode]
GO
ALTER TABLE [dbo].[tbl_buku] ADD  DEFAULT (NULL) FOR [judul]
GO
ALTER TABLE [dbo].[tbl_buku] ADD  DEFAULT (NULL) FOR [tahun]
GO
ALTER TABLE [dbo].[tbl_buku] ADD  DEFAULT (NULL) FOR [isi]
GO
ALTER TABLE [dbo].[tbl_buku] ADD  DEFAULT (NULL) FOR [pengarang]
GO
ALTER TABLE [dbo].[tbl_buku] ADD  DEFAULT (NULL) FOR [penerbit]
GO
ALTER TABLE [dbo].[tbl_buku] ADD  DEFAULT (NULL) FOR [jumlah]
GO
ALTER TABLE [dbo].[tbl_buku] ADD  DEFAULT (NULL) FOR [tanggal]
GO
/****** Object:  StoredProcedure [dbo].[DeleteBuku]    Script Date: 01/07/2023 18:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DeleteBuku](
	@id_buku int
)
AS
BEGIN TRY
	DELETE FROM tbl_buku WHERE id_buku = @id_buku
	SELECT 'Data Buku Berhasil Dihapus' as Response
END TRY
BEGIN CATCH
	SELECT ERROR_MESSAGE() as Response
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[GetAllBuku]    Script Date: 01/07/2023 18:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetAllBuku]
AS
BEGIN
SELECT * FROM tbl_buku
END
GO
/****** Object:  StoredProcedure [dbo].[InsertBuku]    Script Date: 01/07/2023 18:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertBuku](
	@kode varchar(255),
	@judul varchar(255),
	@tahun varchar(255),
	@isi varchar(255),
	@pengarang varchar(255),
	@penerbit varchar(255),
	@jumlah int
)
AS
BEGIN TRY
	INSERT INTO tbl_buku(kode,judul,tahun,isi,pengarang,penerbit,jumlah,tanggal)
	VALUES(@kode,@judul,@tahun,@isi,@pengarang,@penerbit,@jumlah,GETDATE())
	SELECT 'Data Buku Berhasil Ditambahkan' as Response
END TRY
BEGIN CATCH
	SELECT ERROR_MESSAGE() as Response
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[UpdateBuku]    Script Date: 01/07/2023 18:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[UpdateBuku](
	@kode varchar(255),
	@judul varchar(255),
	@tahun varchar(255),
	@isi varchar(255),
	@pengarang varchar(255),
	@penerbit varchar(255),
	@jumlah int,
	@id_buku int
)
AS
BEGIN TRY
	UPDATE tbl_buku SET kode=@kode,judul=@judul,tahun=@tahun,isi=@isi,pengarang=@pengarang,penerbit=@penerbit,jumlah=@jumlah WHERE id_buku = @id_buku
	SELECT 'Data Buku Berhasil Diperbaharui' as Response
END TRY
BEGIN CATCH
	SELECT ERROR_MESSAGE() as Response
END CATCH
GO
USE [master]
GO
ALTER DATABASE [PerpusDB] SET  READ_WRITE 
GO
