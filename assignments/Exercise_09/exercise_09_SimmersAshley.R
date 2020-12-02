# Assignment: Exercise 9
# Name: Simmers, Ashley
# Date: 2020-10-01

library(Hmisc)
library(ggm)
survey_df <- read.csv("data/student-survey.csv")
str(survey_df)
survey_df$TimeReading <- survey_df$TimeReading * 60

cor.test(survey_df$TimeReading, survey_df$Happiness, method="spearman")

cor(survey_df)
cor.test(survey_df$TimeTV, survey_df$Happiness, method ="pearson", conf.level = 0.99)
cor(survey_df) ^2

pcor(c("TimeReading", "TimeTV", "Happiness"), var(survey_df))
pcor(c("TimeReading", "TimeTV", "Happiness"), var(survey_df))^2
