## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

library(countries)

## -----------------------------------------------------------------------------
# FIFA female world cups won
tab1 <- data.frame(country = c("UNITED STATES", "GERMANY", "NORWAY", "JAPAN"),
                   FIFA_cups = c(4, 2, 1, 1))

# nominal yearly GDP estimates from IMF (World economic outlook) 
tab2 <- data.frame(nation = c("DEU", "JPN", "USA", "DEU", "JPN", "USA"),
                   year = c(rep(1980,3), rep(2019,3)), 
                   GDP = c(854, 1128, 2857, 3888, 5118, 21380), 
                   unit = "billion current USD")

# fictitious monthly time series
tab3 <- data.frame(Date = c("01.01.2019", "01.02.2019", "01.03.2019"), 
                   Japan = 1:3, 
                   Norway = 2:4, 
                   Germany = 3:5, 
                   US = 4:6)

# fictitious sectoral data
tab4 <- data.frame(year = 2019,
                   country = "US", 
                   industry = c("Agriculture", "Mining", "Manifacture", "Energy"),
                   freq = runif(1:4))

# more fictitious sectoral data
tab5 <- data.frame(country = c("Estados Unidos", "Japon", "Estados Unidos", "Japon"), 
                   sector = c("Agriculture", "Agriculture","Energy", "Energy"),
                   x = c(T, F, T, F))

## -----------------------------------------------------------------------------
auto_merge(tab1, tab2, tab3, tab4, tab5)

## ----eval=T, include=F--------------------------------------------------------
dt <- auto_merge(tab1, tab2, tab3, tab4, tab5, verbose = F, merging_info = T)

## ----echo =F------------------------------------------------------------------
knitr::kable(dt$info_merged_columns)

## ----eval = F-----------------------------------------------------------------
# data <- list(tab1, tab2, tab3, tab4, tab5)
# 
# # the following two commands are equivalent
# auto_merge(tab1, tab2, tab3, tab4, tab5)
# auto_merge(data)

## -----------------------------------------------------------------------------
# changing the country names to UN spanish official name
auto_merge(tab1, tab2, country_to = "UN_es", verbose = FALSE)

## -----------------------------------------------------------------------------
# with auto_melt
auto_merge(tab1, tab3)

# without auto_melt
auto_merge(tab1, tab3, auto_melt = FALSE)

## -----------------------------------------------------------------------------
auto_merge(tab1, tab2, tab3, tab4, tab5, inner_join = TRUE)

## ----eval = F-----------------------------------------------------------------
# auto_merge(tab1, tab2, tab3, tab4, tab5, verbose = F)

## -----------------------------------------------------------------------------
# asking to merge country and year columns manually with a list of column names
auto_merge(tab1, tab2, tab4,
           by = list("COUNTRIES" = c("country", "nation", NA),
                     "YEARS" = c(NA, "year", "year")))


## -----------------------------------------------------------------------------
# asking to merge country and year columns manually with a vector of regular expressions
auto_merge(tab1, tab2, tab4,
           by = list("COUNTRIES" = c("country", "nation", NA),
                     "YEARS" = c(NA, "year", "year")))


