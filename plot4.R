library("dplyr")
library("stringr")
library("lubridate")

# Read data and filter with required dates
data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE )
dataToUse<- data[data$Date=="1/2/2007" |data$Date=="2/2/2007", c(1:9)]
datetime <- strptime(paste(dataToUse$Date,dataToUse$Time), "%d/%m/%Y %H:%M:%S")
dataToUse<-cbind(datetime,dataToUse)

# change parameters to plot 4 plots
par(mfrow=c(2,2), mar=c(4,4,2,1))
with(dataToUse,{
        plot( dataToUse$datetime,dataToUse$Global_active_power, type = "l",xlab= "", ylab ="Global Active Power" )  
        plot( dataToUse$datetime,dataToUse$Voltage, type = "l",xlab= "datetime", ylab ="Voltage" )
        with(dataToUse,plot(dataToUse$datetime,dataToUse$Sub_metering_1, xlab= "", ylab ="Energy sub metering", type = "n"))
        
        with(subset(dataToUse,), lines(dataToUse$datetime,dataToUse$Sub_metering_1 ,col = "black"))
        with(subset(dataToUse,), lines(dataToUse$datetime,dataToUse$Sub_metering_2 ,col = "red"))
        with(subset(dataToUse,), lines(dataToUse$datetime,dataToUse$Sub_metering_3 ,col = "blue"))
        legend("topright",pch=, col= c("black","red", "blue"),cex=0.5, bty = "n", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1))
       plot ( dataToUse$datetime,dataToUse$Global_reactive_power, type = "l",xlab= "datetime", ylab ="Global_reactive_power" )
        
})
# Generate plot-4

## Copy plot-4 to a PNG file
dev.copy(png, file = "plot4.png", height=480, width=480) 
dev.off()
