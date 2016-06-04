library(dplyr)
library(ggplot2)

#Read source data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Subset data for pollution in baltimore from motor vehicles, then summarize total emissions by year
baltimore_mv_emissions<-NEI[NEI$fips == "24510" & NEI$type == "ON-ROAD",]
baltimore_mv_emissions_byyear<-summarise(group_by(baltimore_mv_emissions, year), Emissions = sum(Emissions))

#Open PNG device and plot bar chart
png("plot5.png", width=480, height=480)
ggplot(baltimore_mv_emissions_byyear, aes(x=factor(year), y=Emissions)) + geom_bar(stat = "identity") + xlab("Year") + ylab("Total PM2.5 Emissions in Tonnes") + ggtitle("Emissions from motor vehicle sources in Baltimore City 1999 - 2008")
dev.off()