household_power_consumption <- read.delim("household_power_consumption.txt", sep=";")

dates <- household_power_consumption$Date
inds <- dates == "1/2/2007" | dates == "2/2/2007"

plot_data1 <- household_power_consumption$Global_active_power[inds]
plot_data2 <- household_power_consumption$Voltage[inds]
plot_data3 <- household_power_consumption$Global_reactive_power[inds]

L = sum(inds)
v1 <- c(0, L/2, L)
v2 <- c('Thu', 'Fri', 'Sat')

png(filename = "plot4.png", width=480, height=480)

par(mfrow = c(2, 2)) 

plot(plot_data1, type='l', xaxt='n', xlab='', 
     ylab='Global Active Power')
axis(side=1, at=v1, labels=v2)

plot(plot_data2, type='l', xaxt='n', xlab='datetime', ylab='Voltage')
axis(side=1, at=v1, labels=v2)

plot(household_power_consumption$Sub_metering_1[inds], type='l',col='black', 
     xlab='', ylab='Energy sub metering', xaxt='n')
L = sum(inds)
v1 <- c(0, L/2, L)
v2 <- c('Thu', 'Fri', 'Sat')
axis(side=1, at=v1, labels=v2)

lines(household_power_consumption$Sub_metering_2[inds], col='red')
lines(household_power_consumption$Sub_metering_3[inds], col='blue')
legend("topright", legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       col=c('black', 'red', 'blue'), lwd=1, bty='n')


plot(plot_data3, type='l', xaxt='n', xlab='datetime', ylab='Global Reactive Power')
axis(side=1, at=v1, labels=v2)

dev.off()

