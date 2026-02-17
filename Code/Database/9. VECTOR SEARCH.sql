/**************************************************************************
***************************************************************************
* AI-Powered Search - Andrew Pruski
* @dbafromthecold.com
* dbafromthecold@gmail.com
* https://github.com/dbafromthecold/aipoweredsearch
* Vector Search
***************************************************************************
**************************************************************************/



USE [burrito-bot-db];
GO



-- PREVIEW_FEATURES is a pre-requisite
ALTER DATABASE SCOPED CONFIGURATION SET PREVIEW_FEATURES = ON
GO



-- earlier versions of SQL 2025 required these trace flags
--DBCC TRACEON (466, 474, 13981, -1);
--GO




-- let's get the size of the table before we create that index
EXEC sp_spaceused 'embeddings.restaurant_embeddings'
GO



-- creating the index referencing the diskann algorithm (only one supported)
-- include the actual execution plan
CREATE VECTOR INDEX vec_idx ON [embeddings].[restaurant_embeddings]([embeddings])
WITH (
    METRIC  = 'cosine', -- euclidean and dot also supported
    TYPE    = 'diskann',
    MAXDOP  = 8 -- set the parallelism of the create index operation - currently ignored!
);
GO



/*************************************************************************************************
let's inspect the data of that index
DBCC IND
DBCC PAGE


*************************************************************************************************/


-- also, let's try to update the data in table...it's now read only!
INSERT INTO [embeddings].[restaurant_embeddings]
           ([restaurant_id]
           ,[embeddings])
     VALUES
           (999
           ,NULL)
GO



-- and let's have a look at the size of the table now
EXEC sp_spaceused 'embeddings.restaurant_embeddings'
GO



-- let's perform a vector search! include actual execution plan
-- do we get different results from VECTOR_DISTANCE() ?
-- generating embeddings for our query
DECLARE @question       NVARCHAR(MAX) = 'best tacos in Dublin';
DECLARE @search_vector  VECTOR(1536)  = AI_GENERATE_EMBEDDINGS(@question USE MODEL [text-embedding-3-small]);

SELECT
    r.[name] AS [Name], 
    r.[city] AS [City], 
    ROUND(r.[rating],1) AS [Rating], 
    r.[review_count] AS [Review Count], 
    r.[address] AS [Address], 
    r.[phone] AS [Phone Number], 
    r.[url] AS [URL],
    vs.distance
FROM VECTOR_SEARCH(
    TABLE      = [embeddings].[restaurant_embeddings] AS e,
    COLUMN     = [embeddings],
    SIMILAR_TO = @search_vector,
    METRIC     = 'cosine',
    TOP_N      = 5
) AS vs
INNER JOIN dbo.restaurants r ON r.id = e.restaurant_id
ORDER BY vs.distance;
GO


-- create a stored procedure to perform searches
CREATE OR ALTER PROCEDURE dbo.search_restaurants
    @question     NVARCHAR(MAX),
    @num_results  INT = 5
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @search_vector VECTOR(1536) =
        AI_GENERATE_EMBEDDINGS(@question USE MODEL [text-embedding-3-small]);

    SELECT
        r.[name] AS [Name], 
        r.[city] AS [City], 
        ROUND(r.[rating],1) AS [Rating], 
        r.[review_count] AS [Review Count], 
        r.[address] AS [Address], 
        r.[phone] AS [Phone Number], 
        r.[url] AS [URL],
        vs.distance
    FROM VECTOR_SEARCH(
        TABLE      = [embeddings].[restaurant_embeddings] AS e,
        COLUMN     = [embeddings],
        SIMILAR_TO = @search_vector,
        METRIC     = 'cosine',
        TOP_N      = @num_results
    ) AS vs
    INNER JOIN dbo.restaurants r ON r.id = e.restaurant_id
    ORDER BY vs.distance;

END
GO



-- let's test the stored procedure
EXEC dbo.search_restaurants
    @question = 'Find me a restaurant with a 3 star rating',
    @num_results= 5;
GO