#We will make use of the popular titanic survival dataset. 
#We will first import our essential libraries like rpart, dplyr, party, rpart.plot etc.

library(rpart)
library(readr)
library(caTools)
library(dplyr)
library(party)
library(partykit)
library(rpart.plot)

#we will read our data and store it inside the titanic_data variable
titanic_data <- "https://goo.gl/At238b" %>%  
  read.csv %>% # read in the data
  select(survived, embarked, sex, 
         sibsp, parch, fare) %>%
  mutate(embarked = factor(embarked),
         sex = factor(sex))

#we will split our data into training and testing sets as follows
set.seed(123)
sample_data = sample.split(titanic_data, SplitRatio = 0.75)
train_data <- subset(titanic_data, sample_data == TRUE)
test_data <- subset(titanic_data, sample_data == FALSE)

#we will proceed to plot our Decision Tree using the rpart function
rtree <- rpart(survived ~ ., train_data)
rpart.plot(rtree)

#will also plot our conditional parting plot
ctree_ <- ctree(survived ~ ., train_data)
plot(ctree_)

