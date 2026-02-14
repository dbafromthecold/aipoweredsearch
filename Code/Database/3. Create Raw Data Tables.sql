USE [burrito-bot-db]
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
) ON [RAW_DATA]
GO



CREATE TABLE [raw_data].[mexican_restaurants_Cork](
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
) ON [RAW_DATA]
GO



CREATE TABLE [raw_data].[mexican_restaurants_Dublin](
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
) ON [RAW_DATA]
GO



CREATE TABLE [raw_data].[mexican_restaurants_Galway](
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
) ON [RAW_DATA]
GO



CREATE TABLE [raw_data].[mexican_restaurants_Limerick](
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
) ON [RAW_DATA]
GO



CREATE TABLE [raw_data].[mexican_restaurants_Waterford](
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
) ON [RAW_DATA]
GO