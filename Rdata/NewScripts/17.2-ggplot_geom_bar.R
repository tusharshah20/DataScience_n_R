################################################################################
##################### Loading Packages & Investigating Data ####################
################################################################################

# 1. Load your packages

library(tidyverse)



# 2. Investigate the dataset

head(mpg)
str(mpg)

# QUESTION: What variables are in the data, and what values do you see?



################################################################################
############################## Creating Bar Charts #############################
################################################################################

# 3. Create your first bar chart

ggplot(mpg) +
    geom_bar(aes(x = class))

# QUESTION: What can you say about the different types of cars in the dataset?



# 4. Changing bar color in a ggplot bar chart

ggplot(mpg) +
    geom_bar(aes(x = class), fill = 'blue')

# HINT: You can try colors like 'red', 'green', or 'yellow'
# HINT: You can also try hex color codes if you have a specific color to match. 
# HINT: Try: '#0FA173' for the color above. Don't forget the #
# HINT: Look up your own hex color codes here: https://htmlcolorcodes.com/color-picker/



# 5. Stacked Bar Chart: Map the variable drv (front-, back-, 4-wheel drive) to a color

ggplot(mpg) +
    geom_bar(aes(x = class, fill = drv))

# QUESTION: Why does this graph produce multiple colors, when the prior graph produced only one?


# 6. Stacked Bar Chart: Map the variable cyl (4-, 6-, 8-cylinder engine) to a color

ggplot(mpg) + 
    geom_bar(aes(x = class, fill = factor(cyl)))

# Code block 1

ggplot(mpg) + 
    geom_bar(aes(x = class, fill = cyl))


# Code block 2

ggplot(mpg) + 
    geom_bar(aes(x = class, fill = factor(cyl)))

# 7. Dodged Bar Chart: Map the variable cyl (4-, 6-, 8-cylinder engine) to a color

ggplot(mpg) + 
    geom_bar(aes(x = class, fill = factor(cyl)), 
             position = position_dodge(preserve = 'single'))

################################################################################
################### Creating Bar Charts with a Defined y-axis ##################
################################################################################

# 8. Calculate average highway miles per gallon by class

by_hwy_mpg <- mpg %>% group_by(class) %>% summarise(hwy_mpg = mean(hwy))

# QUESTION: Which car class has the best (highest) highway mpg?

# 9. Graph highway mpg by class: introducing stat = 'identity'

ggplot(by_hwy_mpg) + 
    geom_bar(aes(x = class, y = hwy_mpg), stat = 'identity')

# 10. Graph highway mpg by class: introducing geom_col

ggplot(by_hwy_mpg) + 
    geom_col(aes(x = class, y = hwy_mpg))

################################################################################
################### Aesthetics and Parameters for Bar Charts ###################
################################################################################

# 11. Introducing the color parameter for a bar chart

ggplot(mpg) +
    geom_bar(aes(x = class), color = 'blue')

# QUESTION: When might you use color instead of, or in addition to, fill?

# 12. Applying color and fill parameters to the same chart

ggplot(mpg) +
    geom_bar(aes(x = class), fill = '#003366', color = '#add8e6')


ggplot(mpg) + 
    geom_bar(aes(x = class, color = drv), fill = 'white')

#Mapping drv to the alpha aesthetic to add transparency

ggplot(mpg) + 
    geom_bar(aes(x = class, alpha = drv))


################################################################################
############# Common Errors with Aesthetic Mappings and Parameters #############
################################################################################

# 15. Error: Trying to include aesthetic mappings *outside* your `aes()` call

ggplot(mpg) + geom_bar(aes(x = class), fill = drv)

# 12. Error: Trying to specify parameters *inside* your `aes()` call

ggplot(mpg) + 
    geom_bar(aes(x = class, fill = 'blue'))
