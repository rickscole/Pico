## PURPOSE
# analyze sentiment in my abyss entries

## NOTES

## import libraries 
import pandas as pd
import pyodbc
import time
from textblob import TextBlob
from textblob.sentiments import NaiveBayesAnalyzer
import os 

## start stopwatch and connect
start_time = time.time()
connection = pyodbc.connect('Driver={SQL Server};''Server=abyss.database.windows.net;''Database=Abyss;''UID=rickcole;''PWD=TURNMUSCIOFF;');
cursor = connection.cursor()

## delete from staging tables
sql = "{call [Abyss].[dbo].[SP_DeleteStagingTables_SentimentAnalysis]}"
cursor.execute(sql)
connection.commit()

## insert registry into Sentiment Analysis iteration table
sql = "{call [Abyss].[dbo].[SP_InsertInto_SentimentAnalysis_Iteration]}"
cursor.execute(sql)
connection.commit()

## get data
sql = 'select pk_id_usersessioninput, input from tbl_void_usersessioninput'
connection.commit();
data = pd.read_sql_query(sql, connection);
ids = data['pk_id_usersessioninput'].tolist()
user_inputs = data['input'].tolist()

## create vectors
positive_sentiments = []
negative_sentiments = []

## get user sentiments and compile into df
for index, user_input in enumerate(user_inputs):
    blob = TextBlob(str(user_input), analyzer = NaiveBayesAnalyzer())
    positive_sentiment = blob.sentiment[1]
    negative_sentiment = blob.sentiment[2]
    positive_sentiments.append(positive_sentiment)
    negative_sentiments.append(negative_sentiment)
    print(index)
df_sentiment_ratings = pd.DataFrame({'fk_id_usersessioninput':ids, 'Positive_Sentiment':positive_sentiments, 'Negative_Sentiment':negative_sentiments})

## write df to csv file
if os.path.exists('pos_and_neg_sent.csv'):
    os.remove('pos_and_neg_sent.csv')
df_sentiment_ratings.to_csv('pos_and_neg_sent.csv', mode = 'a', header=False)

## write csv to db
os.system('cd C:\\Program Files (x86)\\Microsoft SQL Server\\140\\DTS\\Binn & dtexec /f "C:\\Users\\ricks\\OneDrive\\Tabs\\upload sentiments.dtsx"')

## insert from staging table into sentiment analysis table
sql = "{call [Abyss].[dbo].[SP_InsertInto_SentimentAnalysis]}"
cursor.execute(sql)
connection.commit()

## close connection
cursor.close();
connection.close();

