install.packages('dplyr')
install.packages('tidyr')
install.packages('ggplot2')
library(ggplot2)
library(dplyr)
library(tidyr)

SCC <- readRDS('C:/exdata_data_NEI_data/Source_Classification_Code.rds')
NEI <- readRDS('C:/exdata_data_NEI_data/summarySCC_PM25.rds')
NEI$year <- as.numeric(NEI$year)


png('C:/Users/AMThe/OneDrive/Documents/datasciencecoursera/ExplorData/plot1.png', width=480, height=480)

e <- NEI %>% 
  group_by(year) %>% 
  summarise(AvgEm = mean(Emissions)) %>%
  as.data.frame


plot(e$AvgEm~e$year, ylab='Average Emissions', xlab='Year', pch=19, main='Average Emissions in US')
abline(lm(e$AvgEm~e$year))

dev.off()
