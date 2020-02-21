#Using SQL inside R
# Install the sqldf package
install.packages('sqldf') 
install.packages("nycflights13")

# load the library 
library('sqldf') 
library(datasets)
library(nycflights13)

# We will be working with the fligths dataset in order to introduce SQL  
str(flights) 
head(flights)
str(flights)

### SELECT statement
# In R we can use SQL with the sqldf function. It works exactly the same as in a database 
# The data.frame (in this case flights) represents the table we are querying 
#and goes in the FROM statement

ej1 = sqldf(" 
   SELECT  
   dep_time 
   ,dep_delay 
   ,arr_time 
   ,carrier 
   ,tailnum 
   FROM 
   flights
")

head(ej1) 

# We can also compute new variables in the select statement using the syntax: 

# old_variables as new_variable 
ej2 = sqldf(" 
   SELECT 
   arr_delay - dep_delay as gain, 
   carrier 
   FROM 
   flights
")  

ej2[1:5, ] 

#common used features of SQL is the group by statement.
### GROUP BY      

# Computing the average 
ej3 = sqldf(" 
  SELECT 
   avg(arr_delay) as mean_arr_delay, 
   avg(dep_delay) as mean_dep_delay, 
   carrier 
   FROM 
   flights 
   GROUP BY 
   carrier 
")  

ej3

# Other aggregations 
ej4 = sqldf(" 
   SELECT 
   avg(arr_delay) as mean_arr_delay, 
   min(dep_delay) as min_dep_delay, 
   max(dep_delay) as max_dep_delay, 
   carrier 
   FROM  
   flights 
   GROUP BY 
   carrier 
") 

ej4

#knowing how many observations each carrier has  
ej5 = sqldf(" 
   SELECT 
   carrier, count(*) as count 
   FROM  
   flights 
   GROUP BY 
   carrier 
")  

ej5

#Joins
# Let's create two tables: A and B to demonstrate joins.
A = data.frame(c1 = 1:4, c2 = letters[1:4]) 
B = data.frame(c1 = c(2,4,5,6), c2 = letters[c(2:5)]) 
A
B

### INNER JOIN 
# This means to match the observations of the column we would join the tables by.   
inner = sqldf(" 
   SELECT 
   A.c1, B.c2 
   FROM 
   A INNER JOIN B 
   ON A.c1 = B.c1 
") 

# Only the rows that match c1 in both A and B are returned 
inner

### LEFT OUTER JOIN
# the left outer join, sometimes just called left join will return the  
# first all the values of the column used from the A table  
left = sqldf(" 
  SELECT 
   A.c1, B.c2 
  FROM 
   A LEFT OUTER JOIN B 
   ON A.c1 = B.c1 
")  

# Only the rows that match c1 in both A and B are returned 
left 
