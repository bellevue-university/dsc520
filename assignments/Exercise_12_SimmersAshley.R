library(readxl)
library(ggplot2)
library(tidyverse)
library(lm.beta)
library(car)

housing_df <- read_excel("data/week-7-housing.xlsx")
glimpse(housing_df)

summary(housing_df)

price_lm <- lm(formula=housing_df$'Sale Price' ~ housing_df$square_feet_total_living + 
                   housing_df$bedrooms + housing_df$bath_full_count + 
                   housing_df$bath_half_count + housing_df$year_built + 
                   housing_df$sq_ft_lot)
summary(price_lm)

y <- lm.beta(price_lm)

confint(price_lm)

sqft_lm <- lm(formula=housing_df$sq_ft_lot ~ housing_df$square_feet_total_living + 
                  housing_df$bedrooms + housing_df$bath_full_count + 
                  housing_df$bath_half_count + housing_df$year_built + 
                  housing_df$`Sale Price`)
summary(sqft_lm)

x <-lm.beta(sqft_lm)

confint(sqft_lm)

anova(y,price_lm)

anova(x,sqft_lm)

housing_df$residuals <- resid(price_lm)
housing_df$standardized.residuals <- rstandard(price_lm)
housing_df$studentized.residuals <- rstudent(price_lm)
housing_df$cooks.distance <- cooks.distance(price_lm)
housing_df$defbeta <- dfbeta(price_lm)
housing_df$dffit <- dffits(price_lm)
housing_df$leverage <- hatvalues(price_lm)
housing_df$covariance.ratios <- covratio(price_lm)

housing_df$large.residual <- housing_df$standardized.residuals > 2 | housing_df$standardized.residuals < -2
sum(housing_df$large.residual)

housing_df[housing_df$large.residual, c("Sale Price", "square_feet_total_living", "bedrooms","bath_full_count",
                                        "bath_half_count", "sq_ft_lot")]
large_resid <- housing_df[housing_df$large.residual, c("Sale Price", "square_feet_total_living", "bedrooms",
                                                       "bath_full_count", "bath_half_count", "sq_ft_lot", 
                                                       "cooks.distance", "leverage","covariance.ratios")]

durbinWatsonTest(price_lm)
vif(price_lm)
1/vif(price_lm)
mean(vif(price_lm))

plot(housing_df$standardized.residuals)
hist(housing_df$standardized.residuals)

plot(housing_df$studentized.residuals)
hist(housing_df$studentized.residuals)