dataf <- read.table("household_power_consumption.txt", skip = 66637, nrow = 2880, sep = ";")
names(dataf) <- sapply(read.table("household_power_consumption.txt", nrow = 1, sep = ";"), as.character)
dataf$DateTime <- strptime(paste(dataf$Date, dataf$Time), format="%d/%m/%Y %H:%M:%S")

for( i in 3:9 ){
        dataf[[i]] <- sapply(dataf[[i]], as.character)
        dataf[[i]] <- sapply(dataf[[i]], as.numeric)
}

win.graph(200,200)
par(mfcol = c(2,2))

with(dataf, {plot(DateTime, Global_active_power, type = "n", xlab = "daytime", ylab = "Global Active Power (kilowatts)" , axes = F, frame.plot=TRUE)
        axis(1, at=c(as.numeric(min(dataf$DateTime)), as.numeric(min(dataf$DateTime))+86400, as.numeric(min(dataf$DateTime))+2*86400), labels=c("Thu", "Fri", "Sat"))
        axis(2, yaxs = "r")
        with(dataf, points(DateTime, Global_active_power, type = "l"))
        plot(DateTime, Sub_metering_1, type = "n", xlab = "daytime", ylab = "Energy sub metering" , axes = F, frame.plot=TRUE)
        axis(1, at=c(as.numeric(min(dataf$DateTime)), as.numeric(min(dataf$DateTime))+86400
                     , as.numeric(min(dataf$DateTime))+2*86400), labels=c("Thu", "Fri", "Sat"))
        axis(2, yaxs = "r")
        with(dataf, points(DateTime, Sub_metering_1, type = "l"))
        with(dataf, points(DateTime, Sub_metering_2, type = "l", col = "red"))
        with(dataf, points(DateTime, Sub_metering_3, type = "l", col = "blue"))
        legend("topright", pch = "w", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))          
        plot(DateTime, Voltage, type = "n", xlab = "daytime", ylab = "Voltage (volts)" , axes = F, frame.plot=TRUE)
        axis(1, at=c(as.numeric(min(dataf$DateTime)), as.numeric(min(dataf$DateTime))+86400
                     , as.numeric(min(dataf$DateTime))+2*86400), labels=c("Thu", "Fri", "Sat"))
        axis(2, yaxs = "r")
        with(dataf, points(DateTime, Voltage, type = "l"))
        plot(DateTime, Global_reactive_power, type = "n", xlab = "daytime", ylab = "Global Reactive Power (kilowatts)" , axes = F, frame.plot=TRUE)
        axis(1, at=c(as.numeric(min(dataf$DateTime)), as.numeric(min(dataf$DateTime))+86400
                     , as.numeric(min(dataf$DateTime))+2*86400), labels=c("Thu", "Fri", "Sat"))
        axis(2, yaxs = "r")
        with(dataf, points(DateTime, Global_reactive_power, type = "l"))
})
