require(dplyr)

# Import dataset
dataset <- read.csv2('household_power_consumption.txt', stringsAsFactors = FALSE, na.strings = '?')

# Select the desired data for line plot
dataSubset <- subset(dataset, Date == '1/2/2007' | Date == '2/2/2007')
dateTime <- strptime(paste(dataSubset$Date, dataSubset$Time), format = '%d/%m/%Y %H:%M:%S', tz = 'Europe/Paris')
dataSubset <- cbind(dateTime, dataSubset)

dataSubset <- dataSubset %>% select(dateTime:Global_active_power, -Date, -Time)
names(dataSubset)[2] <- 'globalActivePower'
dataSubset$globalActivePower <- as.numeric(dataSubset$globalActivePower)

rm(dataset, dateTime)

# Write line plote to png file
png('plot2.png', width = 840, height = 840)
with(dataSubset, plot(dateTime, globalActivePower, type = 'n', xlab = '', ylab = 'Global Active Power (kW)', cex.lab = 1.3, cex.axis = 1.1))
with(dataSubset, lines(dateTime, globalActivePower, ljoin = 2))
dev.off()