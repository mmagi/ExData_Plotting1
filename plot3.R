Sys.setlocale("LC_TIME", "English")
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
png(filename = "plot3.png", width = 480, height = 480, units = "px")
plot(data$Date, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(data$Date, data$Sub_metering_2, type="l", col="red")
lines(data$Date, data$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, lwd=1, col=c("black","blue","red"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()