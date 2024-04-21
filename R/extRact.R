#' Extract Raster Values Based on Shapefile
#'
#' This function extracts raster values based on the polygons defined in a shapefile.
#' It assigns factor levels from the shapefile and removes the first column (ID)
#' from the resulting data frame.
#'
#' @param img A Raster* image representing the raster data.
#' @param shp A SpatialPolygonsDataFrame object representing the shapefile data.
#'
#' @return A data frame containing the extracted raster values.
#' @import raster
#' @importFrom utils str
#' @export
#'
#' @examples
#' \dontrun{
#' extracted_data <- extRact(img, shp)
#' }
extRact <- function(img, shp) {
  # Extracting raster values
  smp <- raster::extract(img, shp, df = TRUE)
  cat("Extracted raster values:\n")
  print(smp)

  # Assigning factor levels from shapefile
  smp$cl <- as.factor(shp$Class[match(smp$ID, seq(nrow(shp)))])

  # Removing the first column (ID)
  smp <- smp[-1]

  # Summary of factor levels
  cat("Summary of factor levels:\n")
  print(summary(smp$cl))

  # Structure of data frame
  cat("Structure of data frame:\n")
  str(smp)

  return(smp)
}

