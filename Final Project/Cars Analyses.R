library('ggplot2')
library('tidyr')
library('dplyr')
library('car')
library('tm')
options(warn=-1)

#Importing the data and checking for NA values
cars <- read.csv("C:/Users/PS3ma/Downloads/ThinkStats2-master/ThinkStats2-master/code/CO2 Emissions_Canada.csv")
cars$Transmission <- removeNumbers(cars$Transmission)
empty_data <- is.na(cars)

#Introducing noise to account for rounding
cars$Engine.Size.L. <- jitter(cars$Engine.Size.L., amount = 0.25)
cars$CO2.Emissions.g.km. <- jitter(cars$CO2.Emissions.g.km., amount = 0.5)

cars$Transmission <- as.factor(cars$Transmission)
cars$Fuel.Type <- as.factor(cars$Fuel.Type)
cars$Make <- as.factor(cars$Make)
cars$Vehicle.Class <- as.factor(cars$Vehicle.Class)

#Summary of the dataset
summary(cars)
str(cars)


#Histograms and bar charts of engine specifications to find the most common engine type
ggplot(cars, aes(x = Engine.Size.L.)) + geom_histogram(bins = 25) + xlab('Engine Displacement (L)') + ylab('Frequency')
ggplot(cars, aes(x = Cylinders)) + geom_histogram() + xlab('Number of Cylinders') + ylab('Frequency')
ggplot(cars, aes(x = Transmission)) + geom_bar() + ylab('Transmission Type') + ylab('Frequency')
ggplot(cars, aes(x = Fuel.Type)) + geom_bar() + xlab('Fuel Type') + ylab('Frequency')

#Scatter plots and box plots to find what the correlation is between each variable and CO2 emissions
ggplot(cars, aes(x = reorder(Make, CO2.Emissions.g.km.), y = CO2.Emissions.g.km.)) + geom_boxplot(outlier.shape = NA) + theme(axis.text.x=element_text(angle = 90)) + ylab('CO2 Emissions (g/km)')
ggplot(cars, aes(x = reorder(Vehicle.Class, CO2.Emissions.g.km.), y = CO2.Emissions.g.km.)) + geom_boxplot(outlier.shape = NA) + theme(axis.text.x=element_text(angle = 90)) + xlab('Vehicle Shape') + ylab('CO2 Emissions (g/km)')
ggplot(cars, aes(x = Engine.Size.L., y = CO2.Emissions.g.km.)) + geom_point(color = "blue") + xlab('Engine Displacement (L)') + ylab('CO2 Emissions (g/km)')
ggplot(cars, aes(x = reorder(as.factor(Cylinders), CO2.Emissions.g.km.), y = CO2.Emissions.g.km.)) + geom_boxplot(outlier.shape = NA) + xlab('Cylinders') + ylab('CO2 Emissions (g/km)')
ggplot(cars, aes(x = reorder(Transmission, CO2.Emissions.g.km.), y = CO2.Emissions.g.km.)) + geom_boxplot(outlier.shape = NA) + xlab('Transmission Type') + ylab('CO2 Emissions (g/km)')
ggplot(cars, aes(x = reorder(Fuel.Type, CO2.Emissions.g.km.), y = CO2.Emissions.g.km.)) + geom_boxplot(outlier.shape = NA) + xlab("Fuel Type") + ylab('CO2 Emissions (g/km)')
ggplot(cars, aes(x = Fuel.Consumption.City..L.100.km., y = CO2.Emissions.g.km.)) + geom_point(color = "green") + xlab('City Fuel Consumption (L/100km)') + ylab('CO2 Emissions (g/km)')
ggplot(cars, aes(x = Fuel.Consumption.Hwy..L.100.km., y = CO2.Emissions.g.km.)) + geom_point(color = "red") + xlab('Hwy Fuel Consumption (L/100km)') + ylab('CO2 Emissions (g/km)')
ggplot(cars, aes(x = Fuel.Consumption.Comb..L.100.km., y = CO2.Emissions.g.km.)) + geom_point(color = "purple") + xlab('Comb Fuel Consumption (L/100km)') + ylab('CO2 Emissions (g/km)')


#The emissions vs fuel consumption plot displayed multiple lines. Let's separate that data
#to see if we can see any interesting information.

#Separating the data frame by transmission type 
cars_A <- filter(cars, Transmission == 'A')
cars_AM <- filter(cars, Transmission == 'AM')
cars_AS <- filter(cars, Transmission == 'AS')
cars_AV <- filter(cars, Transmission == 'AV')
cars_M <- filter(cars, Transmission == 'M')

#Color coding the emissions vs fuel consumption plot by fuel type. We can clearly see
#that each of the lines seen in the original plot is due to a different fuel type.
ggplot(cars, aes(x = Fuel.Consumption.Comb..L.100.km., y = CO2.Emissions.g.km., color = Fuel.Type)) + geom_point() + xlab('Comb Fuel Consumption (L/100km)') + ylab('CO2 Emissions (g/km)')


#Separating by transmission and color coding by fuel type reveals that some transmissions appear to be more common with some fuels.
ggplot(cars_A, aes(x = Fuel.Consumption.Comb..L.100.km., y = CO2.Emissions.g.km., color = Fuel.Type)) + geom_point() + xlab('Comb Fuel Consumption (L/100km)') + ylab('CO2 Emissions (g/km)')
ggplot(cars_AM, aes(x = Fuel.Consumption.Comb..L.100.km., y = CO2.Emissions.g.km., color = Fuel.Type)) + geom_point() + xlab('Comb Fuel Consumption (L/100km)') + ylab('CO2 Emissions (g/km)')
ggplot(cars_AS, aes(x = Fuel.Consumption.Comb..L.100.km., y = CO2.Emissions.g.km., color = Fuel.Type)) + geom_point() + xlab('Comb Fuel Consumption (L/100km)') + ylab('CO2 Emissions (g/km)')
ggplot(cars_AV, aes(x = Fuel.Consumption.Comb..L.100.km., y = CO2.Emissions.g.km., color = Fuel.Type)) + geom_point() + xlab('Comb Fuel Consumption (L/100km)') + ylab('CO2 Emissions (g/km)')
ggplot(cars_M, aes(x = Fuel.Consumption.Comb..L.100.km., y = CO2.Emissions.g.km., color = Fuel.Type)) + geom_point() + xlab('Comb Fuel Consumption (L/100km)') + ylab('CO2 Emissions (g/km)')
#Automatic and hybrid transmissions can be found on all car types, manual and automated manual transmissions are more 
#common in premium gas cars, and CVTs are more common in regular gas cars. This may be because sports cars, which use 
#premium gas, tend to use manually controlled transmissions due to their powerful engines, whereas CVTs are meant to reduce
#pollution and fuel consumption so cars that have them use regular gas, which emits the least CO2 of the fuels.

cars_gas <- filter(cars, Fuel.Type == 'X')
cars_premium_gas <- filter(cars, Fuel.Type == 'Z')
cars_diesel <- filter(cars, Fuel.Type == 'D')
cars_ethanol <- filter(cars, Fuel.Type == 'E')


#A small difference was seen between the gas and premium gas lines in the scatter plot. 
#Is there a difference between gas and premium gas fuel consumption? Let's find out.
res <- t.test(cars_gas$Fuel.Consumption.Comb..L.100.km., cars_premium_gas$Fuel.Consumption.Comb..L.100.km.)
#Based on the p-value, there is indeed a significant different in fuel consumption between gas and premium gas cars.


#Do diesel cars really pollute more than regular gas cars? Let's find out as well.
res2 <- t.test(cars_gas$CO2.Emissions.g.km., cars_diesel$CO2.Emissions.g.km.)
#Based on the p-value, the difference in emissions between gas and diesel is significant.
#This matches up to common claims that diesel cars pollute more despite being more fuel efficient.

#Ethanol cars appear to have a higher mean emissions rate than other fuels, despite people claiming 
#ethanol to be a clean burning fuel. Is there an emission difference between ethanol and normal gas?
res3 <- t.test(cars_gas$CO2.Emissions.g.km., cars_ethanol$CO2.Emissions.g.km.)
#It looks like ethanol does appear to have a significant difference from gas in emissions. The box 
#plot reveals that ethanol has higher emissions than gas. This could be caused by the number of ethanol 
#samples being an order of magnitude smaller than the number of gas samples.


#It appears that all the variables are linearly correlated with CO2 emissions 
#so I will set up a multiple linear regression model.
emission.model <- lm(CO2.Emissions.g.km. ~ Make + Vehicle.Class + Transmission + Fuel.Type + Cylinders
                     + Engine.Size.L. + Fuel.Consumption.City..L.100.km. + Fuel.Consumption.Hwy..L.100.km. + Fuel.Consumption.Comb..L.100.km., data = cars)

summary(emission.model)

#Calculating R2
summary(emission.model)$r.squared

#Casewise diagnostics (including standardized residuals, leverage, cook distance, and covariance ratios)
cars$standardized.residuals <- rstandard(emission.model)
cars$cooks.distance <- cooks.distance(emission.model)
cars$leverage <- hatvalues(emission.model)
cars$covariance.ratios <- covratio(emission.model)

#Calculating the RMSE
RMSE <- sqrt(var(cars$standardized.residuals))



#All Cook's distances are less than 1, so nothing is having an undue influence on the model
cars$cooks.distance[cars$cooks.distance > 1]

#The formula 1+/-[3(k+1)/n] was used to find the bounds the covariance ratio should be in 
cars$covariance.ratios[cars$covariance.ratios > 1.031 | cars$covariance.ratios < 0.969]
#About 5% of the ratios are outside the boundaries, and because all the Cook's distances are below 1, there is little cause for alarm.

#The assumption of independence has been met, as the D-W statistic is above 1, indicating the residuals are correlated.
durbinWatsonTest(emission.model)

#The model does contain multicollinearity, as the determinant of the correlation matrix is higher than 0.00001. 
#This makes sense as many variables were highly correlated with CO2 emissions, and thus, each other. 
#To find the determinant, the categorical variables are removed to calculate the correlation matrix 
#and its determinant is then found.
cor_matrix <- cor(select(cars, -Transmission, -Fuel.Type, -Make, -Model, -Vehicle.Class))
det(cor_matrix)

#The histogram and Q-Q plot inform us of any deviations from normality seen in the residuals.
#Based on this, we can clearly see that the distribution of residuals is approximately normal.
#In addition, the plot of residuals vs fitted values appears to be not random. Residuals appear to remain fairly constant across the fitted values.
#Due to the non-random residual vs fitted value distribution, the normality of residuals, and the assumption of independence, this model has little bias.

hist(cars$standardized.residuals)

plot(emission.model)


