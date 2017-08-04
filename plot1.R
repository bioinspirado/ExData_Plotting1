dataf <- read.table('household_power_consumption.txt', skip=66637, nrow=2880, sep=';')
names(dataf) <- sapply(read.table('household_power_consumption.txt', nrow=1, sep=';'),as.character)
dataf$DateTime <- strptime(paste(dataf$Date, dataf$Time), format='%d%m%Y %H:%M%S')

for ( i in 3:9){
        dataf[[i]] <- sapply(dataf[[i]], as.character)
        dataf[[i]] <- sapply(dataf[[i]], as.numeric)
}

win.graph(200,200)
hist(dataf$Global_active_power, xlab = 'Global Active Power (kw - kilowatts)', main = 'Global Active Power', col='red', ylim = c(0,1200))
axis(1, at=c(min(dataf$DateTime), min(dataf$DateTime)+86400, min(df$DateTime)+2*86400), labels=c('thu', 'fri', sat))