library(dplyr)

## Test that output is of expected type/class

test_that("output is character", {
  expect_true(
    is.character(find_var_names(df = muac_admission[[1]], vars = "MUAC"))
  )
  expect_true(
    is.character(
      find_var_names(df = muac_admission[[1]], vars = c("MUAC", "State"))
    )
  )
})

test_that("message is activated", {
  expect_message(find_var_names(df = muac_admission[[1]], vars = "Sudan"))
})

df <- monitoring %>%
  group_by(Year, Month) %>%
  summarise(
    cured = sum(Cured),
    death = sum(Death),
    default = sum(Default),
    non_response = sum(`Non-Responder`),
    .group = "drop"
  ) %>%
  filter(Year == 2016)


test_that("output is numeric", {
  expect_true(is.numeric(smooth_m3a3(x = df$default)))
})

test_that("error is activated", {
  expect_error(smooth_m3a3(x = as.character(df$default)))
})
