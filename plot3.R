#######################
## This script constructs Plot 3
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

# Open PNG device to write to plot3.png
png("plot3.png", height = 480, width = 480)

# Construct new plot
plot(data$Date_Time, data$Sub_metering_1, pch=NA, xlab="", 
     ylab="Energy sub metering")
lines(data$Date_Time, data$Sub_metering_1)
lines(data$Date_Time, data$Sub_metering_2, col='red')
lines(data$Date_Time, data$Sub_metering_3, col='blue')
legend('topright', 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1), 
       col = c('black', 'red', 'blue'))

# Close device
dev.off()