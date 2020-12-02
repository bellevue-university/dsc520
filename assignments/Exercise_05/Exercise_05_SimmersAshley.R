# Assignment: EXERCISE 5
# Name: Simmers, Ashley
# Date: 2020-09-20

library(ggplot2)
library(Hmisc)
library(pastecs)
library(psych)

setwd("C:/Users/ashle/OneDrive/Desktop/DSC_520/DSC_520/dsc520")

survey_df <- read.csv("data/acs-14-1yr-s0201.csv")
str(survey_df)
nrow(survey_df)
ncol(survey_df)

zscores <- (survey_df$HSDegree-mean(survey_df$HSDegree))/sd(survey_df$HSDegree)
survey_df <-cbind(survey_df, zscores)
p_norm <- pnorm(survey_df$zscores)
d_norm <- dnorm(survey_df$zscores)
survey_df <- cbind(survey_df, p_norm)
survey_df <- cbind(survey_df, d_norm)
head(survey_df)


ggplot(survey_df, aes(x=HSDegree)) + 
  geom_histogram(aes(y=..density..)) + 
  stat_function(fun=dnorm, args = list(mean=mean(survey_df$HSDegree), sd=sd(survey_df$HSDegree))) +
  ggtitle("High School Degree (Normal Distribution)") + 
  xlab("Percentage Completed HS") + 
  ylab("Count")
  
ggplot(survey_df, aes(sample = HSDegree)) +
  stat_qq() +
  stat_qq_line()

describe(survey_df$HSDegree)

stat.desc(survey_df$HSDegree, basic=TRUE, norm=FALSE, p=0.95)
