data <- read.csv(unz("exdata-data-household_power_consumption.zip", "household_power_consumption.txt"), 
                 stringsAsFactors=FALSE, header = TRUE, sep=";")
data$Date = as.Date(data$Date, "%d/%m/%Y")
data_sub = subset(data, Date >= as.Date("2007-02-01", "%Y-%m-%d"))
data_feb = subset(data_sub, Date <= as.Date("2007-02-02", "%Y-%m-%d"))

png(filename = "plot4.png", width = 480, height = 480, units = "px")

attach(mtcars)
#par(mar=c(1.1,1.1,1.1,1.1))
par(mfrow=c(2,2))

plot(data_feb$Global_active_power, type = "l", axes = F, 
     ylab = "Global Active Power (kilowatts)", xlab = "")
axis(side = 1, at = c(0, sum(weekdays(data_feb$Date)=="Thursday"), sum(weekdays(data_feb$Date)=="Thursday")*2), 
     labels = c(substr(weekdays(data_feb$Date)[1], 1, 3), 
                substr(weekdays(data_feb$Date)[1441], 1, 3), 
                "Sat"))
axis(side = 2, at = seq(0, 8, by = 2))

plot(data_feb$Voltage, type = "l", axes = F, 
     ylab = "Voltage", xlab = "datetime")
axis(side = 1, at = c(0, sum(weekdays(data_feb$Date)=="Thursday"), sum(weekdays(data_feb$Date)=="Thursday")*2), 
     labels = c(substr(weekdays(data_feb$Date)[1], 1, 3), 
                substr(weekdays(data_feb$Date)[1441], 1, 3), 
                "Sat"))
axis(side = 2)

plot(1:length(data_feb$Sub_metering_1), 
     data_feb$Sub_metering_1, type = "l", 
     axes = F, ylab = "Energy sub metering", xlab = "")
lines(1:length(data_feb$Sub_metering_1),
      data_feb$Sub_metering_2, col="red")
lines(1:length(data_feb$Sub_metering_1),
      data_feb$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_3", "Sub_metering_2"),
       col = c("black", "red", "blue"), lty=1)
axis(side = 1, at = c(0, sum(weekdays(data_feb$Date)=="Thursday"), sum(weekdays(data_feb$Date)=="Thursday")*2), 
     labels = c(substr(weekdays(data_feb$Date)[1], 1, 3), 
                     substr(weekdays(data_feb$Date)[1441], 1, 3), 
                     "Sat"))
axis(side = 2, at = seq(0, 40, by = 10))

plot(data_feb$Global_reactive_power, type = "l", axes = F, 
     ylab = "Global_reactive_power", xlab = "datetime")
axis(side = 1, at = c(0, sum(weekdays(data_feb$Date)=="Thursday"), sum(weekdays(data_feb$Date)=="Thursday")*2), 
     labels = c(substr(weekdays(data_feb$Date)[1], 1, 3), 
                substr(weekdays(data_feb$Date)[1441], 1, 3), 
                "Sat"))
axis(side = 2)


dev.off()

