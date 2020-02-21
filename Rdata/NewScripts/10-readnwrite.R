#principal functions reading data into R
#Reading

#read.table, read.csv, for reading tabular data
#readLines, for reading lines of a text file
#source, for reading in R code files (inverse of dump)
#dget, for reading in R code files (inverse of dput)
#load, for reading in saved workspaces
#unserialize, for reading single R objects in binary form

help("read.table")

#data <- read.csv("I:\\Trainings\\MyContent\\Books\\resources\\auction.csv",header = FALSE)
data <- read.csv("I:\\Trainings\\MyContent\\Books\\resources\\auction.csv")
data
data.frame(data)

#IF USING read.table without specifying any other arguments
#R will automatically skip lines that begin with a #
#figure out how many rows there are (and how much memory needs to be allocated)
#figure what type of variable is in each column of the table.
#Telling R all these things directly makes R run faster and more efficiently.
data1 <- read.table("I:\\Trainings\\MyContent\\Books\\resources\\people.txt")

data1

data3 <- read.csv("I:\\Trainings\\MyContent\\Books\\resources\\auction.csv",header = TRUE,comment.char = "",nrows = 20,
              )
data3

#use the colClasses argument. Specifying this option instead of using the default can make
#read.table run MUCH faster, often twice as fast. In order to use this option, you have to know
#the class of each column in your data frame.


#A quick an dirty way to figure out the classes of each column is the following:
initial <- read.table("I:\\Trainings\\MyContent\\Books\\resources\\people.txt", nrows = 1)
classes <- sapply(initial, class)
tabAll <- read.table("I:\\Trainings\\MyContent\\Books\\resources\\people.txt", colClasses = classes)
tabAll

#Set nrows. This doesn't make R run faster but it helps with memory usage.

#Writing
#write.table, for writing tabular data to text files (i.e. CSV) or connections
#writeLines, for writing character data line-by-line to a file or connection
#dump, for dumping a textual representation of multiple R objects
#dput, for outputting a textual representation of an R object
#save, for saving an arbitrary number of R objects in binary format (possibly compressed) to a file.
#serialize, for converting an R object into a binary format for outputting to a connection (or file).

