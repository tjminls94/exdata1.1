## Plot 3: line plot, sub metering 1 2 & 3
## download dataset

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
file <-"PowerConsumption"
download.file(url,file)

## unzip, import data into file

unzip(file)
powerdata <-read.csv("household_power_consumption.txt",sep=";")

## convert date from Factor to Date

powerdata$Date <- as.Date(powerdata$Date, format="%d/%m/%Y")

## extract the time period needed 
## (2007-02-01 to 2007-02-02)

extract <- subset(powerdata, subset=(Date >="2007-02-01" & Date <="2007-02-02"))

## convert Time to character

extract$Date <- as.character(extract$Date)
extract$Time <- as.character(extract$Time)

## create combined Date_Time field

extract$DateTime <- paste(extract$Date, extract$Time)
extract$DateTime <- strptime(extract$DateTime, "%Y-%m-%d %H:%M:%S")


## create line plot

y1<-as.numeric(as.character(extract$Sub_metering_1))
y2<-as.numeric(as.character(extract$Sub_metering_2))
y3<-as.numeric(as.character(extract$Sub_metering_3))

x<-extract$DateTime
plot(x,y1,type="n",xlab="",ylab="Energy sub metering")
lines(x,y1)
lines(x,y2, col="red")
lines(x,y3, col="blue")
legend("topright", lty=1, c("Sub_meeting_1                ","Sub_meeting_2                ","Sub_meeting_3                "), col=c("black","red", "blue"), cex=.5)

## copy to PNG file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
     
     
     

     
     