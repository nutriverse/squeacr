## code to prepare `processData.R` dataset goes here

library(openxlsx)
library(readxl)

## Read cmam databases - Katilu
katilu <- read_xls(path = "data-raw/cmam/kainuk.xls", sheet = 1, skip = 2)


## Read cmam databases - Kainuk
kainuk <- read_xls(path = "data-raw/cmam/kainuk.xls", sheet = 2, skip = 2)


usethis::use_data(processData.R, overwrite = TRUE)
