library(ggplot2)
library(plyr)
SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")

# Plot 6
mv_ind <- grep("motor", SCC$Short.Name, ignore.case = TRUE)
SCC_mv <- SCC[mv_ind,1]
SCC_mv <- as.character(SCC_mv)
NEI_mv <- NEI[NEI$SCC %in% SCC_mv, ]
LA_balt_NEI_mv <- NEI_mv[NEI_mv$fips == "24510" | NEI_mv$fips == "06037",]
agg_LA_balt_NEI_mv <- aggregate(Emissions ~ year + fips, data = LA_balt_NEI_mv, sum)
agg_LA_balt_NEI_mv$County <- ifelse(agg_LA_balt_NEI_mv$fips == "06037", "LA", "Baltimore")
png(filename = "plot6.png")
qplot(year, Emissions, data = agg_LA_balt_NEI_mv, geom = c("point", "line"), group = County, color = County, main = "Baltimore v. LA Motor Vehicle Emissions Changes")
dev.off()