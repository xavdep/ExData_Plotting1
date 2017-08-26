##Plot 1

#getting and cleaning data
mydata <- "household_power_consumption.txt"
dataread <-  read.table(mydata, header = T, sep =";", dec = ".")

cleandata <- dataread[dataread$Date %in% c("1/2/2007", "2/2/2007") ,]

Activepower <-  as.numeric(cleandata$Global_active_power)

png("plot1.png", width = 480, height = 480)
hist(Activepower, col="red", main = "Global Active Power", xlab = "Global Active Power(kilowatts)" )
dev.off()

