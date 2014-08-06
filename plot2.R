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

##Plot 2

##saving to a png file with 480px x 480px size
png(filename = "plot2.png", width = 480, height = 480)

plot(sub_df$DateTime, sub_df$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power (kilowatts)")

dev.off()