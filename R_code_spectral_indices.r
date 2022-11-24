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

