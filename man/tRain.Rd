% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tRain.R
\name{tRain}
\alias{tRain}
\title{Tune and Train Random Forest Model}
\usage{
tRain(smp, ntree = 250)
}
\arguments{
\item{smp}{A data frame containing the sample data with predictor variables and the response variable.}

\item{ntree}{Number of trees to grow in the Random Forest model (default is 250).}
}
\value{
A trained Random Forest model.
}
\description{
This function tunes and trains a Random Forest model using the given sample data.
It calculates sample size for each class, tunes the model using the tuneRF function,
and saves the trained model to a file named "rfmodel.RData".
}
\examples{
\dontrun{
rf_model <- tRain(smp, ntree=250)
}
}
