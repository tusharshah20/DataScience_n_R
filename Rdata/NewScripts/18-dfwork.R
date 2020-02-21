#Creating array
s <- array(c(0:15),dim=c(4,4,2,2))
s
#if the array doesn't have enough values, it will repeatedly store the values

#combining vectors into a dataframe
a <- c(1,2,3,4,NA)
b <- c(6,7,8,NA,10)
c <- c(11,12,NA,14,15)
d <- c(16,NA,18,19,20)
e <- c(21,22,23,24,25)

class(a)

df <- data.frame(a,b,c,d,e)
df
class(df)

#finding number fo rows
nrow(df)
ncol(df)

#to stack the columns of df on top of each other
#df1 contains values of df and a new variable ind is created which represents corresponding column for each row

df1 <- stack(df)
df1

#using rbind to append rowwise (arguments could be vectors/dfs)
rdf <- rbind(df,df,df)
rdf

#using cbind
cdf <- cbind(df,df,df)
cdf

#checking class of individual columns 
str(rdf)
#================================================================================
#working with dplyr
library(dplyr)
#R has its own data file format–it’s usually saved using the .rds extension.
#As with a CSV file, you can load a RDS file straight from a website, however, you must first run the file through a decompressor 
#before attempting to load it via readRDS. A built-in decompressor function called gzcon can be used for this purpose.
#https://github.com/ajaykuma/Datasets
#or simply from your machine
chicago <- readRDS("C:/Users/Win10/Downloads/chicago.rds")
chicago

dim(chicago)
str(chicago)

#The select() function can be used to select columns of a data frame that you want to focus on.
names(chicago)[1:3]
subset <- select(chicago, city:dptp)
head(subset)

#the : normally cannot be used with names or strings, but inside the select() function
#you can use it to specify a range of variable names.
#You can also omit variables using the select() function by using the negative sign.

subset1 <- select(chicago, -(city:dptp))
head(subset1)

#other way of doing it
i <- match("city", names(chicago))
j <- match("dptp", names(chicago))
head(chicago[, -(i:j)])
head(chicago[, (i:j)])

#select() function also allows you to specify variable names based on patterns.
subset <- select(chicago, ends_with("2"))
str(subset)
subset <- select(chicago, starts_with("d"))
str(subset)

#?select for more options

#using filter()
#to extract subsets of rows from a data frame and this is faster than subset()

#Extract the rows of the chicago data frame where the levels of PM2.5 are greater than 30
#try
#try
#try
#try
#try
#try
#try
chic.f <- filter(chicago, pm25tmean2 > 30)
str(chic.f)

#distribution of the pm25tmean2 values is
summary(chic.f$pm25tmean2)

#extract the rows where PM2.5 is greater than 30 and temperature is greater than 80 degrees
chic.f <- filter(chicago, pm25tmean2 > 30 & tmpd > 80)
select(chic.f, date, tmpd, pm25tmean2)

#Using arrange()
#to reorder rows of a data frame according to one of the variables/columns.

#we can order the rows of the data frame by date, so that the first row is the earliest (oldest) observation and 
#the last row is the latest (most recent) observation.
chicago <- arrange(chicago, date)
head(select(chicago, date, pm25tmean2), 3)
tail(select(chicago, date, pm25tmean2), 3)

#in desc order
chicago <- arrange(chicago, desc(date))
head(select(chicago, date, pm25tmean2), 3)
tail(select(chicago, date, pm25tmean2), 3)

#Renaming a variable in a data frame
head(chicago[, 1:5], 3)
chicago <- rename(chicago, dewpoint = dptp, pm25 = pm25tmean2)
head(chicago[, 1:5], 3)


#To compute transformations of variables in a data frame using mutate()
#with air pollution data, we often want to detrend the data by subtracting the mean from the data.
chicago <- mutate(chicago, pm25detrend = pm25 - mean(pm25, na.rm = TRUE))
head(chicago)

#the related transmute() function, which does the same thing as mutate() but then drops all non-transformed variables.
#Here we detrend the PM10 and ozone (O3) variables.
head(transmute(chicago,
               pm10detrend = pm10tmean2 - mean(pm10tmean2, na.rm = TRUE),
               o3detrend = o3tmean2 - mean(o3tmean2, na.rm = TRUE)))


#to generate summary statistics from the data frame within strata defined by a variable.
#Here in this air pollution dataset, we want to know what the average annual level of PM2.5 is. 
#So the stratum is the year, and that is something we can derive from the date variable.(more on date options in other files)

chicago <- mutate(chicago, year = as.POSIXlt(date)$year + 1900)
#splitting dataframe by year
years <- group_by(chicago, year)
head(chicago,3)

#compute summary statistics for each year in the data frame with the summarize()
#now we can see annual averages of pm25, o3, and no2.
summarize(years, pm25 = mean(pm25, na.rm = TRUE),
          o3 = max(o3tmean2, na.rm = TRUE),
          no2 = median(no2tmean2, na.rm = TRUE))

#we might want to know what are the average levels of ozone (o3) and nitrogen dioxide (no2) within quintiles of pm25. 
#A slicker way to do this would be through a regression model, but we can actually do this quickly with group_by() and summarize().
#using group_by()

#create a categorical variable of pm25 divided into quintiles
qq <- quantile(chicago$pm25, seq(0, 1, 0.2), na.rm = TRUE)
chicago <- mutate(chicago, pm25.quint = cut(pm25, qq))

#group the data frame by the pm25.quint variable
quint <- group_by(chicago, pm25.quint)

#compute the mean of o3 and no2 within quintiles of pm25
summarize(quint, o3 = mean(o3tmean2, na.rm = TRUE),
          no2 = mean(no2tmean2, na.rm = TRUE))

#using pipeline operator %>%
#The pipeline operater %>% is very handy for stringing together multiple dplyr functions in a sequence of operations.
#nesting-->third(second(first(x)))
#Using pipeline operator--->first(x) %>% second %>% third
#using pipeline to solve previous use case
x <- mutate(chicago, pm25.quint = cut(pm25, qq)) %>%
  group_by(pm25.quint) %>%
  summarize(o3 = mean(o3tmean2, na.rm = TRUE),
              no2 = mean(no2tmean2, na.rm = TRUE))
x
#This way we don’t have to create a set of temporary variables along the way or create a massive nested sequence of function calls.


#computing the average pollutant level by month,to see if there are any seasonal trends in the data.
y <- mutate(chicago, month = as.POSIXlt(date)$mon + 1) %>%
  group_by(month) %>%
  summarize(pm25 = mean(pm25, na.rm = TRUE),
            o3 = max(o3tmean2, na.rm = TRUE),
            no2 = median(no2tmean2, na.rm = TRUE))
y
