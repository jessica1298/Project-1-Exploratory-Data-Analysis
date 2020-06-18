data <- read.table('household_power_consumption.txt', sep =";", header=T)
# PREPARACIÓN DE LA BASE --------------------------------------------------
library(lubridate)
data$Date <- as.Date(parse_date_time(data$Date,"dmy"))
data2 <- data[data$Date=='2007-02-01',]
data3 <- data[data$Date=='2007-02-02',]
data_f <- rbind(data2, data3)
# PLOT 2 ------------------------------------------------------------------
png(filename = "plot2.png", width = 480, height = 480)
data_f$Time <- strptime(data_f$Time, format="%H:%M:%S")
data_f[1:1440,"Time"] <- format(data_f[1:1440,"Time"],"2007-02-01 %H:%M:%S")
data_f[1441:2880,"Time"] <- format(data_f[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
plot(data_f$Time,as.character(data_f$Global_active_power), type = 'l',
     ylab="Global Active Power (kilowatts)", xlab="")
dev.off()