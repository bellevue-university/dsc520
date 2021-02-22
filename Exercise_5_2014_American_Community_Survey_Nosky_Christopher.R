# This is your second exercise with real data. This time, instead of a bank of
# test scores, we will use the 2014 American Community Survey. These data are
# maintained by the US Census Bureau and are designed to show how communities
# are changing.

#
# Through asking questions of a sample of the population, it produces national
# data on more than 35 categories of information, such as education, income,
# housing, and employment.

#
# For this assignment, you will need to load and activate the ggplot2 package.
# For this deliverable, you should provide the following:
library(ggplot2) 

#
#   1. What are the elements in your data (including the categories and data
  # types)?
setwd('C:/Users/cwnos/Documents/DSC520/Git repo/DSC520')
survey_df <- read.csv('dsc520/acs-14-1yr-s0201.csv', stringsAsFactors = TRUE)
summary(survey_df)
head(survey_df)
#   2. Please provide the output from the following functions: str(); nrow();
# ncol()
str(survey_df)
nrow(survey_df)
ncol(survey_df)
#
# 3. Create a Histogram of the HSDegree variable using the ggplot2 package.
#
# a. Set a bin size for the Histogram.
ggplot(survey_df, aes(HSDegree)) + geom_histogram(bins = 10) +
  ggtitle('Percent of High School Graduates per County') +
  xlab('Percentage of High Scool Graduates') + ylab('Number of Counties') +
  geom_density(aes(y=4.5*..count..), color = 'red', adjust=2)

#
# b. Include a Title and appropriate X/Y axis labels on your Histogram Plot.
#
# 4. Answer the following questions based on the Histogram produced:
#
#   a. Based on what you see in this histogram, is the data distribution unimodal?
#
#   b. Is it approximately symmetrical?
#
#   c. Is it approximately bell-shaped?
#
#   d. Is it approximately normal?
#
#   e. If not normal, is the distribution skewed? If so, in which direction?
#
#   f. Include a normal curve to the Histogram that you plotted.
#
# g. Explain whether a normal distribution can accurately be used as a model
# for this data.

#
# 5. Create a Probability Plot of the HSDegree variable.

ggplot(survey_df, aes(sample=HSDegree)) + stat_qq() + stat_qq_line()

#
# 6. Answer the following questions based on the Probability Plot:
#
#   a. Based on what you see in this probability plot, is the distribution
# approximately normal? Explain how you know.

#
# b. If not normal, is the distribution skewed? If so, in which direction?
# Explain how you know.

#
# 7. Now that you have looked at this data visually for normality, you will
# now quantify normality with numbers using the stat.desc() function. Include
# a screen capture of the results produced.
install.packages('pastecs')
library(pastecs)
stat.desc(survey_df, basic=TRUE, desc=TRUE, norm=FALSE, p=0.95)

#
# 8. In several sentences provide an explanation of the result produced for
# skew, kurtosis, and z-scores. In addition, explain how a change in the sample
# size may change your explanation?