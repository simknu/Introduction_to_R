
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
unique(iris$species) # unique instances by variable

# change column headers (lowercase and underscore (_) instead of dots (.))
colnames(iris)
colnames(iris) <- tolower(colnames(iris))
colnames(iris) <- gsub("\\.", "_", colnames(iris)) # advanced: replace dots (.) with underscores (_)
head(iris)


# 2) Summary statistics --------------------
summary(iris) # summary of dataset

mean(iris$sepal_length)
median(iris$sepal_length)
max(iris$sepal_length)
min(iris$sepal_length)

which.min(iris$sepal_length) # row number of minimum
iris[14, ]
iris[which.min(iris$sepal_length), ]
which.max(iris$sepal_length) # row number of maximum

sd(iris$sepal_length) # standard deviation
var(iris$sepal_length) # variance
quantile(iris$sepal_length) # quantiles


# 3) Missing data --------------------

# In R missing data should always be converted to "NA" (NA = not available)
# Empty cells from a .csv file are usually automatically converted to NA

mean(airquality$Ozone) # result is NA because of missing data
mean(airquality$Ozone, na.rm = TRUE) # result without NA (na.rm = remove NA's before calculation)

# the argument "na.rm" exists in many functions
median(airquality$Ozone, na.rm = TRUE)
sd(airquality$Ozone, na.rm = TRUE)
max(airquality$Ozone, na.rm = TRUE)


# 4) Summary statistics by group --------------------
table(iris$species) # number of occurrences by group (here species)

# calculate mean, maximum and median of sepal length for each species
iris_summary <- iris %>% 
  group_by(species) %>% 
  summarise(mean_sepal_length = mean(sepal_length),
            max_sepal_length = max(sepal_length),
            med_petal_length = median(petal_length)) %>% 
  ungroup()

iris_summary

