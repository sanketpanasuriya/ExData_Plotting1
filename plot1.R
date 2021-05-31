file = "./Electric power consumption.zip"

if(!file.exists(file)) {
      download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",file)
}

dataset <- read.table(unz(file,"household_power_consumption.txt"), header = TRUE, sep=";", stringsAsFactors = FALSE, dec=".")

head(dataset)

subSetDate <- dataset[dataset$Date %in% c("1/2/2007", "2/2/2007"),]

str(subSetDate)

globle_Active_Power <- as.numeric(subSetDate$Global_active_power)

png("plot1.png", width = 480, height = 480)

hist(globle_Active_Power, col="red", main = "Globle Active Power", xlab = "Globle Active Power (killowatts)")
dev.off()


