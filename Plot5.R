condition <- grepl('vehicle', SCC$SCC.Level.Two, ignore.case = TRUE)
sccvehicle <- SCC[condition, SCC]
NEIvehicle <- NEI[NEI$SCC %in% sccvehicle]
baltimorevehicle <- NEIvehicle %>% filter(fips == '24510')

png('Plot5.png')
ggplot(baltimorevehicle, aes(factor(year), Emissions))+
  geom_bar(stat = 'identity', width = 0.7, fill = 'red')+
  labs(x = 'Year', y = 'Emissions from Vehicles in Baltimore')+
  labs(title = 'Emissions from vehicles in Baltimore by Year')
dev.off()