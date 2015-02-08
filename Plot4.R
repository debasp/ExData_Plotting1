install.packages("data.table")
library(data.table)
filepath <- "./household_power_consumption.txt"
DT1 <- fread(filepath, sep=";", na.strings="?" )
DT <- DT1[Date=="1/2/2007" | Date=="2/2/2007"]
DT[, DateNTime:=as.POSIXct(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))]

png(file = "plot4.png", width = 480, height = 480, units = "px", bg = "transparent")
par(mfrow=c(2,2))
plot(DT$DateNTime, DT$Global_active_power, type="l" , xlab="", ylab="Global Active Power")
plot(DT$DateNTime, DT$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(DT$DateNTime, DT$Sub_metering_1, type="n",  xlab="", ylab="Energy Sub Metering");
lines(DT$DateNTime, DT$Sub_metering_1);
lines(DT$DateNTime, DT$Sub_metering_2, col="Red");
lines(DT$DateNTime, DT$Sub_metering_3, col="Blue");
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), lwd=c(1.5,1.5, 1.5),col=c("black","red","blue"))
plot(DT$DateNTime, DT$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
