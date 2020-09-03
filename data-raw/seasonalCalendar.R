## Create seasonal calendar data for Sudan

event <- c(NA,
           "Land preparation",
           NA,
           "Planting",
           NA,
           "Winter season planting",
           NA,
           "Rainy season",
           NA,
           NA,
           "Wheat harvest (irrigated)",
           NA,
           "Lean season",
           NA,
           "Millet and sorghum harveset")

event <- rep(event, 4)

.start <- c("01-01",
            "04-01",
            "05-01",
            "06-01",
            "08-01",
            "11-01",
            "01-01",
            "06-01",
            "10-01",
            "01-01",
            "03-01",
            "04-01",
            "05-01",
            "10-01",
            "11-01")

.start <- c(paste(2016, .start, sep = "-"),
           paste(2017, .start, sep = "-"),
           paste(2018, .start, sep = "-"),
           paste(2019, .start, sep = "-"))

.end <- c("03-31",
          "04-30",
          "05-31",
          "07-31",
          "10-30",
          "12-31",
          "05-30",
          "09-30",
          "10-31",
          "02-28",
          "03-31",
          "04-30",
          "09-30",
          "10-31",
          "12-31")

.end <- c(paste(2016, .end, sep = "-"),
          paste(2017, .end, sep = "-"),
          paste(2018, .end, sep = "-"),
          paste(2019, .end, sep = "-"))

group <- c("Planting",
           "Planting",
           "Planting",
           "Planting",
           "Planting",
           "Planting",
           "Rainfall",
           "Rainfall",
           "Rainfall",
           "Food availability",
           "Food availability",
           "Food availability",
           "Food availability",
           "Food availability",
           "Food availability")

group <- rep(group, 4)

seasonal_calendar <- data.frame(event, .start, .end, group)
names(seasonal_calendar) <- c("event", "start", "end", "group")
seasonal_calendar <- tibble::tibble(seasonal_calendar)

usethis::use_data(seasonal_calendar, overwrite = TRUE, compress = "xz")
