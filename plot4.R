## Creates plot 2

# Reading in the data
data <- read.csv("household_power_consumption.txt", colClasses="character",sep=";",header=1)
data$Date <- as.Date(data$Date, format="%d /%m /%Y")
date_interest1 = as.Date("01/02/2007",format="%d /%m/ %Y")
date_interest2 = as.Date("02/02/2007",format="%d /%m/ %Y")

#Selecting dates of interest
x<-data$Date>=date_interest1 & data$Date<=date_interest2

# Making a variable of POSIXlt dates
tt<-paste(as.character(data$Date[x]), data$Time[x]) 
tt<-strptime(tt,format="%Y-%m-%d %H:%M:%S")
# Getting the right data
Sub_metering_1<-as.numeric(data$Sub_metering_1[x])
Sub_metering_2<-as.numeric(data$Sub_metering_2[x])
Sub_metering_3<-as.numeric(data$Sub_metering_3[x])
Global_active_power<-as.numeric(data$Global_active_power[x])
Global_reactive_power<-as.numeric(data$Global_reactive_power[x])
Voltage <-as.numeric(data$Voltage[x])

#Plotting
png("plot4.png")
par(mfrow=c(2,2))
plot(tt,Global_active_power,type="n",xlab="",ylab="Global Active Power",main="")
lines(tt,Global_active_power)

plot(tt,Voltage,type="n",xlab="datetime",ylab="Voltage",main="")
lines(tt,Voltage)


plot(tt,Sub_metering_1,type="n",xlab="",ylab="Energy sub metering",main="")
lines(tt,Sub_metering_1)
lines(tt,Sub_metering_2,col="red")
lines(tt,Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1,col=c("black","red","blue"))

plot(tt,Global_reactive_power,type="n",xlab="datetime",main="")
lines(tt,Global_reactive_power)
dev.off()