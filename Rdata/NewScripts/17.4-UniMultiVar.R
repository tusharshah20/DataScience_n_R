#First approach to analyzing data is to visually analyze it.
#The objectives of doing this are normally finding relations between variables and univariate descriptions of the variables. 
#We can divide these strategies as −

#Univariate analysis
#Multivariate analysis

#Univariate(a statistical term) Graphical Methods
#In practice, it means we want to analyze a variable independently from the rest of the data. 

#Box-Plots
#Box-Plots are normally used to compare distributions. It is a great way to visually inspect if there are differences between distributions.
#if there are differences between the price of diamonds for different cut.

#using the ggplot2 library for plotting to analyze distributions of numeric variables 
library(ggplot2)  
data("diamonds") 

head(diamonds)

### Box-Plots
#The boxplot compactly displays the distribution of a continuous variable. It 
#visualises five summary statistics (the median, two hinges and two whiskers), and all "outlying" points individually.
#https://www.rdocumentation.org/packages/ggplot2/versions/3.2.1/topics/geom_boxplot
#https://ggplot2.tidyverse.org/reference/geom_bar.html
p = ggplot(diamonds, aes(x = cut, y = price, fill = cut)) + 
  geom_boxplot() + 
  theme_bw() 
print(p)
#there are differences in the distribution of diamonds price in different types of cut.

#Histograms
# We can plot histograms for each level of the cut factor variable using 
facet_grid 
p = ggplot(diamonds, aes(x = price, fill = cut)) + 
  geom_histogram() + 
  facet_grid(cut ~ .) + 
  theme_bw() 
p

# the previous plot doesn’t allow to visuallize correctly the data because of the differences in scale 
# we can turn this off using the scales argument of facet_grid  

p = ggplot(diamonds, aes(x = price, fill = cut)) + 
  geom_histogram() + 
  facet_grid(cut ~ ., scales = 'free') + 
  theme_bw() 
p  

png('02_histogram_diamonds_cut.png') 
print(p) 
dev.off()

#Multivariate Graphical Methods
#finding relationships among different variables. There are two ways to accomplish this that are commonly used: 
#plotting a correlation matrix of numeric variables or 
#simply plotting the raw data as a matrix of scatter plots.
library(ggplot2)
data(diamonds) 

# Correlation matrix plots  
keep_vars = c('carat', 'depth', 'price', 'table') 
df = diamonds[, keep_vars]  
# compute the correlation matrix 
M_cor = cor(df) 
M_cor

# plots 
heatmap(M_cor)
#there is a strong correlation between price and caret, and not much among the other variables.

#A correlation matrix can be useful when we have a large number of variables
#in which case plotting the raw data would not be practical.
#to show the raw data
library(GGally)
ggpairs(df) 
