##Plot 2 Global Active Power over time

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
png("Plot2.png",bg="white",height=480, width=480)
plot(power_sub$Time,as.numeric(as.character(power_sub$Global_active_power)),ylab="Global Active Power (kilowatts)",xlab="",type="l")
dev.off()