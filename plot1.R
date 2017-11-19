household_power_consumption <- read.delim("household_power_consumption.txt", sep=";")

dates <- household_power_consumption$Date
inds <- dates == "1/2/2007" | dates == "2/2/2007"

hist_data <- household_power_consumption$Global_active_power[inds]

png(filename = "plot1.png", width=480, height=480)
hist(hist_data, col="blue", main="Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()

