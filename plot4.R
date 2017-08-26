##plot4
#getting and cleaning data
mydata <- "household_power_consumption.txt"
dataread <-  read.table(mydata, header = T, sep =";", dec = ".")
cleandata <- dataread[dataread$Date %in% c("1/2/2007", "2/2/2007") ,]

mydate <- strptime(paste(cleandata$Date, cleandata$Time), "%d/%m/%Y  %H: %M: %S")

png("plot4.png", width = 480, height = 480)

par(mfrow = c(2,2)) ##We need 4 plots

##plot active power
Activepower <-  as.numeric(cleandata$Global_active_power)
plot(mydate, Activepower, type = "l", xlab="", ylab="Global Active Power (Kilowatts)", yaxt="n") #empty y axis
axis(2, at=c(0,1000, 2000, 3000), labels= c(0,2,4,6)) #rename y axis

#plot voltage
Voltage <-  as.numeric((cleandata$Voltage))
plot(mydate, Voltage, type = "l", xlab = "datetime", yaxt= "n")
axis(2, at=c(800, 1200, 1600, 2000), labels = c(234, 238, 242 ,246))

#Plot submeter
submeter1 <-  as.numeric(cleandata$Sub_metering_1)
submeter2 <-  as.numeric(cleandata$Sub_metering_2)
submeter3 <-  as.numeric(cleandata$Sub_metering_3)
plot(mydate, submeter1, type = "l", xlab = "", ylab = "Energy sub metering") ## init graph with one value
lines(mydate, submeter2, type = "l", col="red") ## add values on graph
lines(mydate, submeter3, type = "l", col="blue") ## add values on graph

legend("topright", lty = 1 , col = c("black", "red" ,"blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = "n") 



#plot global reactive
Reactivepower <-  as.numeric(cleandata$Global_reactive_power)
plot(mydate, Reactivepower, type = "l", xlab="datetime", ylab="Global Reactive Power (Kilowatts)", yaxt = "n")
axis(2, at=c(0,50, 100, 150, 200, 250), labels= c(0.0, 0.1,0.2,0.3,0.4,0.5)) #rename y axis
dev.off()

