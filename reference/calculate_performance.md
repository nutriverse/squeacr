# Calculate CMAM performance indicators

Calculate CMAM performance indicators

## Usage

``` r
calculate_performance(df, vars = NULL, add = TRUE)

calculate_cured(cured, exit)

calculate_dead(dead, exit)

calculate_default(defaulter, exit)

calculate_no_response(nr, exit)
```

## Arguments

- df:

  A data.frame containing programme monitoring data on number of cured,
  deaths, defaulters and non-response. The required data.frame holds
  rows of data corresponding to total counts for each performance
  indicator (i.e., **cured**, **dead**, **defaulter** and
  **non-responder**) rather than rows of individual cases.

- vars:

  A vector of variable names specifying **cured**, **dead**,
  **defaulter** and **non-responder** (in this specific order) values in
  `df`. If NULL (default), typical names used for these variables will
  be searched and used accordingly. If search doesn't yield matching
  variable names, the first 4 columns of the data.frame will be used.

- add:

  Logical. Should result be added to `df`. Default is TRUE.

- cured:

  Numeric value for total number of cured cases

- exit:

  Numeric value for total number of programme exits

- dead:

  Numeric value for total number of cases who died

- defaulter:

  Numeric value for total number of cases who defaulted

- nr:

  Numeric value for total number of cases who did not respond to

## Value

A tibble of performance indicator results (for
`calculate_performance()`) or a numeric value of specified CMAM
performance indicator (for `calculate_cured()`, `calculate_default()`,
`calculate_dead()`), and `calculate_no_response()`.

## Author

Ernest Guevarra

## Examples

``` r
calculate_performance(df = monitoring)
#> # A tibble: 8,234 × 20
#>    State Locality `Beginning Of Month` `New Admissions`  Male Female Cured Death
#>    <chr> <chr>                   <dbl>            <dbl> <dbl>  <dbl> <dbl> <dbl>
#>  1 Gaze… El Qura…                   16               16     8      8    23     0
#>  2 Gaze… El Qura…                   56               24    11     13     0     0
#>  3 Gaze… El Qura…                   80               41    16     25    22     0
#>  4 Gaze… El Qura…                   81               43    21     22    29     0
#>  5 Gaze… El Qura…                   93               51    31     30    36     2
#>  6 Gaze… El Qura…                  103               59    34     25     3     0
#>  7 Gaze… El Qura…                  163               69    34     35     8     0
#>  8 Gaze… El Qura…                  104              108    56     40     6     0
#>  9 Gaze… El Qura…                  275              123    61     62   111     0
#> 10 Gaze… El Qura…                  204               81    39     40    52     0
#> # ℹ 8,224 more rows
#> # ℹ 12 more variables: Default <dbl>, `Non-Responder` <dbl>,
#> #   `Total Discharge` <dbl>, `Rutf Consumed` <dbl>, Screening <dbl>,
#> #   Sites <lgl>, Month <chr>, Year <chr>, cured_prop <dbl>, dead_prop <dbl>,
#> #   defaulter_prop <dbl>, nr_prop <dbl>
calculate_cured(cured = 10, exit = 50)
#> [1] 0.2
calculate_dead(dead = 10, exit = 50)
#> [1] 0.2
calculate_default(defaulter = 10, exit = 50)
#> [1] 0.2
calculate_no_response(nr = 10, exit = 50)
#> [1] 0.2
```
