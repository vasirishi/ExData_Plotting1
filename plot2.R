#################################################
# Author: 	Kannan Subbiah
# Date:   	10/10/2014
# Project: 	Plot2
# Description:	Plot the Global Active Power Line Graph
#		for days Thursday, Friday and Saturday
#		Store it in plot2.png
#################################################
# Read the file by skipping and reading only dates 2/1/2007 to 2/2/2007.
power <- read.table(file="household_power_consumption2.txt", sep = ";", header=TRUE, na.strings = "?", skip = 66636, nrows=2880)
colnames(power) = c("Date", "Time", "Global_active_power","Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1","Sub_metering_2","Sub_metering_3")
# Convert date field to proper date using as.Date

power$Date <- as.Date(power$Date, "%d/%m/%Y")
# Convert Date and Time to a new column called DateTime for charting purpose.


power$DateTime <- strptime(paste(power$Date, power$Time),"%Y-%m-%d %H:%M:%S")
# Open plot2.png to write the plot information

png("plot2.png", width = 480, height = 480, units = "px", bg = "white")
plot(power$DateTime, power$Global_active_power, type="l", xlab = "", ylab="Global Active Power(kilowatts)")
dev.off()
