data <- read.table(unz("exdata_data_household_power_consumption.zip","household_power_consumption.txt"), header = TRUE, sep = ";")
data$Date_time <- strptime(paste(data$Date,data$Time), format = "%d/%m/%Y %H:%M:%S")
data_selected <- subset(data, (Date_time$year == 107)&(Date_time$mon == 1)&((Date_time$mday == 1)|(Date_time$mday == 2)))
png("plot1.png")
hist(as.numeric(as.character(data_selected$Global_active_power)), xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red", main = "Global Active Power")
dev.off()