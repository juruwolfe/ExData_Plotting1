plot2 <- function(){
	## Get data
	house <- read.csv("household_power_consumption.txt", sep=';')
	
	## Subset the data
	house <- subset(house, house$Date %in% "1/2/2007" | house$Date %in% "2/2/2007")
	
	## Convert GAP to numeric
	house$Global_active_power <- as.character(house$Global_active_power)
	house$Global_active_power <- as.numeric(house$Global_active_power)
	
	## Draw the line
	plot(house$Global_active_power, ylab= "Global Active Power (kilowatts)", type='l', xaxt = "n")
	
	## Label the x 
	axis(1, at=2800, labels="Sat")
    axis(1, at=1250, labels="Fri")
    axis(1, at=10, labels="Thu")
	
	## Make the png
	dev.copy(png, file = "plot2.png") 
	dev.off()
}