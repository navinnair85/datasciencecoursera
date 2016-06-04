library(dplyr)

#Read data files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Summarize yearly emission data from Baltimore
baltimore_emissions<-summarize(group_by(filter(NEI, fips == "24510"), year), Emissions = sum(Emissions))

#Open PNG device and plot bar chart
png("plot2.png", width=480, height=480)
barplot(height=baltimore_emissions$Emissions/1000, names.arg=baltimore_emissions$year,
        xlab="Year", ylab="PM2.5 emissions (kilotonnes)",ylim=c(0,5),
        main="Total PM 2.5 emissions (kilotonnes) in Baltimore 1999 - 2008")

dev.off()