
# -----------------------------------------------------------------------------
# Title: Load and save data

# Description: This script introduces the steps that are necessary to load
#  data into R and save data from R.
#  1) Set working directory
#  2) Load data
#  3) Save data

# Author: Simon Knüsel

# Date: 2020-03-26
# -----------------------------------------------------------------------------


# 1) Set working directory --------------------
## See also video tutorial in the '02_Slides_tutorials' folder

# set working directory to the folder '01_Data' in the course folder 'R_Basic_Introduction'
setwd("path_to_your_working_directory") # replace with your working directory
getwd() # get the current working directory


# 2) Load data (load a csv-File) --------------------

# load file tree_growth_data.csv and assign it to tree_growth
tree_growth <- read.csv(file = "tree_growth_data.csv")
head(tree_growth) # see first six lines of dataset

# load file tree_growth_data_2.csv and assign it to tree_growth_2
tree_growth_2 <- read.csv(file = "tree_growth_data_2.csv", 
                          sep = ";") # use "sep = " to change separtor from comma (,) to semicolon (;)
head(tree_growth_2)


# 3) Save data (save as a csv-File) --------------------

# save as .csv (do not forget the file extension .csv in the file name!)
write.csv(x = tree_growth, file = "tree_growth_new.csv", 
          row.names = FALSE)

