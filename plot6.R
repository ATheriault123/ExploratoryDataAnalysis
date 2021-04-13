install.packages('dplyr')
install.packages('tidyr')
install.packages('ggplot2')
library(ggplot2)
library(dplyr)
library(tidyr)

SCC <- readRDS('C:/exdata_data_NEI_data/Source_Classification_Code.rds')
NEI <- readRDS('C:/exdata_data_NEI_data/summarySCC_PM25.rds')
NEI$year <- as.numeric(NEI$year)


png('C:/Users/AMThe/OneDrive/Documents/datasciencecoursera/ExplorData/plot6.png', width=480, height=480)

y <- NEI[NEI$fips=='06037' & NEI$type=='ON-ROAD', ]
x <- NEI[NEI$fips=='24510' & NEI$type=='ON-ROAD', ]
z <- rbind(x,y)
xz <- z %>% 
  group_by(year, fips) %>% 
  summarise(AvgEm = mean(Emissions)) %>%
  as.data.frame
ggplot(xz, aes(year, AvgEm, color=fips)) + geom_point() + geom_smooth(method='lm', se=FALSE) + ggtitle('Average Emissions: Baltimore(Teal) Vs Los Angelos(red)')

dev.off()

