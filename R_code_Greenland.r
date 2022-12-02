# 3 IMPORTANT FUNCTION WE ARE GOING TO USE TODAY
# L APPLY FUNCTION 
# STACK FUNCTION 

# Time series analysis
# Greenland increase of temperature
# Data and code from Emanuela Cosma

library(raster)
# we have single images of LST- land surface temp- we don't have latitude long file
setwd("C:/Lab/")
lst_2000 <- raster("lst_2000.tif")
lst_2000

# Exercise : plot the lst_2000 with ggplot()

library(RStoolbox) # please use this, do not forget
library(ggplot2)
library(viridis)
ggplot() + geom_raster(lst_2000, mapping = aes(x=x, y=y, fill=lst_2000)) + scale_fill_viridis(option="magma") 
# if we want to reverse the direction of color, we put direction as -1 and this will switch the direction
ggplot() + geom_raster(lst_2000, mapping = aes(x=x, y=y, fill=lst_2000)) + scale_fill_viridis(option="magma", direction = -1)
# in order to put title
ggplot() + geom_raster(lst_2000, mapping = aes(x=x, y=y, fill=lst_2000)) + scale_fill_viridis(option="magma", direction = 1) + ggtitle("Temperature 2000") # changed the direction back to 1
ggplot() + geom_raster(lst_2000, mapping = aes(x=x, y=y, fill=lst_2000)) + scale_fill_viridis(option="magma", direction = 1, alpha = 0.2) + ggtitle("Temperature 2000")
# using alpha to decrease the darkness of the image

# uploading all files 
lst_2005 <- raster("lst_2005.tif")
lst_2005

lst_2010 <- raster("lst_2010.tif")
lst_2010

lst_2015 <- raster("lst_2015.tif")
lst_2015

par(mfrow= c(2,2))
plot(lst_2000)
plot(lst_2005)
plot(lst_2010)
plot(lst_2015)

# this is okay if we have less data but what if we have 1000 of images? we use LOOP fucntion- L APPLY function lapply()
# this function can be applied to a list of files, so now we make a list of files by using list.files() function

# list.files(path not needed since we used setwd, pattern needs to be set, like here it is lst)
rlist <- list.files(pattern="lst")

# exercise: list: rlist, function: the function we need to import
# lapply(X, FUN)
import <- lapply(rlist, raster)
import

# now we use stack function, used to stack images together
TGr <- stack(import)
TGr
plot(TGr)

ggplot() + geom_raster(TGr$lst_2000, mapping = aes(x=x, y=y, fill=lst_2000)) + scale_fill_viridis(option="magma", direction = 1, alpha = 0.8) + ggtitle("Temperature 2000")
# or ggplot() + geom_raster(TGr[[1]], mapping = aes(x=x, y=y, fill=lst_2000)) + scale_fill_viridis(option="magma", direction = 1, alpha = 0.8) + ggtitle("Temperature 2000")

library(patchwork)
p1 <- ggplot() + geom_raster(TGr$lst_2000, mapping = aes(x=x, y=y, fill=lst_2000)) + scale_fill_viridis(option="magma", direction = 1, alpha = 0.8) + ggtitle("Temperature 2000")
p2 <- ggplot() + geom_raster(TGr$lst_2015, mapping = aes(x=x, y=y, fill=lst_2015)) + scale_fill_viridis(option="magma", direction = 1, alpha = 0.8) + ggtitle("Temperature 2015")

p1+ p2

g1 <- ggplot() + geom_raster(TGr$lst_2000, mapping = aes(x=x, y=y, fill=lst_2000)) + scale_fill_viridis(option="magma", direction = -1, alpha = 0.8) + ggtitle("Temperature 2000")
g2 <- ggplot() + geom_raster(TGr$lst_2015, mapping = aes(x=x, y=y, fill=lst_2015)) + scale_fill_viridis(option="magma", direction = -1, alpha = 0.8) + ggtitle("Temperature 2015")

g2 + g1

g1 <- ggplot() + geom_raster(TGr$lst_2000, mapping = aes(x=x, y=y, fill=lst_2000)) + scale_fill_viridis(option="magma", direction = 1, alpha = 0.8) + ggtitle("Temperature 2000")
g2 <- ggplot() + geom_raster(TGr$lst_2015, mapping = aes(x=x, y=y, fill=lst_2015)) + scale_fill_viridis(option="magma", direction = 1, alpha = 0.8) + ggtitle("Temperature 2015")

g2 + g1

# exercise make differnce between 2015 and 2000
2015 - 2000
diff <- TGr[[4]] - TGr [[1]]

p3 <- ggplot() + geom_raster(diff, mapping = aes(x=x, y=y, fill=layer)) + scale_fill_viridis(option="magma", direction = 1, alpha = 0.8) + ggtitle("Difference over the years 1015-20000")

p1 + p2 + p3

# PLOTRGB

plotRGB(TGr, r=1, g=2, b=4, stretch="lin")


# you have another package called colorist 
