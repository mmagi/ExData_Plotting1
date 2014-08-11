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
png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(data$Date, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()