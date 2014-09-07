#################################################
# Author: 	Kannan Subbiah
# Date:   	09/02/2014
# Project: 	Plot4
# Description:	Plot 
#		1.	Global Active PowerEnergy Sub Metering Line Graph
#		2.	Voltage
#		3.	Energy Sub Metering
#		4.	Global Reactive Power Line Graphs in 2 rows, 2 cols
#		for days Thursday, Friday and Saturday
#		Store it in plot4.png
#################################################
# Read the file by skipping and reading only dates 2/1/2007 to 2/2/2007.
power <- read.table(file="household_power_consumption2.txt", sep = ";", header=TRUE, na.strings = "?", skip = 66636, nrows=2880)
colnames(power) = c("Date", "Time", "Global_active_power","Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1","Sub_metering_2","Sub_metering_3")
# Convert date field to proper date using as.Date

power$Date <- as.Date(power$Date, "%d/%m/%Y")
# Convert Date and Time to a new column called DateTime for charting purpose.

power$DateTime <- strptime(paste(power$Date, power$Time),"%Y-%m-%d %H:%M:%S")

# Open plot4.png to write the plot information
png("plot4.png", width = 480, height = 480, units = "px", bg = "white")

# Define 2 rows and 2 columns for plotting 4 charts.
par(mfrow = c(2,2))

# Plot the first Chart
plot(power$DateTime, power$Global_active_power, type="l", xlab="",ylab="Global Active Power")

# Plot the second Chart
plot(power$DateTime, power$Voltage, type="l", xlab ="datetime", ylab="Voltage")

# Plot the second Chart
# Plot the chart but not the data.
plot(power$DateTime, power$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")

# Add the points for submeeting1, 2 and 3 with different colors and finally add the legend.
points(power$DateTime, power$Sub_metering_1, type="l", col="black")
points(power$DateTime, power$Sub_metering_2, type="l", col = "red")
points(power$DateTime, power$Sub_metering_3, type="l", col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1, col=c("black","red","blue"))

# Plot the 4th Chart
plot(power$DateTime, power$Global_reactive_power, type="l", xlab ="datetime", ylab="Global_reactive_power")

# Close the png file
dev.off()

