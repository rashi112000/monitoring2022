# downloaded data from copernicus

install.packages("ncdf4")
library(ncdf4) # used for reading .nc files
library(raster) # usual package
library(ggplot2) # used for beautiful plots
library(RStoolbox) # for ggplot2
library(viridis) # legends- color gamut
library(patchwork) # multiframe for ggplot

setwd("C:/Lab/")
# using raster function instead of brick function because it is used to import data- one layer per type/ one layer at a time
snow <- raster("c_gls_SCE_202012210000_NHEMI_VIIRS_V1.0.1.nc")
snow
# exercise- plot snow cover with ggplot and viridis

plot(snow)

ggplot() + geom_raster(snow, mapping= aes(x=x, y=y, fill=Snow.Cover.Extent)) + scale_fill_viridis(option="inferno")

# instead of using whole data, we will use data concerning to europe 
# we wull trim/cut the data using coordinates
ext <- c(-20, 70, 20, 75) # (min x, max x, min y, max y) assigning coordinates 
crop(snow, ext) # now we are cropping the data using crop fucntion 
snow.europe <- crop(snow, ext)
ggplot() + geom_raster(snow.europe, mapping = aes(x=x, y=y, fill=Snow.Cover.Extent)) + scale_fill_viridis(option="inferno")

# plot 2 sets with patchwork
library(patchwork)
p1 <- ggplot() + geom_raster(snow, mapping= aes(x=x, y=y, fill=Snow.Cover.Extent)) + scale_fill_viridis(option="inferno")
p2 <- ggplot() + geom_raster(snow.europe, mapping = aes(x=x, y=y, fill=Snow.Cover.Extent)) + scale_fill_viridis(option="inferno")
p1 + p2
