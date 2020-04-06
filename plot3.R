data <- read.csv("./Data/data2.csv", header=T, sep=";")
data$Date <- as.Date(data$Date)
data$Time <- strptime(data$Time,format="%H:%M")
png(filename="./plot3.png")

plot(1:l, data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="",xaxt="no", col="black")
lines(1:l, data$Sub_metering_2,col="red")
lines(1:l, data$Sub_metering_3,col="blue")
axis(1,at=c(1,l/2,l),labels=c("Thu","Fri","Sat"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lty=1)
dev.off()