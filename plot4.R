library(dplyr)
library(lubridate)
library(tidyr)

#Read the data

HPC<-read.csv("household_power_consumption.txt",sep=";")

# HPC$Date<-as.Date(HPC$Date)
#extract relevant dates and then discard the original data frame
HPC$Date<-as.Date(HPC$Date,"%d/%m/%Y")
HPC1<-HPC[HPC$Date >= "2007-02-01",]
HPC2<-HPC1[HPC1$Date<= "2007-02-02",]

row.names(HPC2)<-NULL

#Convert date and times to datetime
test2<-paste(HPC2$Date,HPC2$Time)
test3<-as.POSIXlt(strptime(test2,"%Y-%m-%d %H:%M:%S"))
HPC2<-cbind(DateTime=test3,HPC2)


#Save the plot to a file Plot1.PNG
png(filename = "plot4.png",height=480,width=480)
par(mfrow = c(2,2))
plot(HPC2$DateTime,as.numeric(as.character(HPC2[,4])),type="l",xlab="" , ylab = "Global Active Power")

plot(HPC2$DateTime,as.numeric(as.character(HPC2[,6])),type="l",xlab="datetime" , ylab = "Voltage")

plot(HPC2$DateTime,as.numeric(as.character(HPC2[,8])),type="l",col="black",xlab="" , ylab = "Energy sub metering")
lines(HPC2$DateTime,as.numeric(as.character(HPC2[,9])),col= "red")
lines(HPC2$DateTime,as.numeric(as.character(HPC2[,10])),col= "blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(HPC2$DateTime,as.numeric(as.character(HPC2[,5])),type="l",xlab="datetime" , ylab = "Global_reactive_power")


dev.off()
