
# -----------------------------------------------------------------------------
# Title: R Script Template

# Description: This is an example of how a sturctured R script may look like

# Author: Simon Knüsel

# Date: 2019-10-01
# -----------------------------------------------------------------------------


# Prepare workspace --------------------

# Set working directory
#setwd("/Users/Desktop/R_Basic_Introduction/")

# Load all required packages
library(dplyr)


# Load data --------------------
tree_growth <- read.csv("01_Data/tree_growth_data.csv")

# Get an overview of data
head(tree_growth)
str(tree_growth)


# Clean data --------------------

# Do not forget to comment your code
tree_growth_clean <- tree_growth %>% 
  mutate(value = ifelse(value == -99999, NA, value)) %>% 
  # Do not forget to break long code into multiple lines
  mutate(ts = as.POSIXct(as.character(ts), format = "%Y-%m-%d %H:%M:%S", 
                         tz = "UTC")) %>% 
  filter(ts <= "2019-06-01 15:00:00")


# Plot data --------------------
plot(data = tree_growth_clean, value ~ ts, type = "l", col = "red")


# Save data --------------------
write.csv(x = tree_growth_clean, file = "01_Data/tree_growth_clean.csv")


