# Import dataset
dataset <- read.csv2('household_power_consumption.txt', stringsAsFactors = FALSE, na.strings = '?')

# Select the desired variable for histogram
dataset <- subset(dataset, Date == '1/2/2007' | Date == '2/2/2007')
globalActivePower <- dataset$Global_active_power
globalActivePower <- as.numeric(unlist(globalActivePower))
rm(dataset)

# Write histogram to png file
png('plot1.png', width = 720, height = 720)
hist(globalActivePower, col = 'red', main = 'Global Active Power', xlab = 'Global Active Power (kW)', ylab = 'Frequency')
dev.off()