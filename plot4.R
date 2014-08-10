data <- read.csv("household_power_consumption.txt", sep=";")
colnames(data)[3] <- "gap"

data$Date <- as.Date(as.character(data$Date), format="%d/%m/%Y")
data$gap <- as.numeric(as.character(data$gap))

d <- data[data$Date == as.Date("01/02/2007", format="%d/%m/%Y") | data$Date == as.Date("02/02/2007", format="%d/%m/%Y"), ]
d$Time <- as.character(d$Time)

# Add new column with date and time
d$xx <- as.POSIXct(paste(d$Date, d$Time), format="%Y-%m-%d %H:%M:%S")
colnames(d)[7] <- "s1"
colnames(d)[8] <- "s2"
colnames(d)[9] <- "s3"

d$s1 <- as.numeric(as.character(d$s1))
d$s2 <- as.numeric(as.character(d$s2))
d$s3 <- as.numeric(as.character(d$s3))
d$Global_reactive_power <- as.numeric(as.character(d$Global_reactive_power))
d$Voltage <- as.numeric(as.character(d$Voltage))

png(filename = "plot4.png", width = 480, height = 480, units = "px", bg = "white")

par(mfrow=c(2,2))

# top left
plot(d$xx, d$gap, type = "l", xlab = "", ylab = "Global Active Power")

# top right
plot(d$xx, d$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# botton left
plot(d$xx, d$s1, type = "l", xlab='', ylab='Energy sub metering')
lines(d$xx, d$s2, col="red")
lines(d$xx, d$s3, col="blue")
legend('topright',
    legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
    col=c('black', 'red', 'blue'),
    lty='solid')

#botton right
plot(d$xx, d$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
