USE [Abyss]
GO

/****** Object:  Table [STG].[TBL_SentimentAnalysis]    Script Date: 2/20/2021 1:02:37 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [STG].[TBL_SentimentAnalysis](
	[FK_ID_UserSessionInput] [int] NULL,
	[Positive_Sentiment] [float] NULL,
	[Negative_Sentiment] [float] NULL
)
GO


