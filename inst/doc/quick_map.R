## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## -----------------------------------------------------------------------------
library(countries)

data <- country_info(fields = c("population", "landlocked", "car", "capital", "capitalInfo"))

## ---- dpi = 600, warning = FALSE, message = FALSE, fig.asp = 0.5, fig.width = 7,  out.width="100%"----
quick_map(data, plot_col = "car.side", verbose = FALSE)

## ---- eval = FALSE------------------------------------------------------------
#  quick_map(data, plot_col = "car.side",
#            save_to = "example_path/plot.png")

## ---- warning = FALSE, message = FALSE, dpi = 700, out.width= "50%",  fig.align = "center"----
quick_map(data, plot_col = "car.side", zoom = "Africa")

## ---- warning = FALSE, message = FALSE, dpi = 700, out.width= "50%",  fig.align = "center"----
quick_map(data, plot_col = "car.side", zoom = c(25, 55, -10, 15))

## ---- dpi = 600, warning = FALSE, message = FALSE, fig.asp = 0.5, fig.width = 7,  out.width="100%"----

quick_map(data, plot_col = "population", verbose = FALSE,
          theme = "Candy")


## ---- dpi = 600, warning = FALSE, message = FALSE, fig.asp = 0.5, fig.width = 7,  out.width="100%"----
quick_map(data[1:150,], plot_col = "population", verbose = FALSE,
          theme = "Greyscale",
          reverse_palette = TRUE,
          name_legend = "Countries' populations\nas of 2022", 
          col_na = "darkred",
          col_border = "NA") # here we are removing the border lines


## ---- dpi = 600, warning = FALSE, message = FALSE, fig.asp = 0.5, fig.width = 7,  out.width="100%"----
quick_map(data, plot_col = "population", verbose = FALSE,
          theme = "RedBlue",
          col_breaks = c(0, 1e5, 1e6, 1e7 , 1e8, 1e9))


## ---- message=FALSE, warning=FALSE--------------------------------------------
p <- quick_map(data, plot_col = "population", verbose = FALSE,
          theme = "RedBlue",
          col_breaks = c(0, 1e5, 1e6, 1e7 , 1e8, 1e9))


## ---- dpi = 600, warning = FALSE, message = FALSE, fig.asp = 0.5, fig.width = 7,  out.width="100%"----
library(ggplot2)

# let's define 6 colours for our map
colours6 <- c("white", "lightblue", "blue", "grey", "black","yellow")

# let's apply them to our plot!
p +
  scale_fill_manual(name = NULL,  # remove name in fill legend
                    values = colours6)+ # use custom colours
  ggtitle("World population") + # add a title to the plot 
  theme(plot.background = element_rect(fill = "#e3cff9"), # change colour of background
        legend.position = "top",  # move legend on top
        plot.title = element_text(hjust = 0.5, family = "mono")) # center the title and change font family


## ---- dpi = 600, warning = FALSE, message = FALSE, fig.asp = 0.6,  fig.width = 8, out.width="100%"----
# extract capital longitude and latitude in data table
data$long <- as.numeric(sub(x = data$capitalInfo.latlng, pattern = "^.*; ", replacement = "", perl = TRUE))
data$lat <- as.numeric(sub(x = data$capitalInfo.latlng, pattern = ";.*$", replacement = "", perl = TRUE))

# make a map
quick_map(data, "landlocked", zoom = "Europe", theme = "Greens")+
  geom_point(data = data, mapping = aes(x = long, y = lat, group = NULL), shape = 10) + # add markers for the capitals
  geom_text(data = data[1:20,], mapping = aes(x = long, y = lat, label = capital, group = NULL), size = 3, nudge_y = -1) + # printing capital name for first 20 rows
  annotate("segment", x = 18, y = 35, xend = 14, yend = 42,
           arrow = arrow(type = "closed", length = unit(0.02, "npc")))+   # add an arrow
  annotate("label", x = 18, y = 35, label = "A boot!")  # add a text annotation



