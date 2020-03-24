
# -----------------------------------------------------------------------------
# Title: Vector, data frame and list

# Description: Introduction to data types (numeric, character, logical, etc.) 
#  and data structures (vector, data frame, list).
#  1) Vector
#  2) Data frame
#  3) List

# Author: Simon Knüsel

# Date: 2020-03-26
# -----------------------------------------------------------------------------


# 1) Vector --------------------

# Vector classes ------

# numeric
vec <- c(2, 5, 7, 9, 3.5)
vec
class(vec) # class() returns the class of an object

# character (characters or text need quotation marks "")
city <- c("Zurich", "Basel", "Bern", "Geneva")
City # throws error because R is case sensitive!
city
class(city)

# logical (contains only TRUE or FALSE)
male <- c(TRUE, FALSE, TRUE, TRUE, FALSE)
male
class(male)

# factor (for categorical variables)
treatment <- factor(c("control", "treat1", "treat1", "control"))
levels(treatment)

# date
start <- "2019-02-03"
end <- "2019-06-01"
class(start)
class(end)

start <- as.Date(start) # classes can be convertet -> conversion from character to date
class(start)
end <- as.Date(end)

end - start # calculations are possible with objects of class date


# Vector indexing ------
## Select elements of a vector

city[2] # 2nd element

vec[3:5] # elements 3, 4 and 5

male[c(2, 5, 8)] # elements 2, 5 and 8



# 2) Data frame --------------------

# Load internal dataset airquality
data(airquality)

# Assign airquality to df
df <- airquality
class(df)

# See structure of df (data frame consists of vectors)
str(df)


# Data frame indexing ------
## Select parts of a data frame

# Select with row and column numbers - df[row, col]
df[1, 2] # first row, second column

df[, 2] # second column

df[1:3, ] # first three rows

df2 <- df[1:3, 3:5] # rows 1:3, columns 3:5
df2 # check the result


# Select by column name - df$column_name
df$Wind

wind <- df$Wind
class(wind) # numeric vector

temp <- df$Temp
df[, 4]
identical(temp, df[, 4])


# Column names ------
colnames(df) # column names (i.e. header of the data frame)

# Change column names
colnames(df) <- c("ozone", "solar.r", "wind", "temp", "month", "day")
colnames(df)
head(df) # look at the first six rows of the data frame



# 3) List --------------------

# Lists can objects of different classes (i.e. data frames, vectors, ...)
list <- list(df, airquality, city, vec, male)
class(list)

# select elements of a list
list1 <- list[1] # first list element, contains df
class(list1)

l1 <- list[[1]] # first list object
class(l1) # first list object is df, therefore its class is data.frame
head(l1)

l3 <- list[[4]][1:3] # select single elements from list objects
l3
