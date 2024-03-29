% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/list_fields.R
\name{list_fields}
\alias{list_fields}
\title{List of accepted fields for the function country_info}
\usage{
list_fields()
}
\value{
A vector of accepted fields for the function \code{country_info()}
}
\description{
This function queries \href{https://restcountries.com/}{REST Countries API} and returns a list of all possible fields that can be used in the function \code{country_info}.
\strong{NOTE:} Internet access is needed to download information from the API.
}
\examples{
# Run example only if a connection to the API is available
if (check_countries_api(warnings = FALSE)){

list_fields()

}
}
\seealso{
\link[countries]{country_info}
}
