#<- is the assignment operator
x <- 1
x
print(x)
msg <- "Hello"
print(msg)

y <- 5 ##nothing printed

y ##auto-printing occurs
print(y) ##explicit printing
##[1] : means y is a vector and 5 is its first element

#using operator to create integer sequences
#integer sequence of length 20
x <- 10:30
x
#==============

#R has 5 basic or "atomic" classes of objects
#1.character
#2.numeric(real numbers)
#3.integer
#4.complex
#5.logical(true/false)

#Basic type of R object is a vector
#Empty vectors can be created with vector() function,A vector can contain objects of same type/class.
#Note** List is a vector which can contain objects of different classes.

#Numbers (numeric objects ie double precision real numbers)
#numbers such as 1 or 2 etc (thought at integers ad represented as numeric objects behind the scenes such as 1.00 or 2.00)
a <- 1 ##numeric object
ai <- 1L ##integer object
#Inf: represents Infinity
1/Inf
#NAN: missing value

