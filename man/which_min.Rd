% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/which_min-max-mode.R
\name{which_min}
\alias{which_min}
\alias{which_max}
\alias{which_mode}
\title{Return location of minimum, maximum and mode values' index}
\usage{
which_min(x, first_only = FALSE)

which_max(x, first_only = FALSE)

which_mode(x, first_only = FALSE)
}
\arguments{
\item{x}{A numeric or vector}

\item{first_only}{Logical value indicating whether only the first value should be returned (i.e. if \code{TRUE} the function behaves like \code{which.min()} and \code{which.max()}). Default is FALSE.}
}
\value{
Returns the position of the minimum, maximum and mode values of a vector \code{x}
}
\description{
These function return the position (index) of all the minimum, maximum, and mode values of the vector \code{x}. \code{which_min()} and \code{which_max()} only support numeric and logical vectors.
These functions are identical to \code{which.min()} and \code{which.max()}, except that ALL minima/maxima are returned instead of only the first one.
}
\examples{
which_mode(c("a","a",2,3))
which_min(c(1,1,2,3,NA,2))
which_max(c(NA,NA,NA,1,1,2))
}
\seealso{
\link[countries]{Mode}, \link[base]{which.min}, \link[base]{which.max}
}
