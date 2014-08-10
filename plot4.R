if (!file.exists("cache.RData")){
  raw <- read.table("household_power_consumption.txt", 
                    header=T, sep=';', na.strings="?", 
                    colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
  subset <- raw[(raw$Date == "1/2/2007") | (raw$Date == "2/2/2007"),]
  data$Date<-strptime(paste(data$Date, data$Time),"%d/%m/%Y %H:%M:%S")
  data$Time<-NULL;
}else{
  load("cache.RData")
}
png(filename = "plot4.png", width = 480, height = 480, units = "px")
par (mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
plot(data$Date, data$Global_active_power, xlab="", ylab="Global Active Power", type="l")
plot(data$Date, data$Voltage, xlab="datetime", ylab="Voltage", type="l")

cols = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(data$Date, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(data$Date, data$Sub_metering_2, type="l", col="red")
lines(data$Date, data$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, lwd=1, col=c("black","blue","red"), legend=cols, bty="n")

plot(data$Date, data$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")        
   
dev.off()