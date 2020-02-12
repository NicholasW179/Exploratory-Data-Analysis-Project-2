library(data.table)
condition <- grepl('vehicle', SCC$SCC.Level.Two, ignore.case = TRUE)
sccvehicle <- SCC[condition, SCC]
NEIvehicle <- NEI[NEI$SCC %in% sccvehicle]
baltimorevehicle <- NEIvehicle %>% filter(fips == '24510')
LAvehicle <- NEIvehicle %>% filter(fips == '06037')
baltimorevehicle[, city := c("Baltimore City")]
LAvehicle[, City := c('Los Angeles')]
labaltnei <- rbind(LAvehicle, baltimorevehicle)
labaltnei$city <- 0
for(fips in 1:length(labaltnei$fips)){
  if(labaltnei$fips[fips] == '24510'){
    labaltnei$city[fips] <- 'Baltimore'
  }else{
    labaltnei$city[fips] <- 'Los Angeles' 
  }
}


png('Plot6.png')
ggplot(labaltnei, aes(year, Emissions))+
  geom_bar(aes(fill = year), stat = 'identity')+
  facet_grid(scales = 'free', space = 'free', .~ city)+
  labs(x = 'Year', y= 'Emissions')+
  labs(title = 'Comparison of vehicle emissions La V. Baltimore')
dev.off()