baltimorenei <- subset(NEI, fips == "24510")

png('Plot3.png')
ggplot(baltimorenei, aes(factor(year), Emissions, fill = type))+
  geom_bar(stat = 'identity')+
  facet_grid(.~type, scales = "free", space = "free")+
  labs(x = 'Year', y = 'Total Emissions')+
  labs(title = 'Emissions in Baltimore by source')
dev.off()


