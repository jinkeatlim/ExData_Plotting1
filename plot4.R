##this script assumes you are in the same working directory as the 
##raw data file "household_power_consumption.txt"

##reading the data
test_df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                      na.strings = "?",
                      colClasses = c("factor", "factor", rep("numeric",7)))

##formatting date and then subsetting, then formatting time
test_df$Date <- as.Date(test_df$Date, format = "%d/%m/%Y")
sub_df <- subset(test_df, Date=="2007-02-01" | Date=="2007-02-02")
sub_df$DateTime <- strptime(paste(sub_df$Date, sub_df$Time), "%Y-%m-%d %H:%M:%S")

##Plot 4

##saving to a png file with 480px x 480px size
png(filename = "plot4.png", width = 480, height = 480)

par(mfcol=c(2,2))
par(mar=c(5,4,1,1))

##subplot 1
plot(sub_df$DateTime, sub_df$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power")

##subplot 2
plot(sub_df$DateTime, sub_df$Sub_metering_1, col = "black", type = "l",
     xlab="", ylab="Energy sub metering")
points(sub_df$DateTime, sub_df$Sub_metering_2, col = "red", type = "l")
points(sub_df$DateTime, sub_df$Sub_metering_3, col = "blue", type = "l")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = c(1,1,1), bty = "n")

##subplot 3
plot(sub_df$DateTime, sub_df$Voltage, type="l", 
     xlab="datetime", ylab="Voltage")

##subplot 4
plot(sub_df$DateTime, sub_df$Global_reactive_power, type="l", 
     xlab="datetime", ylab="Global_reactive_power")


dev.off()