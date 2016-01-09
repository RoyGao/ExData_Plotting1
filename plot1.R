setwd('/Users/roygao/WorkSpace/test/exploryData')

#Read data set into R
df <- read.table("household_power_consumption.txt", sep=";", header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")

#slice the dataframe into time-series of two days
slice <- subset(df, (df[1] == "1/2/2007" | df[1]== "2/2/2007")) 

#plot the figure as required
png("plot1.png", width = 480, height = 480)
hist(slice$Global_active_power, main = "Global Active Power",col='red', xlab = "Global Active Power(kilowatts)")
dev.off()