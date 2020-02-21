#one should avoid making use of loops in R. Why? Well, that’s because R supports vectorization. 
#Simply put, this allows for much faster calculations. For example, solutions that make use of loops 
#are less efficient than vectorized solutions that make use of apply functions, such as lapply and sapply. 

print(paste("The year is", 2010))
print(paste("The year is", 2011))

#This violates the DRY principle
for (year in c(2010,2011,2012,2013,2014,2015)){
  print(paste("The year is", year))}

for (year in 2010:2015){
  print(paste("The year is", year))
}

for (i in 2010:2015){
  print(paste("The year is", i))
}

#conditionals
var1 = 25
var2 = 35
if ((var1+var2)>10){
  print("value is greater than 10")
}

#else if
var1 = 25
var2 = 35
if ((var1+var2)>100){
  print("value is greater than 100")
} else if((var1 + var2)> 65) {
  print("value greater than 65")
} else if((var1 + var2)> 35){
   print("value is greater than 35")
}

#else if n else
var1 = 25
var2 = 35
if ((var1+var2)>100){
  print("value is greater than 100")
} else if((var1 + var2)> 65) {
  print("value greater than 65")
} else{
  print("value cannot be considered")
}

#using next
#printing uneven numbers
for (i in 1:10) {
  if (!i %% 2){
    next
  }
  print(i)
}


#using switch
switch("40",
       '1'= print("monday"),
       '2'= print("tuesday"),
       '3'=print("wednesday"),
       '4'=print("thursday"),
       print("Invalid Input")
       )

#using repeat
var1 = 5
repeat{
  print(var1)
  var1 = var1 + 2
  if(var1 >21){
    break
  }
}

#using while
var1 = 5
while (var1 < 21){
  print(var1)
  var1 = var1 + 2
  
}

#Creating Functions
fibo <- function(a){
  var1 = 0
  var2 = 1
  print(var1)
  print(var2)
  for(x in 1:a){
    var3 = var1+var2
    print(var3)
    var1= var2
    var2= var3
  }
}

