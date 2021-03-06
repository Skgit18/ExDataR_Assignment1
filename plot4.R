library(dplyr)
m <- read.csv(file = 'D:/household_power_consumption.csv', sep = ';', header = TRUE, check.names = TRUE)
m$Date= as.Date(m$Date, format= "%d/%m/%Y")
m$DateTime= as.POSIXct(paste(m$Date, m$Time, format= "%d/%m/%Y %H:%M:%S"))
png("plot4.png", width=480, height=480, units = "px")
par(mfrow=c(2,2))
plot(m$DateTime,m$Global_active_power,type="l",xlab=" ",ylab="Global Active Power (Kilowatt)")
plot(m$DateTime,m$Voltage,type="l",xlab="datetime",ylab="Voltage")
plot(m$DateTime,m$Sub_metering_1,xlab=" ",type="l",ylab="Energy sub metering")
lines(m$DateTime,m$Sub_metering_2,col="red")
lines(m$DateTime,m$Sub_metering_3,col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(m$DateTime,m$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()
