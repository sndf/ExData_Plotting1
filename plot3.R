#read the data
data=read.csv("household_power_consumption.txt", na.strings="?" , header=TRUE,sep=';', stringsAsFactor=FALSE)

#dates and filter
data$Date=as.Date(data$Date,"%d/%m/%Y")
data=data[data$Date %in% as.Date(c("01/02/2007","02/02/2007"),"%d/%m/%Y"),]

fechaHora=strptime(paste(data$Date,data$Time), format='%Y-%m-%d %H:%M:%S')
data$DateTime=fechaHora

#graph
png("plot3.png", width = 480, height = 480)

plot(data$DateTime,data$Sub_metering_1, 
     ylab="Energy sub metering",
     xlab="",type="n")
lines(data$DateTime,data$Sub_metering_1,lwd=1)
lines(data$DateTime,data$Sub_metering_2,lwd=1, col="red")
lines(data$DateTime,data$Sub_metering_3,lwd=1, col="blue")

legend("topright",legend=c("Sub_metering_1","Sub_metering_3","Sub_metering_3"),
       col=c("black","red","blue"),lwd=1)

dev.off()