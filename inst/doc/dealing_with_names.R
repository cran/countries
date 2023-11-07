## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

library(countries)

## -----------------------------------------------------------------------------
is_country(c("United States","Unated States","dot","DNK",123), fuzzy_match = FALSE) # FALSE is the default and will run faster
is_country(c("United States","Unated States","dot","DNK",123), fuzzy_match = TRUE)

## -----------------------------------------------------------------------------
is_country(x=c("Ceylon","LKA","Indonesia","Inde"), check_for=c("India","Sri Lanka"))

## -----------------------------------------------------------------------------
random_countries(5)
list_countries()

## -----------------------------------------------------------------------------
random_countries(5, nomenclature = "ISO3")
random_countries(5, nomenclature = "name_ar")

## -----------------------------------------------------------------------------
example <- c("United States","DR Congo", "Morocco")

# Getting 3-letters ISO code
country_name(x= example, to="ISO3")

# Translating to Spanish
country_name(x= example, to="name_es")

## -----------------------------------------------------------------------------
# Requesting 2-letter ISO codes and translation to Spanish and French
country_name(x= example, to=c("ISO2","name_es","name_fr"))

## ----echo=FALSE---------------------------------------------------------------
tab <- data.frame(CODE=c("**simple**","**ISO3**","**ISO2**","**ISO_code**","**UN_**xx","**WTO_**xx","**name_**xx","**GTAP**", "**all**"),
           DESCRIPTION=c("This is a simple english version of the name containing only ASCII characters. This nomenclature is available for all countries.",
                         "3-letter country codes as defined in ISO standard `3166-1 alpha-3`. This nomenclature is available only for the territories in the standard (currently 249 territories).",
           "2-letter country codes as defined in ISO standard `3166-1 alpha-2`. This nomenclature is available only for the territories in the standard (currently 249 territories).",
           "Numeric country codes as defined in ISO standard `3166-1 numeric`. This country code is the same as the UN's country number (M49 standard). This nomenclature is available for the territories in the ISO standard (currently 249 countries).",
           "Official UN name in 6 official UN languages. Arabic (`UN_ar`), Chinese  (`UN_zh`), English  (`UN_en`), French  (`UN_fr`), Spanish  (`UN_es`), Russian (`UN_ru`). This nomenclature is only available for countries in the M49 standard (currently 249 territories).",
           "Official WTO name in 3 official WTO languages: English (`WTO_en`), French (`WTO_fr`), Spanish (`WTO_es`). This nomenclature is only available for WTO members and observers (currently 189 entities).",
           "Translation of ISO country names in 28 different languages: Arabic (`name_ar`), Bulgarian (`name_bg`), Czech (`name_cs`), Danish (`name_da`), German (`name_de`), Greek (`name_el`), English  (`name_en`), Spanish  (`name_es`), Estonian (`name_et`),  Basque (`name_eu`),  Finnish (`name_fi`), French (`name_fr`), Hungarian (`name_hu`), Italian (`name_it`), Japponease (`name_ja`), Korean (`name_ko`), Lithuanian (`name_lt`), Dutch (`name_nl`), Norwegian (`name_no`), Polish (`name_po`), Portuguese (`name_pt`), Romenian (`name_ro`), Russian (`name_ru`), Slovak (`name_sk`), Swedish (`name_sv`), Thai (`name_th`), Ukranian (`name_uk`), Chinese simplified (`name_zh`), Chinese traditional (`name_zh-tw`)",
           "GTAP country and region codes.", "Converts to all the nomenclatures and languages in this table"))

knitr::kable(tab)

## -----------------------------------------------------------------------------
fuzzy_example <- c("US","C@ète d^Ivoire","Zaire","FYROM","Estados Unidos","ITA")

country_name(x= fuzzy_example, to=c("UN_en"))

## -----------------------------------------------------------------------------
country_name(x= fuzzy_example, to=c("UN_en"), verbose=TRUE)

## -----------------------------------------------------------------------------
country_name(x= c("Taiwan","lsajdèd"), to=c("UN_en"), verbose=FALSE)

## -----------------------------------------------------------------------------
example_custom <- c("Siam","Burma","H#@°)Koe2")

#suppose we are unhappy with how "H#@°)Koe2" is interpreted by the function
country_name(x = example_custom, to = "name_en")

#match_table can be used to generate a table for small adjustments
tab <- match_table(x = example_custom, to = "name_en")
tab$name_en[2] <- "Hong Kong"

#which can then be used for conversion
country_name(x = example_custom, to = "name_en", custom_table = tab)

