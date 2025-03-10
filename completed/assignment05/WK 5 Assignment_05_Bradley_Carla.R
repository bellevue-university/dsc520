# Assignment: ASSIGNMENT 5
# Name: Bradley, Carla
# Date: 2021-01-12
# 
library(ggplot2)
theme_set(theme_minimal())
library(tidyverse)
## Set the working directory to the root of your DSC 520 directory
setwd("/Users/carla/Documents/GitHub/dsc520/data/r4ds")

## Load the `data/r4ds/heights.csv` to
heights_df <- read.csv("heights.csv")

## Using `cor()` compute correlation coefficients for
## height vs. earn

heights <- heights_df %>%
  select(earn, height)
cor(heights$height, heights$earn)

### age vs. earn
heights <- heights_df %>%
  select(age, earn)
cor(heights$age, heights$earn)
### ed vs. earn
heights <- heights_df %>%
  select(ed, earn)
cor(heights$ed, heights$earn)

## Spurious correlation
## 
## The following is data on US spending on science, space, and technology in millions of today's dollars
## and Suicides by hanging strangulation and suffocation for the years 1999 to 2009
## Compute the correlation between these variables
## 
## 
tech_spending <- c(18079, 18594, 19753, 20734, 20831, 23029, 23597, 23584, 25525, 27731, 29449)
suicides <- c(5427, 5688, 6198, 6462, 6635, 7336, 7248, 7491, 8161, 8578, 9000)

select(tech_spending, suicides)
cor(tech_spending, suicides)












