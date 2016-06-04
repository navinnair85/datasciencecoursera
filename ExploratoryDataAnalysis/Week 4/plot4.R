library(dplyr)
library(ggplot2)

#Read data files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Identify the SCC code forresponding to coal combustion
coal_combustion<-grepl("Fuel Comb.*Coal", SCC$EI.Sector)
coal_combustion_sources<-SCC[coal_combustion, ]

#Filter rows corresponding to SCC code for coal combustion
coal_combustion_emissions_rows<-NEI[NEI$SCC %in% coal_combustion_sources$SCC,]

#Summarize coal combustion emissions by year
coal_combustion_emissions<-summarise(group_by(coal_combustion_emissions_rows, year), Emissions = sum (Emissions))

#Open PNG device and plot bar chart
png("plot4.png", width=480, height=480)
ggplot(data = coal_combustion_emissions, aes(x = factor(year), y = Emissions/1000)) + geom_bar(stat = "identity") + xlab("Year") + ylab("Total PM2.5 Emissions in Kilotonnes") + ggtitle("Emissions from coal combustion-related sources 1999 - 2008")
dev.off()
