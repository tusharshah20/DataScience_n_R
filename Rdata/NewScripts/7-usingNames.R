#Using Names

#R objects can have names, which is very useful for writing readable code and self-describing objects
x <- 1:3
x
names(x)
names(x) <- c("NewYork","Seatle","LosAngles")
x

#names for list elements
x <- list("LosAngles" = 1,Boston=2,London=3)
x
names(x)

#matrices can have both row and column names
c <- matrix(1:4,nrow = 2, ncol = 2)
c
dimnames(c) <- list(c("a","b"),c("c","d"))
c

#Column names and row names can be set separately using the colnames() and rownames() functions.
colnames(c) <- c("h", "f")
rownames(c) <- c("x", "z")
c

#Object      Set column names Set row names
#dataframe      names()          row.names()
#matrix       colnames()         rownames()
