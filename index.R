
require(plyr)

# "#" comments the line out
#                     To comment out == Ctrl+Shift+C
# Run from beginning to current line == Ctrl+Alt+B
#                      Clear Console == Ctrl+L


# rm(list=ls(all=TRUE)) # Removes all objects from workspace
# rm(list=setdiff(ls(),c("id","age"))) # Removes all except "id" and "age"
# #OR
# keeplist<- c("id","age") 
# rm(list=setdiff(ls(),keeplist)) 


getwd() # gets the name of the Wording Directory (wd) for you
pathDir<-file.path(getwd()) #
pathCodeSource<-file.path(getwd(),"source")
# setwd(c(pathDir,"data")) # Manually overrides the location of working directory
# pathDataSource <- file.path(pathDir,"data/waterbill.csv")
# ds<-read.csv(pathDataSource) # ds stands for dataset, it's easier to have generic name
# str(ds) # Gives basic structure of the dataset
# head(ds,2) # Prints the first few lines from the dataset
# print(ds) # Prints the entire dataset

# source(file.path(pathCodeSource,"install.packages.R")) # executes code in "install.packages.R" file


pathDataSource <- file.path(pathDir,"data/NLSY97_Religion_08032013.dct")
ds<-read.csv(pathDataSource) #
varnames<-read.csv(pathDataSource,header=FALSE, skip=1,nrows=70,sep=" ")
data<-read.csv(pathDataSource,    header=FALSE, skip=73,        sep=" ")

# referring to elements of ds: ds[rows,column]
varnames<-varnames[c("V3","V4"),] # select collumns named "V3" and "V4"
varnames<-rename(varnames2, c("V3"="QID","V4"="Qname")) #requires plyr package
varnames<- varnames[order(varnames$QID,varnames$Qname), ] 

names(dsSource)<-varnames$QID






