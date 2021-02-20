USE [Abyss]
GO

/****** Object:  Table [dbo].[TBL_SentimentAnalysis_Iteration]    Script Date: 2/20/2021 12:58:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TBL_SentimentAnalysis_Iteration](
	[PK_ID_SentimentAnalysis_Iteration] [int] IDENTITY(1,1) NOT NULL,
	[TS_SentimentAnalysis_Iteration] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_ID_SentimentAnalysis_Iteration] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO


