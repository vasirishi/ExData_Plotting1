#################################################
# Author: 	Kannan Subbiah
# Date:   	10/10/2014
# Project: 	Plot3
# Description:	Plot the Energy Sub Metering Line Graph
#		for days Thursday, Friday and Saturday
#		Store it in plot3.png
#################################################
# Read the file by skipping and reading only dates 2/1/2007 to 2/2/2007.

power <- read.table(file="household_power_consumption2.txt", sep = ";", header=TRUE, na.strings = "?", skip = 66636, nrows=2880)
colnames(power) = c("Date", "Time", "Global_active_power","Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1","Sub_metering_2","Sub_metering_3")
# Convert date field to proper date using as.Date
power$Date <- as.Date(power$Date, "%d/%m/%Y")
# Add a new column called DateTime and store Date/time together for charting purpose.

power$DateTime <- strptime(paste(power$Date, power$Time),"%Y-%m-%d %H:%M:%S")

# Open a plot3.png to write the chart on to it.
png("plot3.png", width = 480, height = 480, units = "px", bg = "white")

# Plot the chart but not the data.
plot(power$DateTime, power$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")

# Add the points for submeeting1, 2 and 3 with different colors and finally add the legend.
points(power$DateTime, power$Sub_metering_1, type="l", col="black")
points(power$DateTime, power$Sub_metering_2, type="l", col = "red")
points(power$DateTime, power$Sub_metering_3, type="l", col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1, col=c("black","red","blue"))
# Close the png file.
dev.off()
