library(dplyr)

#Read data files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Summarize total emissions by year
total_emissions<-summarize(group_by(NEI, year), Emissions = sum(Emissions))

#Open PNG device and plot bar chart
png("plot1.png", width=480, height=480)
barplot(height=total_emissions$Emissions/1000, names.arg=total_emissions$year,
        xlab="Year", ylab="PM2.5 emissions (kilotonnes)",ylim=c(0,8000),
        main="Total PM 2.5 emissions (kilotonnes) 1999 - 2008")

dev.off()
