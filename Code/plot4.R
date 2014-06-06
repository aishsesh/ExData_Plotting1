#reading selected rows
data <- read.table("household_power_consumption.txt", nrows = 3000, sep = ";",skip = 66635)
# reading names of the columns
d1 <- read.table("household_power_consumption.txt", nrows = 1, sep = ";", colClasses = "character")
names(data) <- d1
#filtering data by selected dates
d2<- c( "1/2/2007","2/2/2007") 
data <- data[data$Date %in% d2,]

#adding dattime column which is  combination of date and time
data$datetime <- paste(data$Date, data$Time)
data$datetime <- strptime(data$datetime, format = "%d/%m/%Y %H:%M:%S")

#plotting required graphs
png(file = "plot4.png", width = 480, height = 480, units = "px")

#partitioning into 2X2 
par(mfrow = c(2,2))

#part 1
with(data, plot(datetime, Global_active_power, type = "l", ylab = "Global Active Power", xlab = ""))

#part 2
with(data, plot(datetime, Voltage, type = "l"))

#part 3
with(data,list(
  plot(datetime, Sub_metering_1, type="l", ylab = "Energy sub metering", xlab = ""),
  lines(datetime, Sub_metering_2, col="red"),
  lines(datetime, Sub_metering_3, col = "blue")
))
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = "n", lty = c(1,1,1), col =c("black","red","blue"))

#part 4
with(data, plot(datetime, Global_reactive_power, type = "l"))

dev.off()