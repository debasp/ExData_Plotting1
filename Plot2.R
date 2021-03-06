install.packages("data.table")
library(data.table)
filepath <- "./household_power_consumption.txt"
DT1 <- fread(filepath, sep=";", na.strings="?" )
DT <- DT1[Date=="1/2/2007" | Date=="2/2/2007"]
DT[, DateNTime:=as.POSIXct(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))]

png(file = "plot2.png", width = 480, height = 480, units = "px", bg = "transparent")
plot(DT$DateNTime, DT$Global_active_power, type="l" , xlab="", ylab="Global Active Power(kilowatts)")
dev.off()

