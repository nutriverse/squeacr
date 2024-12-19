# Tests for calculate_median_muac function -------------------------------------

test_that("calculate_median_muac works as expected", {
  expect_type(calculate_muac_median(otp_beneficiaries$muac), "double")
  expect_type(
    calculate_muac_median(otp_beneficiaries$muac, otp_beneficiaries$locality),
    "double"
  )
})
