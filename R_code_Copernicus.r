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
