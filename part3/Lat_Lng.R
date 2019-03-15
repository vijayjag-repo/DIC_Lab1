library(ggmap)
register_google(key = "")
###choose locs.csv file
loc <- read.csv(file.choose())
locs <- data.frame(loc)
just_loc <- locs[,c("location")]
nlocs <- sample(just_loc)
### Removing blank spaces and generic locations
nlocs[nlocs==""]<-NA
nlocs[nlocs=="USA"]<-NA
nlocs[nlocs=="United States"]<-NA
nlocs[nlocs=="Canada"]<-NA
nlocs<-nlocs[complete.cases(nlocs),]
#### Create empty dataframe initialized with zeros
orig <- data.frame(matrix(0, ncol = 2, nrow = 2000))
x <- c("lon", "lat")
colnames(orig) <- x
### Retrieve the latitude and longitude coordinates using geocode() 
for(i in 1:2000)
{
  result <- geocode(toString(nlocs[i]))
  orig$lon[i] <- as.numeric(result[1])
  orig$lat[i] <- as.numeric(result[2])
}
write.table(orig,"./csv_/lat_lng_locs.csv",append=T,row.names = F,col.names = T,sep=",")
