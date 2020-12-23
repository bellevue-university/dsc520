# Assignment: ASSIGNMENT 2
# Name: Wang, Muduo
# Date: 2020-12-12


getwd()


current_directory = getwd()
dir(current_directory)


setwd("C:/Programming/dsc520/data")


person_df1 <- read.csv("C:/Programming/dsc520/data/tidynomicon/person.csv")
str(person_df1)

person_df2 <- read.csv("C:/Programming/dsc520/data/tidynomicon/person.csv", stringsAsFactors = FALSE)
str (person_df2)

summary (scores_df)


library("readxl")

excel_sheets("C:/Programming/dsc520/data/G04ResultsDetail2004-11-02.xls")


voter_turnout_df1 <- read_excel("C:/Programming/dsc520/data/G04ResultsDetail2004-11-02.xls",sheet=2, skip=1)
str (voter_turnout_df1)


voter_turnout_df2 <- read_excel("C:/Programming/dsc520/data/G04ResultsDetail2004-11-02.xls",sheet=2, skip=1)
colnames(voter_turnout_df2)[c(1,2,3,4)] <- c("ward_precint", "ballots_cast", "registered_voters", "voter_turnout")
str(voter_turnout_df2)


library (DBI)


db <- dbConnect(RSQLite::SQLite(),"C:/Programming/dsc520/data/tidynomicon/example.db")


person_df <- dbGetQuery(db, 'SELECT * FROM PERSON')
head(person_df)


table_names <- dbListTables(db)
table_names


tables <- lapply(table_names, dbReadTable,conn=db)
tables


dbDisconnect(db)

library(jsonlite)

## Convert the scores_df dataframe to JSON using the `toJSON()` function
toJSON(scores_df)

## Convert the scores dataframe to JSON using the `toJSON()` function with the `pretty=TRUE` option
toJSON(scores_df,pretty=TRUE)
