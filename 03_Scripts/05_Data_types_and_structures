
# Data types and structures in R ----------------------------------------------

# Clean working directory (remove all objects from workspace) ----------
rm(list=ls())


# Data types ------------------------------------------------------------------

# numeric
x <- 55
x
class(x) # displays the data type of an object


# character
city <- "Zurich"
city
class(city)


# logical
good_Naming <- FALSE
class(good_naming) # R is case sensitive (only use lowercase in object names)

good_naming <- TRUE
class(good_naming)


# factor
city
class(city)
city_fac <- as.factor(city) # classes can be converted
class(city_fac)


# date
start <- "2019-02-03"
end <- "2019-06-01"

start <- as.Date(start, format = "%Y-%m-%d") # covert from character to date
class(start)
end <- as.Date(end, format = "%Y-%m-%d")

end - start # calculations are possible with dates, difference in days


# datetime
start <- "2019-09-10 12:30"
end <- "2019-09-13 22:37:35"

start <- as.POSIXct(start, format = "%Y-%m-%d %H:%M")
class(start)
end <- as.POSIXct(end, format = "%Y-%m-%d %H:%M:%S")

end - start # difference in days
difftime(time1 = end, time2 = start, units = "secs") # custom difference, here seconds


# Data structures -------------------------------------------------------------


# Vector ----------

# vectors are objects with multiple elements
vec_char <- c("Zurich", "Bern", "Geneva", "Lucerne", "Solothurn")
vec_log <- c(TRUE, FALSE, TRUE, TRUE, FALSE)
vec_num <- c(1, 5, 8, 8:13, 2, 4.6)
vec_num

# what data type is vec_num?
class(vec_num)

# calculate the mean of vec_1
vec_1 <- seq(from = 2, to = 14, by = 2)
vec_1

?mean
vec_1_mean <- mean(x = vec_1)
vec_1_mean

# what is the sum of vec_2?
vec_2 <- c(TRUE, TRUE, FALSE, FALSE, TRUE)
sum(vec_2) # TRUE = 1, FALSE = 0


# select elements of vectors
vec_char[2] # 2nd element
vec_char[3:5] # elements 3-5
vec_num[c(2, 5, 8)] # element 2, 5 and 8


# change data types of vectors
vec_char <- as.factor(vec_char)
class(vec_char)

vec_num <- as.character(vec_num)
class(vec_num)
sum(vec_num)


# create empty vector
vec_3 <- vector(mode = "logical", length = 5) # empty logical vector
vec_3
vec_4 <- vector(mode = "numeric", length = 3) # empty numeric vector
vec_4


# Data frame ----------

# use internal dataset airquality
data(airquality) # load dataset
head(airquality) # view first 6 lines of data frame
View(airquality) # view dataset

# assign airquality to df
df <- airquality
class(df)

# show the first 6 lines of the data frame
head(df)
# see the structure of the data frame
str(df)


# select elements of a data frame
df$Temp # select column by name
df[, 4] # select column by number
identical(df$Temp, df[, 4]) # selections are the same

df[2, ] # select row by number
df[2:6, ] # select multiple rows

df[1:2, c(1, 3)] # select first two rows of columns 1 and 3


# data frame has names (i.e. column headers)
names(df) # general name of an object
colnames(df) # column names

# create a data frame from scratch
df <- data.frame(First_Name = c("Eva", "Max", "Bill", "Susan"),
                 Last_Name = c("Miller", "Moritz", "Walsh", "Bunn"),
                 Age = c(23, 44, 58, 76))
str(df)


# List ----------

# lists can contain multiple objects
list <- list(df, airquality, vec_1, vec_2, vec_char)
class(list)

# select elements of a list
l1 <- list[[1]]
identical(df, l1)

l2 <- list[1] # list that contains an object, here df

l3 <- list[[4]][1:3] # select single elements from list object

