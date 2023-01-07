
## Test that output is numeric

test_that("Output is numeric", {
  expect_true(
    is.numeric(calculate_rout(cin = 5, cout = 25, rin = 5, k = 3))
  )
  expect_true(
    is.numeric(calculate_cf(cin = 5, cout = 20))
  )
  expect_true(
    is.numeric(calculate_tc(cin = 5, cout = 20, rin = 5, k = 3))
  )
})
