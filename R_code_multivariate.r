# community ecology example with R
# Multi variate analysis

# install.packages.("vegan")
library(vegan) # vegan means vegetation analysis
setwd("C:/lab/") #need to put the working directly
# downlaod the data from virtuale: and put it in Lab folder
# read.table() generally used to look at the data but that cannot be loaded with this function
# we will use load() function as the file we have is .R which is actually two whole projects in R and thus cannot be loaded with read.table()
# thus now using load to upload the R project
# we are going outside R inside the Lab folder so we are using "" 
load("biomes_multivar.RData") 
# now lets see the number off iles inside R project- it is called List - ls()
ls() # just displays the biomes and biomes types
biomes # it has 20 plots and we cannot have 20 dimensions so we have to squeeze the data into small dimensions
head(biomes)
biomes_types 
# using correspondance analysis called decorana() Detrended correspondance analysis
multivar <- decorana(biomes) #we are assigning the decorana to multivar and we are actually lokoing at the data called biomes
multivar  # thus compacted the data into these 4 columns,, plotted them in 2D
plot(multivar) 
# how to see biomes now and club the points of similar biomes together
attach(biomes_types) # using this table that is why we need to attach
# now we are using ordiellipse(), basically making an ellipse of all the similar plots in the same biomes under that ellipse
# ordiellipse(multivar, type, col=c("black","red","green","blue"), kind = "ehull", lwd=3)
# type of ellipse, this argument tells that we are plotting different columns and
# lwd is line width
ordiellipse(multivar, type, col=c("black", "coral", "blue", "green"), kind="ehull", lwd=3)
