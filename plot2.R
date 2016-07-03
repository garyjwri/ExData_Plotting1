data<-read.csv2("household_power_consumption.txt",header=F,
                col.names=c("Date","Time","Global_active_power",
                            "Global_reactive_power","Voltage",
                            "Global_intensity","Sub_metering_1",
                            "Sub_metering_2","Sub_metering_3"),
                colClasses="character",
                skip=66637,nrows=2880,na.strings="?")
datetime<-paste(data[,1],data[,2])
datetime<-strptime(datetime,"%d/%m/%Y %H:%M:%S",tz="GMT")
png(file="plot2.png")
plot(datetime,as.numeric(data[,3]),type="l",
     xlab="",ylab="Global Active Power (kilowatts)")
dev.off()