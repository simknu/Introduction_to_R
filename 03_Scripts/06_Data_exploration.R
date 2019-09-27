
# Data exploration ------------------------------------------------------------

# Prepare workspace ----------
#setwd("path_to_your_working_directory") # replace with your working directory
#rm(list = ls())

# load libraries
library(dplyr)


# Load data ----------
data(iris)
head(iris)


# Get an overview of data ----------
View(iris) # see the dataset as a table

dim(iris) # dimensions
nrow(iris) # number of rows
ncol(iris) # number of columns

str(iris) # structure of the dataset

# change column headers to lower case
colnames(iris)
iris <- iris %>% 
  rename(sepal_length = Sepal.Length, sepal_width = Sepal.Width,
         petal_width = Petal.Width, petal_length = Petal.Length,
         species = Species)
head(iris)


# Summary statistics ----------
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


# Missing data ----------
data("airquality")
head(airquality)

mean(airquality$Ozone) # result is NA because of missing data (NA = not available)
mean(airquality$Ozone, na.rm = TRUE) # result without NA (na.rm = remove NA's)

# The argument 'na.rm' exists in many functions
median(airquality$Ozone, na.rm = TRUE)
sd(airquality$Ozone, na.rm = TRUE)
max(airquality$Ozone, na.rm = TRUE)


# Summary statistics by group ----------
table(iris$species) # number of occurrences by group (here species)

iris_summary <- iris %>% 
  group_by(species) %>% 
  summarise(mean_sepal_length = mean(sepal_length),
            max_sepal_length = max(sepal_length),
            med_petal_length = median(petal_length)) %>% 
  ungroup()

iris_summary

