library("dplyr")
library("stringr")
library("lubridate")

# Read data and filter with required dates
data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE )
dataToUse<- data[data$Date=="1/2/2007" |data$Date=="2/2/2007", c(1,2,7:9)]
datetime <- strptime(paste(dataToUse$Date,dataToUse$Time), "%d/%m/%Y %H:%M:%S")
dataToUse<-cbind(datetime,dataToUse)

# Generate plot-3
with(dataToUse,plot(dataToUse$datetime,dataToUse$Sub_metering_1, xlab= "", ylab ="Energy sub metering", type = "n"))

with(subset(dataToUse,), lines(dataToUse$datetime,dataToUse$Sub_metering_1 ,col = "black"))
with(subset(dataToUse,), lines(dataToUse$datetime,dataToUse$Sub_metering_2 ,col = "red"))
with(subset(dataToUse,), lines(dataToUse$datetime,dataToUse$Sub_metering_3 ,col = "blue"))
legend("topright",pch=, col= c("black","red", "blue"), cex=0.6,legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1))

## Copy plot-3 to a PNG file
dev.copy(png, file = "plot3.png", height=480, width=480) 
dev.off()


