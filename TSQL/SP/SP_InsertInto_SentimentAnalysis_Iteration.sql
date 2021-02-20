USE [Abyss]
GO

/****** Object:  StoredProcedure [dbo].[SP_InsertInto_SentimentAnalysis_Iteration]    Script Date: 2/20/2021 12:59:14 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		rsc
-- Create date: 2021-02-19_1610
-- Description:	insert registry into Sentiment Analysis Iteration table
-- =============================================
CREATE PROCEDURE [dbo].[SP_InsertInto_SentimentAnalysis_Iteration] 
	
AS
BEGIN
	SET NOCOUNT ON; 

	-- PURPOSE
	-- insert registry into Sentiment Analysis Iteration table 
	-- called by Python script

	insert into [dbo].[TBL_SentimentAnalysis_Iteration]
	select sysdatetime()

END


GO


