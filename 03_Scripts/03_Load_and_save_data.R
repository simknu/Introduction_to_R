
# Load and save data ----------------------------------------------------------

# Set working directory ----------

# Path to the current working directory
# Help for Windows see: https://www.dummies.com/computers/operating-systems/windows-xp-vista/how-to-find-a-folders-path-name-in-windows-explorer/
# Help for Mac see: https://apple.stackexchange.com/questions/317992/is-there-any-way-to-get-the-path-of-a-folder-in-macos
setwd("path_to_your_working_directory") # replace with your working directory
getwd()

# Remove all objects
#rm(list = ls())



# Load data (load .csv-File) ----------
?read.csv

# Load file airquality.csv
read.csv(file = "01_Data/airquality.csv")
# Save to an object
air_quality <- read.csv(file = "01_Data/airquality.csv")

# Load file airquality2.csv
air_quality2 <- read.csv(file = "01_Data/airquality2.csv")
View(air_quality2)
# Change separator from "," to ";"
air_quality2 <- read.csv(file = "01_Data/airquality2.csv", sep = ";")



# Edit data ----------
# See file '04_Data_manipulation.R' for more information on editing and 
# transforming data

# Add the year of the measurements
?airquality
air_quality$year <- 1973
View(air_quality)



# Save data ----------

# Save as .csv
write.csv(x = air_quality, file = "01_Data/airquality_new.csv", 
          row.names = FALSE)
write.csv(air_quality, "01_Data/airquality_new.csv", row.names = FALSE) # argument names (here 'x = ' and 'file = ') can be omitted



# Load and save data as an R-object ----------

# Save as R-object (RDS)
saveRDS(object = air_quality, file = "01_Data/airquality.rds")
# Load R-objects
readRDS(file = "01_Data/airquality.rds")


