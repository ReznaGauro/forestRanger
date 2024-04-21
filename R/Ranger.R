#' Predict Image Data with Random Forest Model
#'
#' This function predicts forest type classification for image data using a trained model.
#'
#' @param img A Raster* image representing the image data to be classified.
#' @param rfmodel A trained Random Forest model object.
#' @param filename Optional. The filename for the resulting classified image. Defaults to "classification_RF.tif".
#' @param overwrite Logical. Whether to overwrite an existing file with the same name as 'filename'. Defaults to TRUE
#'
#' @return A RasterLayer object representing the classified image.
#' @import raster
#' @export
#'
#' @examples
#' \dontrun{
#' classified_image <- Ranger(AOI.tif, rf_model, filename = "classification_RF.tif")
#' }
Ranger <- function(img, rfmodel, filename = "classification_RF.tif", overwrite = TRUE) {
  # Predict image data with RF model
  result <- raster::predict(img, rfmodel, filename = filename, overwrite = overwrite)

  # Return the result (optional)
  return(result)
}
