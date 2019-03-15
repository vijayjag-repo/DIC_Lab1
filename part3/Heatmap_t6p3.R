library(ggplot2)
library(ggmap)
library(maps)
library(usmap)
library(mapdata)

heatmap <- read.csv("./csv_/state_count_2.csv")
states <- map_data("state")

data<- heatmap[,c("states","activity.level")]
colnames(data) <- c("state", "level")

plot_usmap(data = data, values = "level", lines = "black") + labs(title = "        Heatmap generated with some keywords") +
  scale_fill_continuous(name = "level", low = "green" , high = "red", label = scales::comma) + 
  theme(legend.position = "right")
