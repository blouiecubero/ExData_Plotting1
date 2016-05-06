# Loading the data set:
household_power_consumption <- read.delim("household_power_consumption.txt", sep=";", header=TRUE, dec=".")

# Making a subset:
backup = household_power_consumption
backup$Date = as.Date(backup$Date, "%d/%m/%Y")
subset = backup[backup$Date == as.Date("2007-02-01") | backup$Date == as.Date("2007-02-02"),]

# Plotting code and making PNG File:
png(file = "Plot2.png")
date_time = paste(subset$Date, subset$Time, sep=" ")
datetime = strptime(date_time, "%Y-%m-%d %H:%M:%S")
plot(datetime, as.numeric(subset$Global_active_power), type="l", ylab="Global Active Power", xlab="")
dev.off()
