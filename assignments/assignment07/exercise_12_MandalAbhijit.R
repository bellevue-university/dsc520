# Assignment: ASSIGNMENT 7, Exercise 12
# Name: Mandal, Abhijit
# Date: 2020-10-17

# Set the working directory to the root of  DSC 520 directory
setwd("~/Documents/GitHub/dsc520")

library(readxl)
## Load the `data/week-7-housing.xlsx` to
realestate_df <- read_excel("data/week-7-housing.xlsx")


## Add a calculated column total_bath which provides no of bathroom in total
realestate_df <- within(realestate_df, total_bath <- bath_full_count + (bath_half_count/2) + (bath_3qtr_count/3))

##Select relevant data points, sale price < 2000000 and square foot lot < 20000
realestate_df = realestate_df[realestate_df$'Sale Price' < 2000000 & realestate_df$sq_ft_lot < 20000, ]
realestate_df <- realestate_df[(is.na(realestate_df$sale_warning)) & (realestate_df$bedrooms != 0), ]

##selecting only relevant columns for our calculation

realestate_df <- realestate_df[, c(2,8,13,14,15,19,20, 22, 25)]

summary(realestate_df)

plot(realestate_df$'Sale Price',realestate_df$sq_ft_lot)

cor(realestate_df)

## Fit a linear model using the `Square foot of Lot` variable as the predictor and `Sale Price` as the outcome
salepricebysqft_lm <-  lm(realestate_df$'Sale Price'~realestate_df$sq_ft_lot,data = realestate_df)


## Fit a linear model using several predictors variable and `Sale Price` as the outcome
salepricebymultiplevar_lm <-  lm(realestate_df$'Sale Price'~realestate_df$square_feet_total_living+realestate_df$year_built+realestate_df$bedrooms+realestate_df$total_bath+realestate_df$building_grade
                                 ,data = realestate_df)


## View the summary of your model using `summary()`
summary(salepricebysqft_lm)

## View the summary of your new model using `summary()`
summary(salepricebymultiplevar_lm)

library('QuantPsyc')

##standardized betas for each parameter 
lm.beta(salepricebymultiplevar_lm)

confint(salepricebymultiplevar_lm)

anova(salepricebysqft_lm, salepricebymultiplevar_lm)

## outliers
realestate_df$residuals <- resid(salepricebymultiplevar_lm)
realestate_df$studentized.residuals <- rstudent(salepricebymultiplevar_lm)
realestate_df$standardized.residuals <- rstandard(salepricebymultiplevar_lm)

## Influential cases

realestate_df$dffit <- dffits(salepricebymultiplevar_lm)
realestate_df$leverage <- hatvalues(salepricebymultiplevar_lm)
realestate_df$covariance.ratios <- covratio(salepricebymultiplevar_lm)
realestate_df$cooks.distance <- cooks.distance(salepricebymultiplevar_lm)
realestate_df$dfbeta <- dfbeta(salepricebymultiplevar_lm)

summary(realestate_df)

realestate_df$large.residual <- realestate_df$standardized.residuals > 2 | realestate_df$standardized.residuals < -2
summary(realestate_df)

sum(realestate_df$large.residual)

realestate_df[realestate_df$large.residual, c("Sale Price", "building_grade", "square_feet_total_living", "bedrooms", "total_bath", "year_built", "sq_ft_lot", "standardized.residuals")]

realestate_df[realestate_df$large.residual, c("cooks.distance", "leverage", "covariance.ratios")]

realestate_df[realestate_df$large.residual, c("cooks.distance", "leverage", "covariance.ratios","Sale Price", "building_grade", "square_feet_total_living", "bedrooms", "total_bath", "year_built", "sq_ft_lot", "standardized.residuals")]

library("car")
dwt(salepricebymultiplevar_lm)

## vif
vif(salepricebymultiplevar_lm)

## 1/vif
1/vif(salepricebymultiplevar_lm)

## mean
mean(vif(salepricebymultiplevar_lm))

plot(salepricebymultiplevar_lm)

hist(realestate_df$studentized.residuals)

library(ggplot2)
scatter <- ggplot(realestate_df, aes(fitted, studentized.residuals)) + geom_point() + geom_smooth(method = "lm", colour = "Blue")+ labs(x = "Fitted Values", y = "Studentized Residual")
