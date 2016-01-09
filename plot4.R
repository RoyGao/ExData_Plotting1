setwd('/Users/roygao/WorkSpace/test/exploryData')

#Read data set into R
df <- read.table("household_power_consumption.txt", sep=";", header=TRUE, dec=".", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")

#slice the dataframe into time-series of two days
slice <- subset(df, (df[1] == "1/2/2007" | df[1]== "2/2/2007")) 

#deal with DateStamp format columns
slice$DateTime <- strptime(paste(slice$Date, slice$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#plot the figure as required
png("plot4.png", width = 480, height = 480)
par(mfcol=c(2,2))

plot(slice$DateTime, slice$Global_active_power, type="l", ylab= "Global Active Power", xlab="")
plot(slice$DateTime, slice$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(slice$DateTime, slice$Sub_metering_2, col="red")
lines(slice$DateTime, slice$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

plot(slice$DateTime,slice$Voltage,type="l",ylab="Voltage",xlab="datetime")

plot(slice$DateTime,slice$Global_reactive_power,type='l',xlab="datetime",ylab="Global_reactive_power")

dev.off()