# classification of data and finding out the theshold

# club it with the last code 
# THE LAST CODE
# Calculating spectral/ vegetation indices from remote sensing
install.packages("rgdal")
install.packages("RStoolbox")
install.packages("rasterdiv")
library(rgdal)
library(raster)
setwd("C:/lab/")
l1992 <- brick("defor1.png")
l1992
plotRGB(l1992, r=1, g=2, b=3, stretch= "lin")
l2006 <- brick("defor2.png")
plotRGB(l2006, r=1, g=2, b=3, stretch= "lin")
par(mfrow=c(2,1))
plotRGB(l1992, r=1, g=2, b=3, stretch= "lin")
plotRGB(l2006, r=1, g=2, b=3, stretch= "lin")
# this shows the same image in 2 different years, the key points to notice could be: 1. river 2. patch of forest?!
# range of the image is 0-255 as most inages have 8 bits in them and 1 bit = 2^n number of information , so 2^8=256, thus 255 
dvi1992 <- l1992[[1]]- l1992[[2]]
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100)
plot(dvi1992, col=cl)
dvi2006 <- l2006[[1]]- l2006[[2]]
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100)
plot(dvi2006, col=cl)



library(raster)
library(RStoolbox)
# function to do the classification is called "unsuperClass()", software does the work on it's own

# threshold for trees
d1c <- unsuperClass(l1992, nClasses=2) # first classified image
plot(d1c$map)

# Classification of 1992
# class 1: human impact - 34219
# class 2: forest- 307073
 freq(d1c$map)
 # forest cover
 f1992 <- 307073/(307073+34219) # 0.8997369
 # human impact 
 h1992 <- 34219/(307073+34219) # 0.1002631
 
 # Classification of 2006
 d2c <- unsuperClass(l2006, nClasses=2)
 plot(d2c$map)
 # class 1: human impact - 164304
# class 2: forest- 178422
freq(d2c$map)
f2006 <- 164304/(164304+178422) # 0.5205966 
h2006 <- 178422/(164304+178422) # 0.4794034

# function for making tables is data.frame()
landcover <- c("Forest", "Humans")
percent_1992 <- c(89.97, 10.23)
percent_2006 <- c(52.05, 47.97)
perc <- data.frame(landcover, percent_1992, percent_2006)
library(ggplot2) # for the final histogram plot
ggplot(perc, aes(x=landcover, y=percent_1992, color=landcover)) + geom_bar(stat="identity", fill="pink")
# used geom_points for covid, now we are using bars instead of bars
# identity in stat meaning you don't want to change the values to mean or median, you are using the values which are given by us, as it is
# now doing the same for the year 2006
ggplot(perc, aes(x=landcover, y=percent_2006, color=landcover)) + geom_bar(stat="identity", fill="pink") 

# patch work can be used to craete multiframes without using the function par(mfrow=())
install.packages("patchwork")
library(patchwork)
# assigning ggplot to an object
p1 <- ggplot(perc, aes(x=landcover, y=percent_1992, color=landcover)) + geom_bar(stat="identity", fill="pink")
p2 <- ggplot(perc, aes(x=landcover, y=percent_2006, color=landcover)) + geom_bar(stat="identity", fill="pink") 
p1 + p2

# instead of putting on plot beside another, now let's put one plot on top of the other
p1 / p2


# GG plot in RGB
library(raster)
library(RStoolbox)
setwd("C:/lab/")

#rgb # band=1 = NIR
plotRGB(l1992, r=1, g=2, b=3, stretch="lin") # can plot this using ggRGB directly
ggRGB(l1992,1,2,3)

dvi1992 <- l1992[[1]]- l1992[[2]]
plot(dvi1992)

ggplot() + geom_raster(dvi1992, mapping=aes(x=x, y=y, fill=layer)) # fill=layer, we used dvi1992 to see the name of the layer we want to plot and the name of the layer here is layer


# using a package so that colorblind people can understand 
install.packages("viridis")
library(viridis)
ggplot() + geom_raster(dvi1992, mapping=aes(x=x, y=y, fill=layer)) + scale_fill_viridis(option="magma")

# error <ScaleContinuous>
 Range:  
 Limits:    0 --    1

# this error was coming because viridis could not recognise the previous plot, so you write the whole again

# EXERCISE

p1 <- ggplot() + geom_raster(dvi1992, mapping=aes(x=x, y=y, fill=layer)) + scale_fill_viridis(option="magma")
p2 <- ggplot() + geom_raster(dvi2006, mapping=aes(x=x, y=y, fill=layer)) + scale_fill_viridis(option="cividis")

p1 + p2

