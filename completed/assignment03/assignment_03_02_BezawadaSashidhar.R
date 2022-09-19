# Assignment: ASSIGNMENT 3.2
# Name: Bezawada, Sashidhar
# Date: 2022-09-16

## Load the ggplot2 package
#install.packages("ggplot2")
library(ggplot2)
theme_set(theme_minimal())

## Set the working directory to the root of your DSC 520 directory
setwd("C:/Sashi/R_Projects/dsc520/")

## Load the `data/acs-14-1yr-s0201.csv` to
acs_df <- read.csv("data/acs-14-1yr-s0201.csv")
head(acs_df)

## List the name of each field and what you believe the data type and intent is of the data included in each field
names(acs_df)
summary(acs_df)
nrow(unique(acs_df[1]))

#What are the elements in your data?
#Id - Data Type: varchar (contains text and numbers) Intent: unique identifier for each row
#Field_Name             Data Type                               Intent
#----------             --------------------------------------  -------------------------------
#Id                     varchar (contains text and numbers)     unique identifier for each row        
#Id2                    Integer (contains numbers)              unique identifier number for each row        
#Geography              varchar (contains text )                County & State names in United States
#PopGroupID             Integer (contains numbers)              Population Grouping . It has only one value - 1
#POPGROUP.display.label varchar (contains text )                Contains only one value " Total Population"
#RacesReported          integer (contains numbers)              Contains total number of people
#HSDegree               Numeric (contains decimal)              High school Degree Completion percentage
#BachDegree             Numeric (contains decimal)              Bachelor Degree Completion percentage

## Run the following functions and provide the results: str(); nrow(); ncol()
#Categories and data types of the elements in the dataset
str(acs_df)
#Number of rows
nrow(acs_df)
#Number of columns
ncol(acs_df)

#Create a Histogram of the HSDegree variable using the ggplot2 package.
#number of bins = 12 
#Each row of data represents a different U.S. city
ggplot(acs_df, aes(x=HSDegree)) + geom_histogram(bins = 12) + ggtitle('Histogram of the HSDegree') + xlab('Percentage of Total City Population with High School Degrees') + ylab('Frequency')

# Based on what you see in this histogram, is the data distribution unimodal?
# Answer : Only one Hump seen , so , based on that the data distribution is Unimodal. 

# Is it approximately symmetrical?
# Answer : Mean (87.63) and median (88.70) is close enough.So, we can say it is approximately symmetrical. 

# Is it approximately bell-shaped?
# Answer : Yes. It is bell-shaped

# Is it approximately normal?
# Answer : It is not Normal .
 
# If not normal, is the distribution skewed? If so, in which direction?
# Answer : Based on the graph, it is Left Skewed

x <- acs_df$HSDegree
#Histogram oof HSDegree variable
hist.HSDegree <- ggplot(acs_df,aes(HSDegree)) + geom_histogram(aes(y=..density..),bins=11,colour="black",fill="white") + labs(x="Percentage of Total City Population with HSDegrees",y="Density")
hist.HSDegree
# Include a normal curve to the Histogram that you plotted.
#overlaying normal curve
hist.HSDegree + stat_function(fun=dnorm,args=list(mean=mean(x),sd=sd(x)),colour="black",size=1)

#points lie at the higher end of the percentage spectrum (closer to 100%) than the rest of the data.
#The mean value is 87.63, and the IQR goes from 85.5 - 90.75, which is where the majority of the values lie between.
#Given that this range is quite small, I would say that the normal distribution cannot be accurately used as a model
#for this data, since the sample data is already not normally distrubted, and is already showed skewness.


# Explain whether a normal distribution can accurately be used as a model for this data.

#Create a Probability Plot of the HSDegree variable.
#Construction a normal probability plot
#Can evaluate how close the points on the probability plot fall to the normal line
qqnorm(acs_df$HSDegree)
qqplot.HSDegree <- qplot(sample=acs_df$HSDegree,stat='qq')
qqplot.HSDegree


#For analyzing the probability plot for the data distribution of HSDegree, Most of the data points do not follow along the normal line.
#It has a general curve to it and a majority of the points outside of majority range fall away from the line and move away from the normality of the distribution. 

#The distribution is skewed to the left, as both ends of the normality plot bend below the hypothetical normal line that was drawn on the plot.


#stat.desc() function
#install.packages("pastecs")
library(pastecs)
stat.desc(acs_df$HSDegree,norm=TRUE,p=0.95)

# In several sentences provide an explanation of the result produced for skew, kurtosis, and z-scores. 
# In addition, explain how a change in the sample size may change your explanation?

#The negative skewness value of the HSDegree variable indicates that the data distribution is skewed to the left. With
#a value of -1.67, we can see that the skew is pretty strongly directed to the left for this series.
#A normal distribution has a kurtosis of exactly 3. The kurtosis for this data distribution is equal to 4.35,
#which being greater than 3, shows that it is platykurtic, which shows that the tails are shorter and thinner
#and the peak is lower and broader as we did see with the histogram. 
#The normtest.p value is 3.19364e-09, which is less than p = 0.05 for a 95% confidence interval.
#This demonstrates that the distribution of data is significantly from the normal distribution, so we can assume
#that the data distribution of HSDegree is not normal. This comes from the Shapiro-Wilk test of normality.

#The sample size of 136 was relatively small for a population representation of the United States, especially
#when it comes from Census data. If the sample size was different, it may have changed my explanation
#as the distribution would be more representative of the country and give a better idea of the distribution.