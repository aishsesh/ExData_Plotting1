#reading selected rows
data <- read.table("household_power_consumption.txt", nrows = 3000, sep = ";",skip = 66635)
# reading names of the columns
d1 <- read.table("household_power_consumption.txt", nrows = 1, sep = ";", colClasses = "character")
names(data) <- d1
#filtering data by selected dates
d2<- c( "1/2/2007","2/2/2007") 
data <- data[data$Date %in% d2,]

#plotting required graph
png(file = "plot1.png", width = 480, height = 480, units = "px")
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
