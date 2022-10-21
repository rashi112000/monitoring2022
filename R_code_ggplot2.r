# Rcode for ggplot2 based graphs
library(ggplot2) # quotes are not to be used with library, quotes only to be  used when we move out of R, Use a text or color
library(ggplot2)
# ecological dataframe 
virus <- c(10, 30, 40, 50, 60, 80)
death <- c(100, 240, 310, 470, 580, 690)
virus
death
plot(virus,death)
plot(virus,death, pch=19, cex=2)
# how to make a table- table is called DATA FRAME
# the function to create data frame is "data.frame()"
data.frame(virus,death)
d <- data.frame(virus,death) # assigning dataframe to an object- d
summary(d) # to look at statistical fields
# the data we are using here is d
# now going to use ggplot(_, aes()) + geom_point 
# geom_point is used to explain the kind of geomatry you want to use for the plot
# aes- what are the variables to do the plot
# please keep the spacing uniform
ggplot(d, aes(x=virus, y=death)) + geom_point()
ggplot(d, aes(x=virus, y=death)) + geom_point(size=3, col="blue") # to increase size, we can put that function with geom
ggplot(d, aes(x=virus, y=death)) + geom_point(size=3, col="coral", pch=8)
ggplot(d, aes(x=virus, y=death)) + geom_line() # instead of geom points, we are using lines, the function is geom_line
# we can join different functions together
# we can use geom line and point together
ggplot(d, aes(x=virus, y=death)) + geom_point(size=3, col="coral", pch=8) + geom_line() # to change the color of line, geom(col=)
# we can use geom polygon as well
ggplot(d, aes(x=virus, y=death)) + geom_point(size=3, col="blue", pch=8) + geom_line(col="coral")
ggplot(d, aes(x=virus, y=death)) + geom_polygon()


install.packages("spatstat")


# 21 OCTOBER 2022
# importing files
# we make a folder in our laptops, NOT on desktop- make it on C or D drive in order to have shortest path
# creating folder called Lab- download file from virtuale- save it in lab folder
# setwd()- set (something) wd- working directory
# Let's make our own data from outside R
# we will explain to R the path of our directory
setwd("C:/Lab/") # setwd for Windows # setwd("C:/lab/")
# if you get "+" in en error it means you have not closed the path yet
# the function to read the file is read.table("file", header= FALSE/TREU, sep="" )
# file- name of the file, here it is covid--
# header meaning cloumns having names
# sep meaning seperator- a symbols existing which seperates the colummns
read.table("covid_agg.csv")
covid <- read.table("covid_agg.csv", header= TRUE) # if we don't put headers, R cannot read the headings and puts variables against them
head(covid)
covid <- read.table("covid_agg.csv", header= T) # True can be repalced with "T" and header with "head"
summary(covid)
#now making a plot of the points
#ggplot(data="", aes=x and y)
ggplot(covid, aes(x=lon, y=lat)) + geom_point(col="blue", size=3)
ggplot(covid, aes(x=lon, y=lat, size=cases)) + geom_point(col="red") # can change the size of variables to "cases"  as it is numerical and we are not setting the size
ggplot(covid, aes(x=lon, y=lat, size=cases)) + geom_point(col="blue", pch=8)
