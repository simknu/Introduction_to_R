
# -----------------------------------------------------------------------------
# Title: Extras and repetition

# Description: This script contains the repetition at the beginning of the
#  second course day and answers to questions asked during the course.
#  1) Repetition
#  2) Extras

# Author: Simon Knüsel

# Date: 2019-11-06
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

# Calculate the mean of rows
head(iris)
iris_rowmean <- rowMeans(iris[, 1:4]) # select all numeric columns (1:4) of the iris dataset
iris_rowmean

# Add the mean of rows to the iris data frame
iris_mean <- iris
iris_mean$rowmean <- rowMeans(iris_mean[, 1:4])
head(iris_mean)

