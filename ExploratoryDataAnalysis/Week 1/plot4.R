#Read household power consumption file
data <- read.table("household_power_consumption.txt", sep=";", header = TRUE, stringsAsFactors = FALSE)

#Select only the rows corresponding to 01/02/2007 and 02/02/2007 and store in another table
final_data<-data[data$Date %in%c("1/2/2007","2/2/2007"),]

#Free up memory by removing the "data" table from the Global Environment 
rm(data)

#Create a vector called datetime by merging the Date and Time columns
datetime <- strptime(paste(final_data$Date, final_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#convert Character objects to Numeric objects
final_data$Global_active_power<-as.numeric(final_data$Global_active_power)
final_data$Global_reactive_power<-as.numeric(final_data$Global_reactive_power)
final_data$Voltage<-as.numeric(final_data$Voltage)
final_data$Sub_metering_1<-as.numeric(final_data$Sub_metering_1)
final_data$Sub_metering_2<-as.numeric(final_data$Sub_metering_2)
final_data$Sub_metering_3<-as.numeric(final_data$Sub_metering_3)

#Open the png device,explicitly state the dimensions and plot charts
png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))

#chart 1
plot(datetime, final_data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power", col = "black", cex = 0.2)

#chart 2
plot(datetime, final_data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage", col = "black")

#chart 3
plot(datetime, final_data$Sub_metering_1, col = "black", type = "l", xlab = "", ylab = "Energy sub metering")
lines(datetime, final_data$Sub_metering_2, col = "red", type = "l")
lines(datetime, final_data$Sub_metering_3, col = "blue", type = "l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"), bty = "n")

#chart 4
plot(datetime, final_data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()