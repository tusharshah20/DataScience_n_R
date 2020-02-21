install.packages("ggplot2")
library(ggplot2)
#using mpg dataset that's built into ggplot. This dataset contains data on fuel economy for 38 popular car models.
head(mpg, n = 10)
str(mpg)

#The mpg dataset contains 11 columns:
  
#manufacturer: Car Manufacturer Name
#model: Car Model Name
#displ: Engine Displacement (liters)
#year: Year of Manufacture
#cyl: Number of Cylinders
#trans: Type of Transmission
#drv: f = front-wheel drive, r = rear-wheel drive, 4 = 4wd
#cty: City Miles per Gallon
#hwy: Highway Miles per Gallon
#fl: Fuel Type
#class: Type of Car

install.packages("tidyverse")
library(tidyverse)

ggplot(mpg) +
  geom_bar(aes(x = class))

#Changing bar color in a ggplot bar chart
# we added the modifier fill = 'blue' to to end of the line
ggplot(mpg) +
  geom_bar(aes(x = class), fill = 'blue')

#Mapping bar color to a variable in a ggplot bar chart
#We’re dividing the bar chart into segments based on the levels of the drv variable, 
#corresponding to the front-wheel, rear-wheel, and four-wheel drive cars.
#For a given class of car, our stacked bar chart makes it easy to see how many of those 
#cars fall into each of the 3 drv categories.

ggplot(mpg) +
  geom_bar(aes(x = class, fill = drv))

#For example
#Note we convert the cyl variable to a factor to fill properly
ggplot(mpg) + 
  geom_bar(aes(x = class, fill = factor(cyl)))
#even with four segments it starts to become difficult 
#to make comparisons between the different categories on the x-axis.

#Dodged Bar charts
ggplot(mpg) + 
  geom_bar(aes(x = class, fill = factor(cyl)), position = position_dodge(preserve = 'single'))

#scaling bar size to a variable
# Use dplyr to calculate the average hwy_mpg by class
#install.packages("magrittr") # package installations are only needed the first time you use it
#install.packages("dplyr")    # alternative installation of the %>%
library(magrittr) # needs to be run every time you start R and want to use %>%
library(dplyr)    # alternatively, this also loads %>%
#The pipe operator %>% was introduced to "decrease development time and to improve readability and 
#maintainability of code."

by_hwy_mpg <- mpg %>% group_by(class) %>% summarise(hwy_mpg = mean(hwy))

ggplot(by_hwy_mpg) + 
  geom_bar(aes(x = class, y = hwy_mpg), stat = 'identity')

#Instead of using geom_bar with stat = 'identity', 
#you can simply use the geom_col function to get the same result. Let’s see:
# Use dplyr to calculate the average hwy_mpg by class
by_hwy_mpg <- mpg %>% group_by(class) %>% summarise(hwy_mpg = mean(hwy))

ggplot(by_hwy_mpg) + 
  geom_col(aes(x = class, y = hwy_mpg))

#using color for outline
ggplot(mpg) +
  geom_bar(aes(x = class), color = 'blue')

