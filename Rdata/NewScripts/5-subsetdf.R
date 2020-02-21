#Subsetting a dataframe
### import education expenditure data set and assign column names
### import education expenditure data set and assign column names
education <- read.csv("https://raw.githubusercontent.com/ajaykuma/Datasets/master/education.csv", stringsAsFactors = FALSE)
colnames(education) <- c("X","State","Region","Urban.Population","Per.Capita.Income","Minor.Population","Education.Expenditures")
View(education)

#let’s suppose we oversee the Midwestern division of schools and that we are charged with calculating how much money was spent per child 
#for each state in our region. We would need three variables: State, Minor.Population, and Education.Expenditures. 
#However, we would only need the observations from the rows that correspond to Region 2. 

ed_exp1 <- education[c(10:21),c(2,6:7)]
ed_exp1

#or
#omitting row and column references
ed_exp2 <- education[-c(1:9,22:50),-c(1,3:5)]
ed_exp2

#subsetting a data frame in R can become tedious with large data sets.
ed_exp3 <- education[which(education$Region == 2),names(education) %in% c("State","Minor.Population","Education.Expenditures")]
ed_exp3

#This time, however, we are extracting the rows we need by using the which() function. This function returns the indices where the Region 
#column of the education data from is 2. That gives us the rows we need. We retrieve the columns of the subset by using the 
#%in% operator on the names of the education data frame.

#using subset
ed_exp4 <- subset(education, Region == 2, select = c("State","Minor.Population","Education.Expenditures"))
ed_exp4
#The subset() function takes 3 arguments: the data frame you want subsetted, the rows corresponding to the condition by which you want 
#it subsetted, and the columns you want returned.

#using dplyr package
install.packages("dplyr")
library(dplyr)
ed_exp5 <- select(filter(education, Region == 2),c(State,Minor.Population:Education.Expenditures))
ed_exp5

#filter: the first argument is the data frame; the second argument is the condition by which we want it subsetted. 
#The result is the entire data frame with only the rows we wanted.
#select: the first argument is the data frame; the second argument is the names of the columns we want selected from it.
