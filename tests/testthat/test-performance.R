library(tibble)

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
    is.tibble(calculate_performance(.data = monitoring))
  )
})

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
})
