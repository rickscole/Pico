USE [Abyss]
GO

/****** Object:  Table [dbo].[TBL_SentimentAnalysis]    Script Date: 2/20/2021 1:04:28 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TBL_SentimentAnalysis](
	[PK_ID_SentimentAnalysis] [int] IDENTITY(1,1) NOT NULL,
	[TS_SentimentAnalysis] [datetime2](7) NULL,
	[FK_ID_SentimentAnalysis_Iteration] [int] NULL,
	[FK_ID_UserSessionInput] [int] NULL,
	[Positive_Sentiment] [float] NULL,
	[Negative_Sentiment] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_ID_SentimentAnalysis] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO


