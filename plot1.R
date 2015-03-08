#######################
## This script constructs Plot 1
##

# Read all the file
data_all <- read.table("../data/household_power_consumption.txt", header = TRUE, 
                        sep = ";", na.strings = "?", check.names = FALSE, 
                        colClasses = c("character", "character", "numeric", 
                                       "numeric", "numeric", "numeric", 
                                       "numeric", "numeric", "numeric"), 
                        stringsAsFactors = FALSE, comment.char = "", 
                        quote = "\"")

# Fist: subset data to speed up all other operations
# We are interested in only two days so we can select them based on srting
# representations combined with OR operation. Othervise we will have to 
# use <= & => to specify date period
data <- subset(data_all, subset =(Date == "1/2/2007" | Date == "2/2/2007"))

# Clear some memory
rm(data_all)

# Create new column with date and time comverted to R format
data$Date_Time = strptime(paste(data$Date, data$Time),"%d/%m/%Y %H:%M:%S")

# Open PNG device to write to plot1.png
png("plot1.png", height = 480, width = 480)

# Construct new histogram
hist(data$Global_active_power, col='red', xlab = 'Global Active Power (kilowatts)', main = 'Global Active Power')

# Close device
dev.off()