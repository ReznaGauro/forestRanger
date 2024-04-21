#' Rename Bands in Raster Object
#'
#' This function preprocesses the image data by assigning band names dynamically
#' based on the number of bands in the image.
#'
#' @param img A Raster* image.
#'
#' @return The preprocessed image data with dynamically assigned band names
#' @export
#'
#' @examples
#' \dontrun{
#' renamed_img <- Rename(img)
#' print(names(renamed_img))
#' }
Rename <- function(img) {
  band_names <- paste0("b", 1:nlayers(img))
  names(img) <- band_names
  return(img)
}
