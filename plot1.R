#################################################
# Author: 	Kannan Subbiah
# Date:   	09/02/2014
# Project: 	Plot1
# Description:	Plot the Global Active Power Bar Graph and store it in plot1.png
#################################################
# Read the file by skipping and reading only dates 2/1/2007 to 2/2/2007.

power <- read.table(file="household_power_consumption2.txt", sep = ";", header=TRUE, na.strings = "?", skip = 66636, nrows=2880)
colnames(power) = c("Date", "Time", "Global_active_power","Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1","Sub_metering_2","Sub_metering_3")

# Convert date field to proper date using as.Date
power$Date <- as.Date(power$Date, "%d/%m/%Y")

# Convert Time to proper time.

power$Time <- strptime(power$Time, format = "%H:%M:%S")

# Open plot1.png to write the plot information
png("plot1.png", width = 480, height = 480, units = "px", bg = "white")
hist(power$Global_active_power,col = "red" , main = "Global Active Power", ylab = "Frequency", xlab = "Global Active Power(kilowatts)")

# Close the plot1.png file.
dev.off()
