library(ggplot2)
library(plyr)
SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")

## Plot 1
aggdata <- aggregate(NEI$Emissions, by = list(NEI$year), sum)
png(filename = "plot1.png")
plot(aggdata$x ~ aggdata$Group.1, type ="b", main = "Total emission from all sources, 1999-2008")
dev.off()