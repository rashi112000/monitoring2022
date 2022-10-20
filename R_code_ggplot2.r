# Rcode for ggplot2 based graphs
library("ggplot2")
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





