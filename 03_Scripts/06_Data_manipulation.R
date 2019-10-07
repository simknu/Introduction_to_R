
# -----------------------------------------------------------------------------
# Title: Data manipulation

# Description: Introduction to data manipulation.

# Author: Simon Knüsel

# Date: 2019-10-07
# -----------------------------------------------------------------------------


# Load data --------------------
data(iris)

# Get an overview of data
head(iris)
str(iris)


# Manipulate data --------------------

# Add a new column ------

# add new variable "genus"
?iris
iris1 <- iris
head(iris1)
iris1$genus <- "Iris"
head(iris1) # check the result


# Filter rows by condition ------

table(iris$Species) # number of occurrences by variable

# Select single group from character or factor variable
iris2 <- subset(x = iris, Species == "setosa")
table(iris2$Species) # check the result

# Select multiple groups from character or factor variable
iris3 <- subset(x = iris, Species %in% c("setosa", "virginica"))
table(iris3$Species)

# Select numeric variable by condition
iris4 <- subset(x = iris, Sepal.Length >= 4.9)
min(iris4$Sepal.Length) # check the result

# Select numeric variable with multiple conditions
iris5 <- subset(x = iris, Sepal.Length > 4 & Petal.Length > 5) # multiple condition with AND (&)
min(iris5$Sepal.Length) # check results of both conditions
min(iris5$Petal.Length)

iris5 <- subset(iris, Sepal.Length > 6 | Sepal.Length < 5) # multiple conditions OR (|)


# Select columns ------

# Select the first two columns
iris6 <- iris[, 1:2]
head(iris6)

# Select a column by name
iris7 <- iris$Petal.Width
iris7


# Sort values by column ------

iris8 <- iris
iris8$Petal.Length <- order(iris$Petal.Length) # sort column in ascending order
iris8$Petal.Length

iris8$Petal.Length <- order(iris$Petal.Length, decreasing = TRUE) # sort colum in descending order
iris8$Petal.Length

