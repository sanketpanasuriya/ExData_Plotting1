file = "./Electric power consumption.zip"

if(!file.exists(file)) {
      download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",file)
}

dataset2 <- read.table(unz(file,"household_power_consumption.txt"), header = TRUE, sep=";", stringsAsFactors = FALSE, dec=".")

head(dataset2)

subSetData2 <- dataset2[dataset2$Date %in% c("1/2/2007", "2/2/2007"),]

dateTime <- strptime(paste(subSetDate2$Date,subSetDate2$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

globle_Active_Power2 <- as.numeric(subSetDate2$Global_active_power)

png("plot2.png", width = 480, height = 480)

plot(dateTime,globle_Active_Power2, type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")
dev.off()
