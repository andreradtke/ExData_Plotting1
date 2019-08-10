# Import dataset
dataset <- read.csv2('household_power_consumption.txt', stringsAsFactors = FALSE, na.strings = '?')

# Select the desired variable for histogram
dataset <- subset(dataset, Date == '1/2/2007' | Date == '2/2/2007')
globalActivePower <- dataset$Global_active_power
globalActivePower <- as.numeric(unlist(globalActivePower))

# Memory cleanup
rm(dataset)

# Write histogram to png file
png('plot1.png', width = 840, height = 840)
hist(globalActivePower, col = 'red', main = 'Global Active Power', xlab = 'Global Active Power (kWh)', ylab = 'Frequency', cex.lab = 1.3, cex.axis = 1.1, cex.main = 1.5)
dev.off()