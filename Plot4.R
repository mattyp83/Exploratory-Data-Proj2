library(ggplot2)
library(plyr)
SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")

# Plot 4
ind <- grep("coal", SCC$Short.Name, ignore.case = TRUE)
SCC_vals <- SCC[ind,1]
SCC_vals <- as.character(SCC_vals)
vals_NEI <- NEI[NEI$SCC %in% SCC_vals,]
agg_vals_NEI <- aggregate(Emissions ~ year, data = vals_NEI, sum)
png(filename = "plot4.png")
plot(agg_vals_NEI, type = "o", col = "blue", main = "Changes in Emissions from coal, 1999-2008")
dev.off()