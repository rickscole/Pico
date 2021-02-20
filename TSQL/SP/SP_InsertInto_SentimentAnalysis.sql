USE [Abyss]
GO

/****** Object:  StoredProcedure [dbo].[SP_InsertInto_SentimentAnalysis]    Script Date: 2/20/2021 1:05:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		rsc
-- Create date: 2021-02-20_0028
-- Description:	insert values from staging table into sentiment analysis table
-- =============================================
CREATE PROCEDURE [dbo].[SP_InsertInto_SentimentAnalysis] 
	
AS
BEGIN
	SET NOCOUNT ON; 

	-- PURPOSE
	-- insert values from staging table into sentiment analysis table
	-- called by Python script

	declare @ID_SentimentAnalysis_Iteration int = (select max([PK_ID_SentimentAnalysis_Iteration]) from [dbo].[TBL_SentimentAnalysis_Iteration])

	insert into [dbo].[TBL_SentimentAnalysis]
	select sysdatetime()
	, @ID_SentimentAnalysis_Iteration
	, [FK_ID_UserSessionInput]
	, [Positive_Sentiment]
	, [Negative_Sentiment]
	from [STG].[TBL_SentimentAnalysis]

END


GO


