
#Read the Datafile (common code for all the plots)
data<-read.table("household_power_consumption.txt",sep=";",stringsAsFactors=FALSE,header=TRUE)
#COPY data to data2
data2<-data

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

#Prepare the PLOT 4 area; All the 4 plots in one screen
png(file="plot4.png",bg="transparent")
par(mfcol=c(2,2),mar=c(4,4,2,2))
#PLOT2 DateTime Vs Global Active Power
plot(myData$DateTime,myData$Global_active_power, type="l",ylab="Global Active Power (kilowatts)", xlab ="")
#PLOT 3 DateTime Vs Submertering readings
plot(myData$DateTime, myData$Sub_metering_1, col="red",
     ylab="Energy Sub metering",type="l", xlab="")
lines(myData$DateTime, myData$Sub_metering_2,col="green")
lines(myData$DateTime, myData$Sub_metering_3,col="blue")
legend("topright",c("sub_metering_1",
                    "sub_metering_2","sub_metering_3"),col=c("red","green","blue"),lwd=1)

# PLOT DateTime Vs voltage Code
plot(myData$DateTime,myData$Voltage,ylab="Voltage",xlab="DateTime",col="blue",type="l")

# PLOT DateTime Vs Global Reactive Power Code
plot(myData$DateTime,myData$Global_reactive_power,ylim=c(0.0,0.6),ylab="Global Reactive Power",xlab="DateTime",col="red",type="l")

#Close the file
dev.off()





