require(dplyr)

# Import dataset
dataset <- read.csv2('household_power_consumption.txt', stringsAsFactors = FALSE, na.strings = '?')

# Select the desired data for line plot
dataSubset <- subset(dataset, Date == '1/2/2007' | Date == '2/2/2007')
dateTime <- strptime(paste(dataSubset$Date, dataSubset$Time), format = '%d/%m/%Y %H:%M:%S', tz = 'Europe/Paris')
dataSubset <- cbind(dateTime, dataSubset)

dataSubset <- dataSubset %>% select(-Date, -Time, -Global_intensity)
dataSubset$Global_active_power <- as.numeric(dataSubset$Global_active_power)
dataSubset$Global_reactive_power <- as.numeric(dataSubset$Global_reactive_power)
dataSubset$Voltage <- as.numeric(dataSubset$Voltage)
dataSubset$Sub_metering_1 <- as.numeric(dataSubset$Sub_metering_1)
dataSubset$Sub_metering_2 <- as.numeric(dataSubset$Sub_metering_2)
dataSubset$Sub_metering_3 <- as.numeric(dataSubset$Sub_metering_3)

# Memory cleanup
rm(dataset, dateTime)

# Write line plot to png file
png('plot4.png', width = 480, height = 480)

par(mfrow = c(2 ,2))

# Top lef plot
with(dataSubset, plot(dateTime, Global_active_power, type = 'n', xlab = '', ylab = 'Global Active Power (kW)'))
with(dataSubset, lines(dateTime, Global_active_power, ljoin = 2))

# Top right plot
with(dataSubset, plot(dateTime, Voltage, type = 'n', xlab = 'dateTime', ylab = 'Voltage (V)'))
with(dataSubset, lines(dateTime, Voltage, ljoin = 2))

# Bottom left plot
with(dataSubset, plot(dateTime, Sub_metering_1, type = 'n', xlab = '', ylab = 'Energy Sub Metering (Wh)'))
with(dataSubset, lines(dateTime, Sub_metering_1, col = 'black', ljoin = 2))
with(dataSubset, lines(dateTime, Sub_metering_2, col = 'red', ljoin = 2))
with(dataSubset, lines(dateTime, Sub_metering_3, col = 'blue', ljoin = 2))
legend('topright', col = c('black', 'red', 'blue'), legend = c('Sub Metering 1', 'Sub Metering 2', 'Sub Metering 3'), lwd = 2, bty = 'n')

# Bottom right plot
with(dataSubset, plot(dateTime, Global_reactive_power, type = 'n', xlab = 'dateTime', ylab = 'Global Reactive Power (kW)'))
with(dataSubset, lines(dateTime, Global_reactive_power, ljoin = 2))

dev.off()