# forestRanger

Introducing foRestRanger: Your Guide to Exploring Forests 🌲

Explore forests like never before with foRestRanger, your all-in-one toolkit to map forest types. Seamlessly integrate satellite raster imagery and shapefiles to extract precise samples, train Random Forest models, and visualize classification results.

Welcome to the future of geospatial forest exploration with foRestRanger :)

# Installation

You can install the development version of forestRanger from Github <https://github.com/> with:
install.packages("devtools")
devtools::install_github("ReznaGauro/forestRanger")

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
