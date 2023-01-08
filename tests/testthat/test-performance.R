library(tibble)
library(dplyr)

## Test that output is numeric

test_that("output is numeric", {
  expect_true(
    is.numeric(calculate_cured(cured = 10, exit = 50))
  )
  expect_true(
    is.numeric(calculate_dead(dead = 10, exit = 50))
  )
  expect_true(
    is.numeric(calculate_default(defaulter = 10, exit = 50))
  )
  expect_true(
    is.numeric(calculate_no_response(nr = 10, exit = 50))
  )
})

## Test that output is a data.frame

test_that("output is a data.frame", {
  expect_true(
    is.data.frame(calculate_performance(.data = monitoring))
  )
  expect_true(
    is_tibble(calculate_performance(.data = monitoring))
  )
})


x <- monitoring %>%
  select(Cured, Death, Default, `Non-Responder`) %>%
  rename(
    w = Cured,
    x = Death,
    y = Default,
    z = `Non-Responder`
  )

y1 <- monitoring %>%
  mutate(Cured = as.character(Cured))

y2 <- monitoring %>%
  mutate(Death = as.character(Death))

y3 <- monitoring %>%
  mutate(Default = as.character(Default))

y4 <- monitoring %>%
  mutate(`Non-Responder` = as.character(`Non-Responder`))

## Expect warning/error

test_that("warning/error is activated", {
  expect_error(calculate_cured(cured = "10", exit = 50))
  expect_error(calculate_cured(cured = 10, exit = "50"))
  expect_error(calculate_dead(dead = "10", exit = 50))
  expect_error(calculate_dead(dead = 10, exit = "50"))
  expect_error(calculate_default(defaulter = "10", exit = 50))
  expect_error(calculate_default(defaulter = 10, exit = "50"))
  expect_error(calculate_no_response(nr = "10", exit = 50))
  expect_error(calculate_no_response(nr = 10, exit = "50"))
  expect_error(
    calculate_performance(
      .data = monitoring, vars = c("healed", "died", "missing", "no_recovery")
    )
  )
  expect_message(calculate_performance(.data = x))
  expect_error(calculate_performance(y1))
  expect_error(calculate_performance(y2))
  expect_error(calculate_performance(y3))
  expect_error(calculate_performance(y4))
})

