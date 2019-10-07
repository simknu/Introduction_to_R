
# -----------------------------------------------------------------------------
# Title: Extras and repetition

# Description: This script contains answers to questions asked during the 
#  course and the repetition at the beginning of the second course day.
#  1) Extras
#  2) Repetition

# Author: Simon Knüsel

# Date: 2019-09-30
# -----------------------------------------------------------------------------


# Prepare workspace --------------------

# Set working directory
#setwd("/Users/Desktop/R_Basic_Introduction/")
#rm(list = ls())

# Load packages
library(dplyr)


# Load data --------------------
data(iris)


# 1) Extras --------------------

# Convert missing data (here value -99999) to NA when importing data
setwd("~/R_Basic_Introduction/") # replace with your path to the course folder

tree_growth <- read.csv(file = "01_Data/tree_growth_data.csv", 
                        na.strings = -99999)


# Convert column names to lower case and replace points (.) with 
# underscores (_) by hand
iris1 <- iris
colnames(iris1)
colnames(iris1) <- c("sepal_length", "sepal_width", "petal_length", 
                    "petal_width", "species")
head(iris1)

# Convert column names automatically
iris2 <- iris
# Convert to lower case
colnames(iris2) <- tolower(colnames(iris2))
?tolower
# Replace dots (.) with underscores (_)
colnames(iris2) <- gsub("\\.", "_", colnames(iris2))
head(iris2)
?gsub # this is an advanced function

identical(iris1, iris2)



# 2) Repetition --------------------


# Vectors ------
vec1 <- c("Bern", "Zurich", "Basel", "Geneva")
class(vec1)

vec2 <- c(TRUE, FALSE, TRUE, TRUE)
class(vec2)
sum(vec2) # In calculations TRUE = 1 and FALSE = 0


# Data frames ------

# Set working directory
getwd() # get current working directory
setwd("path_to_your_working_directory")

# Load a .csv file
tree_growth <- read.csv(file = "01_Data/tree_growth_data.csv")
head(tree_growth)
str(tree_growth)


# Data manipulation ------

# Add or change a column
iris3 <- mutate(iris1, genus = "Iris")

# Filter rows by condition
iris4 <- filter(iris1, sepal_length > 6 | sepal_length < 5) # multiple conditions OR = |

# Select columns
iris5 <- select(iris1, sepal_length, petal_length)
dim(iris5) # dimensions of the data frame (number of rows, number of columns)

# Sort columns
iris6 <- arrange(iris1, -petal_length) # sort descending (with "-" in fron of column name)
iris6$petal_length

# Summarise data
iris7 <- summarise(iris1, mean = mean(petal_length))
iris7

# Grouped summarise
iris_grouped <- group_by(iris1, species)
mean_petal_length <- summarise(iris_grouped, mean = mean(petal_length))
mean_petal_length

# Piping
iris_dplyr <- iris1 %>% 
  mutate(genus = "Iris") %>% 
  filter(sepal_length >= 4.9)

# check if the code did what you expected
head(iris_dplyr)
min(iris_dplyr$sepal_length)

