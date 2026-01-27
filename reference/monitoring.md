# Routine CMAM monitoring data from Sudan

Routine CMAM monitoring data from Sudan

## Usage

``` r
monitoring
```

## Format

A tibble with 8234 rows and 16 columns

|                      |                                                |
|----------------------|------------------------------------------------|
| **Variable**         | **Description**                                |
| *State*              | Name of state                                  |
| *Locality*           | Name of locality                               |
| *Beginning of Month* | Cases in programme at beginning of month       |
| *New Admissions*     | New cases admitted within the month            |
| *Male*               | New male cases admitted within the month       |
| *Female*             | New female cases admitted within the month     |
| *Cured*              | Number of cured cases within the month         |
| *Death*              | Number of cases who died within the month      |
| *Default*            | Number of cases who defaulted within the month |
| *Non-Responder*      | Number of non-responder cases within the month |
| *Total Discharge*    | Total number of discharges within the month    |
| *RUTF Consumed*      | Number of RUTF consumed                        |
| *Screening*          | Screening                                      |
| *Sites*              | Sites                                          |
| *Month*              | Month                                          |
| *Year*               | Year                                           |

## Source

Federal Ministry of Health of Sudan

## Examples

``` r
monitoring
#> # A tibble: 8,234 × 16
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
#> # ℹ 8 more variables: Default <dbl>, `Non-Responder` <dbl>,
#> #   `Total Discharge` <dbl>, `Rutf Consumed` <dbl>, Screening <dbl>,
#> #   Sites <lgl>, Month <chr>, Year <chr>
```
