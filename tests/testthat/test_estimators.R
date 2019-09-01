library(squeacr)
context("Check estimators")

test_that("rout is numeric", {
  expect_is(calculate_rout(cin = 5, cout = 25, rin = 5, k = 3), "numeric")
})


