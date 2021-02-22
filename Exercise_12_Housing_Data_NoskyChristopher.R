setwd('C:/Users/cwnos/Documents/DSC520/Git repo/DSC520/dsc520')

library(readxl)
library(lm.beta)


housing_df <- read_xlsx("data/week-6-housing.xlsx")

bathrooms <- subset(housing_df,  
                    select = c('bath_full_count', 'bath_half_count',
                               'bath_3qtr_count'), drop = FALSE)

total_bathrooms <- (bathrooms$bath_full_count * 1) + 
                   (bathrooms$bath_half_count * 0.5) + 
                   (bathrooms$bath_3qtr_count * 0.75)

housing_df$total_bathrooms <- total_bathrooms

clean_housing_df <- data.frame(housing_df, stringsAsFactors = TRUE)

# clean_housing <- drop(housing_df, c('Sale Date', 'sale_reason',
#                                'sale_warning', 'sitetype',
#                                'addr_full', 'zip5', 'ctyname',
#                                'postalctyn', 'lon', 'lat',
#                                'building_grade', 'year_built',
#                                'year_renovated', 'current_zoning',
#                                'prop_type', 'present_use'))

clean_housing_df <- subset(housing_df,
                  select = c('Sale Price', 
                           'square_feet_total_living',
                           'bedrooms', 
                           'sq_ft_lot', 
                           'total_bathrooms'))

head(clean_housing_df)
str(clean_housing_df)

sale_price <- clean_housing_df$`Sale Price`
sq_ft_living <- clean_housing_df$square_feet_total_living
beds <- clean_housing_df$bedrooms
sq_ft_lot_size <- clean_housing_df$sq_ft_lot
bath <- clean_housing_df$total_bathrooms


sale_lm <- lm(sale_price ~ sq_ft_lot_size, data = clean_housing_df)

summary(sale_lm)

sale_lm2 <- lm(sale_price ~ beds +
                 bath + 
                 sq_ft_living, 
               data = clean_housing_df)

summary(sale_lm2)

sale_lm3 <- lm(sale_price ~ 
                 bath + 
                 sq_ft_living, 
               data = clean_housing_df)

summary(sale_lm3)


# Beta Coefficients
lm.beta(sale_lm)
lm.beta(sale_lm2)
lm.beta(sale_lm3)

# Confidence intervals
confint.lm(sale_lm, level = 0.95)
confint.lm(sale_lm2, level = 0.95)
confint.lm(sale_lm3, level = 0.95)


       
# Comparing Model performance

anova(sale_lm, sale_lm2)
anova(sale_lm, sale_lm3)
anova(sale_lm2, sale_lm3)

qqnorm(resid(sale_lm), main = "Normal Q-Q Plot, sale_lm", col = 'darkgrey')
qqline(resid(sale_lm), col = 'dodgerblue', lwd = 2)

qqnorm(resid(sale_lm2), main = "Normal Q-Q Plot, sale_lm", col = 'darkgrey')
qqline(resid(sale_lm2), col = 'dodgerblue', lwd = 2)

qqnorm(resid(sale_lm3), main = "Normal Q-Q Plot, sale_lm", col = 'darkgrey')
qqline(resid(sale_lm3), col = 'dodgerblue', lwd = 2)


plot(sale_lm)

summary(sale_lm)
summary(sale_lm2)
summary(sale_lm3)

sale_lm_res <- data.frame(resid(sale_lm))
sale_lm2_res <- data.frame(resid(sale_lm2))
sale_lm3_res <- data.frame(resid(sale_lm3))

plot(rstandard(sale_lm), rstudent(sale_lm))
plot(rstandard(sale_lm2), rstudent(sale_lm2))
plot(rstandard(sale_lm3), rstudent(sale_lm3))

standard_res_sale_lm <- rstandard(sale_lm, 
                                  sd = sqrt(deviance(sale_lm)/df.residual(sale_lm)))
standard_res_sale_lm

outlierTest(sale_lm)

library(car)
summary(sale_lm)
summary(sale_lm2)
summary(sale_lm3)

outlierTest(sale_lm)
outlierTest(sale_lm2)
outlierTest(sale_lm3)

sale_lm_sum <- lm(sale_lm)
summary(sale_lm_sum)

sale_lm2_sum <- lm(sale_lm2)
summary(sale_lm2_sum)

sale_lm3_sum <- lm(sale_lm3)
summary(sale_lm3_sum)

sale_modelOrg <- lm(sale_lm)
summary(sale_modelOrg)
outlierTest(sale_modelOrg)

sale_model.2 <- lm(sale_lm2)
summary(sale_model.2)
outlierTest(sale_model.2)

sale_model.3 <- lm(sale_lm3)
summary(sale_model.3)
outlierTest(sale_model.3)

outlier.1_clean_housing_df <- clean_housing_df[-c(6438,6437,6441,6433,6434,6430,6442,6439,6431,6429),]
str(outlier.1_clean_housing_df)

outlier.2_clean_housing_df <- clean_housing_df[-c(11992,6430,6437,4649,6438,6431,6436,6433,6434,6432),]
str(outlier.2_clean_housing_df)

outlier.3_clean_housing_df <- clean_housing_df[-c(11992,4649,6438,6430,6437,6431,6436,6432,6441,6442),]
str(outlier.3_clean_housing_df)


cleanSaleModel.1 <- lm(sale_price ~ sq_ft_lot_size, data = outlier.1_clean_housing_df)
str(cleanSaleModel.1)

cleanSaleModel.2 <- lm(sale_price ~ sq_ft_lot_size + 
                         beds +
                         bath + 
                         sq_ft_living,
                       data = outlier.2_clean_housing_df)
str(cleanSaleModel.2)

cleanSaleModel.3 <- lm(sale_price ~ 
                         bath + 
                         sq_ft_living,
                       data = outlier.3_clean_housing_df)
str(cleanSaleModel.3)


cleanSaleModel.3$standardized.residuals <- rstandard(cleanSaleModel.3)
cleanSaleModel.3$studentized.residuals <- rstudent(cleanSaleModel.3)
cleanSaleModel.3$cooks.distance <- cooks.distance(cleanSaleModel.3)
cleanSaleModel.3$dfbeta <- dfbeta(cleanSaleModel.3)
cleanSaleModel.3$leverage <- hatvalues(cleanSaleModel.3)
cleanSaleModel.3$covariance.ratios <- covratio(cleanSaleModel.3)

cleanSaleModel.3$large.residual <- cleanSaleModel.3$standard.residuals > 2 | cleanSaleModel.3$studentized.residuals < -2
str(cleanSaleModel.3)


cleanSaleModel.1$standardized.residuals <- rstandard(cleanSaleModel.1)
cleanSaleModel.1$studentized.residuals <- rstudent(cleanSaleModel.1)
cleanSaleModel.1$cooks.distance <- cooks.distance(cleanSaleModel.1)
cleanSaleModel.1$dfbeta <- dfbeta(cleanSaleModel.1)
cleanSaleModel.1$leverage <- hatvalues(cleanSaleModel.1)
cleanSaleModel.1$covariance.ratios <- covratio(cleanSaleModel.1)

cleanSaleModel.1$large.residual <- cleanSaleModel.1$standardized.residuals > 2 | cleanSaleModel.1$studentized.residuals < -2

sum(cleanSaleModel.1$large.residual)

cleanSaleModel.1<-data.frame(c('Sale Price', 
                               'square_feet_total_living',
                               'bedrooms', 
                               'sq_ft_lot', 
                               'total_bathrooms' 
))
cleanSaleModel.1<-cleanSaleModel.1$large.residual
summary(cleanSaleModel.1)
