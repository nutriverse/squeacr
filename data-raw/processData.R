## code to prepare `processData.R` dataset goes here

## Load libraries ##############################################################
library(openxlsx)
library(readxl)
library(stringr)
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



## Read three versions of data - work with most recent (set1) ##################
set1 <- read_xlsx(path = "data-raw/cmam/set1.xlsx", sheet = "CMAM")


## Clean up data ###############################################################

## Correct state spellings
set1$State <- set1$State %>%
  str_replace_all(pattern = "kassala", replacement = "Kassala") %>%
  str_replace_all(pattern = "Northren", replacement = "Northern") %>%
  str_replace_all(pattern = "Centeral Darfur", replacement = "Central Darfur")

## Remove rows of data with State == "(blank)"
set1 <- set1[set1$State != "(blank)", ]

## Clean up locality names
set1$Locality <- set1$Locality %>%
  str_to_title() %>%
  str_replace_all(pattern = "\\(", replacement = " (")

## Add columns for month and year
set1 <- set1 %>%
  mutate(month = str_extract(string = set1$Month, pattern = "[a-zA-z]+"),
         year = paste(20, str_extract(string = set1$Month, pattern = "[0-9]+"), sep = "")) %>%
  select(-Month)

## Clean up variable names
names(set1) <- str_to_title(names(set1))
monitoring <- set1

## Save data as rda ############################################################
usethis::use_data(monitoring, overwrite = TRUE, compress = "xz")





