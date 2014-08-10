data <- read.csv("household_power_consumption.txt", sep=";")
colnames(data)[3] <- "gap"

data$Date <- as.Date(as.character(data$Date), format="%d/%m/%Y")
data$gap <- as.numeric(as.character(data$gap))


d <- data[data$Date == as.Date("01/02/2007", format="%d/%m/%Y") | data$Date == as.Date("02/02/2007", format="%d/%m/%Y"), ]


hist(d$gap, col="Red", xlab ="Global Active Power (kilowatts)", main="Global Active Power")
png(filename = "plot1.png", width = 480, height = 480, units = "px", bg = "white")
dev.off()
