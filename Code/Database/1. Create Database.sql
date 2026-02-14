USE [master]
GO


IF EXISTS(SELECT 1 FROM sys.databases WHERE name = 'burrito-bot-db')
	DROP DATABASE [burrito-bot-db];
GO



CREATE DATABASE [burrito-bot-db]
 ON PRIMARY 
( NAME = N'burrito-bot-db',				FILENAME = N'F:\SQLData1\burrito-bot-db.mdf' ,				SIZE = 1048576KB , MAXSIZE = UNLIMITED, FILEGROWTH = 524288KB ), 
 FILEGROUP [ARCHIVE] 
( NAME = N'burrito-bot-db-archive',		FILENAME = N'F:\SQLData1\burrito-bot-db-archive.ndf' ,		SIZE = 1048576KB , MAXSIZE = UNLIMITED, FILEGROWTH = 524288KB ), 
 FILEGROUP [DATA] 
( NAME = N'burrito-bot-db-data',		FILENAME = N'F:\SQLData1\burrito-bot-db-data.ndf' ,			SIZE = 1048576KB , MAXSIZE = UNLIMITED, FILEGROWTH = 524288KB ), 
 FILEGROUP [EMBEDDINGS] 
( NAME = N'burrito-bot-db-embeddings',	FILENAME = N'F:\SQLData1\burrito-bot-db-embeddings.ndf' ,	SIZE = 1048576KB , MAXSIZE = UNLIMITED, FILEGROWTH = 524288KB ), 
 FILEGROUP [RAW_DATA] 
( NAME = N'burrito-bot-db-raw-data',	FILENAME = N'F:\SQLData1\burrito-bot-db-raw-data.ndf' ,		SIZE = 1048576KB , MAXSIZE = UNLIMITED, FILEGROWTH = 524288KB )
 LOG ON 
( NAME = N'burrito-bot-db_log',			FILENAME = N'G:\SQLTLog1\burrito-bot-db_log.ldf' ,			SIZE = 5242880KB , MAXSIZE = UNLIMITED, FILEGROWTH = 524288KB )
GO





CREATE TABLE [raw_data].[mexican_restaurants_Belfast](
	[place_id]			[nvarchar](50) NOT NULL,
	[name]				[nvarchar](50) NOT NULL,
	[rating]			[float] NOT NULL,
	[review_count]		[smallint] NOT NULL,
	[price_level]		[tinyint] NULL,
	[address]			[nvarchar](100) NOT NULL,
	[phone_number]		[nvarchar](50) NULL,
	[latitude]			[float] NOT NULL,
	[longitude]			[float] NOT NULL,
	[business_status]	[nvarchar](50) NOT NULL
) --ON [RAW_DATA]
GO