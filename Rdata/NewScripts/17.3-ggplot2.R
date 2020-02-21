#Line Graphs using ggplot
#we'll be using the Orange dataset that's built into R. This dataset contains information on 
#the age and circumference of 5 different orange trees, letting us see how these trees grow over time. 

head(Orange, n = 10)

library(tidyverse)
# Filter the data we need
tree_1 <- filter(Orange, Tree == 1)

# Graph the data
ggplot(tree_1) +
  geom_line(aes(x = age, y = circumference))

#Changing line color
ggplot(tree_1) +
  geom_line(aes(x = age, y = circumference), color = 'red')

# Graph different data
ggplot(Orange) +
  geom_line(aes(x = age, y = circumference, color = Tree))

#changing line type
ggplot(Orange) +
  geom_line(aes(x = age, y = circumference, linetype = Tree))

#Changing transparency in ggplot + geom_line with the alpha aesthetic
ggplot(Orange) +
  geom_line(aes(x = age, y = circumference, alpha = Tree))

#Changing the size aesthetic mapping in ggplot + geom_line
ggplot(Orange) +
  geom_line(aes(x = age, y = circumference, size = Tree))
