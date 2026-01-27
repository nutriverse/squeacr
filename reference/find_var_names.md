# Find possible variable names from a data.frame given a set of search names

Find possible variable names from a data.frame given a set of search
names

## Usage

``` r
find_var_names(df, vars, all = FALSE)
```

## Arguments

- df:

  A data.frame to search variable names from

- vars:

  A vector of terms to search for

- all:

  Logical. Should all results of search be returned? If FALSE (default),
  only first value is returned.

## Value

A character vector of variable name/s in `df`

## Author

Ernest Guevarra

## Examples

``` r
find_var_names(df = otp_beneficiaries, vars = "MUAC")
#> [1] "muac"
```
