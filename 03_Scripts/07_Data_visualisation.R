
# -----------------------------------------------------------------------------
# Title: Data visualisation

# Description: Introduction to graphics in R.
#  1) Plot types (i.e. scatterplot, boxplot, histogram, etc.)
#  2) Multiple plots in the same window
#  3) Save plots
#  4) Visualisation capabilities of R

# Author: Simon Knüsel

# Date: 2020-09-20
# -----------------------------------------------------------------------------


# Prepare workspace --------------------

# Set working directory
setwd("~/R_Basic_Introduction/") # path to working directory


# Load data --------------------
data(iris)
head(iris)

temp <- read.csv(file = "01_Data/temperature.csv")
head(temp)


# 1) Plot types --------------------

# Scatterplot (two continuous variables) ------
?plot

plot(x = iris$Petal.Length, y = iris$Petal.Width, type = "p")
plot(data = iris, Petal.Width ~ Petal.Length, type = "p") # ~ Shortcut on Mac: Alt + N (may vary depending on keyboard)

# add axis labels (xlab, ylab) and a title (main)
plot(data = iris, Petal.Width ~ Petal.Length, type = "p",
     xlab = "Petal length", ylab = "Petal width", main = "Iris dataset")

# change color of points (col)
plot(data = iris, Petal.Width ~ Petal.Length, type = "p", col = "red")

# change point symbol (pch)
?pch
plot(data = iris, Petal.Width ~ Petal.Length, type = "p", col = Species,
     xlab = "Petal length", ylab = "Petal width", main = "Iris dataset",
     pch = 16)

# add vertical and horizontal lines to the plot
mean_petal_width <- mean(iris$Petal.Width)
abline(h = mean_petal_width, col = "blue") # h = ..., h for horizontal

abline(v = mean(iris$Petal.Length), col = "grey") # v = ..., v for vertical


# Histogram (distribution of a single variable) ------
hist(x = iris$Petal.Length)
hist(x = iris$Petal.Length, xlab = "Petal length", main = "")

# for one species only
iris_setosa <- subset(iris, Species == "setosa")
hist(x = iris_setosa$Petal.Length, xlab = "Petal length", 
     main = "Iris setosa")
# change axis limits (xlim, ylim)
hist(x = iris_setosa$Petal.Length, xlab = "Petal length", 
     main = "Iris setosa", xlim = c(0.8, 2.2), ylim = c(0, 14))


# Boxplot (compare distributions of groups) ------
boxplot(data = iris, Sepal.Length ~ Species, ylab = "Sepal length")

# add approximate confidence intervals (notch)
boxplot(data = iris, Sepal.Length ~ Species, ylab = "Sepal length", 
        notch = TRUE)


# Time-series plot (line plot) ------

# Filter temperature dataset for the site Bern and the month February
temp_bern <- subset(temp, site == "Bern" & month == 2)
head(temp_bern)

# Plot line plot (type = "l")
plot(data = temp_bern, temp ~ day, type = "l")

# Change direction of y-axis labels (las = 1)
plot(data = temp_bern, temp ~ day, type = "l", 
     xlab = "February", ylab = "Temperature (°C)", las = 1)


# 2) Multiple plots in the same window --------------------

# prepare datasets for one histogram per species
iris_setosa <- subset(iris, Species == "setosa")
iris_versicolor <- subset(iris, Species == "versicolor")
iris_virginica <- subset(iris, Species == "virginica")

# prepare window to draw multiple plots
?par # par controls graphical parameters in the plot window
par(mfrow = c(1, 3)) # 1 row, 3 columns

hist(x = iris_setosa$Petal.Length, xlab = "Petal length", 
     main = "Iris setosa", xlim = c(0, 7), ylim = c(0, 22))
hist(x = iris_versicolor$Petal.Length, xlab = "Petal length",
     main = "Iris versicolor", xlim = c(0, 7), ylim = c(0, 22))
hist(x = iris_virginica$Petal.Length, xlab = "Petal length",
     main = "Iris virginica", xlim = c(0, 7), ylim = c(0, 22))

dev.off() # reset plot window (also deletes the plot)


# more complex plot arrangements (layout)
# example 1
layout(mat = matrix(1:4, ncol = 2, nrow = 2)) # same as par(mfrow = c(2, 2))
layout.show(4) # insert total number of plots

# example 2
layout(mat = matrix(c(1, 2, 3, 3), ncol = 2, nrow = 2, byrow = TRUE), 
       widths = c(2, 1, 1))
layout.show(3)
# draw plots
hist(x = iris_setosa$Petal.Length, xlab = "Petal length", 
     main = "Iris setosa")
hist(x = iris_versicolor$Petal.Length, xlab = "Petal length",
     main = "Iris versicolor")
hist(x = iris_virginica$Petal.Length, xlab = "Petal length",
     main = "Iris virginica")

# example 3
# prepare datasets
temp_bern_feb <- subset(x = temp, site == "Bern" & month == 2)
temp_bern_mar <- subset(x = temp, site == "Bern" & month == 3)
# plot arrangement
layout(mat = matrix(c(1:2), ncol = 1))
layout.show(2)
# change margins for first plot
par(mar = c(0, 4.1, 4.1, 2.1)) # mar controls the margins of the plot window, mar = c(bottom, left, top, right)
# plot in the first panel
plot(x = temp_bern_feb$day, y = temp_bern_feb$temp, type = "l",
     col = "red", ylab = "February", 
     main = "Temperature Bern\n February and March 2013", # '\n' introduces a line break
     xaxt = "n", # suppresses the x-axis label and ticks
     las = 1 # horizontal axis labels
     )
# change margins for the second plot
par(mar = c(5.1, 4.1, 0, 2.1))
# plot in the second panel
plot(x = temp_bern_mar$day, y = temp_bern_mar$temp, type = "l",
     xlab = "Day", ylab = "March", col = "red", las = 1)


# 3) Save plots --------------------

getwd() # plots are by default saved to the current working directory

# 1) Define the name and size of the plot and where to save it
pdf(file = "my_first_plot.pdf", width = 8, height = 4) # add .pdf to the file name

# 2) Draw plots (i.e. run plot commands)
par(mfrow = c(1, 3)) # 1 row, 3 columns

hist(x = iris_setosa$Petal.Length, xlab = "Petal length", 
     main = "Iris setosa")
hist(x = iris_versicolor$Petal.Length, xlab = "Petal length",
     main = "Iris versicolor")
hist(x = iris_virginica$Petal.Length, xlab = "Petal length",
     main = "Iris virginica")

# 3) Write plot to file by shutting off the plotting device
dev.off()


# 4) Visualisation capabilities of R --------------------

# for inspirations on nice graphs and the potential of R for plotting
# https://www.r-graph-gallery.com/


