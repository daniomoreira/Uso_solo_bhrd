#################################################
### SCRIPT TO CHECK INFORMATION OF A SHP TABLE###
### BY: Danielle de O. Moreira              ####
### DATE: 24 MAR 2020                        ####
#################################################

library(rgdal)
library(raster)

uso.pontos <- readOGR(dsn = "./output", layer = "mapbi-2018-bhrd")

uso.pontos

plot(uso.pontos)

#What is the dimension of the table? It gives the n of rowS and number of columns:
dim(uso.pontos)

#check number of lines of the object.
nrow(uso.pontos)

#Other information about the table.
summary(uso.pontos)
head(uso.pontos)
tail(uso.pontos)
head(uso.pontos@data)
tail(uso.pontos@data)

#How many features are in this spatial object?
length(uso.pontos)

#How many variables or attributes (columns) are there?
length(names(uso.pontos))
length(uso.pontos@data)

#How to check the names of each attribute (each columns) for the spatial object.
names(uso.pontos)
names(uso.pontos@data)

#The spatial projection that the data are in
crs(uso.pontos)

#The spatial extent (geographic area covered by) features in the object.
extent(uso.pontos)


## view all attributes in the lines shapefile within the "m_2018_" field
uso.pontos$m_2018_

# view unique values within the "m_2018_" attributes
levels(uso.pontos@data$m_2018_)

#select a subset of features from a spatial object in R
#select features that are of m_2018_ "number of the class"

uso.pontos[uso.pontos$m_2018_ == "3",]

uso.pontos[uso.pontos$m_2018_ == "15",]

uso.pontos[uso.pontos$m_2018_ == "9",]

# save an object with only class 3 points
pontos_3 <- uso.pontos[uso.pontos$m_2018_ == "3",]
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

#Changing the columns names of the table
p <- uso.pontos
dim(p)

col_name <- paste("classe")
#for more than one column use
#col_name <- paste ("col", 1:11, sep = "")

head(p)
names(p) <- col_name
head(p)

#Counting number of categories of the column "class':
table(p$classe)

#Calculating the area of each class. Each point is for a raster size of 1 km2 or 100 ha:
class_3 <- (18363*1)/100
class_3 #in ha
