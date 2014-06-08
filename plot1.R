
#read the data
data=read.csv("household_power_consumption.txt", na.strings="?" , header=TRUE,sep=';', stringsAsFactor=FALSE)

#dates and filter
data$Date=as.Date(data$Date,"%d/%m/%Y")
data=data[data$Date %in% as.Date(c("01/02/2007","02/02/2007"),"%d/%m/%Y"),]

fechaHora=strptime(paste(data$Date,data$Time), format='%Y-%m-%d %H:%M:%S')
data$DateTime=fechaHora

#histogram
png("plot1.png", width = 480, height = 480)

hist(data$Global_active_power,col="red",
     xlab="Global Active Power (kilowatts)", 
     main="Global Active Power")

dev.off()
