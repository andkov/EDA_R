rm(list=ls(all=TRUE))

# 1. Import data set
# Where is my dataset? Where am I?
getwd() # What is my current folder? running this code will show your home folder, in Rstudio it's conveniently the folder where you .Rporj file resides

# install.packages(c("ggplot2", "gcookbook"))

library(ggplot2)
library(gcookbook)

data <- read.csv("data/waterbill.csv")
# names(data) <- c("Appartment","Service","October","Noveber","December")
