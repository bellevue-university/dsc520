
# Assignment: Excercise 3.5 
# Name: Ayachit, Madhukar
# Date: 2020-09-15

acs_df=read.csv("data/acs-14-1yr-s0201.csv")

#1. What are the elements in your data (including the categories and data types)?
str(acs_df)

#2. Please provide the output from the following functions: str(); nrow(); ncol()
nrow(acs_df)
ncol(acs_df)

head(acs_df)
names(acs_df)=c("ID1","ID2","Geography","PopGroupId","DisplayLabel","RacesReported","HSDegree","BatchDegree")

#3. Create a Histogram of the HSDegree variable using the ggplot2 package.
library("ggplot2")

#a. Set a bin size for the Histogram.
#b. Include a Title and appropriate X/Y axis labels on your Histogram Plot.



gg<-ggplot(acs_df,aes(HSDegree) )+ 
  geom_histogram(bins=10,binwidth = 5 ,fill="grey",col="black") +
  labs(title="ACS HS Degree Graph",x="HS Degree",y="Count")
gg


ggplot(diamonds, aes(carat, price)) + stat_bin2d() +
  scale_fill_gradient(trans="log10")

#4. Answer the following questions based on the Histogram produced:

gg +   geom_density(col="red" ,aes(y=5*..count..))

#  a. Based on what you see in this histogram, is the data distribution unimodal?
# Ans is "yes"
#  b. Is it approximately symmetrical?
#  ans is "No"  
#  c. Is it approximately bell-shaped?
# ans is "no"  
#  d. Is it approximately normal?
# ans is "No"  
#  e. If not normal, is the distribution skewed? If so, in which direction?
#   data is negatively screwed 
#  f. Include a normal curve to the Histogram that you plotted.
gg +   geom_density(col="red" ,aes(y=5*..count..))
#  g. Explain whether a normal distribution can accurately be used as a model for this data.

#5. Create a Probability Plot of the HSDegree variable.
qqnorm(acs_df$HSDegree,col="grey")
qqline(acs_df$HSDegree,col="blue")


#6. Answer the following questions based on the Probability Plot:
  
#  a. Based on what you see in this probability plot, is the distribution approximately normal? Explain how you know.
# distribution is not nornal which is shown in the plot as one outlier goes below 65 and uptill 70 to 85 trials below the line 
# and after 90 also few goes away from lone.

#b. If not normal, is the distribution skewed? If so, in which direction? Explain how you know.
#   mostly negative screw and majority distribution under 80 lags  behind  the center line 


#7. Now that you have looked at this data visually for normality, you will now quantify normality with numbers using the 
#   stat.desc() function. Include a screen capture of the results produced.

library(pastecs)
stat.desc(acs_df, basic=TRUE, desc=TRUE, norm=FALSE, p=0.95)

#8. In several sentences provide an explanation of the result produced for skew, kurtosis, and z-scores. 
#   In addition, explain how a change in the sample size may change your explanation?
  
library(e1071)  
skewness(acs_df$HSDegree)
kurtosis(acs_df$HSDegree) 

scale(acs_df$HSDegree,center = TRUE,scale = TRUE)
