rm(list=ls(all=TRUE))

# 1. Import data set
# Where is my dataset? Where am I?
getwd() # What is my current folder? running this code will show your home folder, in Rstudio it's conveniently the folder where you .Rporj file resides

# install.packages(c("ggplot2", "gcookbook"))

library(ggplot2)
library(gcookbook)

ds <- read.csv("data/waterbill.csv")
# names(data) <- c("Appartment","Service","October","Noveber","December")

# # install.packages("xlsx")
# library(xlsx)
# data<-read.xlsx("data/waterbill.xlsx")




plot(ds$speed, ds$dist)

cars<-cars
str(cars)
attach(cars)
plot(speed,dist)
qplot(speed, dist, data=cars)
ggplot(cars, aes(x=speed, y=dist)) + geom_point()
detach(cars)

mtcars<-mtcars
str(mtcars)
attach(mtcars)
plot(mpg, hp, type="p")
points(mpg, disp)

lines(pressure$temperature, pressure$pressure/2, col="red")
points(pressure$temperature, pressure$pressure/2, col="red")

qplot(pressure$temperature, pressure$pressure, geom="line")

plot(ds$)
# This is equivalent to:
ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point()
