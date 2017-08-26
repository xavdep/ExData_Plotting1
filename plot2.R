##Plot2

#getting and cleaning data
mydata <- "household_power_consumption.txt"
dataread <-  read.table(mydata, header = T, sep =";", dec = ".")

cleandata <- dataread[dataread$Date %in% c("1/2/2007", "2/2/2007") ,]

Activepower <-  as.numeric(cleandata$Global_active_power)

mydate <- strptime(paste(cleandata$Date, cleandata$Time), "%d/%m/%Y  %H: %M: %S")
head(mydate)

png("plot2.png", width = 480, height = 480)
plot(mydate, Activepower, type = "l", xlab="", ylab="Global Active Power (Kilowatts)", yaxt="n") #empty y axis
axis(2, at=c(0,1000, 2000, 3000), labels= c(0,2,4,6)) #rename y axis
dev.off()
