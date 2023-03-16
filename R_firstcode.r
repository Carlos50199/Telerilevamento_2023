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
cl <- colorRampPalette(c("cadetblue1", "darkblue", "darkred")) (100)
plot(l2011, col=cl)

# b1 = blu
# b2 = verde
# b3 = rosso
# b4 = infrarosso vicino NIR
#plottiamo solo banda blu
plot(l2011$B1_sre)
#plottiamo solo la banda del NIR
plot(l2011$B4_sre)
#or
plot(l2011[[4]])
#chiudere plot 
dev.off()
#per esportare grafici da R
pdf("first_graph.pdf")
#plottiamo immagine da esportare
plot(l2011$B4_sre)
#chiudiamo plot
dev.off()
#multiframe più parti nello stesso blocco (qui in immagine con due bande)
#distribuisco parti per righe/colonne
par(mfrow=c(2,1))
#poi inserisco le immagini da plottare
plot(l2011$B3_sre)
plot(l2011$B4_sre)
#plottiamo le prime 4 bande, un colore layer
#blu
clb <- colorRampPalette(c("blue4", "blue2", "light blue")) (100)
plot(l2011$B1_sre, col=clb)

clg <- colorRampPalette(c("chartreuse4", "chartreuse2", "chartreuse")) (100)
plot(l2011$B2_sre, col=clg)

clr <- colorRampPalette(c("brown1", "coral2", "coral4")) (100)
plot(l2011$B3_sre, col=clr)

clin <- colorRampPalette(c("chocolate1", "darkgoldenrod2", "darkgoldenrod4")) (100)
plot(l2011$B3_sre, col=clin)

