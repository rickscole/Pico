# PURPOSE
# apply word tokenization to abyss entries

## NOTES

## import libraries
import time
import pyodbc
import pandas as pd
from textblob import TextBlob
import os 

## start stopwatch
start_time = time.time()

## connect to db
connection = pyodbc.connect('Driver={SQL Server};''Server=abyss.database.windows.net;''Database=Abyss;''UID=rickcole;''PWD=Integer0neg!;');
cursor = connection.cursor()

## delete from staging tables
sql = "{call [Abyss].[dbo].[SP_DeleteStagingTables_Tokens]}"
cursor.execute(sql)
connection.commit()

## insert registry into Sentiment Analysis iteration table
sql = "{call [Abyss].[dbo].[SP_InsertInto_Tokens_Iteration]}"
cursor.execute(sql)
connection.commit()

## get data
sql = 'select pk_id_usersessioninput, input from tbl_void_usersessioninput'
connection.commit();
data = pd.read_sql_query(sql, connection);
ids = data['pk_id_usersessioninput'].tolist()
user_inputs = data['input'].tolist()

## get words
ids_replicated = []
words = []
for index, user_input in enumerate(user_inputs):
    blob = TextBlob(user_input)
    corpus_words = blob.words
    number_of_words = len(corpus_words)
    id_replicated = number_of_words * [ids[index]]
    ids_replicated.extend(id_replicated)
    words.extend(corpus_words)
df_words = pd.DataFrame({'fk_id_usersessioninput' : ids_replicated, 'words' : words})

## write to file
if os.path.exists('words.csv'):
    os.remove('words.csv')
df_words.to_csv('words.csv', mode = 'a', header=False) 

## write csv to db
os.system('cd C:\\Program Files (x86)\\Microsoft SQL Server\\140\\DTS\\Binn & dtexec /f "C:\\Users\\ricks\\OneDrive\\Tabs\\upload tokens.dtsx"')

## insert from staging table into tokenization table
sql = "{call [Abyss].[dbo].[SP_InsertInto_Tokens]}"
cursor.execute(sql)
connection.commit()

## close connection
cursor.close();
connection.close();

## print runtime
print("--- %s seconds ---" % (time.time() - start_time))
