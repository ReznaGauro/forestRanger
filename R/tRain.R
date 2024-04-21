#' Tune and Train Random Forest Model
#'
#' This function tunes and trains a Random Forest model using the given sample data.
#' It calculates sample size for each class, tunes the model using the tuneRF function,
#' and saves the trained model to a file named "rfmodel.RData".
#'
#' @param smp A data frame containing the sample data with predictor variables and the response variable.
#' @param ntree Number of trees to grow in the Random Forest model (default is 250).
#'
#' @return A trained Random Forest model.
#' @import randomForest
#' @importFrom randomForest tuneRF
#' @export
#'
#' @examples
#' \dontrun{
#' rf_model <- tRain(smp, ntree=250)
#' }
tRain <- function(smp, ntree = 250) {
  # Calculate sample size for each class
  smp.size <- rep(min(summary(smp$cl)), nlevels(smp$cl))

  # Tune and train the Random Forest model
  rfmodel <- randomForest::tuneRF(
    x = smp[-ncol(smp)],
    y = smp$cl,
    strata = smp$cl,
    ntree = ntree,
    importance = TRUE,
    doBest = TRUE
  )

  # Save the trained RF model
  save(rfmodel, file = "rfmodel.RData")

  return(rfmodel)
}
