file = "./Electric power consumption.zip"

if(!file.exists(file)) {
      download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",file)
}

dataset4 <- read.table(unz(file,"household_power_consumption.txt"), header = TRUE, sep=";", stringsAsFactors = FALSE, dec=".")

head(dataset3)

subSetData4 <- dataset4[dataset4$Date %in% c("1/2/2007", "2/2/2007"),]

dateTime3 <- strptime(paste(subSetData3$Date,subSetData3$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

Sub_metering_1 <- as.numeric(subSetData4$Sub_metering_1)
Sub_metering_2 <- as.numeric(subSetData4$Sub_metering_2)
Sub_metering_3 <- as.numeric(subSetData4$Sub_metering_3)

globle_Active_Power2 <- as.numeric(subSetData4$Global_active_power)

Voltage <- as.numeric(subSetData4$Voltage)

Global_reactive_power <- as.numeric(subSetData4$Global_reactive_power)

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

plot(dateTime3,globle_Active_Power2, type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")

plot(dateTime3, Voltage, type="l", xlab = "datetime", 
     ylab = "Voltage")

plot(dateTime2, Sub_metering_1, type = "l", ylab="Energy Submetering", xlab = "")
lines(dateTime2, Sub_metering_2, type = "l", col = "red")
lines(dateTime2, Sub_metering_3, type = "l", col = "blue")

legend("topright", c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"), 
       lty=1, lwd= 2.8, col = c("black", "red", "blue"), bty="o")

plot(dateTime3,Global_reactive_power , type="l", xlab = "datetime", 
     ylab = "Global_reactive_power")

dev.off()
