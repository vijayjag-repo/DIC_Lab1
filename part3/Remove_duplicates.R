### Use to get unique elements from dataframe
tweets<-read.csv(file.choose())
tf <-data.frame(tweets)
utf <- unique(tf)
write.table(utf,"/Users/arvindthirumurugan/Desktop/Second Semester/Data Intensive computing/New_tweets/unique.csv",append=T,row.names = F,col.names = T,sep=",")
