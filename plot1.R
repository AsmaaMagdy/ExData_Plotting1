
library("dplyr")
library("stringr")
library("lubridate")

## Read data and filter with required dates
data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE )
dataToUse<- data[data$Date=="1/2/2007" |data$Date=="2/2/2007", c(1:3)]

## Generate plot-1
hist(dataToUse$Global_active_power,  xlab ="Global Active Power(kilowatts)", col = "red", main = "Global Active Power")

## Copy plot-1 to a PNG file
dev.copy(png, file = "plot1.png", height=480, width=480) 
dev.off()
