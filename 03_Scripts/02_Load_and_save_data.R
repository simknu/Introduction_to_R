
# -----------------------------------------------------------------------------
# Title: Load and save data

# Description: This script introduces the steps that are necessary to load
#  data into R and save data from R.
#  1) Set working directory
#  2) Load data
#  3) Save data

# Author: Simon Knüsel

# Date: 2019-09-30
# -----------------------------------------------------------------------------


# 1) Set working directory --------------------
## See also documentation in the 02_Slides folder

setwd("path_to_your_working_directory") # replace with your working directory
getwd() # get the current working directory


# 2) Load data (load a csv-File) --------------------

# load file tree_growth_data.csv and assign it to tree_growth
tree_growth <- read.csv(file = "01_Data/tree_growth_data.csv")

# load file tree_growth_data_2.csv and assign it to tree_growth_2
tree_growth_2 <- read.csv(file = "01_Data/tree_growth_data_2.csv", 
                          sep = ";") # use "sep = " to change separtor from comma (,) to semicolon (;)


# 3) Save data (save as a csv-File) --------------------

# save as .csv (do not forget the file extension .csv in the file name!)
write.csv(x = tree_growth_2, file = "01_Data/tree_growth_new.csv", 
          row.names = FALSE)

