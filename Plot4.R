# Loading the data set:
household_power_consumption <- read.delim("household_power_consumption.txt", sep=";", header=TRUE, dec=".")

# Making a subset:
backup = household_power_consumption
backup$Date = as.Date(backup$Date, "%d/%m/%Y")
subset = backup[backup$Date == as.Date("2007-02-01") | backup$Date == as.Date("2007-02-02"),]

# Plotting code and making PNG File:

date_time = paste(subset$Date, subset$Time, sep=" ")
datetime = strptime(date_time, "%Y-%m-%d %H:%M:%S")

# Setting the plot chart
png(file = "Plot4.png")

par(mar=c(5,5,5,5))
par(mfcol=c(2,2))

# Plot 2
plot(datetime, as.numeric(subset$Global_active_power), type="l", ylab="Global Active Power", xlab="")

# Plot 3
plot(datetime, as.numeric(subset$Sub_metering_1), type="l", ylab="Energy Submetering", xlab="")
lines(datetime, as.numeric(subset$Sub_metering_2),col="red")
lines(datetime, as.numeric(subset$Sub_metering_3),col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

# Voltage plot
plot(datetime, as.numeric(subset$Voltage), type="l", ylab="Voltage")

# Global Reactive Power plot
plot(datetime, as.numeric(subset$Global_reactive_power), type="l", ylab="Global_reactive_power")

dev.off()
