#Data are read in using connection interfaces. Connections can be made to files (most common) or to
#other more exotic things.
#file, opens a connection to a file
#gzfile, opens a connection to a file compressed with gzip
#bzfile, opens a connection to a file compressed with bzip2
#url, opens a connection to a webpage

#File Connections
#Connections to text files can be created with the file() function.
#str(file)
#function (description = "", open = "", blocking = TRUE, encoding = getOption("encoding"),raw = FALSE)

#description is the name of the file
#open is a code indicating what mode the file should be opened in
#r open file in read only mode
#w open a file for writing (and initializing a new file)
#a open a file for appending
#rb, wb, ab reading, writing, or appending in binary mode (Windows)

## Create a connection to 'foo.txt'
con <- file("foo.txt")
## Open connection to 'foo.txt' in read-only mode
open(con, "r")
## Read from the connection
data <- read.csv(con)
## Close the connection
close(con)
#which is the same as
data <- read.csv("foo.txt")

## Open connection to gz-compressed text file
con <- gzfile("words.gz")
x <- readLines(con, 10)
x

## Open a URL connection for reading
con <- url("http://www.jhsph.edu", "r")
## Read the web page
x <- readLines(con)
## Print out the first few lines
head(x)