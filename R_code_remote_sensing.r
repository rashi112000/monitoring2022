# R code for remote sensing data analysis in ecosystem monitoring
# download raster package through install.packages("")
install.packages("raster")
# then download the data from virtuale, remote sensing data and save it in Lab folder 
library(raster)
# need to set the working directory, thus using setwd("")
setwd("C:/lab/")
# the data we are using is a stack of several layers so to import this kind of data, we use the function brick("") to form a raster brick
brick("p224r63_2011_masked.grd") # the kind of file we are using has extension .grd
# we take the function and are now assigning it to an object
p224r63_2011 <- brick("p224r63_2011_masked.grd")
p224r63_2011 # the kind of data we are using is RasterBrick- it is basically bands one on top of the other
# resolution explains the size of each pixel, here it is 30m by 30m
# crs explains coordinates
# le us plot the different bands one beside the other
plot(p224r63_2011)
# the error where you have no error but the system closes, you can use the function dev.off(), it will close the plot and rthen you can plot it again
cl <- colorRampPalette(c("black", "grey", "light grey")) (200) # the white part means it has no data
plot(p224r63_2011, col=cl)
