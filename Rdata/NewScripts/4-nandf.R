#Missing values
#Denoted by NA or NaN for q undefined mathematical operations
is.na() ## to test objects if they are NA
is.nan() ## to test for NAN
#NA values have a class such as integer NA, Character NA
#A Nan value is also NA but converse is not true.

## Create a vector with NAs in it
x <- c(1, 2, NA, 10, 3)

## Return a logical vector indicating which elements are NA
is.na(x)
## Return a logical vector indicating which elements are NaN
is.nan(x)

## Now create a vector with both NA and NaN values
x <- c(1, 2, NaN, NA, 4)
is.na(x)
is.nan(x)

#Data Frames
#Data frames are used to store tabular data in R. They are an important type of object in R and are
#used in a variety of statistical modeling applications.
#package dplyr:has an optimized set of functions designed to work efficiently with data frames.
#represented as a special type of list where every element of the list has to have the
#same length. Each element of the list can be thought of as a column and the length of each element
#of the list is the number of rows.
#Unlike matrices, data frames can store different classes of objects in each column. Matrices must
#have every element be the same class (e.g. all integers or all numeric).
#In addition to column names, indicating the names of the variables or predictors, data frames have
#a special attribute called row.names which indicate information about each row of the data frame.
#Data frames are usually created by reading in a dataset using the read.table() or read.csv().
#However, data frames can also be created explicitly with the data.frame() function or they can be
#coerced from other types of objects like lists.
#Data frames can be converted to a matrix by calling data.matrix(). While it might seem that the
#as.matrix() function should be used to coerce a data frame to a matrix, almost always, what you
#want is the result of data.matrix().

x <- data.frame(foo = 1:4, bar = c(T,T,F,F))
x
nrow(x)
ncol(x)

#In statistics we normally consider variables are of the following types ???
#Numeric
#Nominal or categorical
#Ordinal

#In R, a vector can be of the following classes ???
#Numeric - Integer
#Factor
#Ordered Factor
#R provides a data type for each statistical type of variable. 

# Let's create a data.frame
df = data.frame(numbers = 1:26, letters) 
head(df) 

# str gives the structure of a data.frame, it's a good summary to inspect an object 
str(df) 

# The latter shows the letters character vector was coerced as a factor. 
# This can be explained by the stringsAsFactors = TRUE argumnet in data.frame 
# read data.frame for more information  

class(df) 

### Indexing
# Get the first row 
df[1, ] 

# Used for programming normally - returns the output as a list 
df[1, , drop = TRUE] 


# Get several rows of the data.frame 
df[5:7, ] 

### Add one column that mixes the numeric column with the factor column 
df$mixed = paste(df$numbers, df$letters, sep = '')  

str(df) 

### Get columns 
# Get the first column 
df[, 1]  
# It returns a one dimensional vector with that column  

# Get two columns 
df2 = df[, 1:2] 
head(df2)  

# Get the first and third columns 
df3 = df[, c(1, 3)] 
df3[1:3, ]  

### Index columns from their names 
names(df) 

# This is the best practice in programming, as many times indeces change, but 
#variable names don't 

# We create a variable with the names we want to subset 
keep_vars = c("numbers", "mixed") 
df4 = df[, keep_vars]  

head(df4) 

### subset rows and columns 
# Keep the first five rows 
df5 = df[1:5, keep_vars] 
df5 

# subset rows using a logical condition 
df6 = df[df$numbers < 10, keep_vars] 
df6 
