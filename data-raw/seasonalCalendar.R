## Create seasonal calendar data for Sudan

event <- c("Winter season planting",
           "Land preparation",
           "Planting",
           "Millet and sorghum harvest",
           "Wheat harvest (irrigated)",
           "Rainy season",
           "Lean season")

event <- rep(event, 4)

.start <- c("11-01",
           "04-01",
           "06-01",
           "11-01",
           "03-01",
           "06-01",
           "05-01")

.start <- c(paste(2016, .start, sep = "-"),
           paste(2017, .start, sep = "-"),
           paste(2018, .start, sep = "-"),
           paste(2019, .start, sep = "-"))

.end <- c("12-31",
         "04-30",
         "07-31",
         "12-31",
         "03-31",
         "09-30",
         "09-30")

.end <- c(paste(2016, .end, sep = "-"),
          paste(2017, .end, sep = "-"),
          paste(2018, .end, sep = "-"),
          paste(2019, .end, sep = "-"))

group <- c("Agriculture: Preparation and planting",
           "Agriculture: Preparation and planting",
           "Agriculture: Preparation and planting",
           "Agriculture: Harvest",
           "Agriculture: Harvest",
           "Climate",
           "Hunger gap")

group <- rep(group, 4)

seasonal_calendar <- data.frame(event, .start, .end, group)
names(seasonal_calendar) <- c("event", "start", "end", "group")
seasonal_calendar <- tibble::tibble(seasonal_calendar)

usethis::use_data(seasonal_calendar, overwrite = TRUE, compress = "xz")
