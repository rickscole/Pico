USE [Abyss]
GO

/****** Object:  StoredProcedure [dbo].[SP_DeleteStagingTables_SentimentAnalysis]    Script Date: 2/20/2021 12:56:28 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		rsc
-- Create date: 2021-02-20_0029
-- Description:	delete from staging tables for sentiment analysis process
-- =============================================
CREATE PROCEDURE [dbo].[SP_DeleteStagingTables_SentimentAnalysis] 
	
AS
BEGIN
	SET NOCOUNT ON; 

	-- PURPOSE
	-- delete from staging tables for sentiment analysis process

	delete from [STG].[TBL_SentimentAnalysis]

END


GO


