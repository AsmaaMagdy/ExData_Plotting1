library("dplyr")
library("stringr")
library("lubridate")

# Read data and filter with required dates
data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE )
dataToUse<- data[data$Date=="1/2/2007" |data$Date=="2/2/2007", c(1:3)]
datetime <- strptime(paste(dataToUse$Date,dataToUse$Time), "%d/%m/%Y %H:%M:%S")
dataToUse<-cbind(datetime,dataToUse)

# Generate plot-2
#axis(1,  at=1:3, labels=unique(wday(as.Date(dataToUse$datetime)), label = TRUE))
plot( dataToUse$datetime,dataToUse$Global_active_power, type = "l",xlab= "", ylab ="Global Active Power(kilowatts)" )

## Copy plot-2 to a PNG file
dev.copy(png, file = "plot2.png", height=480, width=480) 
dev.off()



