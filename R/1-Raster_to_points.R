#################################################
### SCRIPT PARA TRANSFORMAR RASTER EM PONTOS ####
### Por: Danielle de O. Moreira              ####
#################################################

library(raster)
library(rgdal)


uso <- raster("./data/mapbiomas-2018-bhrd-1km.tif")

uso.pontos <- rasterToPoints(uso, spatial=T)

#Salvar o arquivo em shp
writeOGR(uso.pontos, "./output", "map-2018-bhrd-1km", driver = "ESRI Shapefile")

plot(uso.pontos)

uso.pontos

##END
