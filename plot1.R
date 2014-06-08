## Creates plot 1

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
Global_active_power<-data$Global_active_power[x]
Global_active_power<-as.numeric(Global_active_power)
#Plotting
png("plot1.png")
hist(Global_active_power,col="red",xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()

