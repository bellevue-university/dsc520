# Assignment: Exercise 11
# Name: Bradley, Carla
# Date: 2021-01-30
# 
# 
library(ggplot2)
## Set the working directory to the root of your DSC 520 directory
setwd("/Users/carla/Documents/GitHub/dsc520/data/r4ds")
## Load the `data/r4ds/heights.csv` to
heights_df <- read.csv("heights.csv")

# Fit a linear model 


earn_lm <-  lm(earn ~ age + ed + race + height + sex, data=heights_df)
earn_lm

# View the summary of your model
summary(earn_lm)

predicted_df <- data.frame(
  earn = predict(earn_lm, heights_df),
  ed=heights_df$ed, race=heights_df$race, height=heights_df$height,
  age=heights_df$age, sex=heights_df$sex
)


## Compute deviation (i.e. residuals)

mean_earn <- mean(heights_df$earn)
mean_earn


## Corrected Sum of Squares Total
## 

SSTotal <- var( heights_df$earn ) * (nrow(heights_df)-1)
SSTotal

## Residuals
residuals <- heights_df$earn - predicted_df$earn
residuals


## Sum of Squares for Errors
## 
sse<- sum(residuals^2)
sse


## Corrected Sum of Squares for Model
mean_earn<- mean(heights_df$earn)
ssm <- sum((mean_earn - predicted_df$earn)^2)
ssm

## Residuals

residuals <- heights_df$earn - height_predicted_df$earn
residuals

## Sum of Squares for Error
sse <- sum(residuals^2)
sse
## R Squared
sst <- sum((mean_earn - heights_df$earn)^2)
sst
r_squared <- (ssm/sst)
r_squared
## Number of observations
## 

n <-nrow(heights_df)
n 
## Number of regression parameters
## 
p <- 1

## Corrected Degrees of Freedom for Model
dfm <- p - 1
dfm
## Degrees of Freedom for Error
dfe <- n - p
dfe
## Corrected Degrees of Freedom Total:   DFT = n - 1
dft <- n - 1
dft
## Mean of Squares for Model:   MSM = SSM / DFM
msm <- ssm / dfm
msm
## Mean of Squares for Error:   MSE = SSE / DFE
mse = sse / dfe
mse
## Mean of Squares Total:   MST = SST / DFT
mst <- sst / dft
mst
## F Statistic
f_score = msm / mse
f_score

## Adjusted R Squared R2 = 1 - (1 - R2)(n - 1) / (n - p)
adjusted_r_squared = 1 - (1 - r_squared)*(n-1)/(n - p)
adjusted_r_squared
