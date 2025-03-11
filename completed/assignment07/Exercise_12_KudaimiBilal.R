#Setting our directory and importing data and libraries
setwd("C:/Users/PS3ma/Documents/GitHub/dsc520")

library('readxl')
library('tidyverse')
library('Rcmdr')
library('ggplot2')
library('QuantPsyc')

housing <- read_excel("data/week-7-housing.xlsx")

#Cleaning the data frame of all NA values. I chose to use drop_na() to make the dataset much easier to work with.
clean_housing_data <- drop_na(housing)

#Defining two variables (one containing only two variables and one containing the variables we want for multiple regression)
var1 <- data.frame(clean_housing_data$`Sale Price`, clean_housing_data$sq_ft_lot)
var2 <- data.frame(clean_housing_data$`Sale Price`, clean_housing_data$square_feet_total_living, clean_housing_data$bedrooms, clean_housing_data$bath_full_count, clean_housing_data$bath_half_count, clean_housing_data$year_built)

simple_housing_model <- lm(`Sale Price` ~ sq_ft_lot, data = clean_housing_data)
multiple_housing_model <- lm(`Sale Price` ~ square_feet_total_living + bedrooms + bath_full_count + bath_half_count + year_built, data = clean_housing_data)

#Summaries of both models
summary(simple_housing_model)
summary(multiple_housing_model)

#Standardized betas of the multiple model
#These will tell us the number of standard deviations the outcome will change for one standard deviation change in the predictor
#All of our betas here appear to be very small (<0.5) so the outcome will not change drastically for a change in each predictor.
betas <- lm.beta(multiple_housing_model)

#Analysis of variance to compare models
anova(simple_housing_model, multiple_housing_model)

#Casewise diagnostics (including standardized residuals, leverage, cook distance, and covariance ratios)
clean_housing_data$standardized.residuals <- rstandard(multiple_housing_model)
clean_housing_data$studentized.residuals <- rstudent(multiple_housing_model)
clean_housing_data$cooks.distance <- cooks.distance(multiple_housing_model)
clean_housing_data$dfbeta <- dfbeta(multiple_housing_model)
clean_housing_data$dffit <- dffits(multiple_housing_model)
clean_housing_data$leverage <- hatvalues(multiple_housing_model)
clean_housing_data$covariance.ratios <- covratio(multiple_housing_model)

#Finding the large residuals and their sum
clean_housing_data$large.residuals <- clean_housing_data$standardized.residuals > 2 | clean_housing_data$standardized.residuals < -2
large_residual_sum <- sum(clean_housing_data$large.residuals)

#Printing the data columns as well as the standard residuals, Cook's distance, leverage, and covariance ratios
clean_housing_data[clean_housing_data$large.residuals, c("square_feet_total_living", "bedrooms", "bath_full_count", "bath_half_count", "year_built", "standardized.residuals")]

clean_housing_data[clean_housing_data$large.residuals, c("cooks.distance", "leverage", "covariance.ratios")]


#All Cook's distances are less than 1, so nothing is having an undue influence on the model
clean_housing_data$cooks.distance[clean_housing_data$cooks.distance > 1]

#There are only 5 instances of leverage being above twice the average leverage calculated from the formula ((k+1)/n). 
clean_housing_data$leverage[clean_housing_data$leverage > 0.05]



#The formula 1+/-[3(k+1)/n] was used to find the bounds the covariance ratio should be in 
clean_housing_data$covariance.ratios[clean_housing_data$covariance.ratios > 1.0135 | clean_housing_data$covariance.ratios < 0.9865]
#Most of these are just outside the boundaries, and because the Cook's distance is below 1, there is little cause for alarm.

#The assumption of independence has not been met, as the D-W statistic is below 1, indicating the residuals are correlated.
dwt(multiple_housing_model)

#The VIFs are below 10, the tolerances are well above 0.2, and the mean VIF is close to 1 (1.5), so there is no multicollinearity.
vif(multiple_housing_model)
1/vif(multiple_housing_model)
mean(vif(multiple_housing_model))


hist(clean_housing_data$standardized.residuals)

plot(multiple_housing_model)

#The histogram and Q-Q plot inform us of any deviations from normality seen in the residuals.
#Based on this, we can clearly see that the distribution of residuals is skewed.
#In addition, the plot of residuals vs fitted values appears to be not random, as the values appear clustered and the line slightly curved.
#Due to the non-random residual vs fitted value distribution, the skewness of residuals, and the violated assumption of independence, this model has bias.