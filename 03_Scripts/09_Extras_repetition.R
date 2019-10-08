
# -----------------------------------------------------------------------------
# Title: Extras and repetition

# Description: This script contains the repetition at the beginning of the
#  second course day and answers to questions asked during the course.
#  1) Repetition
#  2) Extras

# Author: Simon Knüsel

# Date: 2019-10-08
# -----------------------------------------------------------------------------


# Load data --------------------
data(iris)


# 1) Repetition --------------------

# Vectors ------
vec1 <- c("Bern", "Zurich", "Basel", "Geneva")
class(vec1)

vec1 <- as.factor(vec1)
vec1
class(vec1)

vec3 <- c(2, 3, 4, 5)
class(vec3)

# select elements of a vector
vec4 <- vec1[c(1, 3)]
vec4


# Data frames ------

# get an overview of a data frame
class(iris)
head(iris)
str(iris)
summary(iris)

# select parts of a data frame
iris[1:20, c(1, 4)]

iris[16, ]

sepal_length <- iris$Sepal.Length
mean(sepal_length)
max(sepal_length)



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


