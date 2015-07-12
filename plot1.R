## This script will import data from the household power consumption data set and plot
## a histogram of the global active power


# Import data
electrics <- read.table("household_power_consumption.txt", sep=";", na.string = "?",
                        header=T, stringsAsFactors=FALSE)

# Subset to the first and second days of feb. 2007
electrics <- subset(electrics, electrics$Date=="1/2/2007" | electrics$Date=="2/2/2007")

# Open png device
png(filename="plot1.png", width=480, height=480)

# Make histogram & format titles
par(mfrow=c(1,1), mar = c(4,4,2,2))
hist(electrics$Global_active_power, col="red", axes=F, xlim=range(0,8),
     xlab="Global Active Power (kilowatts)", main = "Global Active Power")
axis(side=1, at=c(0,2,4,6))
axis(side=2, at=c(0,200,400,600,800,1000,1200))

# Close png device
dev.off()