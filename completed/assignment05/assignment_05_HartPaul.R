# Assignment: ASSIGNMENT 5
# Name: Hart, Paul
# Date: 2021-01-14

## Set the working directory to the root of your DSC 520 directory
setwd("C:/Users/Paul/Bellevue University/DSC 520 Stat for DS/Week 5")
library(ggplot2)

## Load the `data/r4ds/heights.csv` to
heights_df <- read.csv("heights.csv")
h_df <- heights_df[["height"]]
head(h_df)

e_df <- heights_df[["earn"]]
head(e_df)

age_df <- heights_df[["age"]]
head(age_df)

ed_df <- heights_df[["ed"]]
head(ed_df)

## Using `cor()` compute correclation coefficients for
## height vs. earn
cor(h_df,e_df)

### age vs. earn
cor(age_df,e_df)

### ed vs. earn
cor(ed_df,e_df)

## Spurious correlation
## The following is data on US spending on science, space, and technology in millions of today's dollars
## and Suicides by hanging strangulation and suffocation for the years 1999 to 2009
## Compute the correlation between these variables
tech_spending <- c(18079, 18594, 19753, 20734, 20831, 23029, 23597, 23584, 25525, 27731, 29449)
suicides <- c(5427, 5688, 6198, 6462, 6635, 7336, 7248, 7491, 8161, 8578, 9000)

cor(tech_spending,suicides)

