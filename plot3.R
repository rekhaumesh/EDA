
#Read the Datafile (common code for all the plots)
data<-read.table("household_power_consumption.txt",sep=";",stringsAsFactors=FALSE,header=TRUE)
#COPY data to data2
data2<-data
#data2$Date<-as.Date(data2$Date,"%d/%m/%Y")
#myData<-data2[data2$Date >= "2007-2-1" & data2$Date <= "2007-2-2", ]
#mysubData<-subset(data2, Date >= "2007-2-1" & Date <= "2007-2-2")
#Preparing variables for the plot 
data2$Date<-as.Date(data2$Date,"%d/%m/%Y")
myData<-data2[data2$Date >= "2007-2-1" & data2$Date <= "2007-2-2", ]
mysubData<-subset(data2, Date >= "2007-2-1" & Date <= "2007-2-2")

myData$DateTime<-paste(myData$Date,myData$Time)
myData$DateTime<-strptime(myData$DateTime, format = "%Y-%m-%d %H:%M:%S")
myData$Global_active_power<-as.numeric(myData$Global_active_power)
myData$Sub_metering_1<-as.numeric(myData$Sub_metering_1)
myData$Sub_metering_2<-as.numeric(myData$Sub_metering_2)
myData$Voltage<-as.numeric(myData$Voltage)
myData$Global_reactive_power<-as.numeric(myData$Global_reactive_power)


#PLOT 3
myData$Sub_metering_1<-as.numeric(myData$Sub_metering_1)
myData$Sub_metering_2<-as.numeric(myData$Sub_metering_2)
png("plot3.png",bg="transparent")
plot(myData$DateTime, myData$Sub_metering_1, col="red",
     ylab="Energy Sub metering",type="l", xlab="")
lines(myData$DateTime, myData$Sub_metering_2,col="green")
lines(myData$DateTime, myData$Sub_metering_3,col="blue")
legend("topright",c("sub_metering_1",
                    "sub_metering_2","sub_metering_3"),col=c("red","green","blue"),lwd=1)
dev.off()




