/**************************************************************************
***************************************************************************
* AI-Powered Search - Andrew Pruski
* @dbafromthecold.com
* dbafromthecold@gmail.com
* https://github.com/dbafromthecold/aipoweredsearch
* Import data to main table
***************************************************************************
**************************************************************************/



USE [burrito-bot-db];
GO



-- inserting raw data into main table, adding location URL
INSERT INTO [dbo].[restaurants]
           ([place_id],
            [name]
           ,[city]
           ,[rating]
           ,[review_count]
           ,[address]
           ,[phone]
           ,[url])
SELECT  [place_id]
        ,[name]
        ,'Belfast'
        ,[rating]
        ,[review_count]
        ,[address]
        ,[phone_number]
        ,'https://www.google.com/maps/place/?q=place_id:' + [place_id]
FROM [raw_data].[mexican_restaurants_belfast];
GO



INSERT INTO [dbo].[restaurants]
           ([place_id],
            [name]
           ,[city]
           ,[rating]
           ,[review_count]
           ,[address]
           ,[phone]
           ,[url])
SELECT  [place_id]
        ,[name]
        ,'Cork'
        ,[rating]
        ,[review_count]
        ,[address]
        ,[phone_number]
        ,'https://www.google.com/maps/place/?q=place_id:' + [place_id]
FROM [raw_data].[mexican_restaurants_cork];
GO



INSERT INTO [dbo].[restaurants]
           ([place_id],
            [name]
           ,[city]
           ,[rating]
           ,[review_count]
           ,[address]
           ,[phone]
           ,[url])
SELECT  [place_id]
        ,[name]
        ,'Dublin'
        ,[rating]
        ,[review_count]
        ,[address]
        ,[phone_number]
        ,'https://www.google.com/maps/place/?q=place_id:' + [place_id]
FROM [raw_data].[mexican_restaurants_Dublin];
GO



INSERT INTO [dbo].[restaurants]
           ([place_id],
            [name]
           ,[city]
           ,[rating]
           ,[review_count]
           ,[address]
           ,[phone]
           ,[url])
SELECT  [place_id]
        ,[name]
        ,'Galway'
        ,[rating]
        ,[review_count]
        ,[address]
        ,[phone_number]
        ,'https://www.google.com/maps/place/?q=place_id:' + [place_id]
FROM [raw_data].[mexican_restaurants_galway];
GO



INSERT INTO [dbo].[restaurants]
           ([place_id],
            [name]
           ,[city]
           ,[rating]
           ,[review_count]
           ,[address]
           ,[phone]
           ,[url])
SELECT  [place_id]
        ,[name]
        ,'Limerick'
        ,[rating]
        ,[review_count]
        ,[address]
        ,[phone_number]
        ,'https://www.google.com/maps/place/?q=place_id:' + [place_id]
FROM [raw_data].[mexican_restaurants_limerick];
GO



INSERT INTO [dbo].[restaurants]
           ([place_id],
            [name]
           ,[city]
           ,[rating]
           ,[review_count]
           ,[address]
           ,[phone]
           ,[url])
SELECT  [place_id]
        ,[name]
        ,'Waterford'
        ,[rating]
        ,[review_count]
        ,[address]
        ,[phone_number]
        ,'https://www.google.com/maps/place/?q=place_id:' + [place_id]
FROM [raw_data].[mexican_restaurants_waterford];
GO