/**************************************************************************
***************************************************************************
* AI-Powered Search - Andrew Pruski
* @dbafromthecold.com
* dbafromthecold@gmail.com
* https://github.com/dbafromthecold/aipoweredsearch
* Create database tables
***************************************************************************
**************************************************************************/



USE [burrito-bot-db]
GO



-- create schemas, including separate schema for embedding data
CREATE SCHEMA [archive];
CREATE SCHEMA [data];
CREATE SCHEMA [embeddings];
CREATE SCHEMA [raw_data];
GO



-- create main table to hold data
CREATE TABLE [data].[restaurants](
	[id]			[int] IDENTITY(1,1) NOT NULL,
	[place_id]		[nvarchar](255) NOT NULL,
	[name]			[nvarchar](50) NOT NULL,
	[city]			[nvarchar](50) NOT NULL,
	[rating]		[float] NOT NULL,
	[review_count]	[smallint] NOT NULL,
	[address]		[nvarchar](100) NOT NULL,
	[phone]			[nvarchar](50) NULL,
	[url]			[nvarchar](200) NOT NULL,
 CONSTRAINT [pk_restaurants] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [DATA]
) ON [DATA];
GO



-- create table to hold embedding data, FK reference to main table
-- size of vector column is dictated by model referenced
CREATE TABLE [embeddings].[restaurant_embeddings](
	[id]			[int] IDENTITY(1,1) NOT NULL,
	[restaurant_id] [int] NULL,
	[embeddings]	[vector](1536, float32) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [EMBEDDINGS]
) ON [EMBEDDINGS];
GO

ALTER TABLE [embeddings].[restaurant_embeddings]  WITH CHECK ADD  CONSTRAINT [FK_restaurant_embeddings_restaurants] FOREIGN KEY([restaurant_id])
REFERENCES [data].[restaurants] ([id]);
GO

ALTER TABLE [embeddings].[restaurant_embeddings] CHECK CONSTRAINT [FK_restaurant_embeddings_restaurants];
GO
