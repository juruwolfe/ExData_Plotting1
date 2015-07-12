plot3 <- function(){
	## Get data
	house <- read.csv("household_power_consumption.txt", sep=';')
	
	## Subset the data
	house <- subset(house, house$Date %in% "1/2/2007" | house$Date %in% "2/2/2007")
	
	## Convert GAP to numeric
	house$Sub_metering_1 <- as.character(house$Sub_metering_1)
    house$Sub_metering_1 <- as.numeric(house$Sub_metering_1)
    
    house$Sub_metering_2 <- as.character(house$Sub_metering_2)
    house$Sub_metering_2 <- as.numeric(house$Sub_metering_2)
    
    house$Sub_metering_3 <- as.character(house$Sub_metering_3)
    house$Sub_metering_3 <- as.numeric(house$Sub_metering_3)

	
	## Draw the lines
	plot(house$Sub_metering_1, ylab= "Energy sub metering", type='l', xaxt = "n")
    lines(house$Sub_metering_2, col="red")
    lines(house$Sub_metering_3, col="blue")
	
	## Label the x 
	axis(1, at=2800, labels="Sat")
    axis(1, at=1250, labels="Fri")
    axis(1, at=10, labels="Thu")
    
    ## Add the legend
    legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1), lwd=c(2.5,2.5), col=c("black","blue","red"))
	
	## Make the png
	dev.copy(png, file = "plot3.png") 
	dev.off()
}