household_power_consumption <- read.delim("household_power_consumption.txt", sep=";")

dates <- household_power_consumption$Date
inds <- dates == "1/2/2007" | dates == "2/2/2007"

png(filename = "plot3.png", width=480, height=480)
plot(household_power_consumption$Sub_metering_1[inds], type='l',col='black', 
     xlab='', ylab='Energy sub metering', xaxt='n')
L = sum(inds)
v1 <- c(0, L/2, L)
v2 <- c('Thu', 'Fri', 'Sat')
axis(side=1, at=v1, labels=v2)

lines(household_power_consumption$Sub_metering_2[inds], col='red')
lines(household_power_consumption$Sub_metering_3[inds], col='blue')
legend("topright", legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col=c('black', 'red', 'blue'), lwd=1)
dev.off()
