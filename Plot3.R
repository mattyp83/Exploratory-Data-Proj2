library(ggplot2)
library(plyr)
SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")

## Plot 3
NEI_subset <- NEI[NEI$fips == "24510",]
NEI_subset_type <- ddply(NEI_subset, .(type, year), summarize, Emissions = sum(Emissions))
png(filename = "plot3.png")
qplot(year, Emissions, data = NEI_subset_type, geom = c("point", "line"), group = type, color = type, main = "Emissions Sources in Baltimore, 1999-2008")
dev.off()