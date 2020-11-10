library(readxl)

otpData <- readxl::read_xlsx(path = "data-raw/cmam/otpEpisode_calculations.xlsx",
                             sheet = 1,
                             range = "A1:M152")

usethis::use_data(otpData, overwrite = TRUE, compress = "xz")

