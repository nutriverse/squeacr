# Calculate median MUAC-at_admissions

Calculate median MUAC-at_admissions

## Usage

``` r
calculate_muac_median(muac, index = NULL, na_values = NULL)
```

## Arguments

- muac:

  A numeric vector of mid-upper arm circumference measurements either in
  centimetres or millimetres.

- index:

  A list of one or more factors each of the same length as `muac` which
  defines the grouping to be used on `muac`. Default is NULL (no
  grouping applied).

- na_values:

  A vector of values in `muac` that are to be considered as NA values.
  Default to NULL which will use NA.

## Value

A numeric value (if `index = NULL`) or named vector of values for median
mid-upper arm circumference with names from each level of `index`.

## Examples

``` r
calculate_muac_median(otp_beneficiaries$muac)
#> [1] 11.2
calculate_muac_median(otp_beneficiaries$muac, otp_beneficiaries$locality)
#>       Alkamlin         Atbara      El Fasher          Halfa      Kalamendo 
#>          11.30          11.00          11.20          11.20          11.20 
#>        Kassala          Kutum Medani Alkupra Sharg Algazira   South Gazira 
#>          11.00          11.30          11.70          10.90          11.30 
#>         Tawila         Telkuk 
#>          11.25          11.05 
```
