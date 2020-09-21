# Assignment: ASSIGNMENT 3 - Excersise 5
# Name: Mandal, Abhijit
# Date: 2020-09-20

theme_set(theme_minimal())

## Set the working directory to the root of your DSC 520 directory

## Load the 'data/acs-14-1yr-s0201.csv' to
survey_df <- read.csv("data/acs-14-1yr-s0201.csv")

## output from the following functions: str(); nrow(); ncol()
str(survey_df)
nrow(survey_df)
ncol(survey_df)

##Create a Histogram of the HSDegree variable using the ggplot2 package.
## Load the ggplot2 package
library(ggplot2)
## Create a histogram of the `HSDegree` variable using `geom_histogram()`
ggplot(survey_df, aes(HSDegree))+ geom_histogram(fill="steelblue", colour="black", binwidth = 1,bins = 50) +  ggtitle("HSDegree distribution") + ylab("Count") + xlab("% of people having High School Degree")

##Include a normal curve to the Histogram that you plotted.

ggplot(data = survey_df) + 
  geom_histogram(mapping = aes(x = HSDegree, y=..density..), fill="steelblue", colour="black", binwidth = 1,bins = 50) +
  ggtitle("HSDegree distribution") + ylab("Relative Frequency") + xlab("% of people having High School Degree") +
  stat_function(fun = dnorm, colour = "red", args = list(mean = mean(survey_df$HSDegree), sd = sd(survey_df$HSDegree)))

##Create a Probability Plot of the HSDegree variable.
ggplot(survey_df, aes(sample=HSDegree)) + stat_qq(col="blue") + stat_qq_line(col="red", lty=2)


##Now that you have looked at this data visually for normality, you will now quantify normality with numbers using the stat.desc() function. Include a screen capture of the results produced.
library(pastecs)
stat.desc(survey_df$HSDegree, basic = FALSE, norm = TRUE)