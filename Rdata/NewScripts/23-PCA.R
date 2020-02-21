#PCA
data(iris)
str(iris)
  summary(iris)

#for repeatability set seed
set.seed(111)

#taking a sample of size2
ind <- sample(2, nrow(iris),
              replace = TRUE,
              prob = c(0.8,0.2))

training <- iris[ind==1,]
testing <- iris[ind==2,]

#using scatter plots and correlation coefficients
install.packages("psych")
library(psych)

#to see corelation among independent variables
# we are not using 5th variable as it is a factor variable
pairs.panels(training[,-5],gap = 0, bg =c("red",
                                          "yellow",
                                          "blue")[training$Species],
                                          pch=21)

#lower triangle shows scatter plot with all 3 species color coded
#upper traingle shows corelation coefficients
#it shows corelation is highest between petal length and petal width as corelation is very close to 1 (i.e 0.97)
#and look at lowest corelation value close to 0 ie -0.15

#when corelation between independent variables are high that leads to multicollinearlity problems
#and thus predictions/estimations wont be accurate

#to handle this we can use PCA
pc <- prcomp(training[,-5],
             center = TRUE,
#center makes sure that variables are converted so that avg becomes 0                  
             scale. = TRUE)
#scale ensures that before PCA is done , all 4 variables are normalized

#to look at what attributes are stored in pc
attributes(pc)
pc$center
mean(training$Sepal.Length)
pc$scale
sd(training$Sepal.Length)

print(pc)
#each pc is a normalized linear combination of orginal variables which are listed here
#rotations/loadings are coefficients of linear comibination of the continous variables
#values we are between -1 to 1
#interpreting output shows PC1 increases as 3 variables increase but Sepal$width decreases as it is a negative corelation
#similarly look at other values

summary(pc)
#first PC1 shows 73.73% of variability thus we can say 1st PC captures majority of variability
#looking at cumulative proportion shows, by the time we reach PC2 most variability is explained.

#orthogonality of PCA
pairs.panels(pc$x,gap = 0,bg =c("red",
                                "yellow",
                                "blue")[training$Species],
                                pch=21)

#since PC are othogonal to each other, corelation between them is 0

#Bi-plot
library(devtools)

library(ggbiplot)
g <- ggbiplot(pc,obs.scale=1,var.scale=1,groups = training$Species, elipse = TRUE, circle = TRUE, elipse.prob = 0.68)
g <- g + scale_color_discrete(name = '')
g <- g + theme(legend.directio = 'horizontal', legend.position = 'top')
print(g)
#Arrows closer show high correlation

#prediction with principal components
trg <- predict(pc, training)
trg
#converting to dataframe
trg <- data.frame(trg, training[5])
trg
tst <- predict(pc, testing)
tst <- data.frame(tst, testing[5])

#to develop model using multinominal logistic regression model
#because our y variable which is species has 3 levels 
install.packages('nnet')
library(nnet)
trg$Species <- relevel(trg$Species, ref = "setosa")
mymodel <- multinom(Species~PC1+PC2,data = trg)
summary(mymodel)

#confusion matric & misclassfication error
p <- predict(mymodel, trg)
tab <- table(p, trg$Species)
tab

#calculate misclassfication error
1 - sum(diag(tab))/sum(tab)

#on test data #confusion matric & misclassfication error
p1 <- predict(mymodel, tst)
tab1 <- table(p1, tst$Species)
tab1
1 - sum(diag(tab1))/sum(tab1)



