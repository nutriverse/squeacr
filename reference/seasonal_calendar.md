# Seasonal calendar data for Sudan

Seasonal calendar data for Sudan

## Usage

``` r
seasonal_calendar
```

## Format

A tibble with 28 rows and 4 columns

|               |                                             |
|---------------|---------------------------------------------|
| **Variables** | **Description**                             |
| *event*       | Name of seasonal calendar event or activity |
| *start*       | Starting date of event/activity             |
| *end*         | Starting date of event/activity             |
| *group*       | Classification/group of activity or event   |

## Source

https://fews.net/east-africa/sudan/seasonal-calendar/december-2013

## Examples

``` r
seasonal_calendar
#> # A tibble: 28 × 4
#>    event                      start      end        group      
#>    <chr>                      <chr>      <chr>      <chr>      
#>  1 Land preparation           2016-04-01 2016-04-30 Planting   
#>  2 Planting                   2016-06-01 2016-07-31 Planting   
#>  3 Winter season planting     2016-11-01 2016-12-31 Planting   
#>  4 Rainy season               2016-06-01 2016-09-30 Rainfall   
#>  5 Wheat harvest (irrigated)  2016-03-01 2016-03-31 Harvest    
#>  6 Lean season                2016-05-01 2016-09-30 Lean season
#>  7 Millet and sorghum harvest 2016-11-01 2016-12-31 Harvest    
#>  8 Land preparation           2017-04-01 2017-04-30 Planting   
#>  9 Planting                   2017-06-01 2017-07-31 Planting   
#> 10 Winter season planting     2017-11-01 2017-12-31 Planting   
#> # ℹ 18 more rows
```
