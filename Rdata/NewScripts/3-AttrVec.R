#Attributes
#R objects have attributes(metadata for object)
#Examples of R object attributes ( names,dimnames,dimensions[matrices,arrays],class[integer,numeric],
#length,other user-defined attributes/metadata)
x <- 1
#Not all R objects contain attributes, in which case the attributes() function returns NULL.
attributes(x)

#Creating Vectors
#The c() function can be used to create vectors of objects by concatenating things together.
x <- c(0.5, 0.6) ## numeric
x
x <- c(TRUE, FALSE) ## logical
x
x <- c(T, F) ## logical
x
x<- c("a", "b", "c") ## character
x
x <- 9:29 ## integer
x
x <- c(1+0i, 2+4i) ## complex
x

#use the vector() function to initialize vectors.
x <- vector("numeric", length = 10)
x


#create a vector of numbers
numbers = c(1,2,3,4,5,6)
numbers
print(numbers)

#create a vector of letters
ltrs = c('a','b','c','d')
print(ltrs)

#concatenating the both above
mixed_vec = c(numbers,ltrs)
#vector mixed_vec has coerced the numbers to character
print(mixed_vec)

#data type of different vectors can be returned by the function class. 
#It is common to use the class function to "interrogate" an object, asking him what his class is.

### One dimensional objects 
# Integer vector 
num = 1:10 
class(num) 
  
# Numeric vector, it has a float, 10.5 
num = c(1:10, 10.5) 
class(num) 

# Character vector 
ltrs = letters[1:10] 
class(ltrs) 

# Factor vector 
fac = as.factor(ltrs) 
class(fac) 

#for 2 dimensional objects,refer matrix.R

#Mixing objects
#There are occasions when different classes of R objects get mixed together. Sometimes this happens
#by accident but it can also happen on purpose.
y <- c(1.7, "a") ## character
y <- c(TRUE, 2) ## numeric
y <- c("a", TRUE) ## character

#we are mixing objects of two different classes in a vector. But for vectors this is not allowed.
#When different objects are mixed in a vector,coercion occurs so that every element in the vector is 
#of the same class.Above, we see the effect of implicit coercion. What R tries to do is find a way to
#represent all of the objects in the vector in a reasonable fashion.

#Explicit coercion
#Objects can be explicitly coerced from one class to another using the as.* functions
x <- 0:6
class(x)
as.numeric(x)
as.logical(x)
as.character(x)

#If R cannot figure out how to coerce an object ,this can result in NAs being produced.
x <- c("a","b","c")
class(x)
as.numeric(x)
as.logical(x)
as.complex(x)
