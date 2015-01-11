## Plot 2: line plot, global active power over 2 days
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

y<-as.numeric(as.character(extract$Global_active_power))
x<-extract$DateTime
plot(x,y,type="n",xlab="",ylab="Global Active Power (kilowats)")
lines(x,y)

## copy to PNG file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
     
     
     

     
     