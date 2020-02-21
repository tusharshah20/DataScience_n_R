#Read data file
mydata <- read.csv("https://raw.githubusercontent.com/ajaykuma/Datasets/master/Cardiotocographic.csv")
head(mydata)

str(mydata)
data <- mydata
str(data)

#NSP shows 1,2 or 3 depending on classfication states (normal,suspect or pathologic)
#R Reads this as integer but on real it is factor/categorical variable

#converting it into categorical variable

data$NSPF <- as.factor(data$NSP)
head(data)
str(data)

#partition data into Training and Validation data (80,20) using random seed
set.seed(1234)

pd <- sample(2,nrow(data),replace = TRUE, prob = c(0.8,0.2))

train <- data[pd==1,]

validate <- data[pd==2,]


#Decision tree with party

library(party)

#we will use just 3 variables for now
tree <- ctree(NSPF~LB+AC+FM, data = train)

print(tree)
#shows 19 nodes in the tree

plot(tree)
#shows root at top n leaves at bottom
#it shows ,out of 3 vairables we have chosen, AC is the most important variable and thus on top
#when FM is less than 0.11, we reach the terminal node i.e decision nodes where we can see
#probabilities of response variable being 1 i.e. patient being normal is between 0.6 and 0.8.

# to prune the tree ie making it smaller by controlling some paramters.
#add 90%/99% or more  confidence level that variable is significant
#a branch will split into 2 only if sample size is atleast 200/500
tree <- ctree(NSPF~LB+AC+FM, data = train, control = ctree_control(mincriterion=0.99,minsplit = 500))
print(tree)
plot(tree)
#plot(tree,type="simple")

#predicting in validation dataset
predict(tree,validate)
predict(tree,validate,type="prob")

#decision tree with Rpart
library(rpart)

tree1 <- rpart(NSPF~LB+AC+FM,train)

library(rpart.plot)
rpart.plot(tree1)

#to get more information
rpart.plot(tree1,extra=1)
rpart.plot(tree1,extra=2)

#predict
predict(tree1,validate)

#Misclassification error
tab<-table(predict(tree), train$NSPF)
print(tab)
1-sum(diag(tab))/sum(tab)

#1,2,3 in row on top shows actual states
#1,2,3 in column show what was predicted
#usually numbers in diagonal show right classification

#misclassfication error for validate
testPred <- predict(tree,newdata = validate)
tab<-table(testPred, validate$NSPF)
print(tab)
1-sum(diag(tab))/sum(tab)

