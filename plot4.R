data <- read.table('household_power_consumption.txt', sep =";", header=T)
# PREPARACIÓN DE LA BASE --------------------------------------------------
library(lubridate)
data$Date <- as.Date(parse_date_time(data$Date,"dmy"))
data2 <- data[data$Date=='2007-02-01',]
data3 <- data[data$Date=='2007-02-02',]
data_f <- rbind(data2, data3)
data3 <- data_f$Time <- strptime(data_f$Time, format="%H:%M:%S")
data_f[1:1440,"Time"] <- format(data_f[1:1440,"Time"],"2007-02-01 %H:%M:%S")
data_f[1441:2880,"Time"] <- format(data_f[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
# PLOT 4 ------------------------------------------------------------------
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
plot(data_f$Time,as.character(data_f$Global_active_power), type = 'l',
     ylab="Global Active Power (kilowatts)", xlab="")

plot(data_f$Time,as.character(data_f$Voltage), type = 'l',
     ylab="voltage", xlab="")

plot(data_f$Time,as.character(data_f$Sub_metering_1), type = 'l',
     ylab="Global Active Power (kilowatts)", xlab="")
lines(data_f$Time,as.character(data_f$Sub_metering_2), col="red")
lines(data_f$Time,as.character(data_f$Sub_metering_3), col="blue")
legend("topright",legend = c('sub_metering_1','sub_metering_2','sub_metering_1'),
       col=c("black","red","blue"), pch="_", cex=0.3)

plot(data_f$Time,as.character(data_f$Global_reactive_power), type = 'l',
     ylab="voltage", xlab="")
dev.off()
