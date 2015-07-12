# Import data
electrics <- read.table("household_power_consumption.txt", sep=";", na.string = "?",
                        header=T, stringsAsFactors=FALSE)

# Subset to the first and second days of feb. 2007
electrics <- subset(electrics, electrics$Date=="1/2/2007" | electrics$Date=="2/2/2007")

# Open png device
png(filename="plot3.png", width=480, height=480)

## PLOT ENERGY SUB-METERING

# set plot scales & labels
par(mfrow=c(1,1), mar = c(4,4,2,2))
plot (c(0,2880),c(0,40),type="n", axes=F, 
      ylab="Energy sub metering", xlab = "") 

# Add data
lines(electrics$Sub_metering_1)
lines(electrics$Sub_metering_2, col="red")
lines(electrics$Sub_metering_3, col="blue")

# Add axes
axis(side=2, at=c(0,10,20,30))
axis(side=1, at=c(0,1440,2880), labels = c("Thursday", "Friday", "Saturday"))
box()

# Add a legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1), col = c("black", "red", "blue"))

# Close png device
dev.off()