
# -----------------------------------------------------------------------------
# Title: Extras and repetition

# Description: This script contains the repetition at the beginning of the
#  second course day and answers to questions asked during the course.
#  1) Repetition
#  2) Extras

# Author: Simon Knüsel

# Date: 2020-09-20
# -----------------------------------------------------------------------------


# 1) Repetition --------------------

# Vectors ------
vec1 <- c("Bern", "Zurich", "Basel", "Geneva")
class(vec1)

vec2 <- c(2, 3, 4, 5)
class(vec2)

# select elements of a vector
vec3 <- vec1[c(1, 3)]
vec3


# Data frames ------

# load data
data(iris)

# get an overview of a data frame
head(iris)
str(iris)
summary(iris)

# select parts of a data frame
# select rows 1 to 20 and columns 1 and 4
iris2 <- iris[1:20, c(1, 4)]
iris2

# select column Sepal.Length
sepal_length <- iris$Sepal.Length
sepal_length


# 2) Extras --------------------

### Calculate the average sepal length for each species
data(iris)
head(iris)

# If I do not know how to calculate the average sepal length for each 
# species, i.e. I do not know which function does this, I usually do a
# Google search. In this case I use the following search query:
# "r calculate the mean for groups"


?aggregate # Get help for the function aggregate

# Calculate the average sepal length for each species - option 1
iris_group <- aggregate(formula = Sepal.Length ~ Species,
                        data = iris, FUN = mean)

iris_group # check the result


# Calculate the average sepal length for each species - option 2
iris_group <- aggregate(x = iris$Sepal.Length, 
                        by = list(iris$Species),
                        FUN = mean)

iris_group # check the result




### Overlay histograms

# prepare datasets for the two histograms
iris_versicolor <- subset(iris, Species == "versicolor")
iris_virginica <- subset(iris, Species == "virginica")

# Plot the first histogram
# Set the axis limits (for both histograms) with 'xlim' for the 
# x-axis and ylim for the y-axis
hist(x = iris_versicolor$Petal.Length, xlab = "Petal length",
     main = "Overlapping histograms", xlim = c(2, 8), ylim = c(0, 25), 
     col = "blue")

# Add the second histogram
# With the argument 'add' the histogram is added to the first plot
hist(x = iris_virginica$Petal.Length, col = "red", add = TRUE)


# To make the colors transparent you need the function 'rgb'
# You can set the transparency inside the 'rgb' function
# as the fourth number, i.e. rgb(1, 2, 3, 0.5) sets the 
# transparency to 0.5 (to 50%)
hist(x = iris_versicolor$Petal.Length, xlab = "Petal length",
     main = "Overlapping histograms", xlim = c(2, 8), ylim = c(0, 25), 
     col = rgb(0, 0, 1, 0.5))
hist(x = iris_virginica$Petal.Length, col = rgb(1, 0, 0, 0.5), 
     add = TRUE)





### Save plots as an object

# Apparently you cannot save plots produced with the 'plot'
# function to an object. So you need to use the structure
# I showed you in the file '07_Data_visualisation.R' to 
# save the plot. Or you can use the file menu with the 
# 'Export'-button in the 'Plots'-tab on the bottom right.

# Load the dataset
data(iris)
# Prepare the iris_setosa dataset
iris_setosa <- subset(iris, Species == "setosa")

# 1) Define the name and size of the plot and where to save it
pdf(file = "my_first_histogram.pdf", width = 8, height = 4)

# 2) Draw plot(s) (i.e. run plot commands)
hist(x = iris_setosa$Petal.Length, xlab = "Petal length", 
     main = "Iris setosa", xlim = c(0.75, 2), ylim = c(0, 15))

# 3) Write plot to file by shutting off the plotting device
dev.off()



# However, you can save plots produced with other functions.
# For example with 'ggplot2'. For more examples with this function
# I recommend you the R-course on 'tidyverse' at UZH. Or you can
# also have a look at the R cheat sheet on 'ggplot2'
# (https://github.com/rstudio/cheatsheets/raw/master/data-visualization-2.1.pdf).

# This part is now more advanced than what we covered in the course.
# You do not need to get nervous if you do not understand all of the
# code below.

# To use ggplot2 you first need to install the package 'ggplot'
install.packages("ggplot2") # You only need to install the package the first time

# Afterwards you need to load the package
library(ggplot2) # You always need to load packages at the start of every session (i.e. after you restart RStudio)

# After loading the library you can start with plotting
ggplot(data = iris_virginica, aes(x = Petal.Length)) +
  geom_histogram(bins = 20) +
  xlim(3, 8) +
  ylim(0, 15)

# Note: The error you get is only a warning message that 4 of the bars
# do not have any observation (count = 0)

# You can save this plot to an object
ggplot_1 <- ggplot(data = iris_virginica, aes(x = Petal.Length)) +
  geom_histogram(binwidth = 0.2)

ggplot_1 # The plot is only plotted once you run the saved object

# Now you can save the plot with the 'ggsave' function
ggsave(ggplot_1, filename = "my_first_ggplot.pdf", height = 4, width = 8)


