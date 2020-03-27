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
uso.pontos1 <- rasterToPoints(uso, spatial = T)

#Let's check the new shapefile

plot(uso.pontos1)

# All the raster pixels were converted, including the ones with zero values. We need to remove them. First, let's check the name of the column

names(uso.pontos1)

# Now, let's remove the zero values

uso.pontos2 <- uso.pontos1[uso.pontos1$mapbiomas.2018.bhrd.1km > 0,]

plot(uso.pontos2)

#Saving the new shp file (without zero values)
writeOGR(uso.pontos2, "./output", "map-2018-bhrd-1km", driver = "ESRI Shapefile", overwrite_layer = T)

#plot the shp files with the raster file and saving it (only for exercising purpuses)
png("figs/figura02.png", res = 300, width = 2400, height = 1200,)
plot(uso)
plot(uso.pontos2, add = TRUE)
dev.off()
?png

##END
