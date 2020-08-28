## code to prepare `processData.R` dataset goes here

library(openxlsx)
library(readxl)
library(magrittr)
library(dplyr)
library(tidyr)

## Read cmam databases - Katilu
katilu <- read_xls(path = "data-raw/cmam/kainuk.xls", sheet = 1, skip = 2)


## Read cmam databases - Kainuk
kainuk <- read_xls(path = "data-raw/cmam/kainuk.xls", sheet = 2, skip = 2)


## Read Lokori dataset - MUAC at admission
muac_admission <- read_xlsx(path = "data-raw/cmam/lokori.xlsx",
                            sheet = 1,
                            range = "A1:L47")

muac_admission <- muac_admission %>%
  pivot_longer(cols = Lotubae:Lokori, names_to = "district", values_to = "count")

names(muac_admission) <- c("muac", "district", "count")
usethis::use_data(muac_admission, overwrite = TRUE, compress = "xz")

