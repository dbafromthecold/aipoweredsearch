/***************************************************************************
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



SELECT * FROM dbo.restaurants;
GO



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



SELECT * 
FROM dbo.restaurants r
INNER JOIN [embeddings].[restaurant_embeddings] e ON r.id = e.restaurant_id;
GO