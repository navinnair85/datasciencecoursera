library(dplyr)
library(ggplot2)

#Read data files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Summarize emission data by type and year in Baltimore
baltimore_emissions_type<-summarize(group_by(filter(NEI, fips == "24510"), year, type),Emissions  = sum(Emissions))

#Open PNG device and plot barchart using ggplot
png("plot3.png", width=480, height=480)
ggplot(data = baltimore_emissions_type, aes(x=factor(year), y = Emissions)) + facet_grid(.~type) + geom_bar(stat = "identity")+xlab("Year")+ylab("Total PM2.5 Emission in Tonnes") + ggtitle("Emissions in Baltimore by Type")
dev.off()