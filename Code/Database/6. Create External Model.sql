/***************************************************************************
***************************************************************************
* AI-Powered Search - Andrew Pruski
* @dbafromthecold.com
* dbafromthecold@gmail.com
* https://github.com/dbafromthecold/aipoweredsearch
* Create external model
***************************************************************************
**************************************************************************/



USE [burrito-bot-db]
GO



CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'S0methingS@Str0ng!';  
GO



CREATE DATABASE SCOPED CREDENTIAL [https://burrito-bot-ai.openai.azure.com]
WITH IDENTITY = 'HTTPEndpointHeaders', SECRET = N'{"api-key":"XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"}'
GO



CREATE EXTERNAL MODEL [text-embedding-3-small]
WITH (
    LOCATION = 'https://burrito-bot-ai.openai.azure.com/openai/deployments/text-embedding-3-small/embeddings?api-version=2023-05-15',
    API_FORMAT = 'Azure OpenAI',
    MODEL_TYPE = EMBEDDINGS,
    MODEL = 'text-embedding-3-large',
    CREDENTIAL = [https://burrito-bot-ai.openai.azure.com]
);
GO



EXEC sp_configure 'external rest endpoint enabled',1
RECONFIGURE;
GO



DECLARE @ret1 INT, @response1 NVARCHAR(MAX)
EXEC @ret1 = sp_invoke_external_rest_endpoint
    @url = N'https://burrito-bot-ai.openai.azure.com/openai/deployments/text-embedding-3-small/embeddings?api-version=2023-05-15',
    --@credential = [https://burrito-bot-ai.openai.azure.com],
	@headers = N'{"api-key":"XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"}',
    @response = @response1 OUTPUT;
PRINT @response1



BEGIN
    DECLARE @result NVARCHAR(MAX);
    SET @result = (SELECT CONVERT(NVARCHAR(MAX), AI_GENERATE_EMBEDDINGS(N'test text' USE MODEL [text-embedding-3-small])))
    SELECT AI_GENERATE_EMBEDDINGS(N'test text' USE MODEL [text-embedding-3-small]) AS GeneratedEmbedding

    IF @result IS NOT NULL
        PRINT 'Model test successful. Result: ' + @result;
    ELSE
        PRINT 'Model test failer. No result returner.';
END;
GO