library(dplyr)
library(lubridate)
library(tidyr)

#Read the data assuming it has been downloaded into working directory

HPC<-read.csv("household_power_consumption.txt",sep=";")

# HPC$Date<-as.Date(HPC$Date)
#extract relevant dates and then discard the original data frame
HPC$Date<-as.Date(HPC$Date,"%d/%m/%Y")
HPC1<-HPC[HPC$Date >= "2007-02-01",]
HPC2<-HPC1[HPC1$Date<= "2007-02-02",]

row.names(HPC2)<-NULL

#Save the plot to a file Plot1.PNG
png(filename = "plot1.png",width=480,height=480)
hist(as.numeric(as.character(HPC2$Global_active_power)),col="red",xlab="Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
