#read data
mydata<-read.table("/Users/liuxinyan/Desktop/household_power_consumption.txt",sep=";",header = TRUE,stringsAsFactors = FALSE )
head(mydata)
library(dplyr)
newdata<-tbl_df(mydata)
library(lubridate)
#transform date variables into the correct format 
newdata$Date<-dmy(newdata$Date)
#filter data on 2007/02/01 and 2007/02/02
newdata<-newdata%>%
  filter(newdata$Date=='2007-02-01'|newdata$Date=='2007-02-02')
#plot 1
par(mfrow=c(1,1))
hist(newdata$Global_active_power,col="red",main="Global Active Power",xlab='Global Active Power(kilowatts)')
#plot 2
newdata<-newdata%>%
  filter(!is.na(Date)&!is.na(Global_active_power))
newdata$DateTime <- strptime(paste(newdata$Date, newdata$Time),"%Y-%m-%d %H:%M:%S")
plot(newdata$DateTime,newdata$Global_active_power,pch=20,type="l", ylab="Global Active Power (kilowemeters)", xlab='')
#plot 3
plot(x=newdata$DateTime,y=newdata$Sub_metering_1,type="l")
lines(newdata$DateTime,newdata$Sub_metering_2,type="l",col="red")
lines(newdata$DateTime,newdata$Sub_metering_3,type="l",col="blue")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1)
#plot 4
par(mfrow=c(2,2),mar = c(4, 4, 1, 1))
plot(newdata$DateTime,newdata$Global_active_power,pch=20,type="l", ylab="Global Active Power (kilowemeters)", xlab='')
plot(newdata$DateTime,newdata$Voltage,pch=20,type="l", ylab="Voltage", xlab='')
plot(x=newdata$DateTime,y=newdata$Sub_metering_1,type="l")
lines(newdata$DateTime,newdata$Sub_metering_2,type="l",col="red")
lines(newdata$DateTime,newdata$Sub_metering_3,type="l",col="blue")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1)
plot(newdata$DateTime,newdata$Global_reactive_power,pch=20,type="l", ylab="Global_reactive_power", xlab='Date')
