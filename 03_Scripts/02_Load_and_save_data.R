
# Load and save data ----------------------------------------------------------

# Set working directory ----------

# Path to the current working directory
# Help for Windows see: https://www.dummies.com/computers/operating-systems/windows-xp-vista/how-to-find-a-folders-path-name-in-windows-explorer/
# Help for Mac see: https://apple.stackexchange.com/questions/317992/is-there-any-way-to-get-the-path-of-a-folder-in-macos
setwd("path_to_your_working_directory") # replace with your working directory
getwd()

# -> see also the slide 'Set working directory' in the slides for the course
# (in the '02_Slides' folder)


# Load data (load .csv-File) ----------

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


# Save data ----------

# save as .csv (readable by Excel)
write.csv(x = tree_growth_2, file = "01_Data/tree_growth_new.csv", 
          row.names = FALSE)
write.csv(tree_growth_2, "01_Data/tree_growth_new.csv", row.names = FALSE) # argument names (here 'x = ' and 'file = ') can be omitted


# Load and save data as an R-object ----------

# R objects can be useful if you need to save large datasets efficiently, 
# however, these objects are only readable by R

# save as R-object (RDS, readable by R)
saveRDS(object = tree_growth_2, file = "01_Data/tree_growth_2.rds")
# load R-objects
readRDS(file = "01_Data/tree_growth_2.rds")


