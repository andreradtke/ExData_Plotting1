# Import dataset
dataset <- read.csv2('household_power_consumption.txt', stringsAsFactors = FALSE, na.strings = '?')

# Select the desired variable for histogram
dataSubset <- subset(dataset, Date == '1/2/2007' | Date == '2/2/2007')
dataSubset <- dataSubset$Global_active_power
dataSubset <- as.numeric(unlist(dataSubset))

# Memory cleanup
rm(dataset)

# Write histogram to png file
png('plot1.png', width = 480, height = 480)
hist(dataSubset, col = 'red', main = 'Global Active Power', xlab = 'Global Active Power (kW)', ylab = 'Frequency', cex.lab = 1.3, cex.axis = 1.1, cex.main = 1.5)
dev.off()