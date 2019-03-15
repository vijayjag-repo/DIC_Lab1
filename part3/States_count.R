### Choose states.csv file
states <- read.csv(file.choose())
states <- data.frame(states)
states<-table(states)
### write elements to state_count.csv
write.table(states,"./csv_/state_count.csv",append=T,row.names = F,col.names = T,sep=",")
