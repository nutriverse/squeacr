
<!-- README.md is generated from README.Rmd. Please edit that file -->

# squeacr: Semi-Quantitative Evaluation of Access and Coverage (SQUEAC) Tools <img src="man/figures/logo.png" width = "200" align="right" />

<!-- badges: start -->

[![Project Status: WIP – Initial development is in progress, but there
has not yet been a stable, usable release suitable for the
public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![R-CMD-check](https://github.com/nutriverse/squeacr/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/nutriverse/squeacr/actions/workflows/R-CMD-check.yaml)
[![test-coverage](https://github.com/nutriverse/squeacr/actions/workflows/test-coverage.yaml/badge.svg)](https://github.com/nutriverse/squeacr/actions/workflows/test-coverage.yaml)
[![Codecov test
coverage](https://codecov.io/gh/nutriverse/squeacr/branch/main/graph/badge.svg)](https://codecov.io/gh/nutriverse/squeacr?branch=main)
[![pkgdown](https://github.com/nutriverse/squeacr/actions/workflows/pkgdown.yaml/badge.svg)](https://github.com/nutriverse/squeacr/actions/workflows/pkgdown.yaml)
[![CodeFactor](https://www.codefactor.io/repository/github/nutriverse/squeacr/badge)](https://www.codefactor.io/repository/github/nutriverse/squeacr)
[![DOI](https://zenodo.org/badge/115501158.svg)](https://zenodo.org/badge/latestdoi/115501158)
<!-- badges: end -->

In the recent past, measurement of community-based management of acute
malnutrition (CMAM) programme coverage has been mainly through two-stage
cluster sampled surveys either as part of a nutrition assessment or
through a specific coverage survey known as Centric Systematic Area
Sampling (CSAS). However, such methods are resource intensive and often
only used for final programme evaluation meaning results arrive too late
for programme adaptation. SQUEAC, which stands for Semi-Quantitative
Evaluation of Access and Coverage, is a low resource method designed
specifically to address this limitation and is used regularly for
monitoring, planning and importantly, timely improvement to programme
quality, both for agency and Ministry of Health (MoH) led programmes.
This package provides functions for use in conducting a SQUEAC
investigation.

## What does `squeacr` do?

The `{squeacr}` package provides functions that facilitate the
processing, analysis and reporting of various components of a SQUEAC
investigation. The current version of the `{squeacr}` package currently
provides the following:

  - Functions to calculate CMAM programme performance metrics;

  - Functions to calculate CMAM programme length of stay metrics; and,

  - Functions to calculate CMAM coverage estimates.

## Installation

The `{squeacr}` package is not yet available on
[CRAN](https://cran.r-project.org) but can be installed from the
[nutriverse R Universe](https://nutriverse.r-universe.dev) as follows:

``` r
install.packages(
  "squeacr",
  repos = c('https://nutriverse.r-universe.dev', 'https://cloud.r-project.org')
)
```

## Usage

### Calculating CMAM programme performance metrics

*Cure rate*, *defaulter rate*, *death rate*, and *non-response rate* are
the programme indicators used to monitor performance of CMAM. These
indicators are calculated from routine programme monitoring data, an
example of which is the `monitoring` dataset included in `{squeacr}`.

| State  | Locality   | Beginning Of Month | New Admissions | Male | Female | Cured | Death | Default | Non-Responder | Total Discharge | Rutf Consumed | Screening | Sites | Month | Year |
| :----- | :--------- | -----------------: | -------------: | ---: | -----: | ----: | ----: | ------: | ------------: | --------------: | ------------: | --------: | :---- | :---- | :--- |
| Gazera | El Qurashi |                 16 |             16 |    8 |      8 |    23 |     0 |       3 |             0 |              26 |            80 |        49 | NA    | Jan   | 2016 |
| Gazera | El Qurashi |                 56 |             24 |   11 |     13 |     0 |     0 |       0 |             0 |               0 |          \-46 |       298 | NA    | Apr   | 2016 |
| Gazera | El Qurashi |                 80 |             41 |   16 |     25 |    22 |     0 |       2 |             0 |              24 |            16 |       225 | NA    | May   | 2016 |
| Gazera | El Qurashi |                 81 |             43 |   21 |     22 |    29 |     0 |       0 |             0 |              29 |            22 |       215 | NA    | Jun   | 2016 |
| Gazera | El Qurashi |                 93 |             51 |   31 |     30 |    36 |     2 |       0 |             0 |              38 |            14 |         0 | NA    | Jul   | 2016 |
| Gazera | El Qurashi |                103 |             59 |   34 |     25 |     3 |     0 |       0 |             0 |               3 |            12 |       289 | NA    | Aug   | 2016 |
| Gazera | El Qurashi |                163 |             69 |   34 |     35 |     8 |     0 |      12 |             2 |              22 |             8 |         0 | NA    | Sep   | 2016 |
| Gazera | El Qurashi |                104 |            108 |   56 |     40 |     6 |     0 |      47 |             0 |              53 |          \-40 |         0 | NA    | Oct   | 2016 |
| Gazera | El Qurashi |                275 |            123 |   61 |     62 |   111 |     0 |      81 |             2 |             194 |            32 |         0 | NA    | Nov   | 2016 |
| Gazera | El Qurashi |                204 |             81 |   39 |     40 |    52 |     0 |       8 |             2 |              62 |            52 |       293 | NA    | Dec   | 2016 |
| Gazera | El Kamlin  |                  8 |              8 |    3 |      5 |     0 |     0 |       0 |             0 |               0 |             4 |         8 | NA    | Jan   | 2016 |
| Gazera | El Kamlin  |                119 |             19 |   11 |      8 |     2 |     0 |       2 |             1 |               5 |            16 |         7 | NA    | Mar   | 2016 |
| Gazera | El Kamlin  |                133 |              8 |    5 |      3 |    18 |     0 |       2 |             1 |              21 |            18 |       182 | NA    | Apr   | 2016 |
| Gazera | El Kamlin  |                120 |             22 |   15 |      7 |     8 |     0 |       0 |             1 |               9 |             6 |       552 | NA    | May   | 2016 |
| Gazera | El Kamlin  |                134 |              9 |    5 |      4 |    15 |     0 |      13 |             0 |              28 |            15 |       285 | NA    | Jun   | 2016 |

CMAM programme monitoring data for Sudan (showing first 15 rows)

The `monitoring` dataset is from the National CMAM programme in Sudan
showing monthly programme statistics per locality. The dataset has the
following fields:

| **Variable**         | **Description**                                |
| :------------------- | :--------------------------------------------- |
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

We can calculate the different programme performance indicators using
`{squeacr}`. For this example, we’ll calculate the indicators for each
state per year.

``` r
library(squeacr)
library(dplyr)

monitoring |>
  group_by(State, Year) |>
  summarise(
    total_discharge = sum(`Total Discharge`, na.rm = TRUE),
    cure_rate = calculate_cured(sum(Cured, na.rm = TRUE), total_discharge),
    default_rate = calculate_default(sum(Default, na.rm = TRUE), total_discharge),
    death_rate = calculate_dead(sum(Death, na.rm = TRUE), total_discharge),
    non_response_rate = calculate_no_response(sum(`Non-Responder`, na.rm = TRUE), total_discharge),
    .groups = "drop"
  )
```

which results in the following:

    #> # A tibble: 72 × 7
    #>    State        Year  total_discharge cure_rate default_rate death_rate
    #>    <chr>        <chr>           <dbl>     <dbl>        <dbl>      <dbl>
    #>  1 Blue Nile    2016             9693     0.889       0.0906    0.0151 
    #>  2 Blue Nile    2017            10286     0.948       0.0399    0.00972
    #>  3 Blue Nile    2018             8807     0.947       0.0404    0.00863
    #>  4 Blue Nile    2019             9882     0.953       0.0366    0.00708
    #>  5 Central Dar… 2016            13313     0.921       0.0440    0.0174 
    #>  6 Central Dar… 2017            18098     0.935       0.0421    0.00912
    #>  7 Central Dar… 2018            17600     0.939       0.0364    0.00955
    #>  8 Central Dar… 2019            18573     0.952       0.0260    0.00549
    #>  9 East Darfur  2016             9895     0.929       0.0550    0.0104 
    #> 10 East Darfur  2017            12611     0.956       0.0327    0.00690
    #> # ℹ 62 more rows
    #> # ℹ 1 more variable: non_response_rate <dbl>

### CMAM programme length-of-stay

The length-of-stay in a CMAM programme is an important metric that can
provide insight into several aspects of the program’s performance and
effectiveness. It is calculated from those discharged cured from
outpatient care by counting the number of days between the admission
date and the discharge date.

The `otp_beneficiaries` dataset in the package is an example of a
patient record data from which length-of-stay can be calculated using
the `calculate_los()` function:

``` r
calculate_los(otp_beneficiaries$admDate, otp_beneficiaries$disDate)
```

which gives the following results:

    #> Warning in calculate_los(otp_beneficiaries$admDate,
    #> otp_beneficiaries$disDate): Some admission date/s are not in
    #> YYYY-MM-DD format or are not available. Returning NA.
    #> Warning in calculate_los(otp_beneficiaries$admDate,
    #> otp_beneficiaries$disDate): Some discharge dates are earlier than
    #> admisison dates. Returning NA.
    #>   [1]  56  42  36  49  42  51  19  75  84  49  90  70  91  20  42  50
    #>  [17]  14  13  21  28 107  42  42  77  77  77  31  18  18  11  35  35
    #>  [33]  14  14  14  14  28  11  61  73 102  71  71 112  55  71  80  22
    #>  [49]  22  63  62  44  30  42  35  35  28  84  28  14  42  34  47  42
    #>  [65]  45  43  23  42 105 120 105  56 104  42  79  90  77  28  14  14
    #>  [81]  77  28  14  54 103  78  79  70  70  98  78  63  58 125  42  49
    #>  [97]  44  35  89  86  60  39  41  50  47  46  48  51  50  44  44  46
    #> [113]  39  50  54 140  58  84  53  56  21  54  21  28  49  18  56  28
    #> [129]  28  21  54  57  29  59  50  39  91 136 127  63  93 155  35 105
    #> [145]  42  28  28  35  35  70  35  82  14  17  28 168 147 112  42  35
    #> [161]  21  97  35  66  35  28 126  84  70 140  22  63  42  70  94  63
    #> [177]  63  98  70  77  77  60  63  63  84  56  49  91  35  42  42  49
    #> [193]  70  57  29  64  41  21  93  23  31  28  30  14  21  55  65  28
    #> [209]  21  21  88  14  22  21  21  21  35  63  42  28  84  48  14  18
    #> [225]  14  14  30  35  81  76  42  28  28  28  56  28  56  42  98  58
    #> [241]  35  28  39  34  33  28  49  28  64  28  29  33  80  77  60  42
    #> [257]  49  56  55  42  91  98  55  92  98 112  63  63  21  63  63  58
    #> [273]  56  63 126  91 119  28  72 111  42  63  91  98  91  84  15  45
    #> [289]  NA  29  42  49  42  49  49  14  28  44  35  49  42  84  30  14
    #> [305]  14   9 112  56 112  46  28  56  14  70  70  35  28  28  28  48
    #> [321] 123  35  14  14  19  14  56  32  35 131  21  47  53  64  64  39
    #> [337]  NA  NA  37  32  41   6  42  30  26  44  28  19  15  14  50  35
    #> [353]  14  31  28  21   7  26  14  14  28   7   7  19  31  27  20  33
    #> [369]  62  28  15  13  28  16  19  30   7  14  36  15   7  43  20 100
    #> [385]  64  52  93  34  30  57  NA  56  81  52  95  63  49  54  37  70
    #> [401]  84  28  28  66  56

The median length-of-stay in a CMAM programme can be calculated as
follows:

``` r
calculate_los_median(otp_beneficiaries$admDate, otp_beneficiaries$disDate)
```

which gives the following results:

    #> Warning in calculate_los(admission_date = admission_date,
    #> discharge_date = discharge_date): Some admission date/s are not in
    #> YYYY-MM-DD format or are not available. Returning NA.
    #> Warning in calculate_los(admission_date = admission_date,
    #> discharge_date = discharge_date): Some discharge dates are earlier
    #> than admisison dates. Returning NA.
    #> [1] 43

### CMAM programme coverage

The `{squeacr}` provides functions to calculate programme coverage.
These functions implement the single coverage estimator approach\[1\].
In this approach, treatment coverage is calculated in such a way that
estimates the number of severe acute malnutrition (SAM) cases that have
not been enrolled in the programme but have been recovering without
treatment (`r_out`).

For example, if a coverage survey yielded 5 SAM cases in the programme,
25 cases not in the programme, and 5 recovering cases in the programme,
`r_out` can be calculated as follows:

``` r
calculate_rout(cin = 5, cout = 25, rin = 5)
#> [1] 6
```

Note here that the `calculate_rout()` function has another argument
named `k` which is a correction factor representing the ratio of the
mean length of an untreated episode to the mean length of a CMAM
treatment episode. This, by default, is set to `k = 3` in the function.
However, this should be adjusted based on programme data to estimate the
mean length of a SAM treatment episode.

This calculation for `r_out` is used within `calculate_tc()` to estimate
treatment coverage:

``` r
calculate_tc(cin = 5, cout = 25, rin = 5)
#> [1] 0.2439024
```

## Citation

If you use `{squeacr}` in your work, please cite using the suggested
citation provided by a call to the `citation` function as follows:

``` r
citation("squeacr")
#> To cite squeacr in publications use:
#> 
#>   Myatt, Mark, Guevarra, Ernest, Fieschi, Lionella, Norris,
#>   Allison, Guerrero, Saul, Schofield, Lilly, Jones, Daniel,
#>   Emru, Ephrem, Sadler, Kate (2012). _Semi-Quantitative
#>   Evaluation of Access and Coverage (SQUEAC)/Simplified Lot
#>   Quality Assurance Sampling Evaluation of Access and Coverage
#>   (SLEAC) Technical Reference_.
#>   <https://www.fantaproject.org/sites/default/files/resources/SQUEAC-SLEAC-Technical-Reference-Oct2012_0.pdf>.
#> 
#> A BibTeX entry for LaTeX users is
#> 
#>   @Manual{,
#>     location = {Washington, DC},
#>     title = {Semi-Quantitative Evaluation of Access and Coverage ({SQUEAC})/Simplified Lot Quality Assurance Sampling Evaluation of Access and Coverage ({SLEAC}) Technical Reference},
#>     url = {https://www.fantaproject.org/sites/default/files/resources/SQUEAC-SLEAC-Technical-Reference-Oct2012_0.pdf},
#>     publisher = {FHI 360/FANTA},
#>     author = {{Myatt} and {Mark} and {Guevarra} and {Ernest} and {Fieschi} and {Lionella} and {Norris} and {Allison} and {Guerrero} and {Saul} and {Schofield} and {Lilly} and {Jones} and {Daniel} and {Emru} and {Ephrem} and {Sadler} and {Kate}},
#>     year = {2012},
#>   }
```

## Community guidelines

Feedback, bug reports, and feature requests are welcome; file issues or
seek support [here](https://github.com/nutriverse/squeacr/issues). If
you would like to contribute to the package, please see our
[contributing
guidelines](https://nutriverse.io/squeacr/CONTRIBUTING.html).

This project is released with a [Contributor Code of
Conduct](https://nutriverse.io/squeacr/CODE_OF_CONDUCT.html). By
contributing to this project, you agree to abide by its terms.

<br/>

1.  Safari Balegamire, Katja Siling, Jose Luis Alvarez Moran, Ernest
    Guevarra, Sophie Woodhead, Alison Norris, Lionella Fieschi, Paul
    Binns, and Mark Myatt (2015). A single coverage estimator for use in
    SQUEAC, SLEAC, and other CMAM coverage assessments. Field Exchange
    49, March 2015. p81. \<www.ennonline.net/fex/49/singlecoverage\>
