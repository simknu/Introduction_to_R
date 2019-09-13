
# Why use R? ------------------------------------------------------------------

# read data
data_L1 <- read.csv("01_Data/data_L1.csv")

# replace -99999 with NA
data_L1$value[data_L1$value == -99999] <- NA

# delete data in specified region
data_L1$ts <- as.POSIXct(data_L1$ts, format = "%d.%m.%y %H:%M", tz = "UTC")
data_L1$value[data_L1$ts >= "2019-06-01 14:50:00" & 
                data_L1$ts <= "2019-06-01 17:00:00"] <- NA

# plot
plot(data = data_L1, value ~ ts, type = "l")
