#to pull mtcars data in your session
data(mtcars)

#to find out type of variables(observations n columns etc )
str(mtcars)

#view top 5 records of mtcars
head(mtcars)

#five number summary & interquartile range
#note** fivenum needs a column to be defined. SHows five values ie -min,25th percentile,median,
#75th percentile n max value.

fivenum(mtcars$mpg)

#using a histogram for more clarity
hist(mtcars$mpg)

#to get 10 buckets of data
hist(mtcars$mpg, breaks = 10)

#Interquartile range (75 percentile - 25 percentile)
IQR(mtcars$mpg)

#Association between five number & Boxplot of mpg
#http://flowingdata.com/2008/02/15/how-to-read-and-use-a-box-and-whisker-plot/
boxplot(mtcars$mpg)

#introducing outliers
mtcars <-edit(mtcars)
#changd value for mpg from 21-70 and 17.8 to 7.8
boxplot(mtcars$mpg)

#change the data to as it was
mtcars <-edit(mtcars)
boxplot(mtcars$mpg)

#now boxplot to compare quantities or variables
data(iris)
str(iris)
head(iris)
boxplot(iris$Sepal.Length ~ iris$Species)
boxplot(iris$Petal.Length ~ iris$Species, main = "Petal Length")
boxplot(iris$Petal.Length ~ iris$Species, main = "Petal Length",xlab = "Species",ylab = "Petal Length")
#colors()
boxplot(iris$Petal.Length ~ iris$Species,main = "Petal Length",xlab = "Species",ylab = "Petal Length", col = "red")

#to change backgrounf of plot
par(bg="skyblue")
boxplot(iris$Petal.Length ~ iris$Species, main = "Petal Length",xlab = "Species",ylab = "Petal Length")

#rechecking column names in dataset
names(iris)

#par(bg="white")
#boxplot(iris$Petal.Length ~ iris$Species, main = "Petal Length",xlab = "Species",ylab = "Petal Length")
##box plot in lattice package
#including the package

library(lattice)

#using box and whisker plot
bwplot(iris$Sepal.Length ~ iris$Species)
bwplot(iris$Petal.Length ~ iris$Species, main = "Petal Length",xlab = "Species",ylab = "Petal Length")

xyplot(iris$Sepal.Length ~ iris$Species)
xyplot(iris$Sepal.Length ~ iris$Species, col = "red", pch=1)

#boxplot in GGPLOT2 package
library(ggplot2)
qplot(iris$Species,iris$Sepal.Length,data=iris,geom="boxplot")

##summary function for numeric value & categorical
summary(iris)
data(mycars)
str(mtcars)
summary(mtcars)
boxplot(mtcars) # doesnt make sense

##comparison of mpg & cyl
#xaxis being cylinder n yaxis being mileage
boxplot(mtcars$mpg~mtcars$cyl)
#bwplot(mtcars$mpg~mtcars$cyl)

#describe the function
library(Hmisc)
describe(mtcars)
describe(mtcars$mpg)

#slice and dice of a dataset
#using summarize
A1 <- summarize(mtcars$mpg, mtcars$cyl, summary)
A1
