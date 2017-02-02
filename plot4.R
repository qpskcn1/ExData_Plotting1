if(!file.exists('data')) dir.create('data')
fileUrl <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
download.file(fileUrl, destfile = './data/household_power_consumption.zip')
unzip('./data/household_power_consumption.zip', exdir = './data')

filePath <- "./data/household_power_consumption.txt"
data <- read.table(filePath, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# using data from the dates 2007-02-01 and 2007-02-02
dataSubset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# plot
dataSubset$DateTime <- strptime(paste(dataSubset$Date,dataSubset$Time),"%d/%m/%Y %H:%M:%S")
png("plot4.png",width=480,height=480)
par(mfcol=c(2,2))

# plot (1, 1)
plot(dataSubset$DateTime, dataSubset$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=NA)

# plot (2, 1)
plot(dataSubset$DateTime, dataSubset$Sub_metering_1,type="l",ylab="Energy sub metering",xlab=NA,col="black")
lines(dataSubset$DateTime, dataSubset$Sub_metering_2, col="red")
lines(dataSubset$DateTime, dataSubset$Sub_metering_3, col="blue")
legend("topright", lty=1, bty="n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# plot (1, 2)
plot(dataSubset$DateTime, dataSubset$Voltage, type="l", xlab="datetime", ylab="Voltage")

# plot (2, 2)
plot (dataSubset$DateTime, dataSubset$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()

par(mfcol=c(2,2))