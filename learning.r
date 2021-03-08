library(dplyr)

library(readxl)

weekly_sales <- read_csv('weekly_sales_10stores.csv')
appwich_attr <- read_csv('AppWichStoreAttributes.csv')
weekly_weather <- read_csv('weekly_weather.csv')
county_demo <- read_csv('county_demographic.csv')
county_emp <- read_csv('county_employment.csv')
county_crime <- read_csv('county_crime.csv')


# Similar to Python info - Shows basic data type, number of values
str(weekly_sales)

# Similar to Python Describe - shows min, 1st quartile, median, mean, 5rd quartile and max
summary(weekly_sales$Price)


# convert to date
weekly_sales$Date <- as.Date(weekly_sales$Date, format="%m/%d/%y")

library(lubridate)

weekly_sales$my_year = year(weekly_sales$Date)


