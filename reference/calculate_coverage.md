# CMAM coverage estimators

CMAM coverage estimators

## Usage

``` r
calculate_rout(cin, cout, rin, k = 3)

calculate_cf(cin, cout)

calculate_tc(cin, cout, rin, k = 3)
```

## Arguments

- cin:

  Cases in CMAM programme

- cout:

  Cases not in CMAM programme

- rin:

  Recovering cases in programme

- k:

  Correction factor. Ratio of the mean length of an untreated episode to
  the mean length of a CMAM treatment episode

## Value

Numeric value of required coverage estiamtor

## References

Safari Balegamire, Katja Siling, Jose Luis Alvarez Moran, Ernest
Guevarra, Sophie Woodhead, Alison Norris, Lionella Fieschi, Paul Binns,
and Mark Myatt (2015). A single coverage estimator for use in SQUEAC,
SLEAC, and other CMAM coverage assessments. Field Exchange 49, March
2015. p81. \<www.ennonline.net/fex/49/singlecoverage\>

## Author

Ernest Guevarra based on technical notes and equations by Mark Myatt

## Examples

``` r
calculate_rout(cin = 5, cout = 25, rin = 5, k = 3)
#> [1] 6
calculate_cf(cin = 5, cout = 20)
#> [1] 0.2
calculate_tc(cin = 5, cout = 20, rin = 5, k = 3)
#> [1] 0.2857143
```
