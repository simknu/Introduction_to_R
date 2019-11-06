
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
class(iris)
head(iris)
str(iris)
summary(iris)

# add a new column
iris1 <- iris
iris1$genus <- "Iris"

# filter rows by condition
iris1 <- subset(iris, Sepal.Length > 5.5)
min(iris1$Sepal.Length)

# select parts of a data frame
# select rows 1 to 20 and columns 1 and 4
iris2 <- iris[1:20, c(1, 4)]
iris2

# select column Sepal.Length
sepal_length <- iris$Sepal.Length
sepal_length


# 2) Extras --------------------

# Convert column names to lower case
iris1 <- iris
colnames(iris1)
colnames(iris1) <- c("sepal.length", "sepal.width", "petal.length", 
                     "petal.width", "species")
head(iris1)

# Convert column names automatically
iris2 <- iris
# Convert to lower case
colnames(iris2) <- tolower(colnames(iris2))
colnames(iris2)
?tolower

identical(iris1, iris2)


