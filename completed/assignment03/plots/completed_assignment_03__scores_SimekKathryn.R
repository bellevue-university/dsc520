# Assignment: ASSIGNMENT 3
# Name: Simek, Kathryn
# Date: 2020-09-13


library(ggplot2)
theme_set(theme_minimal())

setwd("C:/Users/katie/OneDrive/Documents/GitHub/dsc520")

scores_df <- read.csv("data/scores.csv")
scores_df[, 1]  <- as.numeric(scores_df[, 1])
scores_df[, 2]  <- as.numeric(scores_df[, 2])

## 3. Create one variable to hold a subset of your data set that contains 
## only the Regular Section and one variable for the Sports Section.
sports_df <- scores_df[scores_df$Section == "Sports",]
regular_df <- scores_df[scores_df$Section == "Regular",]

ggplot(sports_df, aes(x=Score, y=Count)) + geom_point() + 
  ggtitle("Section Scores") + xlab("Score Earned") + 
  ylab("Number of Students")

ggplot(regular_df, aes(x=Score, y=Count)) + geom_point() + 
  ggtitle("Section Scores") + xlab("Score Earned") + 
  ylab("Number of Students")

ggplot(scores_df, aes(x=Score, y=Count, col=Section)) + geom_point() +
  ggtitle("Section Scores") + xlab("Score Earned") + 
  ylab("Number of Students")


