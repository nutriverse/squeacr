
<!-- README.md is generated from README.Rmd. Please edit that file -->

# squeacr: Semi-Quantitative Evaluation of Access and Coverage (SQUEAC) Tools in R <img src="man/figures/logo.png" width = "200" align="right" />

<!-- badges: start -->

[![Project Status: WIP – Initial development is in progress, but there
has not yet been a stable, usable release suitable for the
public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![R-CMD-check](https://github.com/nutriverse/squeacr/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/nutriverse/squeacr/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/nutriverse/squeacr/branch/main/graph/badge.svg)](https://codecov.io/gh/nutriverse/squeacr?branch=main)
[![CodeFactor](https://www.codefactor.io/repository/github/nutriverse/squeacr/badge)](https://www.codefactor.io/repository/github/nutriverse/squeacr)
<!-- badges: end -->

In the recent past, measurement of coverage has been mainly through
two-stage cluster sampled surveys either as part of a nutrition
assessment or through a specific coverage survey known as Centric
Systematic Area Sampling (CSAS). However, such methods are resource
intensive and often only used for final programme evaluation meaning
results arrive too late for programme adaptation. SQUEAC, which stands
for Semi-Quantitative Evaluation of Access and Coverage, is a low
resource method designed specifically to address this limitation and is
used regularly for monitoring, planning and importantly, timely
improvement to programme quality, both for agency and Ministry of Health
(MoH) led programmes. This package provides functions for use in
conducting a SQUEAC investigation.

## Installation

The `squeacr` package is not yet available on
[CRAN](https://cran.r-project.org).

The development version of `squeacr` can be installed via
[GitHub](https://github.com/nutriverse/squeacr) as follows:

``` r
if(!require(remotes)) install.packages("remotes")
remotes::install_github("nutriverse/squeacr")
```

## What does `squeacr` do?

The `squeacr` package provides functions that facilitate the processing,
analysis and reporting of various components of a SQUEAC investigation.
The current version of the `squeacr` package currently provides the
following:

- Functions to calculate CMAM programme performance metrics;

- Functions to calculate CMAM programme length of stay metrics; and,

- Functions to calculate CMAM coverage estimates.

## Citation

If you find the `squeacr` package useful, please cite using the
suggested citation provided by a call to the `citation` function as
follows:

``` r
citation("squeacr")
#> 
#> To cite squeacr in publications use:
#> 
#>   Ernest Guevarra (2023). squeacr: Semi-Quantitative Evaluation of
#>   Access and Coverage (SQUEAC) Tools in R R package version 0.0.0.9000
#>   URL https://nutriverse.io/squeacr/
#> 
#> A BibTeX entry for LaTeX users is
#> 
#>   @Manual{,
#>     title = {squeacr: Semi-Quantitative Evaluation of Access and Coverage (SQUEAC) Tools  in R},
#>     author = {{Ernest Guevarra}},
#>     year = {2023},
#>     note = {R package version 0.0.0.9000},
#>     url = {https://nutriverse.io/squeacr/},
#>   }
```

## Community guidelines

Feedback, bug reports, and feature requests are welcome; file issues or
seek support [here](https://github.com/nutriverse/squeacr/issues). If
you would like to contribute to the package, please see our
[contributing
guidelines](https://nutriverse.io/squeacr/CONTRIBUTING.html).

This project is released with a [Contributor Code of
Conduct](https://contributor-covenant.org/version/2/1/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
