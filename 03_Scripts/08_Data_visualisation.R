
# Data visualisation ----------------------------------------------------------

# Prepare workspace ----------
#setwd("path_to_your_working_directory") # replace with your working directory
#rm(list = ls())

# load libraries
library(dplyr)


# Load data ----------
data(iris)
head(iris)
data(airquality)
head(airquality)


# Scatterplot (two continuous variables) ----------
?plot

plot(x = iris$Petal.Length, y = iris$Petal.Width, type = "p")
plot(data = iris, Petal.Width ~ Petal.Length, type = "p") # ~ Shortcut on Mac: Alt + N (may vary depending on keyboard)

# colour (col) by group
plot(data = iris, Petal.Width ~ Petal.Length, type = "p", col = Species)
# add a legend
legend("topleft", legend = levels(iris$Species), col = 1:3, 
       title = "Species", pch = 1, bty = "n")

# add axis labels (xlab, ylab) and a title (main)
plot(data = iris, Petal.Width ~ Petal.Length, type = "p", col = Species,
     xlab = "Petal length", ylab = "Petal width", main = "Iris dataset")

# change point symbol (pch)
?pch
plot(data = iris, Petal.Width ~ Petal.Length, type = "p", col = Species,
     xlab = "Petal length", ylab = "Petal width", main = "Iris dataset",
     pch = 16)

# add vertical and horizontal lines to the plot
mean_petal_width <- mean(iris$Petal.Width)
abline(h = mean_petal_width, col = "blue") # h = ..., h for horizontal

abline(v = mean(iris$Petal.Length), col = "grey") # v = ..., v for vertical


# Histogram (distribution of a single variable) ----------
hist(x = iris$Petal.Length)
hist(x = iris$Petal.Length, xlab = "Petal length", main = "")

# for one species only
iris_setosa <- filter(iris, Species == "setosa")
hist(x = iris_setosa$Petal.Length, xlab = "Petal length", 
     main = "Iris setosa")
# change axis limits (xlim, ylim)
hist(x = iris_setosa$Petal.Length, xlab = "Petal length", 
     main = "Iris setosa", xlim = c(0.8, 2.2), ylim = c(0, 14))


# Boxplot (compare distributions of groups) ----------
boxplot(data = iris, Sepal.Length ~ Species, ylab = "Sepal length")

# add approximate confidence intervals (notch)
boxplot(data = iris, Sepal.Length ~ Species, ylab = "Sepal length", 
        notch = TRUE)


# Time-series plot (line plot) ----------
# create date column for airquality
?airquality

airquality_plot <- airquality %>%
        # add year column
        mutate(Year = 1973) %>% 
        # add a date column (combination of columns year, month, day)
        mutate(ts = as.Date(paste(Year, Month, Day, sep = "-",
                                  format = "%Y-%m-%d")))

str(airquality_plot)

plot(data = airquality_plot, Ozone ~ ts, type = "l")



# Multiple plots in same window ----------

# prepare datasets for one histogram per species
iris_setosa <- filter(iris, Species == "setosa")
iris_versicolor <- filter(iris, Species == "versicolor")
iris_virginica <- filter(iris, Species == "virginica")

# prepare window to draw multiple plots
?par # par controls graphical parameters in the plot window
par(mfrow = c(1, 3)) # 1 row, 3 columns

hist(x = iris_setosa$Petal.Length, xlab = "Petal length", 
     main = "Iris setosa")
hist(x = iris_versicolor$Petal.Length, xlab = "Petal length",
     main = "Iris versicolor")
hist(x = iris_virginica$Petal.Length, xlab = "Petal length",
     main = "Iris virginica")

dev.off() # reset plot window (also deletes the plot)


# more complex plot arrangements (layout)
layout(mat = matrix(1:4, ncol = 2, nrow = 2)) # same as par(mfrow = c(2, 2))
layout.show(4) # total number of plots

layout(mat = matrix(c(1, 2, 3, 3), ncol = 2, nrow = 2, byrow = TRUE), 
       widths = c(2, 1, 1))
layout.show(3)

hist(x = iris_setosa$Petal.Length, xlab = "Petal length", 
     main = "Iris setosa")
hist(x = iris_versicolor$Petal.Length, xlab = "Petal length",
     main = "Iris versicolor")
hist(x = iris_virginica$Petal.Length, xlab = "Petal length",
     main = "Iris virginica")



# another example of multiple plots (with layout)
layout(mat = matrix(c(1:2), ncol = 1))
layout.show(2)

# change margins for first plot
par(mar = c(0, 4.1, 4.1, 2.1)) # mar controls the margins of the plot window, mar = c(bottom, left, top, right)

# plot in the first panel
plot(x = airquality_plot$ts, y = airquality_plot$Ozone, type = "l",
     col = "blue", ylab = "Ozone", 
     main = "Airquality\nNew York, 1973", # '\n' introduces a line break
     xaxt = "n", # suppresses the x-axis label and ticks
     las = 1 # horizontal axis labels
     )

# change margins for the second plot
par(mar = c(5.1, 4.1, 0, 2.1))
# plot in the second panel
plot(x = airquality_plot$ts, y = airquality_plot$Temp, type = "l",
     ylab = "Temperature", col = "red", las = 1)



# Save plots ----------

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


# Visualisation capabilities of R ----------

# for inspirations on nice graphs and the potential of R for plotting
# https://www.r-graph-gallery.com/


