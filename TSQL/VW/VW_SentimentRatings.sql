USE [Abyss]
GO

/****** Object:  View [dbo].[VW_SentimentRatings]    Script Date: 2/20/2021 1:05:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[VW_SentimentRatings] as
select 
date = usi.ts_usersessioninput
, usi.input
, tsa.positive_sentiment
, tsa.negative_sentiment 
from [stg].[TBL_SentimentAnalysis] tsa
inner join [dbo].[TBL_VOID_UserSessionInput] usi
on tsa.fk_id_usersessioninput = usi.pk_id_usersessioninput
GO


