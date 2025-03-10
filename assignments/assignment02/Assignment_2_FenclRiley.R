# Assignment: Assigment 2
# Name: Fencl, Riley 
# Date: 2020-12-13

# Checking current directory
getwd()

# Listing directory contents
dir()

# Setting the directory to the root folder 
setwd("~/R/R Working Directory")

# Creating the CSV file
person_df1 <- read.csv("data/tidynomicon/person.csv")
str(person_df1)

# Creating the CSV file, with the stringsAsFactors
person_df1 <- read.csv("data/tidynomicon/person.csv", stringsAsFactors = FALSE)
str(person_df1)

# Reading the scores csv
scores_df <- read.csv("data/scores.csv")
summary(scores_df)

# Loading readxl
library(readxl)

# Listing the worksheets
excel_sheets("data/G04ResultsDetail2004-11-02.xls")

# Reading the voter turnout sheet
voter_turnout_df1 <- read_excel("data/G04ResultsDetail2004-11-02.xls", "Voter Turnout", skip = 1)
str(voter_turnout_df1)

# Reading the voter turnout sheet, and applying labels
voter_turnout_df2 <- read_excel("data/G04ResultsDetail2004-11-02.xls", "Voter Turnout", skip = 2)
names(voter_turnout_df2) <- c("ward_precinct", "ballots_cast", "registered_voters", "voter_turnout")
str(voter_turnout_df2)

# Loading DBI
library(DBI)

# Creating the connection
db <- dbConnect(RSQLite::SQLite(), "data/tidynomicon/example.db")

# Creating the SQL statement
person_df <- dbGetQuery(db, "SELECT * FROM PERSON")
head(person_df)

# Listing the tables
table_names <- dbListTables(db)
print(table_names)

# Creating the tables variable
tables <- lapply(table_names, dbReadTable, conn = db)
tables

# Disconnecting from the database
dbDisconnect(db)

# Importing jsonlite
library(jsonlite)

# Converting scores_df to JSON
toJSON(scores_df)

# Converting using pretty=true
toJSON(scores_df, pretty = TRUE)
