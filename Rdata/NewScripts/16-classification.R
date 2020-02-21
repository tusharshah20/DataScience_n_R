#Building a classification model
#Importing libraries
library(datasets) #contains iris datasets
library(caret) #package for ml algorithms/ CARET: classification & regression testing

#Importing iris dataset
data(iris)

#checking if any missing data
sum(is.na(iris))

#to achieve reproductible model ,set the random seed number
#When building classification model by default R assigns random numbers to the model 'seed number'

set.seed(100)

#Data splitting
#perform stratified random split of the dataset
TrainingIndex <- createDataPartition(iris$Species,p = 0.8, list = FALSE)
#clicking on TrainingIndex shows an ID assigned to each row ie flower

TrainingSet <- iris[TrainingIndex,] #training set
TestingSet <- iris[-TrainingIndex,] #Test Set

#compare scatter plot of the 80 and 20 data subsets

#SVM model (polynomial kernel)
#Note** caret package contains many ML algorithms,we will use Support Vector Machine




