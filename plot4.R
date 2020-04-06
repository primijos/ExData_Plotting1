data <- read.csv("./Data/data2.csv", header=T, sep=";")
data$Date <- as.Date(data$Date)
data$Time <- strptime(data$Time,format="%H:%M")
png(filename="./plot4.png")
l<-length(data$Sub_metering_1)

original <- par(mfrow=c(2,2))

plot(1:l, data$Global_active_power, type="l", ylab="Global Active Power", xlab="",xaxt="no")
axis(1,at=c(1,l/2,l),labels=c("Thu","Fri","Sat"))

plot(1:l, data$Voltage, type="l", ylab="Voltage", xlab="datetime",xaxt="no")
axis(1,at=c(1,l/2,l),labels=c("Thu","Fri","Sat"))

plot(1:l, data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="",xaxt="no", col="black")
lines(1:l, data$Sub_metering_2,col="red")
lines(1:l, data$Sub_metering_3,col="blue")
axis(1,at=c(1,l/2,l),labels=c("Thu","Fri","Sat"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lty=1,
       bty="n", cex=0.75)

plot(1:l, data$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime",xaxt="no")
axis(1,at=c(1,l/2,l),labels=c("Thu","Fri","Sat"))

par(original)
dev.off()