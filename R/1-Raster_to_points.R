########################################################
### SCRIPT TO TRANSFORM RASTER FILE IN SHP (POINTS) ####
### Por: Danielle de O. Moreira                     ####
### Data: 26/03/2020                                ####
########################################################

library(raster)
library(rgdal)

#Creating an object with the raster file
uso <- raster("./data/mapbiomas-2018-bhrd-1km.tif")

#Information about the file
uso

#To plot a figure
plot(uso)

#TO save a figure
png("figs/figura01.png", res = 300, width = 2400, height = 1200)
plot(uso)
dev.off()

#To transform raster to points
uso.pontos <- rasterToPoints(uso, spatial=T)

uso.pontos

#Saving the shp file
writeOGR(uso.pontos, "./output", "map-2018-bhrd-1km", driver = "ESRI Shapefile")

#plot the shp files with the raster file and saving it (only for exercising purpuses)
png("figs/figura02.png", res = 300, width = 2400, height = 1200)
plot(uso)
plot(uso.pontos, add = TRUE)
dev.off()

##END
