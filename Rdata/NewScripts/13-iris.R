#Loading Iris Dataset


#Method 1
library(datasets)
data(iris)

iris <- datasets::iris
View(iris)

#Method 2
install.packages('RCurl')
library(RCurl)

#Return all the available packages using
#ap <- available.packages()

iris <- read.csv(text = getURL("https://raw.githubusercontent.com/ajaykuma/Datasets/master/iris.csv"))

#view the data
View(iris)

##########
# Display summary statistics
#########

#head() /tail()
iris
head(iris, 4)
tail(iris, 4)

#other options to look at variables
iris$Sepal.Length
iris$Species

#Assigning to a variable
Species <- iris$Species
Species

#summary()
summary(iris)

#selecting a specific variable
summary(iris$Sepal.Length)

#check to see if there is any missing data i.e. na values
sum(is.na(iris))

#skimr() -expands on summary() by providing larger set of statistics
install.packages("skimr")
#https://github.com/ropensci/skimr

library(skimr)
skim(iris) #perform skim to display summary statistics

#Group data by Species then perform skim
iris %>%
  dplyr::group_by(Species) %>%
  skim()

#Quick data visualization
#R base plot

#Panel plots i.e. 5/5 scatter plot of all variables in dataset
plot(iris)
plot(iris,col = "red")

#Scatter plot using variables
plot(iris$Sepal.Width, iris$Sepal.Length)
plot(iris$Sepal.Width, iris$Sepal.Length, col = "red") #Make red circles
plot(iris$Sepal.Width, iris$Sepal.Length, col = "red",
     xlab = "Sepal Width", ylab = "Sepal Length") #Make red circles and add x n y axis

#Histogram (showing frequency count)
hist(iris$Sepal.Width)
hist(iris$Sepal.Width, col = "red") #make red bars

#Feature plots
#https://www.machinelearningplus.com/machine-learning/caret-packages/
install.packages("caret")
library(caret)
featurePlot(x = iris[,1:4],
            y = iris$Species,
            plot = "box",
            strip = strip.custom(par.strip.text=list(cex=.7)),
            scales = list(x = list(relation="free"),
                          y = list(relation="free"))
            ) 


