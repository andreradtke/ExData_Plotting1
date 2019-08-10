require(dplyr)

# Import dataset
dataset <- read.csv2('household_power_consumption.txt', stringsAsFactors = FALSE, na.strings = '?')

# Select the desired data for line plot
dataSubset <- subset(dataset, Date == '1/2/2007' | Date == '2/2/2007')
dateTime <- strptime(paste(dataSubset$Date, dataSubset$Time), format = '%d/%m/%Y %H:%M:%S', tz = 'Europe/Paris')
dataSubset <- cbind(dateTime, dataSubset)

dataSubset <- dataSubset %>% select(-Date:-Global_intensity)
dataSubset$Sub_metering_1 <- as.numeric(dataSubset$Sub_metering_1)
dataSubset$Sub_metering_2 <- as.numeric(dataSubset$Sub_metering_2)
dataSubset$Sub_metering_3 <- as.numeric(dataSubset$Sub_metering_3)

# Memory cleanup
rm(dataset, dateTime)

# Write line plote to png file
png('plot3.png', width = 840, height = 840)
with(dataSubset, plot(dateTime, Sub_metering_1, type = 'n', xlab = '', ylab = 'Energy Sub Metering (Wh)', cex.lab = 1.3, cex.axis = 1.1))
with(dataSubset, lines(dateTime, Sub_metering_1, col = 'black', ljoin = 2))
with(dataSubset, lines(dateTime, Sub_metering_2, col = 'red', ljoin = 2))
with(dataSubset, lines(dateTime, Sub_metering_3, col = 'blue', ljoin = 2))
legend('topright', col = c('black', 'red', 'blue'), legend = c('Sub Metering 1', 'Sub Metering 2', 'Sub Metering 3'), lwd = 2, cex = 1.3)
dev.off()