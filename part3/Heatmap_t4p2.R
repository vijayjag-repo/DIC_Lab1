library(ggplot2)
library(ggmap)
library(maps)
library(usmap)
library(mapdata)

heatmap <- read.csv("./csv_/StateDatabyWeekforMap_2018-19week40-4.csv")
states <- map_data("state")
heatmap$ACTIVITY.LEVEL <- as.numeric( substr( heatmap$ACTIVITY.LEVEL, 6, 8 ) )
heatmap$STATENAME <- tolower(heatmap$STATENAME)

avg <- aggregate(.~STATENAME, data=heatmap, mean)
data<- avg[,c("STATENAME","ACTIVITY.LEVEL")]
colnames(data) <- c("state", "level")

plot_usmap(data = data, values = "level", lines = "black") + labs(title = "2018-19 Influenza Season Week 40 of 2018 to Week 4 ending Jan 26, 2019") +
  scale_fill_continuous(name = "level", low = "green", high = "red", label = scales::comma) + 
  theme(legend.position = "right")







