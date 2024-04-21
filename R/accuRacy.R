#' Calculate Classification Accuracy Metrics
#'
#' This function calculates classification accuracy metrics, including user's accuracy (UA),
#' producer's accuracy (PA), and overall accuracy (OA), based on a classified image and
#' reference shapefiles for training and validation.
#'
#' @param classified_img A Raster* object representing the classified image.
#' @param training_shapefile Path to the training shapefile.
#' @param validation_shapefile Path to the validation shapefile.
#'
#' @return A list containing the accuracy matrix, user's accuracy, producer's accuracy, and overall accuracy.
#' @import raster
#' @import sp
#' @import rgdal
#' @export
#'
#' @examples
#' \dontrun{
#' # Train the Random Forest model
#' rf_model <- tRain(smp)
#' # Obtain classification result
#' classification_file <- Ranger(img, rf_model)
#' # Accuracy assessment
#' accuracy_metrics <- accuRacy(classification_RF.tif, TrainingPoints.shp, ValidationPoints.shp)
#' print(accuracy_metrics)
#' }
accuRacy <- function(classified_img, training_shapefile, validation_shapefile) {
  # Load classified image and shapefiles
  img.classified <- raster::raster(classified_img)
  shp.train <- rgdal::readOGR(dsn = training_shapefile)
  shp.valid <- rgdal::readOGR(dsn = validation_shapefile)

  # Get reference and predicted classes
  reference <- as.factor(shp.valid$Class)
  predicted <- as.factor(raster::extract(img.classified, shp.valid))

  # Create accuracy matrix
  accmat <- table(pred = predicted, ref = reference)

  # Calculate user's accuracy (UA), producer's accuracy (PA), and overall accuracy (OA)
  UA <- diag(accmat) / rowSums(accmat) * 100
  PA <- diag(accmat) / colSums(accmat) * 100
  OA <- sum(diag(accmat)) / sum(accmat) * 100

  # Return results
  return(list(accuracy_matrix = accmat, user_accuracy = UA, producer_accuracy = PA, overall_accuracy = OA))
}




