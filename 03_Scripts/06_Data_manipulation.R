
# Data manipulation -----------------------------------------------------------

# Prepare workspace ----------
#setwd("path_to_your_working_directory") # replace with your working directory
#rm(list = ls())

# load libraries
#install.packages("dplyr")
library(dplyr)
?dplyr


# Load data ----------
data(iris)

# Get an overview of data ----------
View(iris) # see the dataset as a table
head(iris) # see the first six rows of the dataset

dim(iris) # dimensions
nrow(iris) # number of rows
ncol(iris) # number of columns

str(iris) # structure of the dataset



# Manipulate data -------------------------------------------------------------

# Change column headers to lower case
colnames(iris)
colnames(iris) <- c("sepal_length", "sepal_width", "petal_length", 
                    "petal_width", "species") # long commands can run over multiple lines (break lines after comma)
head(iris)


# Mutate - add a new variable  ----------
# add variable 'genus'
?iris

# classical approach
iris1 <- iris
iris1$genus <- "Iris" # classical approach

# dplyr approach
iris2 <- mutate(iris, genus = "Iris")

# compare classical and dplyr approach
identical(iris1, iris2)


# Filter - select rows by condition  ----------
table(iris$species) # number of occurrences by variable
unique(iris$species) # unique instances by variable

# dpylr approach
iris3 <- filter(iris, species == "setosa")
unique(iris3$species)

iris4 <- filter(iris, species %in% c("setosa", "virginica")) # species == setosa OR virginica
unique(iris4$species)

iris5 <- filter(iris, sepal_length >= 4.9)
head(iris5)

iris6 <- filter(iris, sepal_length >= 4.9 & species == "setosa") # multiple conditions AND = &
iris7 <- filter(iris, sepal_length > 6 | sepal_length < 5) # multiple conditions OR = |


# classical approach
iris8 <- subset(iris, species == "setosa")
iris9 <- subset(iris, species %in% c("setosa", "virginica"))


# Select - select columns ----------

# dplyr approach
iris10 <- select(iris, sepal_width, sepal_length)
iris11 <- select(iris, grep("sepal", names(iris)))
?grep

# classical approach
iris12 <- iris[, 1:2]


# Arrange - sort by columns ----------

# dplyr approach
iris13 <- arrange(iris, -sepal_width)
head(iris13)

# classical approach
iris14 <- iris[order(iris$sepal_width, decreasing = TRUE), ]


# Summarise - summarise data ----------

# dplyr approach
iris15 <- summarise(iris, mean = mean(petal_length))
iris15 <- summarise(iris, max = max(petal_length))
iris15

# classical appraoch
iris16 <- mean(iris$petal_length)
iris16 <- max(iris$petal_length)
iris16


# Group_by - group data ----------

# dplyr approach
iris_gr <- group_by(iris, species)
iris_gr_mean <- summarise(iris_gr, mean = mean(petal_length))
iris_gr_mean

# classical appraoch
iris_set <- subset(iris, species == "setosa")
iris_set_mean <- mean(iris_set$petal_length)
iris_set_mean

iris_ver <- subset(iris, species == "versicolor")
iris_ver_mean <- mean(iris_ver$petal_length)
iris_ver_mean

iris_vir <- subset(iris, species == "virginica")
iris_vir_mean <- mean(iris_vir$petal_length)
iris_vir_mean


# Repetition of dplyr arguments ----------

# repetition of dplyr arguments
?mutate # add or change a column
?filter # filter rows by condition
?select # select columns
?arrange # sort by columns
?summarise # summarise data

?group_by # group data
?ungroup # ungroup data (always use after group_by)

# for more dplyr arguments and explanations see
vignette("dplyr")
# https://github.com/rstudio/cheatsheets/raw/master/data-transformation.pdf


# Use dplyr efficiently - piping ----------

# NEW: Pipe sign %>% 
# %>% assigns the data frame to the function
# shortcut Mac: Command + Shift + M
# shortcut Windows: Ctrl + Shift + M

iris_dplyr <- iris %>% 
  mutate(genus = "Iris") %>% 
  filter(sepal_length >= 4.9) %>% 
  select(sepal_length, sepal_width, species, genus) %>% 
  arrange(-sepal_length) %>% 
  group_by(species, genus) %>% # data can be grouped by multiple columns
  summarise(sepal_length_mean = mean(sepal_length),
            sepal_width_mean = mean(sepal_width)) %>% 
  ungroup() # always use after group_by

iris_dplyr

