setwd("C:/Users/fernando_rodriguez/Desktop/fernando/courses/exploratory")

## Loading the data
wholedata <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
wholedata$Date <- as.Date(wholedata$Date, format="%d/%m/%Y")
data <- subset(wholedata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(wholedata)
## Converting the Date and Time in variables
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
## Making Plots
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
