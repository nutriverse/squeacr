
## Test that output is numeric

test_that("output is numeric", {
  expect_true(
    is.numeric(
      calculate_los(
        admission_date = "2010-03-15", discharge_date = "2010-06-14"
      )
    )
  )
  expect_true(
    is.numeric(
      calculate_median_los(
        admission_date = otp_beneficiaries$admDate,
        discharge_date = otp_beneficiaries$disDate
      )
    )
  )
  expect_true(
    is.data.frame(
      calculate_median_los(
        admission_date = otp_beneficiaries$admDate,
        discharge_date = otp_beneficiaries$disDate,
        group = otp_beneficiaries$locality
      )
    )
  )
})



test_that("warnings are activated", {
  expect_warning(calculate_los(NA, "2010-06-14"))
  expect_warning(calculate_los("2010-03-15", NA))
  expect_warning(
    calculate_los(
      admission_date = otp_beneficiaries$admDate,
      discharge_date = otp_beneficiaries$disDate
    )
  )
})
