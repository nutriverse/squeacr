library(readxl)
library(dplyr)

otp_beneficiaries <- readxl::read_xlsx(path = "data-raw/cmam/otpEpisode_calculations.xlsx",
                                       sheet = 1,
                                       range = "A1:M152") %>%
  dplyr::relocate(health_facility, .before = age) %>%
  dplyr::relocate(locality, .before = health_facility) %>%
  dplyr::relocate(state, .before = state)

usethis::use_data(otp_beneficiaries, overwrite = TRUE, compress = "xz")

