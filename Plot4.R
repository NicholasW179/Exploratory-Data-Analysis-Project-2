library(data.table)
combustion <- grepl('comb', SCC[, EI.Sector], ignore.case = TRUE)
coal <- grepl('coal', SCC[, EI.Sector], ignore.case = TRUE)
combustionscc <- SCC[combustion & coal, SCC]
coalcombnei <- NEI[NEI[, SCC] %in% combustionscc]
png('Plot4.png')
ggplot(coalcombnei, aes(factor(year), Emissions))+
  geom_bar(stat = 'identity', width = 0.75)+
  labs(x='year', y='Emissions')+
  labs(title = 'Emissions from Coal Combustion')
dev.off()
  