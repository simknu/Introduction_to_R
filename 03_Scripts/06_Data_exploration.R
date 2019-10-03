
# -----------------------------------------------------------------------------
# Title: Data exploration

# Description: Introduction how one can explore and summarise a dataset.
#  1) Get an overview of the dataset
#  2) Summary statistics
#  3) Missing data
#  4) Summary statistics by group

# Author: Simon Knüsel

# Date: 2019-09-30
# -----------------------------------------------------------------------------


# Prepare workspace --------------------
#setwd("path_to_your_working_directory") # replace with your working directory
#rm(list = ls())

# Load packages
library(dplyr)


# Load data --------------------
data(airquality)
head(airquality)
data(iris)
head(iris)

# 1) Get an overview of the dataset --------------------
View(iris) # see the dataset as a table

dim(iris) # dimensions (number of rows, number of columns)
nrow(iris) # number of rows
ncol(iris) # number of columns

str(iris) # structure of the dataset

table(iris$Species) # number of occurrences by variable
unique(iris$Species) # unique instances by variable

# change column headers (lowercase and underscore (_) instead of dots (.))
colnames(iris)
colnames(iris) <- tolower(colnames(iris))
head(iris)


# 2) Summary statistics --------------------
summary(iris) # summary of dataset

mean(iris$sepal.length)
median(iris$sepal.length)
max(iris$sepal.length)
min(iris$sepal.length)

which.min(iris$sepal.length) # row number of minimum
iris[14, ]
iris[which.min(iris$sepal.length), ]
which.max(iris$sepal.length) # row number of maximum

sd(iris$sepal.length) # standard deviation
var(iris$sepal.length) # variance
quantile(iris$sepal.length) # quantiles


# 3) Missing data --------------------

# In R missing data should always be converted to "NA" (NA = not available)
# Empty cells from a .csv file are usually automatically converted to NA

mean(airquality$Ozone) # result is NA because of missing data
airquality$Ozone
mean(airquality$Ozone, na.rm = TRUE) # result without NA (na.rm = TRUE, removes NA's before calculation)

# the argument "na.rm" exists in many functions
median(airquality$Ozone, na.rm = TRUE)
sd(airquality$Ozone, na.rm = TRUE)
max(airquality$Ozone, na.rm = TRUE)


# 4) Summary statistics by group --------------------
table(iris$species) # number of occurrences by group (here species)

# calculate mean, maximum and median of sepal length for each species
iris_summary <- iris %>% 
  group_by(species) %>% 
  summarise(mean_sepal_length = mean(sepal.length),
            max_sepal_length = max(sepal.length),
            med_petal_length = median(petal.length)) %>% 
  ungroup()

iris_summary

