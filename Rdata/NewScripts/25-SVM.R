#using Support vector machine for classfication
data("iris")
#note Species variable is a factor variable
#building a classficiation modelt o predict right species

head(iris)

library(ggplot2)

qplot(Petal.Length,Petal.Width,data=iris,color=Species)

#supprt vector machine
install.packages("e1071")
library(e1071)

#developing a model
mymodel <- svm(Species~.,data=iris)
summary(mymodel)
#cost: cost of constraint voilation
#kernel: shows the kernel which was used
#since reponse variable is categorical , SVM-type is classfication
#(8--belongs to 1st species, 22-second,21-third)

plot(mymodel, data = iris,
              Petal.Width~Petal.Length,
              slice = list(Sepal.Width = 3, Sepal.Length = 4))
#support vectors represented by cross,decision boundaries fro 3 type of series

#confusion matrix and misclassification error
pred <- predict(mymodel, iris)
tab <- table(Predicted = pred, Actual = iris$Species)
tab

#misclassification error
1- sum(diag(tab))/sum(tab)

#try changing kernel to linear/polynomial/sigmoid in model & try the whole activity
#mymodel <- svm(Species~.,data=iris, kernel = "linear")

#Tuning model/hyper parameter optimization which helps to select best model
set.seed(123)
tmodel <- tune(svm,Species~., data = iris,
     ranges = list(epsilon = seq(0,1,0.1),cost = 2^(2:9)))
#with this we can 88 different combinations based on cost and epsilon values

plot(tmodel)
summary(tmodel)

#choosing best model
mymodel <- tmodel$best.model
summary(mymodel)
