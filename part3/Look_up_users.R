library(twitteR)
### Choose us_tweers.csv
loc <- read.csv(file.choose())
locs <- data.frame(loc)
### Retrieving the screenNames from the dataframe
names <- locs[,c("screenName")]
consumer_key <- ""
consumer_secret <- ""
access_token <- ""
access_secret <- ""
setup_twitter_oauth(consumer_key,consumer_secret,access_token,access_secret)
### Call lookupUsers() manually for every 49 elements
users <- twListToDF(lookupUsers(names[1:49]))
### Retrieve locations from users dataframe 
locs <- users[,c("location")]
### Write locations to locs.csv
write.table(locs,"./csv_/locs.csv",append=T,row.names = F,col.names = T,sep=",")


