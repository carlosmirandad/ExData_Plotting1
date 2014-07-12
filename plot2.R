######################################################################################################
# Exploratory Data Analysis Class
# Project #1
# Plot #2
######################################################################################################

# Initial Steps:
# 1. Downloaded file from: #https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# 2. Unzipped the file 
# 3. Saved the file to current directory as "household_power_consumption.txt"

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


png("./plot2.png")



plot(dat$Time, 
     dat$Global_active_power,
     xlab="",
     ylab="Global Active Power (kilowatts)", 
     type="l"
)




dev.off()

