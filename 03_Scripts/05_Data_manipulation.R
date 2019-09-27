
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
head(iris)


# Get an overview of data ----------
View(iris) # see the dataset as a table

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
iris3 <- filter(iris, species %in% c("setosa", "virginica"))
iris3 <- filter(iris, sepal_length >= 4.9)

# classical approach
iris4 <- subset(iris, species == "setosa") # same commands as in dplyr approach
iris4 <- subset(iris, species %in% c("setosa", "virginica"))
unique(iris4$species)


# Select - select columns ----------

# dplyr approach
iris6 <- select(iris, sepal_width, sepal_length)
iris6 <- select(iris, grep("sepal", names(iris)))
?grep

# classical approach
iris5 <- iris[, 1:2]


# Arrange - sort by columns ----------

# dplyr approach
iris6 <- arrange(iris, -sepal_width)
head(iris6)

# classical approach
iris7 <- iris[order(iris$sepal_width, decreasing = TRUE), ]


# Summarise - summarise data ----------

# dplyr approach
iris8 <- summarise(iris, mean = mean(petal_length))
iris8 <- summarise(iris, max = max(petal_length))
iris8

# classical appraoch
iris9 <- mean(iris$petal_length)
iris9 <- max(iris$petal_length)
iris9


# Group_by - group data ----------

# dplyr approach
iris_grouped <- group_by(iris, species)
iris10 <- summarise(iris_grouped, mean = mean(petal_length))
iris10

# classical appraoch
iris_setosa <- subset(iris, species == "setosa")
iris11 <- mean(iris_setosa$petal_length)

iris_versicolor <- subset(iris, species == "versicolor")
iris12 <- mean(iris_versicolor$petal_length)

iris_virginica <- subset(iris, species == "virginica")
iris13 <- mean(iris_virginica$petal_length)


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
  group_by(species, genus) %>% 
  summarise(sepal_length_mean = mean(sepal_length),
            sepal_width_mean = mean(sepal_width)) %>% 
  ungroup()

iris_dplyr

