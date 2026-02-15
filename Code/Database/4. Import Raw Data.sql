/**************************************************************************
***************************************************************************
* AI-Powered Search - Andrew Pruski
* @dbafromthecold.com
* dbafromthecold@gmail.com
* https://github.com/dbafromthecold/aipoweredsearch
* import Raw Data
***************************************************************************
**************************************************************************/



USE [burrito-bot-db]
GO



-- enabling external rest endpoint functionality
EXEC sp_configure 'external rest endpoint enabled',1
RECONFIGURE;
GO



-- using sp_invoke_external_rest_endpoint to pull data from source
DECLARE @ApiKey  VARCHAR(100)  = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
DECLARE @Keyword VARCHAR(10)   = 'mexican';
DECLARE @BaseUrl VARCHAR(100)  = 'https://maps.googleapis.com/maps/api/place/nearbysearch/json';
DECLARE @Radius VARCHAR(10)    = 20000;
DECLARE @Latitude VARCHAR(10)  = '53.3498';
DECLARE @Longitude VARCHAR(10) = '-6.2603';

DECLARE @FullUrl VARCHAR(500);

SET @FullUrl = @BaseUrl + '?location=' 
         + @Latitude + ',' 
         + @Longitude +
         + '&radius=' + @Radius +
         + '&type=restaurant' +
         + '&keyword=' + @Keyword
         + '&key=' + @ApiKey
         PRINT @FullUrl

DECLARE @ret1 INT, @response1 NVARCHAR(MAX)
EXEC @ret1 = sp_invoke_external_rest_endpoint
    @url = @FullUrl,
    @response = @response1 OUTPUT;
PRINT @response1;
GO



-- pulling data into raw tables from CSV files
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