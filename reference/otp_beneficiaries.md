# Outpatient Therapeutic Care Programme (OTP) beneficiaries data

Outpatient Therapeutic Care Programme (OTP) beneficiaries data

## Usage

``` r
otp_beneficiaries
```

## Format

A tibble with 405 rows and 13 columns:

|                   |                                                      |
|-------------------|------------------------------------------------------|
| **Variable**      | **Description**                                      |
| *index*           | Unique identifier                                    |
| *state*           | Name of state                                        |
| *locality*        | Name of locality                                     |
| *health_facility* | Name of health facility                              |
| *age*             | Age of child                                         |
| *muac*            | Mid-upper arm circumference (cms) at admission       |
| *wt*              | Weight (kgs) at admission                            |
| *ht*              | Height (cms) at admission                            |
| *admDate*         | Date of admission                                    |
| *disDate*         | Date of discharge                                    |
| *diswt*           | Weight (kgs) at discharge                            |
| *attended*        | Number of OTP sessions attended                      |
| *exitType*        | Type of exit (cured, dead, default or non-responder) |

## Source

Data collected from beneficiary cards from Kassala, North Darfur, and
Algazira State, Sudan

## Examples

``` r
otp_beneficiaries
#> # A tibble: 405 × 13
#>    index locality health_facility   age  muac    wt    ht admDate            
#>    <dbl> <chr>    <chr>           <dbl> <dbl> <dbl> <dbl> <dttm>             
#>  1     1 Telkuk   Tahjer             10  11     6.6  69.5 2020-07-07 00:00:00
#>  2     2 Telkuk   Tahjer             18  11     7.2  73.5 2020-07-07 00:00:00
#>  3     3 Telkuk   Tahjer             12  11.2   7.5  73.5 2020-07-14 00:00:00
#>  4     4 Telkuk   Tahjer             12  11.5   6.4  70   2020-07-07 00:00:00
#>  5     5 Telkuk   Tahjer             12  11     6.5  71   2020-07-21 00:00:00
#>  6     6 Telkuk   Tahjer             19  11.2   7.3  74   2020-07-12 00:00:00
#>  7     7 Telkuk   Tahjer             12  11     6    68.5 2020-07-23 00:00:00
#>  8     8 Telkuk   Tahjer             10  10.4   5.6  69   2020-05-18 00:00:00
#>  9     9 Telkuk   Tahjer             17  10.2   6.7  71   2020-05-19 00:00:00
#> 10    10 Telkuk   Tahjer             12  11     6.2  69   2020-05-19 00:00:00
#> # ℹ 395 more rows
#> # ℹ 5 more variables: disDate <dttm>, diswt <dbl>, attended <dbl>,
#> #   exitType <chr>, state <chr>
```
