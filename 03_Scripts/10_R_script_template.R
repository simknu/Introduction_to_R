
# -----------------------------------------------------------------------------
# Title: R Script Template

# Description: This is an example of how a sturctured R script may look like

# Author: Simon Knüsel

# Date: 2020-03-26
# -----------------------------------------------------------------------------


# Prepare workspace --------------------

# Set working directory
setwd("/Users/Desktop/R_Basic_Introduction/") # replace with your working directory

# Load all required packages
library(dplyr)


# Load data --------------------
temp <- read.csv("01_Data/temperature.csv")

# Get an overview of data
head(temp)
str(temp)


# Manipulate data --------------------

# Do not forget to comment your code
temp$year <- 2019
temp_bern <- subset(temp, site == "Bern")

# Do not forget to break long code into multiple lines
temp_bern$date <- as.Date(paste(temp_bern$year, temp_bern$month, 
                                temp_bern$day, sep = "-"))


# Plot data --------------------
plot(data = temp_bern, temp ~ date, type = "l", col = "red", 
     xlab = "", ylab = "Temperature (°C)", main = "Temperature in Bern",
     las = 1)


# Save data --------------------
write.csv(x = temp_bern, file = "01_Data/temperature_bern.csv")

