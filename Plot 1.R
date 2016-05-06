
# Loading the data set:
household_power_consumption <- read.delim("household_power_consumption.txt", sep=";", header=TRUE, dec=".")

# Making a subset:
subset = household_power_consumption[household_power_consumption$Date %in% c("1/2/2007","2/2/2007") ,]

# Plotting code and making PNG File:
png(file = "Plot1.png")
hist(as.numeric(subset$Global_active_power)/500
     ,col="red", main="Global Active Power"
     ,xlab="Global Active Power (Kilowatts)")
dev.off()
