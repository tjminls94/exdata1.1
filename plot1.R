## Plot 1
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

## create histogram plot

extract$Global_active_power<-as.numeric(extract$Global_active_power)
hist(extract$Global_active_power,main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

## copy to PNG file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
     
     
     

     
     