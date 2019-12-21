data <- read.table(unz("exdata_data_household_power_consumption.zip","household_power_consumption.txt"), header = TRUE, sep = ";")
data$Date_time <- strptime(paste(data$Date,data$Time), format = "%d/%m/%Y %H:%M:%S")
data_selected <- subset(data, (Date_time$year == 107)&(Date_time$mon == 1)&((Date_time$mday == 1)|(Date_time$mday == 2)))
png("plot4.png")
par(mfcol=c(2,2))
## topleft 
plot(data_selected$Date_time, as.numeric(as.character(data_selected$Global_active_power)), xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
## bottomleft
plot(data_selected$Date_time, as.numeric(as.character(data_selected$Sub_metering_1)), xlab = "", ylab = "Energy sub metering", type = "l")
points(data_selected$Date_time, as.numeric(as.character(data_selected$Sub_metering_2)), type = "l", col = "red")
points(data_selected$Date_time, as.numeric(as.character(data_selected$Sub_metering_3)), type = "l", col = "blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty = c(1,1,1), cex = 0.8)
## topright
plot(data_selected$Date_time, as.numeric(as.character(data_selected$Voltage)), xlab = "datetime", ylab = "Voltage", type = "l")
## bottomright
plot(data_selected$Date_time, as.numeric(as.character(data_selected$Global_reactive_power)), xlab = "datetime", ylab = "Global_reactive_power", type = "l")
dev.off()