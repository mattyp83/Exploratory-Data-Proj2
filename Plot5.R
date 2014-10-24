library(ggplot2)
library(plyr)
SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")

# Plot 5
mv_ind <- grep("motor", SCC$Short.Name, ignore.case = TRUE)
SCC_mv <- SCC[mv_ind,1]
SCC_mv <- as.character(SCC_mv)
NEI_mv <- NEI[NEI$SCC %in% SCC_mv, ]
balt_NEI_mv <- NEI_mv[NEI_mv$fips == "24510",]
agg_balt_NEI_mv <- aggregate(Emissions ~ year, data = balt_NEI_mv, sum)
png(filename = "plot5.png")
plot(agg_balt_NEI_mv, type = "o", col = "red", main = "Motor Vehicle Emission Source Changes, 1999-2008")
dev.off()