# Assignment: ASSIGNMENT 5 exercise 9 Student Survey
# Name: Mandal, Abhijit
# Date: 2010-10-03

## Set the working directory to the root of your DSC 520 directory
#setwd("/dsc520.git")
library(ggm)
library(GGally)
library(dplyr)
library(ggplot2)


## Load the `data/r4ds/heights.csv` to
students_df <- read.csv("data/student-survey.csv")

#create the matrix of the student data for variables TimeReading, TimeTV and Happiness

cor(students_df[, c("TimeReading", "TimeTV", "Happiness")])

#lets draw a graph for the correlation
GGally::ggpairs(students_df[, c("TimeReading", "TimeTV", "Happiness")])

#Heatmap
# load the reshape package for melting the data
library(reshape2)

# load the scales package for some extra plotting features
library(scales)

# build the correlation matrix
studentCor <- cor(students_df[, c("TimeReading", "TimeTV", "Happiness")])

# melt it into the long format
studentMelt <- melt(studentCor, varnames=c("x", "y"), value.name="Correlation")

# order it according to the correlation
studentMelt <- studentMelt[order(studentMelt$Correlation), ]

# display the melted data
studentMelt
## plot it with ggplot
# initialize the plot with x and y on the x and y axes
ggplot(studentMelt, aes(x=x, y=y)) + geom_tile(aes(fill=Correlation)) +
       scale_fill_gradient2(low=muted("red"), mid="white",
                                         high="steelblue",
                                        guide=guide_colorbar(ticks=FALSE, barheight=10),
                                        limits=c(-1, 1)) +  theme_minimal() + labs(x=NULL, y=NULL)

# A. Use R to calculate the covariance of the Survey variables and provide an explanation of why you would use this calculation and what the results indicate.
# Ans : I am using Pearson correlation for this calculation as it ony requires that data are interval for it to be an accurate measure of the linear relationship between two variables
# we see that the TimeReading is negatively related to TimeTv with pearson correlation of r = -0.883, this is a reasonably big effect, so we can conclude that as Tv Time increases the Reading time decreases
# Also,  we see that the TimeReading is negatively related to Happiness with pearson correlation of r =-0.434, again this is a big effect, so we can conclude that as Reading time increases the happiness decreases

# B. Examine the Survey data variables. What measurement is being used for the variables? Explain what effect changing the measurement being used for the variables would have on the covariance calculation.
# Would this be a problem? Explain and provide a better alternative if needed.
# Ans: in the Survey data variables, there are following variables with the mentioned measurement as per my assumption:
# TimeReading - numeric value (hours)
# TimeTV      - numeric value (minutes)
# Happiness   - float value (int percentage)
# Gender        - numeric value ( 1 represents male and 0 female)

# Effect of changing the measurement in covariance
# lets convert the TimeReading to Minutes and get the covariance
students_df_new <- read.csv("data/student-survey.csv")
students_df_new$TimeReading <- students_df_new$TimeReading * 60
students_df_new
cor(students_df_new[, c("TimeReading", "TimeTV", "Happiness")])

#clearly we can see that there is no effect after changing the measurement

#C. Choose the type of correlation test to perform, explain why you chose this test, and make a prediction if the test yields a positive or negative correlation?
# I chose the pearson method with .95 level of confidence with the prediction that the correlation of Reading time vs TV Time will be less than zero

cor.test(students_df_new$TimeReading, students_df_new$TimeTV, alternative = "less", method = "pearson", conf.level = 0.95)

# pearson method with .95 level of confidence with the prediction that the correlation of Reading time vs Happiness will be less than zero
cor.test(students_df_new$TimeReading, students_df_new$Happiness, alternative = "less", method = "pearson", conf.level = 0.95)

# pearson method with .95 level of confidence with the prediction that the correlation of Tv Time time vs Happiness will be greater than zero
cor.test(students_df_new$TimeTV, students_df_new$Happiness, alternative = "greater", method = "pearson", conf.level = 0.95)

# D. Perform a correlation analysis of:
# 1. All variables
cor(students_df_new, use = "complete.obs", method = "pearson")
# 2. A single correlation between two a pair of the variables
cor(students_df_new$TimeReading, students_df_new$TimeTV, use = "complete.obs", method = "pearson")

# 3. Repeat your correlation test in step 2 but set the confidence interval at 99%
cor.test(students_df_new$TimeReading, students_df_new$TimeTV, alternative = "less", method = "pearson", conf.level = 0.99)

# 4. Describe what the calculations in the correlation matrix suggest about the relationship between the variables. Be specific with your explanation.
# The calculation suggest that the Reading time is inversely related to TV time at .99 confidence level, i.e. if the TV time increases then the Reading time decreases and vice versa.

# E. Calculate the correlation coefficient and the coefficient of determination, describe what you conclude about the results.
library(Hmisc)
rcorr(as.matrix(students_df_new[, c("TimeReading", "TimeTV", "Happiness")]))
# The output of the above correlation shows that 
# Time TV  is negatively related to Reading Time with a Pearson correlation coefficient of r = -0.88 and the significance value is 0.0003 (close to 0). 
# This significance value tells us that the probability of getting a correlation coefficient this big in a sample of 11 people if the null hypothesis
# were true (there was no relationship between these variables) is very low 
# Hence, we can gain confidence that there is a genuine relationship between TVTime and ReadingTime Our criterion for significance is usually .05 
# so we can say that all of the correlation coefficients are significant.

# Coefficient of Determination for TimeTv vs TimeReading
coeffDet <- (-0.88) * (-0.88) * 100
coeffDet
# the coefficient of determination came out to be 77.44%, this means that TVTime  is highly correlated with  ReadingTime and can account for 77.44% of variation in ReadingTime 

# For all variables
cor(students_df_new)^2 * 100
# TimeTv account for 40.52% of variation in Happiness
# Happiness accounts for 18.91% variation in TimeReading

# F. Based on your analysis can you say that watching more TV caused students to read less? Explain.
#  Yes, based on the analysis on the calculation done in previous step we can say that watching more TV caused students to read less.

# G. Pick three variables and perform a partial correlation, documenting which variable you are “controlling”.
# Explain how this changes your interpretation and explanation of the results.
library(ggm)
students_df2 <- students_df_new[, c("TimeReading", "TimeTV", "Happiness")]

#Partial coorelation between TimeReading and TimeTV controlling Happiness
pc <- pcor(c("TimeTV", "TimeReading", "Happiness"), var(students_df2))
pc
pc <- pc^2 

pc
pcor.test(pc, 1, 11)
# so we see that the partial corelation between TimeReading and TimeTV came nearly same 76.20% keeping Happiness in control

#Partial coorelation between TimeTV and Happiness controlling TimeReading
pc2 <- pcor(c("TimeTV", "Happiness", "TimeReading"), var(students_df2))
pc2
pc2 <- pc2^2 

pc2
pcor.test(pc2, 1, 11)
# so we see that the partial corelation between TimeTV and Happiness came around 35.71% keeping TimeReading in control