data <- read.csv(unz("exdata-data-household_power_consumption.zip", "household_power_consumption.txt"), 
                 stringsAsFactors=FALSE, header = TRUE, sep=";")
data$Date = as.Date(data$Date, "%d/%m/%Y")
data_sub = subset(data, Date >= as.Date("2007-02-01", "%Y-%m-%d"))
data_feb = subset(data_sub, Date <= as.Date("2007-02-02", "%Y-%m-%d"))

png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(data_feb$Global_active_power, type = "l", axes = F, 
     ylab = "Global Active Power (kilowatts)", xlab = "")
axis(side = 1, at = c(0, sum(weekdays(data_feb$Date)=="Thursday"), sum(weekdays(data_feb$Date)=="Thursday")*2), 
     labels = c(substr(weekdays(data_feb$Date)[1], 1, 3), 
                     substr(weekdays(data_feb$Date)[1441], 1, 3), 
                     "Sat"))
axis(side = 2, at = seq(0, 8, by = 2))
dev.off()
