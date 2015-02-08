plot2 <- function (){

	## Execute in directory where data file resides
		fileName <- "./household_power_consumption.txt"
	## Read the file, coerce all columns to character
		housePower <- fread(fileName, colClasses="character")

	## Subset data to only data points for 1/2/2007 and 2/2/2007
	## Note that these correspond to 2007-02-01 and 2007-02-02
		housePowerData <- subset(housePower, Date == '1/2/2007'|Date == '2/2/2007')

	## Convert Global_active_power to numeric
		housePowerData$Global_active_power <- as.numeric(housePowerData$Global_active_power)

	## Convert Data and Time into POSIXlt time
		x <- paste(housePowerData$Date, housePowerData$Time)
		housePowerTime <- strptime(x, "%d/%m/%Y %H:%M:%S")

	## Plot 2
	## Line plot housePowerData$Global_active_power over time
	## x label: (none)
	## y label: Global Active Power (kilowatts)
	## Save it to a PNG file with a width of 480 pixels and a height of 480 pixels
		png(file = "plot2.png")

		p.xlab <- ""
		p.ylab <- "Global Active Power (kilowatts)"
		plot(housePowerTime, housePowerData$Global_active_power, type="l", xlab=p.xlab, ylab=p.ylab)

		dev.off()
}
