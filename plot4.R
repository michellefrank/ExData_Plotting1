# Import data
electrics <- read.table("household_power_consumption.txt", sep=";", na.string = "?",
                        header=T, stringsAsFactors=FALSE)

# Subset to the first and second days of feb. 2007
electrics <- subset(electrics, electrics$Date=="1/2/2007" | electrics$Date=="2/2/2007")

# Open the png device
png(filename="plot4.png", width=480, height=480)

# Create the grid for adding plots
par(mfrow = c(2,2), mar = c(4,4,2,2))

## ADD GLOBAL ACTIVE POWER VS. TIME
plot(electrics$Global_active_power, type = "l", axes = F,
     xlab=" ", ylab = "Global Active Power (kilowatts)")
axis(side=2, at=c(0,2,4,6))
axis(side=1, at=c(0,1440,2880), labels = c("Thursday", "Friday", "Saturday"))
box()


## ADD VOLTAGE VS. TIME
plot(electrics$Voltage, type = "l", axes = F,
     xlab=" ", ylab = "Voltage")
axis(side=2, at=c(234, 236, 238, 240, 242, 244, 246))
axis(side=1, at=c(0,1440,2880), labels = c("Thursday", "Friday", "Saturday"))
box()


## ADD ENERGY SUB-METERING VS. TIME
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
       lty=c(1,1), col = c("black", "red", "blue"), bty="n", cex = 0.75)


## ADD REACTIVE POWER VS. TIME
plot(electrics$Global_reactive_power, type = "l", axes = F,
     xlab=" ", ylab = "Global_reactive_power")
axis(side=2, at=c(0.0, 0.1, 0.2, 0.3, 0.4, 0.5))
axis(side=1, at=c(0,1440,2880), labels = c("Thursday", "Friday", "Saturday"))
box()

# Close png device
dev.off()