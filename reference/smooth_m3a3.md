# Apply median of 3 and average of 3 smoothing on a time series

Apply median of 3 and average of 3 smoothing on a time series

## Usage

``` r
smooth_m3a3(x)
```

## Arguments

- x:

  A vector of numerical information to be smoothed

## Value

A vector of smoothed data

## Author

Ernest Guevarra

## Examples

``` r
x <- aggregate(cbind(`New Admissions`, Default) ~ Month + Year,
               data = monitoring, FUN = sum)
smooth_m3a3(x = x$Default)
#>  [1] 1826.0000 1826.0000 1621.6667 1417.3333 1403.6667 1594.3333 1714.3333
#>  [8] 1643.6667 2013.0000 2453.0000 2770.6667 2498.0000 2082.0000 1824.0000
#> [15] 1716.3333 1788.0000 1824.0000 1690.6667 1521.3333 1408.0000 1490.3333
#> [22] 1588.0000 1629.6667 1563.0000 1481.0000 1399.0000 1406.3333 1413.6667
#> [29] 1421.0000 1354.6667 1260.0000 1193.6667 1297.0000 1428.6667 1516.3333
#> [36] 1473.3333 1392.6667 1327.6667 1254.3333 1218.6667 1183.0000 1124.3333
#> [43] 1038.0000  951.6667 1119.6667 1324.0000 1528.3333 1528.3333
```
