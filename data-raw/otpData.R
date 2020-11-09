library(readxl)

otpData <- readxl::read_xlsx(path = "data-raw/cmam/otpEpisode_calculations.xlsx",
                             sheet = 1,
                             range = "A1:M152")

(otpData$diswt * 1000) - (otpData$wt * 1000) / (otpData$wt * )


