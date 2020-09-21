# Assignment: ASSIGNMENT 2 - Test Scores
# Name: Mandal, Abhijit
# Date: 2020-09-12

## Load the file `data/scores.csv` to `scores_df` using `read.csv`
## Examine the structure of `scores_df` using `str()`
scores_df <-  read.csv("data/scores.csv")

regular_scores_df <- scores_df[scores_df$Section == "Regular",]
str(regular_scores_df)
regular_students <- sum(regular_scores_df$Count)
regular_students
regular_scores <- sum(regular_scores_df$Count * regular_scores_df$Score)
regular_scores
regular_avg_score = regular_scores/regular_students
regular_avg_score


sports_scores_df <- scores_df[scores_df$Section == "Sports",]
str(sports_scores_df)
sports_students <- sum(sports_scores_df$Count)
sports_students
sports_scores <- sum(sports_scores_df$Count * sports_scores_df$Score)
sports_scores
sports_avg_score = sports_scores/sports_students
sports_avg_score

library(ggplot2)
library(ggthemes) # Load

theme_set(theme_gray())  # pre-set the bw theme.

data("sports_scores_df", package = "ggplot2")

# Scatterplot
gg <- ggplot(sports_scores_df, aes(x=Score, y=Count))  + 
  geom_point(aes(col=Score, size=Count)) + 
  geom_smooth(method="loess", se=F) + 
  xlim(c(200, 400)) + 
  ylim(c(0, 30)) + 
  labs(subtitle="Score Vs Count", 
       y="No of Students Achieving the Score", 
       x="Score of Students in Sports Section", 
       title="Scatterplot", 
       caption = "Graph of Student Scores in Sports Section")

plot(gg)

data("sports_scores_df", package = "ggplot2")

# Scatterplot
gg <- ggplot(regular_scores_df, aes(x=Score, y=Count))  + 
  geom_point(aes(col=Score, size=Count)) + 
  geom_smooth(method="loess", se=F) + 
  xlim(c(200, 400)) + 
  ylim(c(0, 30)) + 
  labs(subtitle="Score Vs Count", 
       y="No of Students Achieving the Score", 
       x="Score of Students in Regular Section", 
       title="Scatterplot", 
       caption = "Graph of Student Scores in Regular Section")

plot(gg)
