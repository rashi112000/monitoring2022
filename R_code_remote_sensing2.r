# missed lecture 1 of this class so now we continue here and try and figure it out later!! 18/11/2022
# clubbing this with the previous one will work!


setwd("C:/lab/")
# .grd is being used as it is grid and put everything else in Lab folder
p224r63_1988 <- brick("p224r63_1988_masked.grd") # taking all the blue green red bands togethere inside R altogthere as an image
p224r63_1988
# importing 2011 data
p224r63_2011 <- brick("p224r63_2011_masked.grd")
p224r63_2011

# now plotting the data from 2011 and 1988 agaianst each other? using plotRGB("")
#plotRGB() # plotRGB(x, r=1, g=2, b=3, scale, maxpixels=500000, stretch=NULL) # b1= blue, b2=green b3= red and b4=yellow = (actually in near infrared)
# doing it for data for the year 1988
plotRGB(p224r63_1988, r=3, g=2, b=1, stretch="lin") # assigning red blue and green colrs to the bands present in the data assigned to us- the diffrent bands present
# using the strech function for: 
# moving one band up, b2 is blue, b3 is green and b4 is red now 
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="lin")
plotRGB(p224r63_1988, r=3, g=4, b=2, stretch="lin")

# exercice: make a multiframe with 2 rows and 1 column 
# ploting 1988 and 2011 images: one on top of the other 

par(mfrow=c(2,1))
plotRGB(p224r63_1988, r=3, g=2, b=4, stretch="lin")
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="lin")

