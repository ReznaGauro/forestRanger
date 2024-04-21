#' Load Raster and Shapefile Data
#'
#' This function loads raster and shapefile data from specified paths. It prints
#' information about the loaded data, including the raster data, shapefile data,
#' and labels of the shapefile.
#'
#' @param raster_path Path to the raster file.
#' @param shapefile_path Path to the shapefile.
#'
#' @return A list containing the loaded raster and shapefile data.
#' @import raster
#' @import rgdal
#'
#' @export
#'
#' @examples
#' \dontrun{
#' # Load raster and shapefile data from "inst/extdata" folder
#' raster_path<- "AOI.tif"
#' shapefile_path <- "TrainingPoints.shp"
#' loaData(raster_path, shapefile_path)
#' }
loaData <- function(raster_path, shapefile_path) {
  # Loading raster data
  img <- raster::brick(raster_path)
  cat("Loaded raster data:\n")
  print(img)

  # Loading shapefile
  shp <- rgdal::readOGR(dsn = shapefile_path)
  cat("Loaded shapefile:\n")
  print(shp)

  # Check labels of shapefile
  cat("Labels of shapefile:\n")
  levels_factor <- levels(as.factor(shp$Class))
  for (i in seq_along(levels_factor)) {
    cat(paste0(i, " ", levels_factor[i]), "\n")
  }

  return(list(raster_data = img, shapefile_data = shp))
}

