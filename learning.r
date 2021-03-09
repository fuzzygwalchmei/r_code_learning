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


library(stringr)
# String functions primarily start with str_

weekly_sales <- weekly_sales %>% 
  mutate(Flatbread = str_detect(Description, "FLATBREAD"))


weekly_sales <- weekly_sales %>% 
  mutate(Chicken = str_detect(Description, regex("chicken", ignore_case = TRUE)),
         Bacon = str_detect(Description, regex("bacon", ignore_case = TRUE)),
         Turkey = str_detect(Description, regex("turkey", ignore_case = TRUE)))

# everything() as a selector will bring remaining columns to assist with reordering

weekly_sales <- weekly_sales %>% 
  select(INV_NUMBER, Store_num, Description, Flatbread, Bacon, Chicken, Turkey, everything())


# Filtering similar to python

weekly_sales[weekly_sales$Sold > 100,]

mean(weekly_sales$Sales[weekly_sales$Flatbread])

# piping doesnt work in this situation
weekly_sales %>% mean(
  filter(Chicken==TRUE & Bacon == TRUE)$Sales
)

# This filtering method works
mean(
  filter(
  weekly_sales,
  Chicken==TRUE,
  Bacon==TRUE
  )$Sales
)









