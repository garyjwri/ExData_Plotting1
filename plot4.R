data<-read.csv2("household_power_consumption.txt",header=F,
                col.names=c("Date","Time","Global_active_power",
                            "Global_reactive_power","Voltage",
                            "Global_intensity","Sub_metering_1",
                            "Sub_metering_2","Sub_metering_3"),
                colClasses="character",
                skip=66637,nrows=2880,na.strings="?")
datetime<-paste(data[,1],data[,2])
datetime<-strptime(datetime,"%d/%m/%Y %H:%M:%S",tz="GMT")
png(file="plot4.png")
par(mfrow=c(2,2))
plot(datetime,as.numeric(data[,3]),type="l",
     xlab="",ylab="Global Active Power")
plot(datetime,as.numeric(data[,5]),type="l",ylab="Voltage")
plot(datetime,as.numeric(data[,7]),type="l",xlab="",
     ylab="Energy sub metering")
lines(datetime,as.numeric(data[,8]),col="red")
lines(datetime,as.numeric(data[,9]),col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),col=c("black","red","blue"),bty="n")
plot(datetime,as.numeric(data[,4]),type="l",ylab="Global_reactive_power")
dev.off()