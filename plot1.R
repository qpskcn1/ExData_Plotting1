if(!file.exists('data')) dir.create('data')
fileUrl <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
download.file(fileUrl, destfile = './data/household_power_consumption.zip')
unzip('./data/household_power_consumption.zip', exdir = './data')

filePath <- "./data/household_power_consumption.txt"
data <- read.table(filePath, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# using data from the dates 2007-02-01 and 2007-02-02
dataSubset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# plot
globalActivePower <- as.numeric(dataSubset$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()