## open and select the file ##
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";")
attach(data2)
data2<- data[ which(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]
data2$Global_active_power <- as.numeric(data2$Global_active_power)

## save the graph ##
png(filename='plots/plot1.png',width=480,height=480,units='px')
## make the graph ##
hist(Global_active_power, col="red", main="Global active power", xlab="Global Active Power (kilowatts)")
##close device##
x<-dev.off()
