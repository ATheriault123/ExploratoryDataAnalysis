install.packages('dplyr')
install.packages('tidyr')
install.packages('ggplot2')
library(ggplot2)
library(dplyr)
library(tidyr)

SCC <- readRDS('C:/exdata_data_NEI_data/Source_Classification_Code.rds')
NEI <- readRDS('C:/exdata_data_NEI_data/summarySCC_PM25.rds')
NEI$year <- as.numeric(NEI$year)


png('C:/Users/AMThe/OneDrive/Documents/datasciencecoursera/ExplorData/plot4.png', width=480, height=480)

ss <- SCC[grep('Coal', SCC$EI.Sector), ]
m <- NEI %>% 
  group_by(year) %>% 
  filter(SCC == ss$SCC) %>% 
  summarise(AvgEm = mean(Emissions)) %>%
  as.data.frame

plot(m$AvgEm~m$year, ylab='Average Emissions', xlab='Year', pch=19, main='Average Emissions from Coal in US')
abline(lm(m$AvgEm~m$year))


dev.off()



