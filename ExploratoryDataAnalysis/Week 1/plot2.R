#Read household power consumption file
data <- read.table("household_power_consumption.txt", sep=";", header = TRUE, stringsAsFactors = FALSE)

#Select only the rows corresponding to 01/02/2007 and 02/02/2007 and store in another table
final_data<-data[data$Date %in%c("1/2/2007","2/2/2007"),]

#Free up memory by removing the "data" table from the Global Environment 
rm(data)

#Create a vector called datetime by merging the Date and Time columns
datetime <- strptime(paste(final_data$Date, final_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Open the png device,explicitly state the dimensions and plot line graph
png("plot2.png", width=480, height=480)
plot(datetime, final_data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()