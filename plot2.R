household_power_consumption <- read.delim("household_power_consumption.txt", sep=";")

dates <- household_power_consumption$Date
inds <- dates == "1/2/2007" | dates == "2/2/2007"

plot_data <- household_power_consumption$Global_active_power[inds]
v1 <- c(0, length(plot_data)/2, length(plot_data))
v2 <- c('Thu', 'Fri', 'Sat')

png(filename = "plot2.png", width=480, height=480)
plot(plot_data, type='l', xaxt='n', ylab='Global Active Power (kilowatts)', xlab='')
axis(side=1, at=v1, labels=v2)
dev.off()
