newcol <- read.csv("newcols.csv")
library(readr)
cooperatives_clean <- read_csv("cooperatives_clean.csv")
cooperatives_newcols <- merge(cooperatives_clean,newcol)

write.csv(cooperatives_newcols,file="cooperatives_newcols")
