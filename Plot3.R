dataplot<-read.table("household_power_consumption.txt", sep=";", header =T, 
                 colClasses=c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric','numeric', 'numeric', 'numeric'),
                 na.strings='?')
dataplotplot<-dataplot[dataplot$Date %in% c("1/2/2007","2/2/2007"),]                 
dataplotplot$datetime<-strptime(paste(dataplotplot$Date,dataplotplot$Time),"%d/%m/%Y %H:%M:%S")
png("plot3.png", height = 480, width = 480)
plot(dataplotplot$datetime,dataplotplot$Sub_metering_1,xlab ="", ylab = "Energy sub metering", type ="l",col = 'black')
lines(dataplotplot$datetime,dataplotplot$Sub_metering_2, col = "red")
lines(dataplotplot$datetime,dataplotplot$Sub_metering_3, col = "blue")
legend('topright',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c('black','red','blue'), lty = 1, lwd = 3)
dev.off()
