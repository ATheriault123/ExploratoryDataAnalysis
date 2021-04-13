install.packages('dplyr')
install.packages('tidyr')
install.packages('ggplot2')
library(ggplot2)
library(dplyr)
library(tidyr)

SCC <- readRDS('C:/exdata_data_NEI_data/Source_Classification_Code.rds')
NEI <- readRDS('C:/exdata_data_NEI_data/summarySCC_PM25.rds')
NEI$year <- as.numeric(NEI$year)


png('C:/Users/AMThe/OneDrive/Documents/datasciencecoursera/ExplorData/plot5.png', width=480, height=480)

x <- NEI[NEI$fips=='24510' & NEI$type=='ON-ROAD', ]
x <- x %>% 
  group_by(year) %>% 
  summarise(AvgEm = mean(Emissions)) %>%
  as.data.frame
plot(x$AvgEm~x$year, pch=19, main='Average Emissions from Motor Vehicles')
abline(lm(x$AvgEm~x$year))

dev.off()



