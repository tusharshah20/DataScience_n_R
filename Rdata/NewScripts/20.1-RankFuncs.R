#using Rank functions
#Rank references the position of the value in the sorted vector and is in the same order as the original sequence
#rank() function in R returns the ranks of the values in a vector. rank function in R also 
#handles Ties and missing values in several ways.

#rank(x, na.last = TRUE, ties.method = c(“average”, “first”, “random”, “max”, “min”))
#x	 numeric, character or logical vector
#na.last	Treatment of NAs. How to Handle NAs
#ties.method	Treatment of Ties. How to Handle Ties

#Rank function in R with NAs as last:
x <- c(2,7,1,-17,NA,Inf,35,21)
rank(x)

#Rank function in R with NAs as First:
x <- c(2,7,1,-17,NA,Inf,35,21)
rank(x,na.last = FALSE) #NA FIRST

#Rank function in R with NAs are removed:
x <- c(2,7,1,-17,NA,Inf,35,21)
rank(x,na.last = NA) #NA removed

#Rank function in R with NAs are ranked as NA:
x <- c(2,7,1,-17,NA,Inf,35,21)
rank(x,na.last = "keep") #NA is kept with rank NA

#Rank function in R with Ties=”Average”:
x <- c(2,7,1,-17,NA,Inf,35,21,7)
rank(x,na.last = TRUE,ties.method = "first")

#Rank function in R with Ties=”random”:
x <- c(2,7,1,-17,NA,Inf,35,21,7)
rank(x,na.last = TRUE,ties.method = "random")

#Rank function in R with Ties=”max”:
#Maximum value of the rank is allocated to the elements of vector when ties are encountered
x <- c(2,7,1,-17,NA,Inf,35,21,7)
rank(x,na.last = TRUE,ties.method = "max")

#Rank function in R with Ties=”min”:
x <- c(2,7,1,-17,NA,Inf,35,21,7)
rank(x,na.last = TRUE,ties.method = "min")

#Ranking of character vector in R:
y<-c("a","h","e","d")
rank(y)
  