## open and select the file ##
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";")
data<- data[ which(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]
data$Global_active_power <- as.numeric(data2$Global_active_power)
data$Date2<-as.Date(data$Date)
data$DateTime<-as.POSIXct(paste(data$Date2, data2$Time), format="%Y-%m-%d %H:%M:%S")
Sys.setlocale("LC_TIME", "English")

## save the graph ##
png(filename='plots/plot2.png',width=480,height=480,units='px')
##make the graph##
plot(data2$DateTime,data2$sub_metering_1,ylab='Energy sub metering',type='l')
lines(data2$DateTime, data2$sub_metering_2, col="red")
lines(data2$DateTime, data2$Sub_metering_3, col="blue")
legend('topright',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','red','blue'),lty='solid')

##close device##
x<-dev.off()
