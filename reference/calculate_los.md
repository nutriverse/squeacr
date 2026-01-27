# Calculate CMAM length of stay and median length of stay for a cohort of CMAM discharges

Calculate CMAM length of stay and median length of stay for a cohort of
CMAM discharges

## Usage

``` r
calculate_los(admission_date, discharge_date)

calculate_los_median(admission_date, discharge_date, group = NULL)
```

## Arguments

- admission_date:

  Date of admission in `YYYY-MM-DD` format. If child is a kwashiorkor
  case, date of lowest weight (when oedema has subsided). Can be a
  single date value or a vector of date values.

- discharge_date:

  Date of discharge in `YYYY-MM-DD` format. Can be a single date value
  or a vector of date values.

- group:

  A character value/s with the same length as `admission_date` and
  `discharge_data` to use as grouping variable within which median
  length-of-stay is to be calculated. Default is NULL for no grouping.

## Value

Numeric value or vector of numeric values for length-of-stay in days for
`calculate_los()`. A numeric value for median length-of-stay in days for
`calculate_los_median()`. If `group` is not NULL, a vector of numeric
values for median length-of-stay in days with length equal to the number
of groups.

## Author

Ernest Guevarra

## Examples

``` r
calculate_los(admission_date = "2010-03-15",
              discharge_date = "2010-06-14")
#> [1] 91

calculate_los(admission_date = c("2010-03-15", "2010-03-16"),
              discharge_date = c("2010-06-14", "2010-06-20"))
#> [1] 91 96

calculate_los_median(
  otp_beneficiaries$admDate,
  otp_beneficiaries$disDate,
  group = otp_beneficiaries$locality
)
#> Warning: Some admission date/s are not in YYYY-MM-DD format or are not available. Returning NA.
#> Warning: Some discharge dates are earlier than admisison dates. Returning NA.
#>             group  los
#> 1        Alkamlin 52.0
#> 2          Atbara 50.0
#> 3       El Fasher 63.0
#> 4           Halfa 21.0
#> 5       Kalamendo 35.0
#> 6         Kassala 63.0
#> 7           Kutum 58.0
#> 8  Medani Alkupra 36.0
#> 9  Sharg Algazira 28.0
#> 10   South Gazira 26.0
#> 11         Tawila 28.5
#> 12         Telkuk 42.0
```
