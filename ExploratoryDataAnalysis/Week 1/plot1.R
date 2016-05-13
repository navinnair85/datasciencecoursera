#Read household power consumption file
data <- read.table("household_power_consumption.txt", sep=";", header = TRUE, stringsAsFactors = FALSE)

#Convert Characters to Date objects in the Date column with the dd/mm/yyyy format
data$Date<-as.Date(data$Date, "%d/%m/%Y")

#Select only the rows corresponding to 01/02/2007 and 02/02/2007 and store in another table
final_data<-subset(data, Date >=As.Date("2007/02/01") & Date <= As.Date("2007/02/02"))

#Free up memory by removing the "data" table from the Global Environment 
rm(data)

#Convert Characters to Numeric objects in the Global_active_power column
final_data$Global_active_power<-as.numeric(final_data$Global_active_power)

#Open the png device,explicitly state the dimensions and plot histogram
png("plot1.png", width=480, height=480)
hist(final_data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()

