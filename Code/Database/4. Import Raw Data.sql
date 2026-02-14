USE [burrito-bot-db]
GO



INSERT INTO [raw_data].[mexican_restaurants_Belfast]
SELECT *
FROM OPENROWSET(
    BULK 'C:\git\aipoweredsearch\Data\Raw Data\mexican_restaurants_Belfast.csv',
    FORMAT = 'CSV',
    FIRSTROW = 2
	) AS rs;
GO



INSERT INTO [raw_data].[mexican_restaurants_Cork]
SELECT *
FROM OPENROWSET(
    BULK 'C:\git\aipoweredsearch\Data\Raw Data\mexican_restaurants_Cork.csv',
    FORMAT = 'CSV',
    FIRSTROW = 2
	) AS rs;
GO

    

INSERT INTO [raw_data].[mexican_restaurants_Dublin]
SELECT *
FROM OPENROWSET(
    BULK 'C:\git\aipoweredsearch\Data\Raw Data\mexican_restaurants_Dublin.csv',
    FORMAT = 'CSV',
    FIRSTROW = 2
	) AS rs;
GO



INSERT INTO [raw_data].[mexican_restaurants_Galway]
SELECT *
FROM OPENROWSET(
    BULK 'C:\git\aipoweredsearch\Data\Raw Data\mexican_restaurants_Galway.csv',
    FORMAT = 'CSV',
    FIRSTROW = 2
	) AS rs;
GO



INSERT INTO [raw_data].[mexican_restaurants_Limerick]
SELECT *
FROM OPENROWSET(
    BULK 'C:\git\aipoweredsearch\Data\Raw Data\mexican_restaurants_Limerick.csv',
    FORMAT = 'CSV',
    FIRSTROW = 2
	) AS rs;
GO



INSERT INTO [raw_data].[mexican_restaurants_Waterford]
SELECT *
FROM OPENROWSET(
    BULK 'C:\git\aipoweredsearch\Data\Raw Data\mexican_restaurants_Waterford.csv',
    FORMAT = 'CSV',
    FIRSTROW = 2
	) AS rs;
GO