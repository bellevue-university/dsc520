# Assignment: ASSIGNMENT 6
# Name: Lastname, Firstname
# Date: 2021-01-23

## Set the working directory to the root of your DSC 520 directory
setwd("C:/Users/Paul/Bellevue University/DSC 520 Stat for DS/Week 6")

## Load the `data/r4ds/heights.csv` to
heights_df <- read.csv("heights.csv")
age <- heights_df[["age"]]
earn <- heights_df[["earn"]]

## Load the ggplot2 library
library(ggplot2)

## Fit a linear model using the `age` variable as the predictor and `earn` as the outcome
age_lm <-  lm(earn ~ age, data = heights_df)
age_lm

## View the summary of your model using `summary()`
summary(age_lm)

## Creating predictions using `predict()`
#age_predict_df <- data.frame(earn = predict(age_lm, ___), age=___)
age_predict_df <- predict(age_lm, heights_df)

## Plot the predictions against the original data
ggplot(data = heights_df, aes(y = earn, x = age)) +
  geom_point(color='blue') +
  geom_line(color='red',data = heights_df, aes(y=age_predict_df, x=age))

mean_earn <- mean(earn)
## Corrected Sum of Squares Total
sst <- sum((mean_earn - earn)^2)
## Corrected Sum of Squares for Model
ssm <- sum((mean_earn - age_predict_df)^2)
## Residuals
residuals <- earn - age_predict_df
## Sum of Squares for Error
sse <- sum(residuals^2)
## R Squared R^2 = SSM\SST
r_squared <- ssm/sst

## Number of observations
n <- nrow(age)
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
adjusted_r_squared <- 1 - (1-r_squared)*(n-1)/(n-p)

## Calculate the p-value from the F distribution
p_value <- pf(f_score, dfm, dft, lower.tail=F)

