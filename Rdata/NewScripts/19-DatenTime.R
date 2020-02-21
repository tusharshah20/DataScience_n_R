#Dates are represented by the Date class and times are represented by the POSIXct or the POSIXlt class.
## Coerce a 'Date' object from character
x <- as.Date("1970-01-01")
x

#see the internal representation of a Date object by using the unclass() function.
unclass(x)
unclass(as.Date("1970-01-02"))
unclass(as.Date("1970-01-03"))


#Times
#POSIXlt is a list underneath and it stores a bunch of other useful information like the day of the week, day
#of the year, month, day of the month.

#weekdays: give the day of the week
#months: give the month name
#quarters: give the quarter number (“Q1”, “Q2”, “Q3”, or “Q4”)

x <- Sys.time()
x
class(x) ## 'POSIXct' object

#The POSIXlt object contains some useful metadata.
p <- as.POSIXlt(x)
p
names(unclass(p))

y <- Sys.time()
y
unclass(y) #internal representation

y$sec ## Can't do this with 'POSIXct'!
p <- as.POSIXlt(y)
p$sec

#strptime() takes a character vector that has dates and times and converts them into to a POSIXlt object.
datestring <- c("January 10, 2012 10:40", "December 9, 2011 9:10")
x <- strptime(datestring, "%B %d, %Y %H:%M")
x
class(x)

#mathematical operations
x <- as.Date("2012-01-01")
y <- strptime("9 Jan 2011 11:34:21", "%d %b %Y %H:%M:%S")
x-y

#fixing it
x <- as.POSIXlt(x)
x-y

#date/time classes keep track of leap years, leap seconds, daylight savings, and time zones
x <- as.Date("2012-03-01")
y <- as.Date("2012-02-28")
x-y
