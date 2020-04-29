# Assignment: ASSIGNMENT 6
# Name: Lastname, Firstname
# Date: 2010-02-14

## Set the working directory to the root of your DSC 520 directory
setwd("/home/jdoe/Workspaces/dsc520")

## Load the `data/r4ds/heights.csv` to
heights_df <- read.csv("data/r4ds/heights.csv")

## Load the ggplot2 library
library(ggplot2)

## Fit a linear model using the `age` variable as the predictor and `earn` as the outcome
age_lm <-  ___

## View the summary of your model using `summary()`
___

## Creating predictions using `predict()`
age_predict_df <- data.frame(earn = predict(___, ___), age=___)

## Plot the predictions against the original data
ggplot(data = ___, aes(y = ___, x = ___)) +
  geom_point(color='blue') +
  geom_line(color='red',data = ___, aes(y=___, x=___))

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
r_squared <- ___

## Number of observations
n <- ___
## Number of regression parameters
p <- 2
## Corrected Degrees of Freedom for Model (p-1)
dfm <- ___
## Degrees of Freedom for Error (n-p)
dfe <- ___
## Corrected Degrees of Freedom Total:   DFT = n - 1
dft <- ___

## Mean of Squares for Model:   MSM = SSM / DFM
msm <- ___
## Mean of Squares for Error:   MSE = SSE / DFE
mse <- ___
## Mean of Squares Total:   MST = SST / DFT
mst <- ___
## F Statistic F = MSM/MSE
f_score <- ___

## Adjusted R Squared R2 = 1 - (1 - R2)(n - 1) / (n - p)
adjusted_r_squared <- ___

## Calculate the p-value from the F distribution
p_value <- pf(f_score, dfm, dft, lower.tail=F)
