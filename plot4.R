plot4 <- function (){

	## Execute in directory where data file resides
		fileName <- "./household_power_consumption.txt"
	## Read the file, coerce all columns to character
		housePower <- fread(fileName, colClasses="character")

	## Subset data to only data points for 1/2/2007 and 2/2/2007
	## Note that these correspond to 2007-02-01 and 2007-02-02
		housePowerData <- subset(housePower, Date == '1/2/2007'|Date == '2/2/2007')

	## Convert Global_active_power to numeric
		housePowerData$Global_active_power <- as.numeric(housePowerData$Global_active_power)
	## Convert Global_reactive_power to numeric
		housePowerData$Global_reactive_power <- as.numeric(housePowerData$Global_reactive_power)
	## Convert Voltage to numeric
		housePowerData$Voltage <- as.numeric(housePowerData$Voltage)
	## Convert Sub_metering_1 to numeric
		housePowerData$Sub_metering_1 <- as.numeric(housePowerData$Sub_metering_1)
	## Convert Sub_metering_2 to numeric
		housePowerData$Sub_metering_2 <- as.numeric(housePowerData$Sub_metering_2)
	## Convert Sub_metering_3 to numeric
		housePowerData$Sub_metering_3 <- as.numeric(housePowerData$Sub_metering_3)

	## Convert Data and Time into POSIXlt time
		x <- paste(housePowerData$Date, housePowerData$Time)
		housePowerTime <- strptime(x, "%d/%m/%Y %H:%M:%S")

	## Plot 4
	## Save it to a PNG file with a width of 480 pixels and a height of 480 pixels
		png(file = "plot4.png")

	## Make 2 rows and 2 columns of plots
		par(mfrow=c(2,2))

	## Top Left plot
	## Line plot housePowerData$Global_active_power over time
	## x label: (none)
	## y label: Global Active Power
		p.xlab <- ""
		p.ylab <- "Global Active Power"
		plot(housePowerTime, housePowerData$Global_active_power, type="l", xlab=p.xlab, ylab=p.ylab)

	## Top Right plot
	## Line plot housePowerData$Voltage over time
	## x label: datetime
	## y label: Voltage
		p.xlab <- "datetime"
		p.ylab <- "Voltage"
		plot(housePowerTime, housePowerData$Voltage, type="l", xlab=p.xlab, ylab=p.ylab)


	## Bottom Left plot
	## Line plot housePowerData$Sub_metering_* over time
	## x label: (none)
	## y label: Energy sub metering
		p.xlab <- ""
		p.ylab <- "Energy sub metering"
		p.leg <- c("Sub_metering_1", "Sub_metering_2","Sub_metering_3")
		p.col <- c("black", "red", "blue")
		plot(housePowerTime, housePowerData$Sub_metering_1, type="l", xlab=p.xlab, ylab=p.ylab)
		points(housePowerTime, housePowerData$Sub_metering_2, type="l", col="red")
		points(housePowerTime, housePowerData$Sub_metering_3, type="l", col="blue")
		legend("topright", p.leg, lty=1, col=p.col, bty="n")

	## Bottom Right plot
	## Line plot housePowerData$Global_reactive_power over time
	## x label: datetime
	## y label: Global_reactive_power
		p.xlab <- "datetime"
		p.ylab <- "Global_reactive_power"
		plot(housePowerTime, housePowerData$Global_reactive_power, type="l", xlab=p.xlab, ylab=p.ylab)

	dev.off()
}
