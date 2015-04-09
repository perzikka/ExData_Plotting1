data <- read.csv(unz("exdata-data-household_power_consumption.zip", "household_power_consumption.txt"), 
                 stringsAsFactors=FALSE, header = TRUE, sep=";")
data$Date = as.Date(data$Date, "%d/%m/%Y")
data_sub = subset(data, Date >= as.Date("2007-02-01", "%Y-%m-%d"))
data_feb = subset(data_sub, Date <= as.Date("2007-02-02", "%Y-%m-%d"))

png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(as.numeric(data_feb$Global_active_power), ylim = c(0, 1200), xlab="Global Active Power (kilowatts)", col="red")
dev.off()
