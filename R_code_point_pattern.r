# This is a point pattern anaylysis for population ecology
# importing the data 
# use of working data
setwd("C:/lab/")
# now we will read the table
read.table("covid_agg.csv")
covid <- read.table("covid_agg.csv", header=T) #putting header True so that it reads the heading
head(covid)
  attach(covid) # in order to find lon
# Now, let's see the density of the covid data!
# using the points simply to undesertand the density of the plot
library(spatstat)
# now explain to packeage to pass from points to planar point pattern
# let's make a planar point pattern in spatstat
# the function we use is ppp(), applying ppp to covid, if we have two axes, we need to explain the two coordinates
# also putting the range of the values for both longitude and latitude
ppp(x= lon, y= lat, c(-180,180), c(-90,90)) # since putting the range includes two coordinates(-180 to 180), it becomes an array and we need to put c()
covid_planar <- ppp(x= lon, y= lat, c(-180,180), c(-90,90))
# covid_planar <- ppp(x= lon, y= lat, c(-180,180), c(-90,90))  WE CAN USE TJIS IF WE DON'T ATTACH COVID


# WITHOUT ATTACHING COVID
covid_planar <- ppp(x= lon, y= lat, c(-180,180), c(-90,90))
density_map <- density(covid_planar)
plot(density_map)
points(covid_planar) # cannot use plot as it will overwrite the previous "plot" function
points(covid_planar, pch=19)
# changing colors
#cl <- colorRampPalette(c('yellow', 'orange', 'red'))
cl <- colorRampPalette(c("cyan", "coral", "chartreuse")) (100) 
# the number 100 is being used to choose how many variations of the color while transitioning from one color to another
plot(density_map, col=cl)
points(covid_planar, pch=17)

# changing colors, size
cl <- colorRampPalette(c("red", "blue", "green")) (300)
plot(density_map, col=cl)
points(covid_planar, pch=17)

cl <- colorRampPalette(c("pink", "green", "blue")) (500)
plot(density_map, col=cl)
points(covid_planar, pch=8)

cl <- colorRampPalette(c("deeppink1", "green", "blue")) (1000)
plot(density_map, col=cl)
points(covid_planar, pch=8)

# install package- rgdal
install.packages("rgdal")
# downlaod the data from virtaule- coastline one
# then put all the data in the Lab folder in Windows C
setwd("C:/Lab/")
library(rgdal)
# let's add the coastlines with readOGR
# readOGR meaning points having geometry/ coordinates- it is a vector
coastlines <- readOGR("ne_10m_coastline.shp") # file with the extension .shp
coastlines

# let us rebuild the map we build yesterday
covid <- read.table("covid_agg.csv", header=T)
head(covid)
attach(covid)
covid_planar <- ppp (x=lon, y=lat, c(-180,180), c(-90,90)) 
# explaining from where we are taking the longitudes and latitude values and then explaining the range of the data 
plot(covid_planar)
plot(coastlines, add=T) # need to add here add()- basically adding coastlines to our previod covid planar plot
# now adding density to the previous function
density_map <- density(covid_planar)
plot(density_map)
points(covid_planar, pch=8, col="white") # of covid planar
plot(coastlines, add=T)
plot(coastlines, add=T, col="yellow")
head(covid)
# now focusing on abundance
# using marks we can tell tell R where the points are so that with the help of interpolation(of the point data on field), we will find abundance

# INTERPOLATE CASE DATA
attach(covid)
marks(covid_planar) <- cases # marks mean points with a label
# now using a fucntion for interpolation that is Smooth()
cases_map <- Smooth(covid_planar) # we get a warning here because the points used to make the map aren't enough, no issue though
cl <- colorRampPalette(c("pink", "green", "blue")) (500)
plot(cases_map, col=cl)
points(covid_planar, pch=8, col="black")
plot(coastlines, add=T, col="black")
