# Assignment: ASSIGNMENT 6
# Name: Sutow, Brett
# Date: 2020-10-05

## Set the working directory to the root of your DSC 520 directory
setwd("/Users/Brett/Desktop/dsc520-master")

## Load the `data/r4ds/heights.csv` to
heights_df <- read.csv("/Users/Brett/Desktop/dsc520-master/data/r4ds/heights.csv")
head(heights_df)
earn<- heights_df[,c(1)]
height<- heights_df[,c(2)]
sex<- heights_df[,c(3)]
ed<- heights_df[,c(4)]
age<- heights_df[,c(5)]
race<- heights_df[,c(6)]
## Load the ggplot2 library
library(ggplot2)

## Fit a linear model using the `age` variable as the predictor and `earn` as the outcome
age_lm <-  lm(earn ~ age, data = heights_df )

## View the summary of your model using `summary()`
summary(age_lm)

## Creating predictions using `predict()`
age_predict_df <- data.frame(earn = predict(age_lm,heights_df ), age = age)
print(age_predict_df)
## Plot the predictions against the original data
ggplot(data = age_predict_df, aes(y = earn, x = age)) +
  geom_point(color='blue') +
  geom_line(color='red',data = heights_df, aes(y=earn, x=age))

mean_earn <- mean(heights_df$earn)
## Corrected Sum of Squares Total
sst <- sum((mean_earn - heights_df$earn)^2)
## Corrected Sum of Squares for Model
ssm <- sum((mean_earn - age_predict_df$earn)^2)
## Residuals
residuals <- heights_df$earn - age_predict_df$earn
## Sum of Squares for Error
sse <- sum(residuals^2)
## R Squared R^2 = SSM\SST
r_squared <- (ssm/sst)

## Number of observations
n <- nrow(heights_df)
## Number of regression parameters
p <- 2
## Corrected Degrees of Freedom for Model (p-1)
dfm <- p-1
## Degrees of Freedom for Error (n-p)
dfe <- n-p
## Corrected Degrees of Freedom Total:   DFT = n - 1
dft <- n-1

## Mean of Squares for Model:   MSM = SSM / DFM
msm <- ssm/dfm
## Mean of Squares for Error:   MSE = SSE / DFE
mse <- sse/dfe
## Mean of Squares Total:   MST = SST / DFT
mst <- sst/dft
## F Statistic F = MSM/MSE
f_score <- msm/mse

## Adjusted R Squared R2 = 1 - (1 - R2)(n - 1) / (n - p)
adjusted_r_squared <- 1-(1-r_squared)*(n-1)/(n-p)

## Calculate the p-value from the F distribution
p_value <- pf(f_score, dfm, dft, lower.tail=F)
