# Assignment: ASSIGNMENT 4-2
# Name: Salgado-Gouker, Kyle
# Date: 2023-1-7

## We interact with a few datasets in this course, one you are already familiar
## with, the 2014 American Community Survey and the second is a Housing dataset,
## that provides real estate transactions recorded from 1964 to 2016.  For this
## exercise, you need to start practicing some data transformation steps – which
## will carry into next week, as you learn some additional methods.  For this
## week, using either dataset (or one of your own – although I will let you know
## ahead of time that the Housing dataset is used for a later assignment, so not
## a bad idea for you to get more comfortable with now!), perform the following
## data transformations:

library(ggplot2)
library(readxl)
library(plyr)

theme_set(theme_minimal())

## Set the working directory to the root of your DSC 520 directory
setwd("C:/Users/kyles/OneDrive/Documents/GitHub/dsc520")

## Load the `data/week-7-housing.xlsx` to
housing_df <- read_excel("data/week-7-housing.xlsx")
str(housing_df)
nrow(housing_df)
ncol(housing_df)

# Remove the space from the field names for consistency
old_names <- names(housing_df)
old_names[1] <- "sale_date"
old_names[2] <- "sale_price"
names(housing_df) <- old_names

# Adds two fields
# 1. Price per square foot.
prices <- housing_df["sale_price"]
sq_ft <- housing_df["square_feet_total_living"]
price_per_sq_ft <- round(prices/sq_ft, 2)
# Adds new column to table
names(price_per_sq_ft) <- c("price_per_square_foot")
housing_df <- cbind(housing_df, price_per_sq_ft)

# 2. Years old at sale
get_year_of_sale <- function(x) {
  return(strtoi(substr(x, 1, 4)))
}

# a. Use the apply function on a variable in your dataset
# calculate year_of_sale first.
year_of_sale <- sapply(housing_df$sale_date, get_year_of_sale)
# field for year_of_sale.
names(year_of_sale) <- c("year_of_sale")
housing_df <- cbind(housing_df, year_of_sale)

calculate_age_at_sale <- function(x, construction_year, year_at_sale) {
  return(year_at_sale - construction_year)
}

age_at_sale <- sapply(housing_df, calculate_age_at_sale, construction_year=housing_df$year_built, year_at_sale=housing_df$year_of_sale)[, 1]
# add new field to data frame for age at sale.
names(age_at_sale) <- c("age_at_sale")
housing_df <- cbind(housing_df, age_at_sale)

# b. Use the aggregate function on a variable in your dataset
# Builds new data frame with aggregate data by year. Allows us to calculate (for
# example) relative value of property sold.
years <- aggregate(housing_df, by = list(housing_df$year_of_sale), FUN=length)[,1]
total_houses_sold_by_year <- aggregate(housing_df, by = list(housing_df$year_of_sale), FUN=length)[,2]
sales_total_by_year <- aggregate(housing_df$sale_price, list(housing_df$year_of_sale), FUN=sum)[,2]
average_by_year <- sales_total_by_year/total_houses_sold_by_year

yearly_summary <- data.frame()
for (row_number in 1:length(years)) {
  # make a new row
  year_row <- c(years[row_number], total_houses_sold_by_year[row_number], sales_total_by_year[row_number], 
                sales_total_by_year[row_number]/total_houses_sold_by_year[row_number])
  # set the names
  names(year_row) <- c('year', 'homes_sold', 'total_value_sold', 'average_price')
  # add the new row to the new data frame
  yearly_summary <- rbind(yearly_summary, year_row)
}

# give names to the columns of yearly_summary
names(yearly_summary) <- c('year', 'homes_sold', 'total_value_sold', 'average_price')

# relative value of property sold column added for each row 
percentage_of_average_yearly_sale <- round(100*as.double(housing_df$sale_price)/as.double(yearly_summary[strtoi(housing_df$year_of_sale)-2005, 4]),2)
housing_df <- cbind(housing_df, percentage_of_average_yearly_sale)

# c. Use the plyr function on a variable in your dataset – more specifically, I
# want to see you split some data, perform a modification to the data, and
# then bring it back together.
# d. Check distributions of the data per year with these functions using ddply.
sale_price_analysis_df <- ddply(housing_df,
                                .(year_of_sale),
                                summarize, 
                                units = length(sale_date),
                                minimum = min(sale_price),
                                maximum = max(sale_price),
                                mean = mean(sale_price), 
                                median = median(sale_price),
                                sd   = sd(sale_price),
                                se = sd/sqrt(units))

per_square_foot_analysis_df <- ddply(housing_df,
                                     .(year_of_sale),
                                     summarize, 
                                     units = length(sale_date),
                                     minimum = min(price_per_square_foot),
                                     maximum = max(price_per_square_foot),
                                     mean = mean(price_per_square_foot), 
                                     median = median(price_per_square_foot),
                                     sd   = sd(price_per_square_foot),
                                     se = sd/sqrt(units))

# Shows error boxes in the graphs (+/- sd).
sales_price_plot = ggplot(sale_price_analysis_df, aes(x=year_of_sale, y=median, color='blue')) + geom_line() + geom_point() + 
  geom_errorbar(data=sale_price_analysis_df, mapping=aes(x=year_of_sale, ymin=median-sd, ymax=median+sd), width=0.2, linewidth=1, color="green") +
  ggtitle("Sale Prices") + xlab("Year") + ylab("Dollars") + lims(x = c(2006, 2016))

per_square_foot_plot = ggplot(per_square_foot_analysis_df, aes(x=year_of_sale, y=median, color='red')) + geom_line() + geom_point() + 
  geom_errorbar(data=per_square_foot_analysis_df, mapping=aes(x=year_of_sale, ymin=median-sd, ymax=median+sd), width=0.2, linewidth=1, color="green") +
  ggtitle("Price Per Square Foot") + xlab("Year") + ylab("Dollars Per Sq Foot") + lims(x = c(2006, 2016))

# e. Identify if there are any outliers
# 
# >>> There are plenty of outliers, especially in 2008, as can be seen in the
# >>> wild standard deviation. A simple perusal of the sales show a purchase of
# >>> $698 for a 5800 sq ft house in 2010. This is not even unique, as there are
# >>> 5 homes sold for less than $1000. At the same time that year, there were
# >>> homes sold for $4.4 million.
# 
# f. Create at least 2 new variables
# 
# >>> I created four new variables above.