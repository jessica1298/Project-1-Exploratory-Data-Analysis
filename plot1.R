
data <- read.table('household_power_consumption.txt', sep =";", header=T)
# PREPARACIÓN DE LA BASE --------------------------------------------------
library(lubridate)
data$Date <- as.Date(parse_date_time(data$Date,"dmy"))
data2 <- data[data$Date=='2007-02-01',]
data3 <- data[data$Date=='2007-02-02',]
data_f <- rbind(data2, data3)
# PLOT 1 ------------------------------------------------------------------
png(filename = "plot1.png", width = 480, height = 480)
hist(as.numeric(as.character(data_f$Global_active_power)),col="red",main="Global Active Power"
     ,xlab="Global Active Power(kilowatts)")
dev.off()

