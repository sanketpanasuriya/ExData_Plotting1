file = "./Electric power consumption.zip"

if(!file.exists(file)) {
      download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",file)
}

dataset3 <- read.table(unz(file,"household_power_consumption.txt"), header = TRUE, sep=";", stringsAsFactors = FALSE, dec=".")

head(dataset3)

subSetData3 <- dataset3[dataset3$Date %in% c("1/2/2007", "2/2/2007"),]

dateTime2 <- strptime(paste(subSetData3$Date,subSetData3$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

summary(dateTime2)

Sub_metering_1 <- as.numeric(subSetData3$Sub_metering_1)
Sub_metering_2 <- as.numeric(subSetData3$Sub_metering_2)
Sub_metering_3 <- as.numeric(subSetData3$Sub_metering_3)

png("plot3.png", width = 480, height = 480)
plot(dateTime2, Sub_metering_1, type = "l", ylab="Energy Submetering", xlab = "")
lines(dateTime2, Sub_metering_2, type = "l", col = "red")
lines(dateTime2, Sub_metering_3, type = "l", col = "blue")

legend("topright", c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"), lty=1, lwd= 2.8, col = c("black", "red", "blue"))

dev.off()
