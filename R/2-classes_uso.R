#################################################
### SCRIPT PARA checagem do NUMERO           ####
### DE CLASSES DE UM ARQUIVO SHP             ####
### Por: Danielle de O. Moreira              ####
#################################################

library(rgdal)
library(raster)

pontos <- readOGR(dsn = "./output", layer = "map-2018-bhrd-1km")

pontos

#How many features are in this spatial object?
length(pontos)

#How many attributes (columns) are there?
length(pontos@data)

#The spatial projection that the data are in
crs(pontos)

#The spatial extent (geographic area covered by) features in the object.
extent(pontos)

head(pontos@data)
tail(pontos@data)

#How to check the names of each attribute (each columns) for the spatial object.
names(pontos@data)

## view all attributes in the lines shapefile within the "m_2018_" field
pontos$m_2018_

# view unique values within the "m_2018_" attributes
levels(pontos@data$m_2018_)

#select a subset of features from a spatial object in R
#select features that are of m_2018_ "number of the class"

pontos[pontos$m_2018_ == "3",]

pontos[pontos$m_2018_ == "15",]

pontos[pontos$m_2018_ == "9",]

# save an object with only class 3 points
pontos_3 <- pontos[pontos$m_2018_ == "3",]
pontos_3

# how many features are in our new object
length(pontos_3)

#We can plot our subsetted shapefiles.
# plot just points of class 3
library(tmap)
tmap_options(bg.color = "black", main.title = "Formação florestal", main.title.color = "black")
tm_shape(pontos_3) + tm_dots(size = .3, col = "green")


#other simple way to plot
plot
plot(pontos_3,
     p = 1, col = 3, main = "Formação Florestal")

Mais
