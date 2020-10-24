# Assignment: ASSIGNMENT Thoraric Surgery
# Name: Sutow, Brett
# Date: 2020-10-21
install.packages("caret")
library(caret)
setwd("/Users/Brett/Desktop/dsc520-master")
ts_df<-read.csv("/Users/Brett/Desktop/dsc520-master/data/TS.csv")
head(ts_df)
survivalafter1year<- glm(ts_df$Risk1YR ~ ts_df$Treatment + ts_df$PRE4
                         + ts_df$PRE5 + ts_df$PRE14 + ts_df$AGE)
summary(survivalafter1year)

# The largest impact we see is from PRE14OC14 and PRE14OC13 both
# show statistical significance on the survival rate. 

res <- predict(survivalafter1year, test.type = 'response')
res

res<- predict(survivalafter1year, train.type = 'response')
res

confmatrix <- table(actual_value=ts_df$Risk1YR, predicted_value = res >0.5)
confmatrix

#It did a good job at predicting those results that would be false, however not so much with true. 
