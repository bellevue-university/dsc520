# Assignment: ASSIGNMENT 7
# Name: Sutow, Brett
# Date: 2020-10-14

## Set the working directory to the root of your DSC 520 directory
setwd("/Users/Brett/Desktop/dsc520-master")

## Load the `data/r4ds/heights.csv` to
heights_df <- read.csv("data/r4ds/heights.csv")
head(heights_df)
earn<- heights_df[,c(1)]
height<- heights_df[,c(2)]
sex<- heights_df[,c(3)]
ed<- heights_df[,c(4)]
age<- heights_df[,c(5)]
race<- heights_df[,c(6)]
# Fit a linear model
earn_lm <-  lm(earn ~ age + ed + height + race + sex, data=heights_df)

# View the summary of your model
summary(earn_lm)

predicted_df <- data.frame(
  earn = predict(earn_lm, heights_df),
  ed=ed, race=race, height=height,
  age=age, sex=sex
  )
summary(predicted_df)
## Compute deviation (i.e. residuals)
mean_earn <- mean(heights_df$earn)
summary(mean_earn)
## Corrected Sum of Squares Total
sst <- sum((mean_earn - heights_df$earn)^2)
print(sst)
## Corrected Sum of Squares for Model
ssm <- sum((mean_earn - predicted_df$earn)^2)
print(ssm)
## Residuals
residuals <- resid(earn_lm)
print(residuals)
## Sum of Squares for Error
sse <- sum(residuals^2)
print(sse)
## R Squared
r_squared <- (ssm/sst)
print(r_squared)
## Number of observations
n <- nrow(heights_df)
print(n)
## Number of regression paramaters
p <- 8
## Corrected Degrees of Freedom for Model
dfm <- p-1
print(dfm)
## Degrees of Freedom for Error
dfe <- n-p
print(dfe)
## Corrected Degrees of Freedom Total:   DFT = n - 1
dft <- n-1
print(dft)
## Mean of Squares for Model:   MSM = SSM / DFM
msm <- ssm/dfm
print(msm)
## Mean of Squares for Error:   MSE = SSE / DFE
mse <- sse/dfe
print(mse)
## Mean of Squares Total:   MST = SST / DFT
mst <- sst/dft
print(mst)
## F Statistic
f_score <- msm/mse
print(f_score)
## Adjusted R Squared R2 = 1 - (1 - R2)(n - 1) / (n - p)
adjusted_r_squared <- 1-(1-r_squared)*(n-1)/(n-p)
print(adjusted_r_squared)
