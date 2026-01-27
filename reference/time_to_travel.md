# Time-to-travel to health facilities for beneficiaries and volunteers

Time-to-travel to health facilities for beneficiaries and volunteers

## Usage

``` r
time_to_travel
```

## Format

A tibble with 165 rows and 9 columns:

|                   |                                          |
|-------------------|------------------------------------------|
| **Variable**      | **Description**                          |
| *State*           | Name of state                            |
| *Locality*        | Name of locality                         |
| *Health Facility* | Name of health facility                  |
| *Category*        | Category of beneficiary or volunteer     |
| *30 or less*      | Travel time of 30 minutes or less        |
| *31 to 60*        | Travel time of 31 minutes to 60 minutes  |
| *61 to 90*        | Travel time of 61 minutes to 90 minutes  |
| *91 to 120*       | Travel time of 91 minutes to 120 minutes |
| *more than 120*   | Travel time of more than 120 minutes     |

## Source

Data collected from beneficiary cards from Kassala State, Sudan

## Examples

``` r
time_to_travel
#> # A tibble: 165 × 9
#>    State  Locality `Health Facility` Category `30 or less` `31 to 60` `61 to 90`
#>    <chr>  <chr>    <chr>             <chr>           <dbl>      <dbl>      <dbl>
#>  1 Kassa… Telkuk   Tahdi Osisi       Admissi…           25          0          0
#>  2 Kassa… Telkuk   Tahdi Osisi       Default…            0          0          0
#>  3 Kassa… Telkuk   Tahdi Osisi       Volunte…            5          0          0
#>  4 Kassa… Telkuk   Tahajer           Admissi…            4         42         10
#>  5 Kassa… Telkuk   Tahajer           Default…            0          0          0
#>  6 Kassa… Telkuk   Tahajer           Volunte…            1          4          1
#>  7 Kassa… Telkuk   Maman Almisgid    Admissi…            0         37          0
#>  8 Kassa… Telkuk   Maman Almisgid    Default…            0          0          0
#>  9 Kassa… Telkuk   Maman Almisgid    Volunte…            4          0          0
#> 10 Kassa… Telkuk   Tawayeet          Admissi…            1          5          0
#> # ℹ 155 more rows
#> # ℹ 2 more variables: `91 to 120` <dbl>, `more than 120` <dbl>
```
