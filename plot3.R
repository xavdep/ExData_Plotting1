##plot 3
#getting and cleaning data
library(lattice)
mydata <- "household_power_consumption.txt"
dataread <-  read.table(mydata, header = T, sep =";", dec = ".")

cleandata <- dataread[dataread$Date %in% c("1/2/2007", "2/2/2007") ,]

submeter1 <-  as.numeric(cleandata$Sub_metering_1)
submeter2 <-  as.numeric(cleandata$Sub_metering_2)
submeter3 <-  as.numeric(cleandata$Sub_metering_3)

mydate <- strptime(paste(cleandata$Date, cleandata$Time), "%d/%m/%Y  %H: %M: %S")

png("plot3.png", width = 480, height = 480)
plot(mydate, submeter1, type = "l", xlab = "", ylab = "Energy sub metering") ## init graph with one value
lines(mydate, submeter2, type = "l", col="red") ## add values on graph
lines(mydate, submeter3, type = "l", col="blue") ## add values on graph
legend("topright", lty=1, col = c("black", "red" ,"blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = "o") 

dev.off()

