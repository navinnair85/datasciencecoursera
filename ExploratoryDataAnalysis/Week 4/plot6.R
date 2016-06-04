library(dplyr)
library(ggplot2)

#Read source data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#create dataframes for vehicle emissions in Baltimore and LA County
baltimore_mv_emissions<-NEI[NEI$fips == "24510" & NEI$type == "ON-ROAD",]
lacounty_mv_emissions<-NEI[NEI$fips == "06037" & NEI$type == "ON-ROAD",]

#Summarize Baltimore vehicle emissions by year and add column for county name 
baltimore_mv_emissions_byyear<-summarise(group_by(baltimore_mv_emissions, year), Emissions = sum(Emissions))
baltimore_mv_emissions_byyear$County<-"Baltimore City, MD"

#Summarize LA County vehicle emissions by year and add column for county name
lacounty_mv_emissions_byyear<-summarise(group_by(lacounty_mv_emissions, year), Emissions = sum(Emissions))
lacounty_mv_emissions_byyear$County<-"Los Angeles County, CA"

#Combine emissions dataframes for 2 cities
combined_emissions<-rbind(baltimore_mv_emissions_byyear, lacounty_mv_emissions_byyear)

#Open PNG device and plot line chart
png("plot6.png", width=480, height=480)
ggplot(data = combined_emissions, aes(x = factor(year), y = Emissions, group = County, colour = County)) + geom_line() + geom_point() + xlab("Year") + ylab("Total PM2.5 Emissions in Tonnes") + ggtitle("Motor Vehicle Emissions, 1999 - 2008")
dev.off()