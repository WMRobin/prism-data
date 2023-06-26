# install.packages(raster)
library(raster)
library(sf)

# set year for example
year <- "2018"

# load example year dates
load(paste0("temp/dates_", year, ".RData"))

# load variable names
load("temp/vars.RData")

# variable units of measurement
measurements <- c("mm", "c")
save(measurements, file = "temp/measurements.RData")

# file base path
# fileBase <- "raw/unzip/PRISM_ppt_stable_4kmD2_"
fileBase <- "raw/unzip/PRISM_"

# .bil file path
bilFile <- function(var, year, date) {
  paste0(fileBase, var, "_stable_4kmD2_", year, date, "_bil.bil")
}

# date for example
date <- dates_2018[1]

# load raster data
r1 <- raster(bilFile(vars[1], year, date))
r2 <- raster(bilFile(vars[2], year, date))

# stack the two rasters
s <- stack(list(r1, r2))

# name the layers for their variable
names(s) <- list(paste(vars[1], measurements[1], sep = "_"), paste(vars[2], measurements[2], sep = "_"))

# create a dataframe for the variables and their lat lon coordinates
df <- as.data.frame(s, xy = T)
