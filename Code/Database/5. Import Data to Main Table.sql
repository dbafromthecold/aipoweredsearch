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
INSERT INTO [data].[restaurants]
           ([place_id],
            [name]
           ,[city]
           ,[rating]
           ,[review_count]
           ,[address]
           ,[phone]
           ,[url])
SELECT DISTINCT
        place_id
        ,place_name 
        ,'Belfast'
        ,place_rating
        ,place_review_count
        ,formatted_address
        ,NULL
        ,'https://www.google.com/maps/place/?q=place_id:' + [place_id]
FROM [raw_data].[mexican_restaurant_reviews_Belfast];
GO



INSERT INTO [data].[restaurants]
           ([place_id],
            [name]
           ,[city]
           ,[rating]
           ,[review_count]
           ,[address]
           ,[phone]
           ,[url])
SELECT DISTINCT
        place_id
        ,place_name 
        ,'Cork'
        ,place_rating
        ,place_review_count
        ,formatted_address
        ,NULL
        ,'https://www.google.com/maps/place/?q=place_id:' + [place_id]
FROM [raw_data].[mexican_restaurant_reviews_Cork];
GO



INSERT INTO [data].[restaurants]
           ([place_id],
            [name]
           ,[city]
           ,[rating]
           ,[review_count]
           ,[address]
           ,[phone]
           ,[url])
SELECT DISTINCT
        place_id
        ,place_name 
        ,'Dublin'
        ,place_rating
        ,place_review_count
        ,formatted_address
        ,NULL
        ,'https://www.google.com/maps/place/?q=place_id:' + [place_id]
FROM [raw_data].[mexican_restaurant_reviews_Dublin];
GO



INSERT INTO [data].[restaurants]
           ([place_id],
            [name]
           ,[city]
           ,[rating]
           ,[review_count]
           ,[address]
           ,[phone]
           ,[url])
SELECT DISTINCT
        place_id
        ,place_name 
        ,'Galway'
        ,place_rating
        ,place_review_count
        ,formatted_address
        ,NULL
        ,'https://www.google.com/maps/place/?q=place_id:' + [place_id]
FROM [raw_data].[mexican_restaurant_reviews_Galway];
GO



INSERT INTO [data].[restaurants]
           ([place_id],
            [name]
           ,[city]
           ,[rating]
           ,[review_count]
           ,[address]
           ,[phone]
           ,[url])
SELECT DISTINCT
        place_id
        ,place_name 
        ,'Limerick'
        ,place_rating
        ,place_review_count
        ,formatted_address
        ,NULL
        ,'https://www.google.com/maps/place/?q=place_id:' + [place_id]
FROM [raw_data].[mexican_restaurant_reviews_Limerick];
GO



INSERT INTO [data].[restaurants]
           ([place_id],
            [name]
           ,[city]
           ,[rating]
           ,[review_count]
           ,[address]
           ,[phone]
           ,[url])
SELECT DISTINCT
        place_id
        ,place_name 
        ,'Waterford'
        ,place_rating
        ,place_review_count
        ,formatted_address
        ,NULL
        ,'https://www.google.com/maps/place/?q=place_id:' + [place_id]
FROM [raw_data].[mexican_restaurant_reviews_Waterford];
GO