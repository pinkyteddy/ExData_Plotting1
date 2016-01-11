#######Draw Plot 2
##1. Load data from file
data1 <- read.csv("household_power_consumption.txt", sep =";", header = T, na.strings = "?", nrows =2075259, check.names = F, stringsAsFactors = F, comment.char = "", quote='\"')
##2. Convert column date
data1$Date <- as.Date(data1$Date, format ="%d/%m/%Y")
##3. Get subset data 
myData <- subset(data1, subset= (Date >= "2007-02-01"  & Date <= "2007-02-02"))
##4.Remove old data  
rm(data1)
##5. Convert dates
myDateTime <- paste(as.Date(myData$Date), myData$Time)
myData$Datetime <- as.POSIXct(myDateTime)

##6. Draw plot 2
plot(myData$Datetime,myData$Global_active_power, type="l", xlab= "", ylab = "Global Active Power (killowatss)")

##7. Copy to file
dev.copy(png, file = "plot2.png")
dev.off()
#7. Remove  myData, myDateTime in environment
rm(myData)
rm(myDateTime)

