#Other functions in R
#Merge two data frames in R by using the merge() function
#the data frames must have same column names on which the merging happens.

#x:data frame1.
#y:data frame2.
#by,x, by.y: The names of the columns that are common to both x and y. The default is to use the columns with common names 
#between the two data frames.
#all, all.x, all.y:Logical values that specify the type of merge. The default value is all=FALSE (meaning that only the matching rows are returned).

# data frame 1
df1 = data.frame(CustomerId = c(1:6), Product = c(rep("Oven", 3), rep("Television", 3)))
df1
# data frame 2
df2 = data.frame(CustomerId = c(2, 4, 6), State = c(rep("California", 2), rep("Texas", 1)))
df2

#Inner join in R:  Return only the rows in which the left table have matching keys in the right table.
df<-merge(x=df1,y=df2,by="CustomerId")
df

#Outer join in R: Returns all rows from both tables, join records from the left which have matching keys in the right table.
df<-merge(x=df1,y=df2,by="CustomerId",all=TRUE)
df

#Left outer join in R: Return all rows from the left table, and any rows with matching keys from the right table.
df<-merge(x=df1,y=df2,by="CustomerId",all.x=TRUE)
df

#Right outer join in R: Return all rows from the right table, and any rows with matching keys from the left table.
df<-merge(x=df1,y=df2,by="CustomerId",all.y=TRUE)
df

#Cross join in R: A Cross Join (also sometimes known as a Cartesian Join) results in every row 
#of one table being joined to every row of another table
df<-merge(x = df1, y = df2, by = NULL)
df


#Melting & casting
#Melting
#The melt function takes data in wide format and stacks a set of columns into a single column of data. 
library(MASS)
library(reshape2)
library(reshape)
print(head(ships,n=10))

#lets keep type and year as constant(id variable) and melt (stack) the other three variables namely period, service and incidents
shipdata<-(head(ships,n=10))
molten.ships <- melt(shipdata, id = c("type","year"))
print(molten.ships)

#As the result type and year column are kept constant. Columns named period, service and incidents are stacked under 
#the column named variable and their values are stacked under the column named value.

#Casting
#Aggregation occurs when the combination of variables in the cast function does not identify Individual observations. 
print(head(ships,n=10))
recasted.ship <- cast(molten.ships, type+year~variable,sum)
print(recasted.ship)


#using reshape functions
#Reshape function in R transforms the data from wide to long and also transforms back the data from long to wide.
country<-data.frame(c("A","B","C"),c(100,200,120),c(2000,7000,15000))
colnames(country)<- c("countries","population_in_million","gdp_percapita")
country   

#from wide to long
#--data frame “country” is passed to reshape function
#--idvar is the variable which need to be left unaltered which is “countries”
#--varying are the ones that needs to converted from wide to long
#--v.names are the values that should be against the times in the resultant
#--new.row.names is used to assign row names to the resultant dataset
#--direction is, to which format the data needs to be transformed

country_w_to_L<- reshape(data=country, idvar="countries",
                         varying = c("population_in_million","gdp_percapita"),
                         v.name=c("value"),
                         times=c("population_in_million","gdp_percapita"),
                         new.row.names = 1:1000,
                         direction="long")
country_w_to_L

#from long to wide
##--data (country_w_to_L) which is in long format,  is passed to reshape function
##--idvar is the variable which need to be left unaltered, which is “countries”
#--timevar are the variables that needs to converted to wide format
#--v.names are the value variable
#--direction is, to which format the data needs to be transformed
country_L_to_w <- reshape(data=country_w_to_L,idvar="countries",
                          v.names = "value",
                          timevar = "time",
                          direction="wide")
country_L_to_w


