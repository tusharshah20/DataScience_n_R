#Apply function in R
#Returns a vector or array or list of values obtained by applying a function to margins of an array or matrix.
#Apply(x,1,sum)
#X is a data frame or matrix
#1 indicated Processing along rows .if it is 2 then it indicated processing along the columns

Age<-c(56,34,67,33,25,28)
Weight<-c(78,67,56,44,56,89)
Height<-c(165, 171,167,167,166,181)

BMI_df<-data.frame(Age,Weight,Height)
BMI_df

# row wise sum up of dataframe using apply function in R
apply(BMI_df,1,sum)

## column wise sum up of dataframe using apply function in R
apply(BMI_df,2,sum)

# column wise mean of dataframe using apply function in R
apply(BMI_df,2,mean)

#lapply function in R
#lapply function takes list, vector or Data frame  as input and returns only list as output
lapply(BMI_df, function(BMI_df) BMI_df/2)

# lapply function in R
lapply(BMI_df, mean)

#sapply function in R
#sapply function takes list, vector or Data frame  as input. It is similar to lapply function but returns only vector as output.

sapply(BMI_df, function(BMI_df) BMI_df/2)
sapply(BMI_df, mean)

# sapply function in R (applies nchar function)
random <- c("This","is","random","vector")
sapply(random,nchar)

#mapply function in R
#mapply is a multivariate version of sapply. mapply applies FUN to the first elements of each (.) argument, the second elements, the third elements
#if we have several data structures (e.g. vectors, lists) and you want to apply a function to the 1st elements of each, 
#and then the 2nd elements of each, etc., coercing the result to a vector/array as in sapply

# mapply function in R
#sums up all the first elements(1+1+1) ,sums up all the second elements(2+2+2)
mapply(sum, 1:4, 1:4, 1:4)

# mapply function in R
#repeats the first element once , second element twice
mapply(rep,1:4,1:4)

#tapply function in R
#to apply a function to subsets of a vector and the subsets are defined by some other vector, usually a factor.
#amous iris data. Species is a factor with 3 values namely Setosa, versicolor and virginica. If we want to find the mean of 
#sepal length of these 3 species(subsets).

# tapply function in R
attach(iris)
# mean sepal length by species
tapply(iris$Sepal.Length, Species, mean)


#rapply function in R
#recursive apply, as the name suggests it is used to apply a function to all elements of a list recursively.
# rapply function in R
x=list(1,2,3,4)
rapply(x,function(x){x^2},class=c("numeric"))

#power of rapply
x=list(3,list(4,5),6,list(7,list(8,9)))
str(x)
rapply(x,function(x) x^2,class=c("numeric"))

#vapply function in R
#similar to sapply, but has a pre-specified type of return value
# vapply function in R
vapply(1:5, sqrt, 1i)
