
#Read the Datafile (common code for all the plots)
data<-read.table("household_power_consumption.txt",sep=";",stringsAsFactors=FALSE,header=TRUE)
#COPY data to data2
data2<-data
data2$Date<-as.Date(data2$Date,"%d/%m/%Y")
myData<-data2[data2$Date >= "2007-2-1" & data2$Date <= "2007-2-2", ]
mysubData<-subset(data2, Date >= "2007-2-1" & Date <= "2007-2-2")

#PLOT1
png(file="plot1.png",bg="transparent")
hist(myData$Global_active_power,col="red",xlab="Global Power Active", main="Global Active Power")
dev.off()

#PLOT2
myData$DateTime<-paste(myData$Date,myData$Time)
myData$DateTime<-strptime(myData$DateTime, format = "%Y-%m-%d %H:%M:%S")
png("plot2.png",bg="transparent")
plot(myData$DateTime,myData$Global_active_power, type="l",ylab="Global Active Power (kilowatts)", xlab ="")
dev.off()

