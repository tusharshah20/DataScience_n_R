#using textual or binary formats for storing data
#an intermediate format that is textual,
#but not as simple as something like CSV. The format is native to R and is somewhat readable because
#of its textual nature.
#One can create a more descriptive representation of an R object by using the dput() or dump()
#functions. 

#The dump() and dput() functions are useful because the resulting textual format is editable,
#and in the case of corruption, potentially recoverable. Unlike writing out a table or CSV file,
#dump() and dput() preserve the metadata (sacrificing some readability), so that another user doesn't
#have to specify it all over again. For example, we can preserve the class of each column of a table or
#the levels of a factor variable.

#Textual formats can work much better with version control programs like subversion or git which
#can only track changes meaningfully in text files. In addition, textual formats can be longer-lived;
#if there is corruption somewhere in the file, it can be easier to fix the problem because one can just
#open the file in an editor and look at it (although this would probably only be done in a worst case scenario!).

#There are a few downsides to using these intermediate textual formats. The format is not very space efficient,
#because all of the metadata is specified. Also, it is really only partially readable. In some
#instances it might be preferable to have data stored in a CSV file and then have a separate code file
#that specifies the metadata.

#One way to pass data around is by deparsing the R object with dput() and reading it back in (parsing it) using dget().
## Create a data frame
y <- data.frame(a = 1, b = "a")
y

## Print 'dput' output to console
dput(y)

#Notice that the dput() output is in the form of R code and that it preserves metadata like the class of the object, the row names, and the column names.
## Send 'dput' output to a file
dput(y, file = "y.R")

#read in 'dput' output from a file
new.y <- dget("y.R")
new.y

#Multiple objects can be deparsed at once using the dump function and read back in using source.
x <- "winter"
y <- data.frame(a = 1L,b = "a")

#we can dump() R objects to a file by passing a character vector of their names
dump(c("x","y"),file = "data.R")

#The inverse of dump() is source()
source("data.R")
str(y)
x


##Binary formats
