library(lubridate)
#Loading the extracted dataset
hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?",stringsAsFactors = FALSE)
 
#creating a combined Date-Time variable
hpc$DateTime <- dmy_hms(paste(hpc$Date,hpc$Time))
hpc$Date <- dmy(hpc$Date)
hpc <- subset(hpc, Date == ymd("2007-02-02") | Date == ymd("2007-02-01"))
 
#removing NA values(if any) from the data to be plotted
hpc <- subset(hpc, !is.na(Global_active_power))

#plotting the line chart 
png("plot3.png",width = 480, height = 480, units = "px")
with(hpc, plot(DateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub Metering"))
par(new = TRUE)
lines(hpc$DateTime, hpc$Sub_metering_2, col ="Red")
par(new = TRUE)
lines(hpc$DateTime, hpc$Sub_metering_3, col ="blue")
legend("topright", lty = 1,col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()