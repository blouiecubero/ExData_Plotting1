
# Loading the data set:
household_power_consumption <- read.delim("household_power_consumption.txt", sep=";", header=TRUE, dec=".")

# Making a subset:
backup = household_power_consumption
backup$Date = as.Date(backup$Date, "%d/%m/%Y")
subset = backup[backup$Date >= as.Date("2007-01-02") & backup$Date <= as.Date("2007-02-02"),]

# Plotting code and making PNG File:
png(file = "Plot1.png")
hist(as.numeric(subset$Global_active_power)/500
     ,col="red", main="Global Active Power"
     ,xlab="Global Active Power (Kilowatts)")
dev.off()
