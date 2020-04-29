# Assignment: ASSIGNMENT 4
# Name: Lastname, Firstname
# Date: 2010-02-14

## Load the ggplot2 package
library(ggplot2)
theme_set(theme_minimal())

## Set the working directory to the root of your DSC 520 directory
setwd("/home/jdoe/Workspaces/dsc520")

## Load the `data/r4ds/heights.csv` to
heights_df <- read.csv("data/r4ds/heights.csv")

# https://ggplot2.tidyverse.org/reference/geom_boxplot.html
## Create boxplots of sex vs. earn and race vs. earn using `geom_point()` and `geom_boxplot()`
## sex vs. earn
ggplot(___, aes(x=___, y=___)) + ___+ ___
## race vs. earn
ggplot(___, aes(x=___, y=___)) + ___+ ___

# https://ggplot2.tidyverse.org/reference/geom_bar.html
## Using `geom_bar()` plot a bar chart of the number of records for each `sex`
ggplot(___, aes(___)) + ___

## Using `geom_bar()` plot a bar chart of the number of records for each race
ggplot(heights_df, aes(___)) + ___

## Create a horizontal bar chart by adding `coord_flip()` to the previous plot
ggplot(___, aes(___)) + ___ + ___

# https://www.rdocumentation.org/packages/ggplot2/versions/3.3.0/topics/geom_path
## Load the file `"data/nytimes/covid-19-data/us-states.csv"` and
## assign it to the `covid_df` dataframe
covid_df <- read.csv("data/nytimes/covid-19-data/us-states.csv")

## Parse the date column using `as.Date()``
covid_df$date <- ___

## Create three dataframes named `california_df`, `ny_df`, and `florida_df`
## containing the data from California, New York, and Florida
california_df <- covid_df[ which( covid_df$state == "California"), ]
ny_df <- ___
florida_df <- ___

## Plot the number of cases in Florida using `geom_line()`
ggplot(data=florida_df, aes(x=___, y=___, group=1)) + ___

## Add lines for New York and California to the plot
ggplot(data=___, aes(x=___, group=1)) +
  geom_line(aes(y = ___)) +
  geom_line(data=___, aes(y = ___)) +
  geom_line(data=___, aes(y = ___))

## Use the colors "darkred", "darkgreen", and "steelblue" for Florida, New York, and California
ggplot(data=___, aes(x=___, group=1)) +
  geom_line(aes(y = ___), color = ___) +
  geom_line(data=ny_df, aes(y = cases), color=___) +
  geom_line(data=___, aes(y = ___), color=___)

## Add a legend to the plot using `scale_colour_manual`
## Add a blank (" ") label to the x-axis and the label "Cases" to the y axis
ggplot(data=___, aes(x=___, group=1)) +
  geom_line(aes(y = cases, colour = "Florida")) +
  geom_line(data=ny_df, aes(y = cases,colour="New York")) +
  geom_line(data=california_df, aes(y = cases, colour="California")) +
  scale_colour_manual("",
                      breaks = c(___, ___, ___),
                      values = c(___, ___, ___)) +
  xlab(" ") + ylab("Cases")

## Scale the y axis using `scale_y_log10()`
ggplot(data=___, aes(x=___, group=1)) +
  geom_line(aes(y = cases, colour = "Florida")) +
  geom_line(data=ny_df, aes(y = cases,colour="New York")) +
  geom_line(data=california_df, aes(y = cases, colour="California")) +
  scale_colour_manual("",
                      breaks = c(___, ___, ___),
                      values = c(___, ___, ___)) +
  xlab(" ") + ylab("Cases") + ___
