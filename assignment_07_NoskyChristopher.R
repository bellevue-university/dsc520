# Assignment: ASSIGNMENT 7
# Name: Nosky, Christopher
# Date: 2021-01-31

## Set the working directory to the root of your DSC 520 directory
setwd("C:/Users/cwnos/Documents/DSC520/Git repo/DSC520/dsc520")

## Load the `data/r4ds/heights.csv` to
heights_df <- read.csv("data/r4ds/heights.csv")
head(heights_df)
# Fit a linear model
earn_lm <-  lm(earn ~ height + sex + ed + age + race, data=heights_df)

# View the summary of your model
summary(earn_lm)

predicted_df <- data.frame(
  earn = predict(earn_lm, heights_df),
  ed=16, race='white', height=68,
  age=41, sex='male'
)
head(predicted_df)

## Compute deviation (i.e. residuals)
mean_earn <- mean(heights_df$earn)
## Corrected Sum of Squares Total
sst <- sum((mean_earn - heights_df$earn)^2)
## Corrected Sum of Squares for Model
ssm <- sum((mean_earn - predicted_df$earn)^2)
## Residuals
residuals <- heights_df$earn - predicted_df$earn
## Sum of Squares for Error
sse <- sum(residuals^2)
## R Squared
r_squared <- r_squared <- (ssm / sst)

## Number of observations
n <- 1192
## Number of regression paramaters
p <- 8
## Corrected Degrees of Freedom for Model
dfm <- (p-1)
## Degrees of Freedom for Error
dfe <- (n-p)
## Corrected Degrees of Freedom Total:   DFT = n - 1
dft <- (n-1)

## Mean of Squares for Model:   MSM = SSM / DFM
msm <- (ssm/dfm)
## Mean of Squares for Error:   MSE = SSE / DFE
mse <- (sse/dfe)
## Mean of Squares Total:   MST = SST / DFT
mst <- (sst/dft)
## F Statistic
f_score <- (msm/mse)

## Adjusted R Squared R2 = 1 - (1 - R2)(n - 1) / (n - p)
adjusted_r_squared <- 1 - (1 - r_squared) * (dft) / (dfe)
