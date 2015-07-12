# Import data
electrics <- read.table("household_power_consumption.txt", sep=";", na.string = "?",
                        header=T, stringsAsFactors=FALSE)

# Subset to the first and second days of feb. 2007
electrics <- subset(electrics, electrics$Date=="1/2/2007" | electrics$Date=="2/2/2007")

# Open png device
png(filename="plot2.png", width=480, height=480)

# Plot the active power as a function of time
par(mfrow=c(1,1), mar = c(4,4,2,2))
plot(electrics$Global_active_power, type = "l", axes = F,
     xlab=" ", ylab = "Global Active Power (kilowatts)")
axis(side=2, at=c(0,2,4,6))
axis(side=1, at=c(0,1440,2880), labels = c("Thursday", "Friday", "Saturday"))
box()

# Close png device
dev.off()