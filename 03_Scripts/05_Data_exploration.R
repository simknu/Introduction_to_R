
# -----------------------------------------------------------------------------
# Title: Data exploration

# Description: Introduction how one can explore and summarise a dataset.
#  1) Get an overview of the dataset
#  2) Summary statistics
#  3) Summary statistics by group
#  4) Missing data

# Author: Simon Knüsel

# Date: 2019-10-07
# -----------------------------------------------------------------------------


# Load data --------------------
## Load internal datasets airquality and iris
data(airquality)
data(iris)


# 1) Get an overview of the dataset --------------------

View(iris) # see the dataset as a table

dim(iris) # dimensions (number of rows, number of columns)
nrow(iris) # number of rows
ncol(iris) # number of columns

str(iris) # structure of the dataset

table(iris$Species) # number of occurrences by variable
unique(iris$Species) # unique instances by variable


# 2) Summary statistics --------------------

summary(iris) # summary of dataset

mean(iris$Sepal.Length)
median(iris$seSepal.Length)
max(iris$Sepal.Length)
min(iris$Sepal.Length)

which.min(iris$Sepal.Length) # row number of minimum
which.max(iris$Sepal.Length) # row number of maximum

sd(iris$Sepal.Length) # standard deviation
var(iris$Sepal.Length) # variance
quantile(iris$Sepal.Length) # quantiles


# 3) Summary statistics by group --------------------

table(iris$Species) # number of occurrences by group (here species)

# Calculate the mean of petal length for each species
iris_setosa <- subset(x = iris, Species == "setosa") # filter for species "setosa"
table(iris_setosa$Species) # check the result
mean(iris_setosa$Petal.Length)

iris_versicolor <- subset(iris, Species == "versicolor")
table(iris_versicolor$Species)
mean(iris_versicolor$Petal.Length)

iris_virginica <- subset(x = iris, Species == "virginica")
table(iris_virginica$Species)
mean(iris_virginica$Petal.Length)


# 4) Missing data --------------------
## In R missing data should always be converted to "NA" (NA = not available)
## Empty cells from a .csv file are usually automatically converted to NA

mean(airquality$Ozone) # result is NA because of missing data
airquality$Ozone
mean(airquality$Ozone, na.rm = TRUE) # result without NA (na.rm = TRUE, removes NA's before calculation)

# The argument "na.rm" exists in many functions
median(airquality$Ozone, na.rm = TRUE)
sd(airquality$Ozone, na.rm = TRUE)
max(airquality$Ozone, na.rm = TRUE)

