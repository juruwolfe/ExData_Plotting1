plot1 <- function(){
	## Get data
	house <- read.csv("household_power_consumption.txt", sep=';')
	
	## Subset the data
	house <- subset(house, house$Date %in% "1/2/2007" | house$Date %in% "2/2/2007")
	
	## Convert GAP to numeric
	house$Global_active_power <- as.character(house$Global_active_power)
	house$Global_active_power <- as.numeric(house$Global_active_power)
	
	## Draw the hist
	hist(house$Global_active_power, col="red", xlab="Globe Active Power (kilowatts)", main="Global Active Power")
	
	## Make the png
	dev.copy(png, file = "plot1.png") 
	dev.off()
}