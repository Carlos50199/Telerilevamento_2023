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

#Landast images made by 7 different bands in a single image, one for each color:
# 1 = blue
# 2 = green
# 3 = red
# 4 = NIR
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
#[lin] scala valori linearmente 
#[hist] amplifica valori estremi
plotRGB(l2011,r=3,g=2,b=1, stretch="lin") #image w/ every layer with the right letter and linear stretch
#r=red; g=green; b=blue
plotRGB(l2011,r=3,g=2,b=1,) # same image as before without stretch
plotRGB(l2011, r=3, g=2, b=3, stretch="Lin") #highlight plants
plotRGB(l2011,r=4,g=3,b=2, stretch="lin") #plants highlighted in red
plotRGB(l2011,r=3,g=4,b=2, stretch="lin") #plants highlighted in green, fields in purple
plotRGB(l2011, r=3, g=2, b=3, stretch="lin") #ora tutte le piante diventanno verde
plotRGB(l2011,r=3, g=2, b=4, stretch="lin") #plants in blue, bare ground (probably fields) in yellow#

#importing 1988 Landsat images
l1988<-brick("p224r63_1988_masked.grd")
#creating multiframe w/ 2011 RGB image and 1988 RGB image (natural color) |par(mf)|
par(mfrow=c(2;1))
plotRGB(l2011, r=3, g=2, b=3, stretch="Lin")
plotRGB(l1988, r=3, g=2, b=3, stretch="Lin")
#creating multiframe w/ 2011 RGB image and 1988 RGB image, both linear and histographic stretch
par(mfrow=c(2,2))
> plotRGB(l1988,r=4,g=3,b=2, stretch="lin")
> plotRGB(l2011,r=4,g=3,b=2, stretch="lin")
> plotRGB(l1988,r=4,g=3,b=2, stretch="hist")
> plotRGB(l2011,r=4,g=3,b=2, stretch="hist")
#now save as pdf 
pdf("1988_vs_2011_Lin_Hist.pdf")
par(mfrow=c(2,2))
plotRGB(l1988,r=4,g=3,b=2, stretch="lin")
plotRGB(l2011,r=4,g=3,b=2, stretch="lin")
plotRGB(l1988,r=4,g=3,b=2, stretch="hist")
plotRGB(l2011,r=4,g=3,b=2, stretch="hist")
dev.off()

#indici di uso del suolo tramite indice di vegetazione legato alla differenza tra red e NIR

#just copying
library(raster)

setwd("~/lab/") # Linux
# setwd("C:/lab/") # Windows
# setwd("/Users/name/Desktop/lab/") # Mac

# Exercise: import the first file -> defor1_.jpg -> give it the name l1992
l1992 <- brick("defor1_.png")

plotRGB(l1992, r=1, g=2, b=3, stretch="lin")

# layer 1 = NIR
# layer 2 = red
# layer 3 = green


# Exercise: import the second file -> defor2_.jpg -> give it the name l2006
l2006 <- brick("defor2_.png")

# l2006 <- brick("p224r63_2011.grd")
l2006

plotRGB(l2006, r=1, g=2, b=3, stretch="lin")

# Exercise: plot in a multiframe the two images with one on top of the other
par(mfrow=c(2,1))
plotRGB(l1992, r=1, g=2, b=3, stretch="lin")
plotRGB(l2006, r=1, g=2, b=3, stretch="lin")

# DVI Difference Vegetation Index
dvi1992 = l1992[[1]] - l1992[[2]]
# or:
# dvi1992 = l1992$defor1_.1 - l1992$defor1_.2
dvi1992

cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) # specifying a color scheme
plot(dvi1992, col=cl)

# DVI Difference Vegetation Index
dvi2006 = l2006[[1]] - l2006[[2]]
dvi2006

plot(dvi2006, col=cl)


# DVI difference in time
dvi_dif = dvi1992 - dvi2006
cld <- colorRampPalette(c('blue','white','red'))(100)
plot(dvi_dif, col=cld)

#- day 2

# Range DVI (8 bit): -255 a 255
# Range NDVI (8 bit): -1 a 1

# Range DVI (16 bit): -65535 a 65535
# Range NDVI (16 bit): -1 a 1

# Hence, NDVI can be used to compare images with a different radiometric resolution

# NDVI 1992
dvi1992 = l1992[[1]] - l1992[[2]]
ndvi1992 = dvi1992 / (l1992[[1]] + l1992[[2]])
# or
ndvi1992 = (l1992[[1]] - l1992[[2]]) / (l1992[[1]] + l1992[[2]])

cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) # specifying a color scheme
plot(ndvi1992, col=cl)

# multiframe con il plotRGB dell'immagine sopra
# e l'ndvi sotto

# Multiframe with plotRGB on top of the NDVI image
par(mfrow=c(2,1))
plotRGB(l1992, r=1, g=2, b=3, stretch="lin")
plot(ndvi1992, col=cl)

# 2006
ndvi2006 = dvi2006 / (l2006[[1]] + l2006[[2]])

# Multiframe with NDVI1992 on top of the NDVI2006 image
par(mfrow=c(2,1))
plot(ndvi1992, col=cl)
plot(ndvi2006, col=cl)
