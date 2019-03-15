library('revgeo')
### Choose lat_lng_locs.csv file
lat_lng <- read.csv(file.choose())
lat_lng <- data.frame(lat_lng)
lat_lng<-lat_lng[complete.cases(lat_lng),]
states <- NULL
### Manually retrieve 300 tweets at a time using revgeo
for(i in 2001:2378)
{
  geo_information <- revgeo( longitude = lat_lng[i,]$lon, latitude =lat_lng[i,]$lat , provider = "google", API = "", output = "hash", item = "state")
  states <- append(states,geo_information$state)
}
### Write the states to states.csv
write.table(states,"./csv_/states.csv",append=T,row.names = F,col.names = T,sep=",")

