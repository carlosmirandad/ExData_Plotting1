######################################################################################################
# Exploratory Data Analysis Class
# Project #1
# Plot #3
######################################################################################################

# Initial Steps:
# 1. Downloaded file from: #https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# 2. Unzipped the file 
# 3. Saved the file to current directory as "household_power_consumption.txt"

# Infrastructure:
# - R version 3.1.0 (2014-04-10)
# - RStudio Version 0.98.507 
# - Linux operating system (Ubuntu 12.04 LTS)
# - Memory 2.0 GB

########### Load file to a dataframe ########### 
dat <- read.table(
    "./household_power_consumption.txt", 
    header = TRUE, 
    sep = ";",
    na.strings = c("NA","?")
)

#Format dates and times
dat$Time <- strptime(paste(dat$Date,dat$Time),"%d/%m/%Y %H:%M:%S")
dat$Date <- as.Date(dat$Date, format="%d/%m/%Y")

#Keep only desired records
startDate <- as.Date("2007-02-01")
endDate   <- as.Date("2007-02-02")
dat <- dat[dat$Date>=startDate & dat$Date<=endDate,]


########### Plot ########### 


png("./plot3.png")
#the default dimensions already are the required ones (width = 480, height = 480)


plot(dat$Time, 
     dat$Sub_metering_1,
     xlab="",
     ylab="Energy sub metering", 
     type="l",
     col="black"
)

lines(dat$Time, 
      dat$Sub_metering_2,
      col="red"
)

lines(dat$Time, 
      dat$Sub_metering_3,
      col="blue"
)

legend("topright",
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),
       lty=1
)


dev.off()


