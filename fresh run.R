rm(list=ls(all=TRUE))

# 1. Import data set
# Where is my dataset? Where am I?
getwd() # What is my current folder? running this code will show your home folder, in Rstudio it's conveniently the folder where you .Rporj file resides

# install.packages(c("ggplot2", "gcookbook"))

library(ggplot2)
library(gcookbook)

waterbill <- read.csv("data/waterbill.csv")
# names(data) <- c("Appartment","Service","October","Noveber","December")

# # install.packages("xlsx")
# library(xlsx)
# data<-read.xlsx("data/waterbill.xlsx")


# 2.1. Creating a Scatter Plot (p.8)
cars<-cars
str(cars)
attach(cars)
plot(speed,dist)
qplot(speed, dist, data=cars)
ggplot(cars, aes(x=speed, y=dist)) + geom_point()
detach(cars)

# 2.2 Creating a Line graphn (p.9)
str(pressure)
View(pressure)
plot(pressure$temperature, pressure$pressure, type="p")
points(pressure$temperature, pressure$pressure)
lines(pressure$temperature, pressure$pressure/2, col="red")
points(pressure$temperature, pressure$pressure/2, col="red")

library(ggplot2)
qplot(pressure$temperature, pressure$pressure, geom="line")
ggplot(pressure, aes(x=temperature, y=pressure))+ geom_line()

# 9.1. Setting the Title of a Graph (p.221)
p<-ggplot(pressure, aes(x=temperature, y=pressure))+ geom_line()
p+ggtitle("temp/pressure curve")+
  geom_point()
  

# 2.5 Creating a boxplot
#  len - The response is the length of odontoblasts (teeth)
#  dose -dose levels of Vitamin C (0.5, 1, and 2 mg)
#  supp - supplement type 
#     OJ- Orange Juice
#     VC - Vitamic C, ascorbic acid


str(ToothGrowth)
View(ToothGrowth)
summary(ToothGrowth)
table(ToothGrowth)
head(ToothGrowth)
plot(ToothGrowth$supp, ToothGrowth$len)

ggplot(ToothGrowth, aes(x=supp, y=len))                    + geom_boxplot()
ggplot(ToothGrowth, aes(x=dose, y=len))                    + geom_boxplot()
ggplot(ToothGrowth, aes(x=factor(dose), y=len))            + geom_boxplot()
ggplot(ToothGrowth, aes(x=interaction(supp, dose), y=len)) + geom_boxplot()

myplot<-ggplot(ToothGrowth, aes(x=interaction(supp, dose), y=len))+
  geom_boxplot()+
  ggtitle("Effect of Supplement and Dose on Toothgrowth")

# 14.5 Outputting to PNG
# width and height are in pixels

pathImages<-file.path(getwd(),"images")
pathPlot <-file.path(pathImages,"Tooth_Growth_Graph.png")
png(filename = pathPlot, width =5, height =3 , units = "in",res=90)
plot(myplot)
dev.off()

# 15.19. Converting Data from Wide to Long (p/365)
library(reshape2)
dsl<-melt(waterbill, id.vars=c("Apt.","Outcome"), variable.name="month", value.name="cost")

summary(dsl)
str(dsl)
qplot(month,cost,data=dsl)


p<-ggplot(dsl,aes(x=month,y=cost,color=factor(Apt.)))+
  geom_point(size=5)+
  geom_line(aes(group=interaction(Outcome,factor(Apt.)),linetype=Outcome),size=1)
p


ggplot(dsl, aes(x=month, y=cost, group=interaction(Apt.,Outcome)))+
  geom_line(aes(color=factor(Apt.)))+ facet_grid(Outcome~.)



