#Assuming the extracted data exists in the working directory
library(lubridate)
#Loading the extracted dataset
hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?",stringsAsFactors = FALSE)

#Subsetting the dataset to extract the required date
hpc$Date <- dmy(hpc$Date)
hpc <- subset(hpc, Date == ymd("2007-02-02") | Date == ymd("2007-02-01"))

#removing NA values(if any) from the data to be plotted
hpc <- subset(hpc, !is.na(Global_active_power))

#opening and plotting in PNG graphic device

png("plot1.png", height = 480, width = 480, units = "px")
hist(hpc$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()
