## Plot 2 of 4
## Using "?" as NA
## Converting Date and Time to Date/Time
## Limiting to two day period 2.1 - 2.2 2007
## Using BASE Plotting system
## Creates png file
## setting height and width to 480 pixels

data <- read.csv("household_power_consumption.txt",
                 sep=";",
                 colClasses=c(rep("character",2),rep("numeric",7)),
                 na.strings="?")

data$Timestamp <- strptime(paste(data$Date,data$Time),
                           format="%d/%m/%Y %H:%M:%S")

data$Date=NULL
data$Time=NULL

sub_data = subset(data,as.Date(data$Timestamp) >= "2007-02-01" 
                  & as.Date(data$Timestamp) < "2007-02-03")

png(filename="plot2.png", height=480, width=480, bg="transparent")

plot(sub_data$Timestamp,
     sub_data$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")

dev.off()


