#Factors
#Factors are used to represent categorical data and can be unordered or ordered. One can think of
#a factor as an integer vector where each integer has a label. Factors are important in statistical
#modeling and are treated specially by modelling functions like lm() and glm().
#Using factors with labels is better than using integers because factors are self-describing. Having a
#variable that has values Male and Female is better than a variable that has values 1 and 2.
#Factor objects can be created with the factor() function.

x <- factor(c("yes","yes","no","yes","no"))
x
table(x)

unclass(x)

#Factors will be automatically created for you when you read a dataset in using a function like
#read.table(). Those functions often default to creating factors when they encounter data that look
#like characters or strings.
#The order of the levels of a factor can be set using the levels argument to factor(). This can be
#important in linear modelling because the first level is used as the baseline level.

x <- factor(c("yes","yes","no","yes","no"))
x

x <- factor(c("yes","yes","no","yes","no"),
            levels = c("yes","no"))
x
