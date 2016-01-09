setwd('/Users/roygao/WorkSpace/test/exploryData')

#Read data set into R
df <- read.table("household_power_consumption.txt", sep=";", header=TRUE, dec=".", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")

#slice the dataframe into time-series of two days
slice <- subset(df, (df[1] == "1/2/2007" | df[1]== "2/2/2007")) 

#deal with DateStamp format columns
slice$DateTime <- strptime(paste(slice$Date, slice$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#plot the figure as required
png("plot2.png", width = 480, height = 480)
plot(slice$DateTime, slice$Global_active_power, type = 'l',ylab= "Global Active Power(kilowatts)", xlab="")
dev.off()