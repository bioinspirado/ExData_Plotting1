dataf <- read.table("household_power_consumption.txt", skip = 66637, nrow = 2880, sep = ";")
names(dataf) <- sapply(read.table("household_power_consumption.txt", nrow = 1, sep = ";"), as.character)

dataf$DateTime <- strptime(paste(dataf$Date, dataf$Time), format="%d/%m/%Y %H:%M:%S")

for( i in 3:9 ){
        dataf[[i]] <- sapply(dataf[[i]], as.character)
        dataf[[i]] <- sapply(dataf[[i]], as.numeric)
}

win.graph(200,200)
with(dataf, plot(DateTime, Global_active_power, type = "n", xlab = "daytime", ylab = "Global Active Power (kilowatts)" , axes = F, frame.plot=TRUE))
axis(1, at=c(as.numeric(min(dataf$DateTime)), as.numeric(min(dataf$DateTime))+86400
             , as.numeric(min(dataf$DateTime))+2*86400), labels=c("Thu", "Fri", "Sat"))
axis(2, yaxs = "r")

with(dataf, points(DateTime, Global_active_power, type = "l"))
