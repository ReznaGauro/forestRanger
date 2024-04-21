# forestRanger

Introducing foRestRanger: Your Guide to Exploring Forests 🌲

Explore forests like never before with foRestRanger, your all-in-one toolkit to map forest types. Seamlessly integrate satellite raster imagery and shapefiles to extract precise samples, train Random Forest models, and visualize classification results.

Welcome to the future of geospatial forest exploration with foRestRanger :)

# Installation

`#ffffff`You can install the development version of forestRanger from Github <https://github.com/> with:

`#ffffff`install.packages("devtools")

`#ffffff`devtools::install_github("ReznaGauro/forestRanger")

# Examplary usage - "forestRanger" in action:
install.packages("devtools")
library(devtools)
devtools::install_github("ReznaGauro/forestRanger")
library(forestRanger)

## Install and load dependencies
library(raster)
library(sp)
library(rgdal)
library(utils)
library(randomForest)

setwd("D:/MSc_EAGLE/RPackage_Resources") ## Setting up the directory
list.files() ## Listing the files

## loaData function from the package "forestRanger" to get spatial information
forest <- loaData(raster_path = "AOI.tif", shapefile_path = "TrainingPoints.shp")

This function generates the spatial information of the raster and shapefile:
(Example below)
> forest <- loaData(raster_path = "AOI.tif", shapefile_path = "TrainingPoints.shp")
Loaded raster data:
class      : RasterBrick 
dimensions : 8031, 7941, 63774171, 7  (nrow, ncol, ncell, nlayers)
resolution : 30, 30  (x, y)
extent     : 457185, 695415, 6075885, 6316815  (xmin, xmax, ymin, ymax)
crs        : +proj=utm +zone=32 +datum=WGS84 +units=m +no_defs 
source     : AOI.tif 
names      : AOI_1, AOI_2, AOI_3, AOI_4, AOI_5, AOI_6, AOI_7 
min values :     5,   178,   237,  1977,  6652,  6613,  7020 
max values : 61299, 62003, 65454, 65454, 64781, 65454, 65454 
OGR data source with driver: ESRI Shapefile 
Source: "D:\MSc_EAGLE\RPackage_Resources\TrainingPoints.shp", layer: "TrainingPoints"
with 293 features
It has 3 fields
Loaded shapefile:
class       : SpatialPointsDataFrame 
features    : 293 
extent      : 4346058, 4375937, 3675015, 3704839  (xmin, xmax, ymin, ymax)
crs         : +proj=laea +lat_0=52 +lon_0=10 +x_0=4321000 +y_0=3210000 +ellps=GRS80 +units=m +no_defs 
variables   : 3
names       : Latitude,   Longitude,       Class 
min values  : 56.17699,    10.40584, Broadleaved 
max values  : 56.44598, 10.88891188,       Water 
Labels of shapefile:
1 Broadleaved 
2 Coniferious 
3 Others 
4 Water



