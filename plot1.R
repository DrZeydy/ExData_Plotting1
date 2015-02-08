plot1 <- function (){

	## Execute in directory where data file resides
		fileName <- "./household_power_consumption.txt"
	## Read the file, coerce all columns to character
		housePower <- fread(fileName, colClasses="character")

	## Subset data to only data points for 1/2/2007 and 2/2/2007
	## Note that these correspond to 2007-02-01 and 2007-02-02
		housePowerData <- subset(housePower, Date == '1/2/2007'|Date == '2/2/2007')

	## Convert Global_active_power to numeric
		housePowerData$Global_active_power <- as.numeric(housePowerData$Global_active_power)

	## Plot 1
	## Histogram of housePowerData$Global_active_power
	## Color: orangered
	## x label: Global Active Power (kilowatts)
	## title: Global Active Power
	## Save it to a PNG file with a width of 480 pixels and a height of 480 pixels
		png(file = "plot1.png")

		p.color <- "orangered"
		p.xlab <- "Global Active Power (kilowatts)"
		p.title <- "Global Active Power"
		hist(housePowerData$Global_active_power, col=p.color, main=p.title, xlab=p.xlab)

		dev.off()
}
