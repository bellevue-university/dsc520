# Assignment: ASSIGNMENT 7
# Name: Lastname, Firstname
# Date: 2010-02-14

## Set the working directory to the root of your DSC 520 directory
setwd("/homoe/jdoe/Workspaces/dsc520")

## Load the `data/r4ds/heights.csv` to
heights_df <- read.csv("data/r4ds/heights.csv")

# Fit a linear model
earn_lm <-  lm(___ ~ ___ + ___ + ___ + ___ + ___, data=___)

# View the summary of your model
summary(earn_lm)

predicted_df <- data.frame(
  earn = predict(___, ___),
  ed=___, race=___, height=___,
  age=___, sex=___
  )

## Compute deviation (i.e. residuals)
mean_earn <- ___
## Corrected Sum of Squares Total
sst <- ___
## Corrected Sum of Squares for Model
ssm <- ___
## Residuals
residuals <- ___
## Sum of Squares for Error
sse <- ___
## R Squared
r_squared <- ___

## Number of observations
n <- ___
## Number of regression paramaters
p <- 8
## Corrected Degrees of Freedom for Model
dfm <- ___
## Degrees of Freedom for Error
dfe <- ___
## Corrected Degrees of Freedom Total:   DFT = n - 1
dft <- ___

## Mean of Squares for Model:   MSM = SSM / DFM
msm <- ___
## Mean of Squares for Error:   MSE = SSE / DFE
mse <- ___
## Mean of Squares Total:   MST = SST / DFT
mst <- ___
## F Statistic
f_score <- ___

## Adjusted R Squared R2 = 1 - (1 - R2)(n - 1) / (n - p)
adjusted_r_squared <- ___
