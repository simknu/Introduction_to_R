
# -----------------------------------------------------------------------------
# Title: Load and save data

# Description: This script introduces the steps that are necessary to load
#  data into R and save data from R.
#  1) Set working directory
#  2) Load data
#  3) Save data

#  For more help you can also have a look at the slides "Set working directory"
#  in the course material (inside the folder "02_Slides").

# Author: Simon Knüsel

# Date: 2019-09-30
# -----------------------------------------------------------------------------


# 1) Set working directory --------------------

# Path to the current working directory
# Help for Windows see: https://www.dummies.com/computers/operating-systems/windows-xp-vista/how-to-find-a-folders-path-name-in-windows-explorer/
# Help for Mac see: https://apple.stackexchange.com/questions/317992/is-there-any-way-to-get-the-path-of-a-folder-in-macos

setwd("path_to_your_working_directory") # replace with your working directory
getwd() # get the current working directory


# 2) Load data (load .csv-File) --------------------

# load file tree_growth_data.csv
read.csv(file = "01_Data/tree_growth_data.csv")
# assign the loaded file to an object
tree_growth <- read.csv(file = "01_Data/tree_growth_data.csv")


# load file tree_growth_data_2.csv
tree_growth_2 <- read.csv(file = "01_Data/tree_growth_data_2.csv")
View(tree_growth_2) # see the whole dataset
head(tree_growth_2) # see the first six lines of the dataset

# change separator from "," to ";"
tree_growth_2 <- read.csv(file = "01_Data/tree_growth_data_2.csv", sep = ";")
head(tree_growth_2)


# 3) Save data --------------------

# save as .csv (readable by Excel)
write.csv(x = tree_growth_2, file = "01_Data/tree_growth_new.csv", 
          row.names = FALSE)
write.csv(tree_growth_2, "01_Data/tree_growth_new.csv", row.names = FALSE) # argument names (here 'x = ' and 'file = ') can be omitted


# Load and save data as an R-object --------

# R objects can be useful if you need to save large datasets efficiently, 
# however, these objects are only readable by R

# save as R-object (RDS, readable by R)
saveRDS(object = tree_growth_2, file = "01_Data/tree_growth_2.rds")
# load R-objects
readRDS(file = "01_Data/tree_growth_2.rds")


