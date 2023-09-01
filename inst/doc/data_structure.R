## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

library(countries)

## -----------------------------------------------------------------------------
#download data
temp <- tempfile()
download.file("https://fbellelli.com/data%20files/Extended%20EDB%20by%20measure-country-HS%20chapter.zip", temp, mode="wb")

#unzip and load it in R
library(data.table)
example <- fread(
  unzip(temp,"Extended EDB by measure-country-HS chapter/Extended EDB (by measure-country-HS chapter).csv"),
  stringsAsFactors=FALSE,
  encoding = "Latin-1")

## ----include=FALSE------------------------------------------------------------
#Delete downloaded data from disk
unlink("Extended EDB by measure-country-HS chapter", recursive = TRUE)


## -----------------------------------------------------------------------------
#Columns of country names
find_countrycol(example)  

#Return any column containing a country name
find_countrycol(example, min_share=0) 

## -----------------------------------------------------------------------------
# Date and year columns
find_timecol(example)  

## -----------------------------------------------------------------------------
find_countrycol(example, return_index = TRUE)
find_timecol(example, return_index = TRUE)  

## -----------------------------------------------------------------------------
test <- c("December 2022", "20/01/1970", "Banana", "12.13.2000") 

is_date(test)
is_date(test, formats=c("%d/%m/%Y"))

## ----echo=FALSE---------------------------------------------------------------
tab <- data.frame(Symbol= c("%d","%a","%A","%m","%b","%B","%y","%Y"),
                  Definition = c("Day number","Abbreviated day name","Full day name", "Month number","Abbreviated month name","Full month name","Year 2-digits","Year 4-digits"),
                  Example=c("13","Mon","Monday","2","Feb","February","22","2022"))

knitr::kable(tab)


## -----------------------------------------------------------------------------
find_keycol(example, allow_NA = TRUE)

## -----------------------------------------------------------------------------
#This will only check if a key is found among the first three columns
find_keycol(example, allow_NA = TRUE, search_only = 1:3)

## -----------------------------------------------------------------------------
find_keycol(example, allow_NA = FALSE)

## -----------------------------------------------------------------------------
is_keycol(example, c("COUNTRIES","Year"), allow_NA = TRUE)
is_keycol(example, c("COUNTRIES","Year", "Nr","Tentative HS chapters match"), allow_NA = TRUE)

