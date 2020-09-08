## Create seasonal calendar data for Sudan

event <- c("Land preparation",
           "Planting",
           "Winter season planting",
           "Rainy season",
           "Wheat harvest (irrigated)",
           "Lean season",
           "Millet and sorghum harvest")

event <- rep(event, 4)

.start <- c("04-01",
            "06-01",
            "11-01",
            "06-01",
            "03-01",
            "05-01",
            "11-01")

.start <- c(paste(2016, .start, sep = "-"),
            paste(2017, .start, sep = "-"),
            paste(2018, .start, sep = "-"),
            paste(2019, .start, sep = "-"))

.end <- c("04-30",
          "07-31",
          "12-31",
          "09-30",
          "03-31",
          "09-30",
          "12-31")

.end <- c(paste(2016, .end, sep = "-"),
          paste(2017, .end, sep = "-"),
          paste(2018, .end, sep = "-"),
          paste(2019, .end, sep = "-"))

group <- c("Planting",
           "Planting",
           "Planting",
           "Rainfall",
           "Food availability",
           "Food availability",
           "Food availability")

group <- rep(group, 4)

seasonal_calendar <- data.frame(event, .start, .end, group)
names(seasonal_calendar) <- c("event", "start", "end", "group")

## Remove NAs
seasonal_calendar <- tibble::tibble(seasonal_calendar)

usethis::use_data(seasonal_calendar, overwrite = TRUE, compress = "xz")
