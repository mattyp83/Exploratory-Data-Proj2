library(ggplot2)
library(plyr)
SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")

## Plot 2
Balt_subset <- subset(NEI, NEI$fips == "24510")
Balt_aggdata <- aggregate(Balt_subset$Emissions, by = list(Balt_subset$year), sum)
png(filename = "plot2.png")
plot(Balt_aggdata$x ~ Balt_aggdata$Group.1, type = "b", main = "Total emissions in the Baltimore, 1999-2008")
dev.off()