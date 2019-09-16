
# Data types and structures in R ----------------------------------------------

# Clean working directory (remove all objects from workspace) ------
rm(list=ls())


# Data types ------------------------------------------------------------------

# Numeric
x <- 55
x
class(x) # displays the data type of an object


# Character
city <- "Zurich"
city
class(city)


# Logical
good_Naming <- FALSE
class(good_naming) # R is case sensitive (only use lowercase in object names)

good_naming <- TRUE
class(good_naming)



# Data structures -------------------------------------------------------------


# Vector ----------

# Vectors are objects with multiple elements
vec_char <- c("Zurich", "Bern", "Geneva", "Lucerne", "Solothurn")
vec_log <- c(TRUE, FALSE, TRUE, TRUE, FALSE)
vec_num <- c(1, 5, 8, 8:13, 2, 4.6)
vec_num

# What data type is vec_num?
class(vec_num)

# What data type is vec_1?
vec_1 <- c(TRUE, 1, 3, "five")
class(vec_1) # if multiple data types are provided, only one is assigned

# Calculate the mean of vec_2
vec_2 <- seq(from = 2, to = 14, by = 2)
vec_2

?mean
vec_2_mean <- mean(x = vec_2)
vec_2_mean

# What is the sum of vec_3?
vec_3 <- c(TRUE, TRUE, FALSE, FALSE, TRUE)
sum(vec_3) # TRUE = 1, FALSE = 0


# Select elements of vectors
vec_char[2] # 2nd element
vec_char[3:5] # elements 3-5
vec_num[c(2, 5, 8)] # element 2, 5 and 8


# Create empty vector
vec_4 <- vector(mode = "logical", length = 5) # empty logical vector
vec_4
vec_5 <- vector(mode = "numeric", length = 3) # empty numeric vector
vec_5



# Data frame ----------

# Use internal dataset airquality
data(airquality) # load dataset
airquality
View(airquality) # view dataset

# Save airquality as df
df <- airquality
class(df)

# Show the first 6 lines of the data frame
head(df)
# See the structure of the data frame
str(df)


# Select elements of a data frame
df$Temp # select column by name
df[, 4] # select column by number
identical(df$Temp, df[, 4]) # selections are the same

df[2, ] # select row by number
df[2:6, ] # select multiple rows

df[1:2, c(1, 3)] # select first two rows of columns 1 and 3


# Data frame has names (i.e. column headers)
names(df) # general name of an object
colnames(df) # column names

# Create a data.frame from scratch
df <- data.frame(First_Name = c("Eva", "Max", "Bill", "Susan"),
                 Last_Name = c("Miller", "Moritz", "Walsh", "Bunn"),
                 Age = c(23, 44, 58, 76))
str(df)



# List ----------

# Lists can contain multiple objects
list <- list(df, airquality, vec_1, vec_2, vec_char)
class(list)

# Select elements of a list
l1 <- list[[1]]
identical(df, l1)

l2 <- list[1] # list that contains an object, here df

l3 <- list[[4]][1:3] # select single elements from list object

