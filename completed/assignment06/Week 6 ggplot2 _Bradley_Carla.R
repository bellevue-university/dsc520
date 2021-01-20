# Assignment: ASSIGNMENT 6
# Name: Lastname, Firstname
# Date: 2010-02-14

## Set the working directory to the root of your DSC 520 directory
setwd("/Users/carla/Documents/GitHub/dsc520/data/r4ds")

## Load the `data/r4ds/heights.csv` to
heights_df <- read.csv("heights.csv")

## Load the ggplot2 library
library(ggplot2)

## Fit a linear model using the `age` variable as the predictor and `earn` as the outcome
 
age_lm <- lm(formula = earn ~ age, data = heights_df)
age_lm

## View the summary of your model using `summary()`
summary(age_lm)


## Creating predictions using `predict()`
library(ROCR)
age_predict_df <- data.frame(earn = predict(age_lm, heights_df), age=heights_df$age)

## Plot the predictions against the original data
library(ggplot2)
ggplot(data = heights_df, aes(y = earn, x = age)) +
  geom_point(color='blue') +
  geom_line(color='red',data = heights_df, aes(y=earn, x=ed))

mean_earn <- mean(heights_df$earn)
mean_earn
## Corrected Sum of Squares Total
sst <- sum((mean_earn - heights_df$earn)^2)
sst
## Corrected Sum of Squares for Model
ssm <- sum((mean_earn - age_predict_df$earn)^2)
ssm

## Residuals
residuals <- heights_df$earn - age_predict_df$earn
## Sum of Squares for Error
sse <- sum(residuals^2)
sse
## R Squared R^2 = SSM\SST
r_squared <- ssm/sst
r_squared
## Number of observations
n <- nrow(heights_df)
n
## Number of regression parameters
p <- 2

## Corrected Degrees of Freedom for Model (p-1)
dfm <- p-1
## Degrees of Freedom for Error (n-p)
dfe <- n - p
## Corrected Degrees of Freedom Total:   DFT = 
dft <- n - 1

## Mean of Squares for Model:   MSM = SSM / DFM
msm <- ssm/sst
## Mean of Squares for Error:   MSE = SSE / DFE
mse <- ssm/dfe
mse
## Mean of Squares Total:   MST = SST / DFT
mst <- ssm/dft
## F Statistic F = MSM/MSE
f_score <- msm/mse

## Adjusted R Squared R2 = 1 - (1 - R2)(n - 1) / (n - p)
## 
adjusted_r_squared <- 1 - (1 - r_squared) * (n - 1) / (n - p)
adjusted_r_squared

## Calculate the p-value from the F distribution
p_value <- pf(f_score, dfm, dft, lower.tail=F)
p_value


