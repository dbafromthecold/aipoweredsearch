/**************************************************************************
***************************************************************************
* AI-Powered Search - Andrew Pruski
* @dbafromthecold.com
* dbafromthecold@gmail.com
* https://github.com/dbafromthecold/aipoweredsearch
* Generate Embeddings
***************************************************************************
**************************************************************************/




USE [burrito-bot-db];
GO



-- check the data
SELECT * FROM dbo.restaurants;
GO



-- generate embeddings using external model and insert into table
-- remember, we want to incorporate meaning into the embeddings!
-- check the execution plan!
INSERT INTO [embeddings].[restaurant_embeddings]
(
    restaurant_id,
    embeddings
)
SELECT
    r.id,
    AI_GENERATE_EMBEDDINGS(
        r.Name + ' ' +
        r.City + ' ' +
        CONVERT(NVARCHAR(50), r.Rating) + ' ' +
        CONVERT(NVARCHAR(4), r.review_count) + ' ' +
        r.Address
        USE MODEL [text-embedding-3-small]
    )
FROM dbo.restaurants r;
GO



-- let's have a look at the data!
SELECT * 
FROM dbo.restaurants r
INNER JOIN [embeddings].[restaurant_embeddings] e ON r.id = e.restaurant_id;
GO



/*************************************************************************************************
let's compare the size of the main table to the size of the embeddings table

EXEC sp_spaceused 'data.restaurants';
GO

EXEC sp_spaceused 'embeddings.restaurant_embeddings';
GO