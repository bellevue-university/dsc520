# Assignment: ASSIGNMENT 3
# Name: Lastname, Firstname
# Date: 2010-02-14

## Load the ggplot2 package
library(ggplot2)
theme_set(theme_minimal())

## Set the working directory to the root of your DSC 520 directory
setwd("/home/jdoe/Workspaces/dsc520")

## Load the `data/r4ds/heights.csv` to
heights_df <- read.csv("data/r4ds/heights.csv")

# https://ggplot2.tidyverse.org/reference/geom_point.html
## Using `geom_point()` create three scatterplots for
## `height` vs. `earn`
ggplot(___, aes(x=___, y=___)) + ___
## `age` vs. `earn`
ggplot(___, aes(x=___, y=___)) + ___
## `ed` vs. `earn`
ggplot(___, aes(x=___, y=___)) + ___

## Re-create the three scatterplots and add a regression trend line using
## the `geom_smooth()` function
## `height` vs. `earn`
ggplot(___, aes(x=___, y=___)) + ___ + ___
## `age` vs. `earn`
ggplot(___, aes(x=___, y=___)) + ___ + ___
## `ed` vs. `earn`
ggplot(___, aes(x=___, y=___)) + ___ + ___

## Create a scatterplot of `height`` vs. `earn`.  Use `sex` as the `col` (color) attribute
ggplot(___, aes(x=___, y=___, col=___)) + ___

## Using `ggtitle()`, `xlab()`, and `ylab()` to add a title, x label, and y label to the previous plot
## Title: Height vs. Earnings
## X label: Height (Inches)
## Y Label: Earnings (Dollars)
ggplot(___, aes(x=___, y=___, col=___)) + ___ + ___ + ___ + ___

# https://ggplot2.tidyverse.org/reference/geom_histogram.html
## Create a histogram of the `earn` variable using `geom_histogram()`
ggplot(___, aes(___)) + ___

## Create a histogram of the `earn` variable using `geom_histogram()`
## Use 10 bins
ggplot(___ aes(___)) + ___

# https://ggplot2.tidyverse.org/reference/geom_density.html
## Create a kernel density plot of `earn` using `geom_density()`
ggplot(___, aes(___)) +  ___
