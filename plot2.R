data <- read.csv("household_power_consumption.txt", sep=";")
colnames(data)[3] <- "gap"

data$Date <- as.Date(as.character(data$Date), format="%d/%m/%Y")
data$gap <- as.numeric(as.character(data$gap))

d <- data[data$Date == as.Date("01/02/2007", format="%d/%m/%Y") | data$Date == as.Date("02/02/2007", format="%d/%m/%Y"), ]
d$Time <- as.character(d$Time)

# Add new column with date and time
d$xx <- as.POSIXct(paste(d$Date, d$Time), format="%Y-%m-%d %H:%M:%S")

png(filename = "plot2.png", width = 480, height = 480, units = "px", bg = "white")
plot(d$xx, d$gap, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
