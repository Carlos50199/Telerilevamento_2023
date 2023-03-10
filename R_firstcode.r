#First code in GitHub
#Installing raster package
install.packages("raster")

library(raster)

Settiamo in R la cartella nella quale lavoreremo Working directory
setwd("C:/Lab/")
#Parakana Indigenous Reserve, ultimo appezzamento rimasto di una porzione più grande della Forseta Amazzonica (Prov. di Belem)
#Dati satellitari Landsat 8, con path 224 row 63

l2011<-brick("p224r63_2011_masked.grd")
#cambiamo colore con colorRampPalette
