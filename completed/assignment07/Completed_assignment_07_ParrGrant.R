# Assignment: ASSIGNMENT 7
# Name: Parr, Grant
# Date: 2021-01-28

## Set the working directory to the root of your DSC 520 directory
setwd("/Users/gparr/dsc520/data/")

## Load the `data/r4ds/heights.csv` to
heights_df <- read.csv("/Users/gparr/dsc520/data/r4ds/heights.csv")
View(heights_df)

# Fit a linear model
earn_lm <-  lm(heights_df$earn ~ heights_df$age + heights_df$sex + heights_df$ed + heights_df$height + heights_df$race)

# View the summary of your model
summary(earn_lm)

predicted_df <- data.frame(earn = predict(earn_lm, newdata = data.frame(earn = heights_df$earn)),
  ed=heights_df$ed, race=heights_df$race, height=heights_df$height, age=heights_df$age, sex=heights_df$sex)

## Compute deviation (i.e. residuals)
mean_earn <- mean(heights_df$earn)
View(mean_earn)
## Corrected Sum of Squares Total
sst <- sum((mean_earn - heights_df$earn)^2)
## Corrected Sum of Squares for Model
ssm <- sum((mean_earn - age_predict_df$earn)^2)
## Residuals
residuals <- heights_df$earn - predicted_df$earn
## Sum of Squares for Error
sse <- sum(residuals^2)
## R Squared
r_squared <- ssm/sst

## Number of observations
n <- 12865
## Number of regression paramaters
p <- 8
## Corrected Degrees of Freedom for Model
dfm <- (p-1)
## Degrees of Freedom for Error
dfe <- (n-p)
## Corrected Degrees of Freedom Total:   DFT = n - 1
dft <- n - 1

## Mean of Squares for Model:   MSM = SSM / DFM
msm <- ssm / dfm
## Mean of Squares for Error:   MSE = SSE / DFE
mse <- sse / dfe
## Mean of Squares Total:   MST = SST / DFT
mst <- sst / dft
## F Statistic F = MSM/MSE
f_score <- msm / mse

## Adjusted R Squared R2 = 1 - (1 - R2)(n - 1) / (n - p)
adjusted_r_squared <- 1-(1- r_squared)*(n-1)/(n-p)
