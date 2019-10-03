
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
colnames(iris2)
?tolower
# Replace dots (.) with underscores (_)
colnames(iris2) <- gsub("\\.", "_", colnames(iris2))
head(iris2)
?gsub # this is an advanced function

identical(iris1, iris2)


# Define colors by group (specify a custom color palette)
palette(c("violet", "blue", "darkgreen"))
plot(data = iris, Petal.Width ~ Petal.Length, type = "p", col = Species)


# Data upload with missing data coded as some value (e.g. -99999)
setwd("~/Introduction_to_R") # set working directory to course folder

# using "na.strings = " converts the provided values to NA during the upload
tree_growth <- read.csv(file = "01_Data/tree_growth_data.csv", 
                        na.strings = "-99999")



# 2) Repetition --------------------


# Vectors ------
vec1 <- c("Bern", "Zurich", "Basel", "Geneva")
class(vec1)

vec3 <- c(2, 3, 4, 5)
class(vec3)
vec3 <- as.character(vec3)
class(vec3)

vec2 <- c(TRUE, FALSE, TRUE, TRUE)
class(vec2)
sum(vec2) # In calculations TRUE = 1 and FALSE = 0

class(iris$Species)


# Data frames ------

# Set working directory
getwd() # get current working directory
setwd("path_to_your_working_directory")

# Load a .csv file
tree_growth <- read.csv(file = "01_Data/tree_growth_data.csv")
head(tree_growth)
str(tree_growth)


# Data manipulation ------

#install.packages("dplyr")
library(dplyr)

# Add or change a column
iris3 <- mutate(iris1, genus = "Iris")

# Filter rows by condition
iris6 <- filter(iris1, species %in% c("setosa", "virginica"))
iris6$species

# OR Alt + 7 |
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

