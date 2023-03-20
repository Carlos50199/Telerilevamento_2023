#First code in GitHub
#Installing raster package
install.packages("raster")

library(raster)
#Setting Working directory (folder Lab) in Microsoft
setwd("C:/Lab/")

#Parakanã Indigenous Reserve, last portion of Amazon Forest in near Belem (Paranà State,Brasil)
#Landsat 8 data, path 224 row 63
l2011<-brick("p224r63_2011_masked.grd")
#changing plot color w/ colorRampPalette
cl <- colorRampPalette(c("cadetblue1", "darkblue", "darkred")) (100)
plot(l2011, col=cl)

#Landast imagine made by 7 different bands in a single image, one for each color:
# b1 = blue
# b2 = green
# b3 = red
# b4 = NIR
#plotting just blue layer
plot(l2011$B1_sre)
#plotting just NIR layer 
plot(l2011$B4_sre) 
#or 
plot(l2011[[4]])
#closing plot 
dev.off()

#exporting chart from R
#1° step
pdf("first_graph.pdf") #naming file, pdf or png form. W/ working directory is saved directly in the selected folder (here "Lab")
#2° step
plot(l2011$B4_sre) #selecting the plot, here only NIR photo
#3° step
dev.off() #closing every open plot

# plotting specific layer in the block w/ function |par(mf)|
#setting row & column (n° row, n° column), c for binding 
par(mfrow=c(2,1))
#selecting the images
plot(l2011$B3_sre)
plot(l2011$B4_sre)
#plotting the first 4 layer, 1 color for each image
#blue
clb <- colorRampPalette(c("blue4", "blue2", "light blue")) (100) #naming plot, choosing colors
plot(l2011$B1_sre, col=clb) #plotting 
#green
clg <- colorRampPalette(c("chartreuse4", "chartreuse2", "chartreuse")) (100)
plot(l2011$B2_sre, col=clg)
#red
clr <- colorRampPalette(c("brown1", "coral2", "coral4")) (100)
plot(l2011$B3_sre, col=clr)
#near infrared 
clin <- colorRampPalette(c("chocolate1", "darkgoldenrod2", "darkgoldenrod4")) (100)
plot(l2011$B3_sre, col=clin)

#Creating an RGB image, letters r/g/b linked w/ desidered band
# b1 = blue
# b2 = green
# b3 = red
# b4 = NIR
#stretch=increase the contrast of the image, can be [="lin"] or [="hist"]
plotRGB(l2011,r=3,g=2,b=1, stretch="lin") #image w/ every layer with the right letter and linear stretch
#r=red; g=green; b=blue
plotRGB(l2011,r=3,g=2,b=1,) # same image as before without stretch
plotRGB(l2011, r=3, g=2, b=3, stretch="Lin") #highlight plants
plotRGB(l2011,r=4,g=3,b=2, stretch="lin") #plants highlighted in red
plotRGB(l2011,r=3,g=4,b=2, stretch="lin") #plants highlighted in green, fields in purple
#plotRGB(l2011, r=3, g=2, b=3, stretch="lin") ora tutte le piante diventanno verde
plotRGB(l2011,r=3, g=2, b=4, stretch="lin") #plants in blue, bare ground (probably fields) in yellow

