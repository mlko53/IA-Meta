df <- read.csv(file="C:/Users/danie/Documents/_Psychology_Research/IA-Meta/data/2017 Chim/chim_s4b.csv", header=TRUE)
df[] <- lapply(df, as.character)
df[df=="Never"] <- 1
df[df=="Not at all"] <- 1
df[df=="A small amount of the time"] <- 2
df[df=="Slightly"] <- 2
df[df=="Half of the time"] <- 3
df[df=="Moderately"] <- 3
df[df=="Most of the time"] <- 4
df[df=="Very"] <- 4
df[df=="All the time"] <- 5
df[df=="Extremely"] <- 5
write.csv(df, file="C:/Users/danie/Documents/_Psychology_Research/IA-Meta/data/2017 Chim/study4b.csv")