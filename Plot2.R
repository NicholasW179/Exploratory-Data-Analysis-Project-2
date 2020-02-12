




nei_baltimore <- subset(NEI, fips == '24510')
nei_baltimore <- nei_baltimore %>% group_by(year) %>% summarise(yearlyemissions = sum(Emissions))
png('Plot2.png')
barplot(nei_baltimore$yearlyemissions, names = nei_baltimore$year,
        xlab = 'Years', ylab = 'Emissions',
        main = 'Emissions over the Years')
dev.off()