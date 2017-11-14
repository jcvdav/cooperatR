
library(readr)
cooperatives_clean <- read_csv("cooperatives_clean.csv")
newcol <- read.csv("newcols.csv")
cooperatives_newcols <- merge(cooperatives_clean,newcol)

write.csv(cooperatives_newcols,file="cooperatives_newcols")
