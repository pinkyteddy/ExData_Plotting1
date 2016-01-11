#######Draw Plot 1
#1. Load data from file
data1 <- read.csv("household_power_consumption.txt", sep =";", header = T, na.strings = "?", nrows =2075259, check.names = F, stringsAsFactors = F, comment.char = "", quote='\"')
#2. Convert column date
data1$Date <- as.Date(data1$Date, format ="%d/%m/%Y")
#3. Get subset data 
myData <- subset(data1, subset= (Date >= "2007-02-01"  & Date <= "2007-02-02"))
#4.Remove old data  
rm(data1)
#5. Raw plot 1
hist(myData$Global_reactive_power, col = "red", main = "Global Active Power", xlab ="Global Active Power(kilowatts)")

#6. Copy to file
dev.copy(png, file = "plot1.png")
dev.off()
#7. Remove  myData in environment
rm(myData)

