# This is a point pattern anaylysis for population ecology
# importing the data 
# use of working data
setwd("C:/lab/")
# now we will resd the table
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
cl <- colorRampPalette(c("cyan", "coral", "chartreuse")) (100) # the number 100 is being used to choose how many variations can be used
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
