#reading selected rows
data <- read.table("household_power_consumption.txt", nrows = 3000, sep = ";",skip = 66635)
# reading names of the columns
d1 <- read.table("household_power_consumption.txt", nrows = 1, sep = ";", colClasses = "character")
names(data) <- d1
#filtering data by selected dates
d2<- c( "1/2/2007","2/2/2007") 
data <- data[data$Date %in% d2,]

#adding dattime column which is  combination of date and time
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, format = "%d/%m/%Y %H:%M:%S")

#plotting required graph
png(file = "plot2.png", width = 480, height = 480, units = "px")
with(data, plot(DateTime, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.off()