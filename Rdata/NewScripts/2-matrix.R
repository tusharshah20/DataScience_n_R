#Matrices
#Matrices are vectors with a dimension attribute. The dimension attribute is itself an integer vector
#of length 2 (number of rows, number of columns)

m <- matrix(nrow = 2, ncol = 3)
n <- matrix(c(5:29),5,5)
n
m
dim(m)
attributes(m)

#Matrices are constructed column-wise, so entries can be thought of starting in the upper left corner
#and running down the columns.
m <- matrix(1:6, nrow = 2, ncol = 3)
m

# Matrix
M = matrix(1:12, ncol = 4) 
M

lM = matrix(letters[1:12], ncol = 4) 
lM


#Matrices can also be created directly from vectors by adding a dimension attribute.
n <- 1:10
n
dim(n) <- c(2,5)
n

#Matrices can be created by column-binding or row-binding with the cbind() and rbind() functions.
a <- 1:3
a
y <- 10:12
y
cbind(a, y)
rbind(a, y)

# cbind concatenates two matrices (or vectors) in one matrix 
cbind(M, lM) 
class(M)
class(lM)

#Lists
#Special types of vector that contain elements of different classes
#List with various apply functions can make a powerful combination
x <- list(1,"a",TRUE,1+4i)
x
#Creating an empty list of predefined length with vector() function
x <- vector("list", length = 5)
x
