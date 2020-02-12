library('data.table')
path <- getwd()
library(dplyr)
library(ggplot2)

download.file(url = 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip'
              , destfile = paste(path, "dataFiles.zip", sep = "/"))

unzip(zipfile = "dataFiles.zip")



NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI <- as.data.table(NEI)
SCC <- as.data.table(SCC)
yearlyemissions <- NEI %>% group_by(year) %>% summarise(yearlyemissions = sum(Emissions))
NEI[, Emissions := lapply(.SD, as.numeric), .SDcols = c("Emissions")]

png('plot1.png')
barplot(yearlyemissions$yearlyemissions,
        names = yearlyemissions$year,
        xlab = 'Years', ylab = 'Emissions',
        main = 'Emissions over the Years')
dev.off()



