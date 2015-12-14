## open and select the file ##
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";")
data<- data[ which(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]
data$Global_active_power <- as.numeric(data2$Global_active_power)
data$Date2<-as.Date(data$Date)
data$DateTime<-as.POSIXct(paste(data$Date2, data2$Time), format="%Y-%m-%d %H:%M:%S")
Sys.setlocale("LC_TIME", "English")

## save the graph ##
png(filename='plots/plot4.png',width=480,height=480,units='px')

# make 4 plots
par(mfrow=c(2,2))

# plot data on top left (1,1)
plot(data$DateTime,data$Global_active_power,ylab='Global Active Power (kilowatts)',xlab='',type='l')

# plot data on top right (1,2)
plot(data$DateTime,data$Voltage,ylab='Voltage', xlab='DateTime',type='l')

# plot data on bottom left (2,1)
plot(data$DateTime,data$sub_metering_1,ylab='Energy sub metering',type='l', xlab='')
lines(data$DateTime, data$sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend('topright',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','red','blue'),lty='solid')

# plot data on bottom right (2,2)
plot(data$DateTime,data$Global_reactive_power,ylab='Global_reactive_power', xlab='DateTime',type='l')

##close device##
x<-dev.off()
