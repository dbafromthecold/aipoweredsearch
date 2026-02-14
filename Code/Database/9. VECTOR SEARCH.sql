USE [burrito-bot-db];
GO



ALTER DATABASE SCOPED CONFIGURATION SET PREVIEW_FEATURES = ON
GO



--DBCC TRACEON (466, 474, 13981, -1);
--GO



CREATE VECTOR INDEX vec_idx ON [embeddings].[restaurant_embeddings]([embeddings])
WITH (
    METRIC  = 'cosine',
    TYPE    = 'diskann',
    MAXDOP  = 8
);
GO



/********************************************************************************************************************

Creating a stored procedure to perform searches

********************************************************************************************************************/


CREATE OR ALTER PROCEDURE dbo.search_restaurants
    @question     NVARCHAR(MAX),
    @num_results  INT = 5
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @search_vector VECTOR(1536) =
        AI_GENERATE_EMBEDDINGS(@question USE MODEL [text-embedding-3-small]);

    ;WITH vs AS
    (
        SELECT
            restaurant_id,
            distance
        FROM vector_search(
            TABLE      = [embeddings].[restaurant_embeddings],
            COLUMN     = [embeddings],
            SIMILAR_TO = @search_vector,
            METRIC     = 'cosine',
            TOP_N      = @num_results
        )
    )
    SELECT
        r.[name] AS [Name], 
		r.[city] AS [City], 
		ROUND(r.[rating],1) AS [Rating], 
		r.[review_count] AS [Review Count], 
		r.[address] AS [Address], 
		r.[phone] AS [Phone Number], 
		r.[url] AS [URL]
        --vs.distance
    FROM vs
    INNER JOIN dbo.restaurants r
        ON r.id = vs.restaurant_id
    ORDER BY vs.distance;
END
GO



EXEC dbo.search_restaurants
    @question = 'Find me a restaurant with a 3 star rating',
    @num_results= 5;
GO