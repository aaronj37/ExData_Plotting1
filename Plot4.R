##Plot 4 Multiplot Frame

#Load Table
power_data<-read.table("household_power_consumption.txt",na.strings="?",sep=";",header=TRUE)

#Format date to extract
power_data$Date<-as.Date(power_data$Date,format="%d/%m/%Y")

#Exctract data in date range
power_sub<-subset(power_data,Date==as.Date("2007-02-01")|Date==as.Date("2007-02-02"))

#Paste date and time together to get timestamp
d=paste(as.character(power_sub$Date),as.character(power_sub$Time),sep=" ")
t=strptime(d,format="%Y-%m-%d %H:%M")
power_sub$Time=t

#Store in png file
png("Plot4.png",bg="white",height=480, width=480)
par(mfrow = c(2, 2))

plot(power_sub$Time,as.numeric(as.character(power_sub$Global_active_power)),ylab="Global Active Power",xlab="",type="l")

plot(power_sub$Time,as.numeric(as.character(power_sub$Voltage)),ylab="Voltage",xlab="datetime",type="l")


plot(power_sub$Time,as.numeric(as.character(power_sub$Sub_metering_1)),ylab="Energy Sub Metering",xlab="",type="l")
lines(power_sub$Time,as.numeric(as.character(power_sub$Sub_metering_2)),col="red")
lines(power_sub$Time,as.numeric(as.character(power_sub$Sub_metering_3)),col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))

plot(power_sub$Time,as.numeric(as.character(power_sub$Global_reactive_power)),ylab="Global_reactive_power",xlab="datetime",type="l")
dev.off()