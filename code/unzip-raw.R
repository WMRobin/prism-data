# base zip path
# zipBase <- "raw/PRISM_ppt_stable_4kmD2_"
zipBase <- "raw/PRISM_"

# specific date (for example)
date <- "0101"
year <- "2018"

# output directory
outDir <- "raw/unzip"

# list of variables
vars <- c("ppt", "tmean")

# unzip file
# unzip(zipFile, exdir = outDir)

# function to unzip file
my_unzip <- function(var, year, date) {
  unzip(paste0(zipBase, var, "_stable_4kmD2_", year, date, "_bil.zip"),
        # exdir = paste(outDir, var, sep = "/"))
        exdir = outDir)
}
# my_unzip <- function(year, date) unzip(paste0(zipBase, year, date, "_bil.zip"), exdir = outDir)

# make strings of dates
ones <- paste0(rep("0",9), 1:9)
tens <- paste0(rep("1",10), 1:9)
twenties <- paste0(rep("2",10), 1:9)

# make strings of dates for each month
jan <- paste0(rep("01",31), c(ones, tens, twenties, "30", "31"))
feb <- paste0(rep("02",28), c(ones, tens, paste0(rep("2",9), 1:8)))
febLeap <- paste0(rep("02",29), c(ones, tens, paste0(rep("2",9), 1:8)))
mar <- paste0(rep("03",31), c(ones, tens, twenties, "30", "31"))
apr <- paste0(rep("04",30), c(ones, tens, twenties, "30"))
may <- paste0(rep("05",31), c(ones, tens, twenties, "30", "31"))
jun <- paste0(rep("06",30), c(ones, tens, twenties, "30"))
jul <- paste0(rep("07",31), c(ones, tens, twenties, "30", "31"))
aug <- paste0(rep("08",31), c(ones, tens, twenties, "30", "31"))
sep <- paste0(rep("09",30), c(ones, tens, twenties, "30"))
oct <- paste0(rep("10",31), c(ones, tens, twenties, "30", "31"))
nov <- paste0(rep("11",30), c(ones, tens, twenties, "30"))
dec <- paste0(rep("12",31), c(ones, tens, twenties, "30", "31"))

# 2018 is not a leap year
dates_2018 <- c(jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec)

# save dates in temp file for reference later
save(dates_2018, file = "temp/dates_2018.RData")

# save variables in temp file for reference later
save(vars, file = "temp/vars.RData")

# loop through all dates in 2018 and unzip both variables
year <- "2018"
for (var in vars) {
  for (date in dates_2018) {
    my_unzip(var, year, date)
  }
}


# run through process for one day so I can work with data -- run whole process later
my_unzip(vars[1], year, dates_2018[1])
my_unzip(vars[2], year, dates_2018[1])