library(readxl)
library(dplyr)

otp_beneficiaries <- readxl::read_xlsx(path = "data-raw/cmam/otpEpisode_calculations.xlsx",
                                       sheet = 1,
                                       range = "A1:M290") %>%
  dplyr::relocate(health_facility, .before = age) %>%
  dplyr::relocate(locality, .before = health_facility) %>%
  dplyr::relocate(state, .before = state)

usethis::use_data(otp_beneficiaries, overwrite = TRUE, compress = "xz")


##
locality_names <- openxlsx::getSheetNames(file = "data-raw/cmam/time_to_travel.xlsx")

time_to_travel <- data.frame()

for(i in locality_names) {
  x <- readxl::read_xlsx(path = "data-raw/cmam/time_to_travel.xlsx",
                         sheet = i)

  time_to_travel <- rbind(time_to_travel, x)
}

usethis::use_data(time_to_travel, overwrite = TRUE, compress = "xz")
