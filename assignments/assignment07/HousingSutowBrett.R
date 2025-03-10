# Assignment: ASSIGNMENT Housing
# Name: Sutow, Brett
# Date: 2020-10-14
install.packages("readxl")
library(readxl)
library(ggplot2)
install.packages("lm.beta")
install.packages("Rmisc")
library(Rmisc)
install.packages("Hmisc")
library(Hmisc)
install.packages("influence.ME")
library(influence.ME)
install.packages("lme4")
library(lme4)
install.packages("caret")
install.packages("car")
library(car)
## Set the working directory to the root of your DSC 520 directory
setwd("/Users/Brett/Desktop/dsc520-master")


##Set dataframe 
housing_df<- read_excel('/Users/Brett/Downloads/week-6-housing.xlsx')
head(housing_df)
tail(housing_df)
summary(housing_df)
saleprice<- housing_df[,c(2)]
sqfoot<- housing_df[,c(22)]
bedroom<- housing_df[,c(15)]

##Cleaning Datapoints based off the information and the given datapoints we would clean
## City Name, Property Type## 

##Creating Variables 
sale_lm <- lm(housing_df$`Sale Price` ~ housing_df$sq_ft_lot)
summary(sale_lm)
#Sale date picked as another predictor because it allows for comparison based on time
saleonbed_lm <- lm(housing_df$`Sale Price` ~ housing_df$sq_ft_lot + housing_df$bedrooms)
summary(saleonbed_lm)

saleonfullbath_lm <- lm(housing_df$`Sale Price` ~ housing_df$sq_ft_lot + housing_df$bedrooms + housing_df$bath_full_count)

#Rsquared represents the correlation between the dependent variable and the independent variable
#In this case it shows for the sale_lm an rsquared of .01435 and the rsquared for the 
#model saleonbed_lm .06278. The addition of the sale year helped improve the rsquared.
#Showing a better correlation based off that, but rsquare is still very low for us to determine
#impact between the variables. 
library(lm.beta)
lm.beta(sale_lm)
lm.beta(saleonbed_lm)
#The beta coefficients in for these datapoints shows a positive relationship.
#This tells us that as the independent variable increases so does the dependent.
#These betas are not very strong, as shown in the results. But, they are positive in result.

#Calculate confidence interval 
confint(sale_lm)
confint(saleonbed_lm)
#We are 97.5% confident that our data points from the created variables will fall within
#the ranges listed in the charts produced. 
anova(sale_lm)
anova(saleonbed_lm)
#The residuals decreased from the original variable to the new created one.
#This means that means there is less of a relationship due to this addition.
function(sale_lm)
function(saleonbed_lm)
residsale_lm<- resid(sale_lm)
residsaleonbed_lm<-resid(saleonbed_lm)
rstansale_lm<-rstandard(sale_lm)
rstansaleonyear_lm<-rstandard(saleonbed_lm)
print(rstansale_lm)
print(residsaleonbed_lm)

#Sum Residuals 
sum(residsale_lm, na.rm = TRUE)
sum(residsaleonbed_lm, na.rm= TRUE)

#Investigate further by calculating the leverage, cooks distance, 
#and covariance rations. Comment on all cases that are problematic.
hatvalues(sale_lm)
hatvalues(saleonbed_lm)
cooks.distance(sale_lm)
cooks.distance(saleonbed_lm)
cov(housing_df$`Sale Price`, housing_df$sq_ft_lot)
cov(housing_df$`Sale Price`,housing_df$bedrooms)

#Indpendence 
library(MASS)
tbl= table(housing_df$`Sale Price`, housing_df$sq_ft_lot)
tbl1= table(housing_df$`Sale Price`, housing_df$bedrooms)
chisq.test(tbl)
chisq.test(tbl1)

#Multiccollinearity
vif(saleonbed_lm)

#Plot
plot(residsale_lm)

plot(residsaleonbed_lm)

hist(residsale_lm)
hist(residsaleonbed_lm)

#Bias 
#Based off the information above I believe the data is not biased 
#Though one of the key factors we can look at is  multicollinearity and it is above 1.
#It is not above it substainally enough to show significant impact on the data. 
       
       
       