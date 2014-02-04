# "R graphics Cookbook" http://shop.oreilly.com/product/0636920023135.do


# "#" comments the line out
#                     To comment out == Ctrl+Shift+C
# Run from beginning to current line == Ctrl+Alt+B
#                      Clear Console == Ctrl+L


rm(list=ls(all=TRUE)) # Removes all objects from workspace
# rm(list=setdiff(ls(),c("id","age"))) # Removes all except "id" and "age"
# #OR
# keeplist<- c("id","age") 
# rm(list=setdiff(ls(),keeplist)) 


getwd() # gets the name of the Wording Directory (wd) for you
pathCodeSource<-file.path(getwd(),"source") # we'll refer to snippets of code stored in "EDA_R/source"
pathImageOut<-file.path(getwd(),"images") # we'll put our beautiful graphs into folder "EDA_R/images"
# setwd(c(pathDir,"data")) # Manually overrides the location of working directory
# pathDataSource <- file.path(pathDir,"data/waterbill.csv")
# ds<-read.csv(pathDataSource) # ds stands for dataset, it's easier to have generic name
# str(ds) # Gives basic structure of the dataset
# head(ds,2) # Prints the first few lines from the dataset
# print(ds) # Prints the entire dataset
# source(file.path(pathCodeSource,"install.packages.R")) # executes code in "install.packages.R" file

# Importing and Cleaning a research database
{ # Reading and cleaning a research dataset
  pathDataSource <- file.path(pathDir,"data/NLSY97_Religion_08032013.dct")
  ds<-read.csv(pathDataSource) #
  varnames<-read.csv(pathDataSource,header=FALSE, skip=1,nrows=70,sep=" ")
  data<-read.csv(pathDataSource,    header=FALSE, skip=73,        sep=" ")
  
  # referring to elements of ds: ds[rows,column]
  varnames<-varnames[,c("V3","V4")] # select collumns named "V3" and "V4", varname is an OBJECT - []
  library(plyr)
  varnames<-rename(varnames, c("V3"="QID","V4"="Qname")) #requires plyr package, renames the old = new, rename is a FUNCTION ()
  varnames<- varnames[order(varnames$QID,varnames$Qname), ] #  order is a FUNCTION ()
  names(data)<-varnames$QID
  
{#manually renaming variables
  data<-rename(data, c(
    "R0323900"="famrel_1997",
    "R2165200"="famrel_1998",
    "R3483100"="famrel_1999",
    "R4881300"="famrel_2000",
    "R1193900"="agemon_1997",
    "R2553400"="agemon_1998",
    "R3876200"="agemon_1999",
    "R5453600"="agemon_2000",
    "R7215900"="agemon_2001",
    "S1531300"="agemon_2002",
    "S2000900"="agemon_2003",
    "S3801000"="agemon_2004",
    "S5400900"="agemon_2005",
    "S7501100"="agemon_2006",
    "T0008400"="agemon_2007",
    "T2011000"="agemon_2008",
    "T3601400"="agemon_2009",
    "T5201300"="agemon_2010",
    "R1194100"="ageyear_1997",
    "R2553500"="ageyear_1998",
    "R3876300"="ageyear_1999",
    "R5453700"="ageyear_2000",
    "R7216000"="ageyear_2001",
    "S1531400"="ageyear_2002",
    "S2001000"="ageyear_2003",
    "S3801100"="ageyear_2004",
    "S5401000"="ageyear_2005",
    "S7501200"="ageyear_2006",
    "T0008500"="ageyear_2007",
    "T2011100"="ageyear_2008",
    "T3601500"="ageyear_2009",
    "T5201400"="ageyear_2010",
    "R1235800"="samplesype",
    "S0919700"="todo_2002",
    "S6317100"="todo_2005",
    "T2782200"="todo_2008",
    "R4893400"="attend_2000",
    "R6520100"="attend_2001",
    "S0919300"="attend_2002",
    "S2987800"="attend_2003",
    "S4681700"="attend_2004",
    "S6316700"="attend_2005",
    "S8331500"="attend_2006",
    "T0739400"="attend_2007",
    "T2781700"="attend_2008",
    "T4495000"="attend_2009",
    "T6143400"="attend_2010",
    "R0536401"="bmonth",
    "R0536402"="byear",
    "R1482600"="race",
    "R0536300"="sex",
    "R0555800"="psrelpref",
    "R0000100"="id",
    "S0919600"="decide_2002",
    "S6317000"="decide_2005",
    "T2782100"="decide_2008",
    "S0919500"="obey_2002",
    "S6316900"="obey_2005",
    "T2782000"="obey_2008",
    "S5532800"="relpref_2005",
    "T2111400"="relpref_2008",
    "S0919400"="values_2002",
    "S6316800"="values_2005",
    "T2781900"="values_2008",
    "S0919800"="pray_2002",
    "S6317200"="pray_2005",
    "T2782300"="pray_2008",
    "R0552300"="prelpref",
    "R0552200"="praised",
    "R0555700"="psraised" 
  ))}
}







