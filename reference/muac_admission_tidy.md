# MUAC at admission in tidy format

MUAC at admission in tidy format

## Usage

``` r
muac_admission_tidy
```

## Format

A tibble with 506 rows and 3 columns

|              |                                            |
|--------------|--------------------------------------------|
| **Variable** | **Description**                            |
| *muac*       | Mid-upper arm circumference in centimetres |
| *district*   | Name of district                           |
| *count*      | Number of cases with specific MUAC         |

## Source

A SQUEAC survey in Lokori, Kenya

## Examples

``` r
muac_admission
#> $Telkuk
#> # A tibble: 56 × 12
#>     muac state   locality `Tahdi Osisi` Tahajer `Maman Almisgid` Tawayeet
#>    <dbl> <chr>   <chr>            <dbl>   <dbl>            <dbl>    <dbl>
#>  1   115 Kassala Telkuk               0       1                0        0
#>  2   114 Kassala Telkuk               1       1                2        6
#>  3   113 Kassala Telkuk               3       5                2       18
#>  4   112 Kassala Telkuk               3       8                7       11
#>  5   111 Kassala Telkuk               5       5                0        1
#>  6   110 Kassala Telkuk               4      14               12       22
#>  7   109 Kassala Telkuk               2       5                0        1
#>  8   108 Kassala Telkuk               0       3                0        1
#>  9   107 Kassala Telkuk               0       1                0        4
#> 10   106 Kassala Telkuk               0       1                0        0
#> # ℹ 46 more rows
#> # ℹ 5 more variables: `Gedamaib masjed` <dbl>, Temekref <dbl>, Edrut <dbl>,
#> #   `Haladet Shareg` <dbl>, Baryay <dbl>
#> 
#> $Halfa
#> # A tibble: 56 × 6
#>     muac state   locality `Alhara alula` Masak Omrahaw
#>    <dbl> <chr>   <chr>             <dbl> <dbl>   <dbl>
#>  1   115 Kassala Halfa                 1     0       0
#>  2   114 Kassala Halfa                 3     1      14
#>  3   113 Kassala Halfa                 3     2       5
#>  4   112 Kassala Halfa                 5     4       2
#>  5   111 Kassala Halfa                 1     2       4
#>  6   110 Kassala Halfa                 3     0       4
#>  7   109 Kassala Halfa                 0     1       0
#>  8   108 Kassala Halfa                 3     0       0
#>  9   107 Kassala Halfa                 2     0       0
#> 10   106 Kassala Halfa                 0     0       0
#> # ℹ 46 more rows
#> 
#> $Kassala
#> # A tibble: 56 × 7
#>     muac state   locality Mukram `Hamd Wkill` Yahyaalhisan `Al Kuaty hospital`
#>    <dbl> <chr>   <chr>     <dbl>        <dbl>        <dbl>               <dbl>
#>  1   115 Kassala Kassala       0            0            0                   0
#>  2   114 Kassala Kassala       0            0            2                   2
#>  3   113 Kassala Kassala      20            0           15                   0
#>  4   112 Kassala Kassala      44            1            6                   1
#>  5   111 Kassala Kassala      34            1            8                   0
#>  6   110 Kassala Kassala      19            7           17                   5
#>  7   109 Kassala Kassala       5            0            4                   2
#>  8   108 Kassala Kassala       8            0            1                   0
#>  9   107 Kassala Kassala       1            0            1                   2
#> 10   106 Kassala Kassala       0            0            0                   1
#> # ℹ 46 more rows
#> 
#> $`Naher Atbara`
#> # A tibble: 56 × 8
#>     muac state   locality     `8 - Arab` Sabaat Almazar Alelawi Reara
#>    <dbl> <chr>   <chr>             <dbl>  <dbl>   <dbl>   <dbl> <dbl>
#>  1   115 Kassala Naher Atbara          0      0       0       0     0
#>  2   114 Kassala Naher Atbara          2      1       1       4     6
#>  3   113 Kassala Naher Atbara          4     14       0       4    25
#>  4   112 Kassala Naher Atbara          4      9       7       6    20
#>  5   111 Kassala Naher Atbara          0     12       2       4    17
#>  6   110 Kassala Naher Atbara         34      9      12      11     2
#>  7   109 Kassala Naher Atbara          1      1       0       0     0
#>  8   108 Kassala Naher Atbara          1      1       0       1     4
#>  9   107 Kassala Naher Atbara          0      5       1       0     1
#> 10   106 Kassala Naher Atbara          0      1       0       3     0
#> # ℹ 46 more rows
#> 
#> $`El Fasher`
#> # A tibble: 56 × 8
#>     muac state      locality Alnhdua `sid El shohada` `Abu Shock camp` Abudegeis
#>    <dbl> <chr>      <chr>      <dbl>            <dbl>            <dbl>     <dbl>
#>  1   115 North Dar… El Fash…       2                2               11         0
#>  2   114 North Dar… El Fash…       2               28               42        39
#>  3   113 North Dar… El Fash…      11               76               85        32
#>  4   112 North Dar… El Fash…      32               40              106        17
#>  5   111 North Dar… El Fash…      25               27               54         2
#>  6   110 North Dar… El Fash…      39               24              137        17
#>  7   109 North Dar… El Fash…       4                8               41         2
#>  8   108 North Dar… El Fash…       8               24               20         1
#>  9   107 North Dar… El Fash…       6               19               21         1
#> 10   106 North Dar… El Fash…       1               10               12         0
#> # ℹ 46 more rows
#> # ℹ 1 more variable: Golo <dbl>
#> 
#> $Tawila
#> # A tibble: 56 × 8
#>     muac state       locality `Rownda A` Tungor Tardonat  Dali `Tawila Hospital`
#>    <dbl> <chr>       <chr>         <dbl>  <dbl>    <dbl> <dbl>             <dbl>
#>  1   115 North Darf… Tawila            0      0        0     0                 0
#>  2   114 North Darf… Tawila            6     15       11    35                27
#>  3   113 North Darf… Tawila           14     15       14    39                30
#>  4   112 North Darf… Tawila           34     15       10    11                 5
#>  5   111 North Darf… Tawila           14      3        2     5                 1
#>  6   110 North Darf… Tawila           32      4        7    15                42
#>  7   109 North Darf… Tawila            3      0        0     5                 2
#>  8   108 North Darf… Tawila            9      0        0     4                 7
#>  9   107 North Darf… Tawila            6      0        2     2                 1
#> 10   106 North Darf… Tawila            9      0        1     1                 1
#> # ℹ 46 more rows
#> 
#> $Kutumu
#> # A tibble: 56 × 7
#>     muac state        locality `Kutum Health Centre` Kassab   Amo Damrat
#>    <dbl> <chr>        <chr>                    <dbl>  <dbl> <dbl>  <dbl>
#>  1   115 North Darfur Kutumu                       0      0     1      0
#>  2   114 North Darfur Kutumu                      22     21     2      9
#>  3   113 North Darfur Kutumu                      18     56     5      8
#>  4   112 North Darfur Kutumu                      11     25     9      4
#>  5   111 North Darfur Kutumu                      14     18     3      7
#>  6   110 North Darfur Kutumu                       4     23     1      5
#>  7   109 North Darfur Kutumu                       6      1     1      1
#>  8   108 North Darfur Kutumu                       5      3     0      0
#>  9   107 North Darfur Kutumu                       0      1     0      0
#> 10   106 North Darfur Kutumu                       4      0     0      0
#> # ℹ 46 more rows
#> 
#> $Kalamendo
#> # A tibble: 56 × 7
#>     muac state        locality  Abudeleik Arida  Wada `Eid albida`
#>    <dbl> <chr>        <chr>         <dbl> <dbl> <dbl>        <dbl>
#>  1   115 North Darfur Kalamendo         0     0     0            1
#>  2   114 North Darfur Kalamendo         7    15    19           24
#>  3   113 North Darfur Kalamendo        16    19    12           15
#>  4   112 North Darfur Kalamendo        18     9    21           11
#>  5   111 North Darfur Kalamendo        10     6     1            3
#>  6   110 North Darfur Kalamendo        11     5    20            4
#>  7   109 North Darfur Kalamendo         0     1     1            0
#>  8   108 North Darfur Kalamendo         0     0     0            0
#>  9   107 North Darfur Kalamendo         0     1     0            0
#> 10   106 North Darfur Kalamendo         0     0     0            0
#> # ℹ 46 more rows
#> 
#> $`Medani Alkupra`
#> # A tibble: 56 × 7
#>     muac state    locality       `Abu Sunun` Arkauet Alkreaba Banaat
#>    <dbl> <chr>    <chr>                <dbl>   <dbl>    <dbl>  <dbl>
#>  1   115 Algazira Medani Alkupra           1       7       24     10
#>  2   114 Algazira Medani Alkupra           0       0        1      0
#>  3   113 Algazira Medani Alkupra           1       0        0      0
#>  4   112 Algazira Medani Alkupra           0       0        0      0
#>  5   111 Algazira Medani Alkupra           0       0        0      0
#>  6   110 Algazira Medani Alkupra           2       1       26      6
#>  7   109 Algazira Medani Alkupra           0       0        0      0
#>  8   108 Algazira Medani Alkupra           0       0        0      0
#>  9   107 Algazira Medani Alkupra           0       0        0      0
#> 10   106 Algazira Medani Alkupra           0       0        0      0
#> # ℹ 46 more rows
#> 
#> $`South Gazira`
#> # A tibble: 56 × 7
#>     muac state    locality     `Wad Alhadad` Alhoush `Almadina Arab` Barakat
#>    <dbl> <chr>    <chr>                <dbl>   <dbl>           <dbl>   <dbl>
#>  1   115 Algazira South Gazira            10       0               0       0
#>  2   114 Algazira South Gazira             0       2               4       0
#>  3   113 Algazira South Gazira             0       0              10       0
#>  4   112 Algazira South Gazira             1       2               9       0
#>  5   111 Algazira South Gazira             0       1               2       0
#>  6   110 Algazira South Gazira             0       9              36       2
#>  7   109 Algazira South Gazira             0       0               0       0
#>  8   108 Algazira South Gazira             0       0               0       0
#>  9   107 Algazira South Gazira             0       0               1       0
#> 10   106 Algazira South Gazira             0       0               0       0
#> # ℹ 46 more rows
#> 
#> $`Sharg Algazira`
#> # A tibble: 56 × 7
#>     muac state    locality       Rufaa Alganed Alhelalia Tambool
#>    <dbl> <chr>    <chr>          <dbl>   <dbl>     <dbl>   <dbl>
#>  1   115 Algazira Sharg Algazira     1       0         0       0
#>  2   114 Algazira Sharg Algazira     4       0         0       0
#>  3   113 Algazira Sharg Algazira     4       0         1       0
#>  4   112 Algazira Sharg Algazira     0       0         1       1
#>  5   111 Algazira Sharg Algazira     0       0         0       0
#>  6   110 Algazira Sharg Algazira     0       0         0       0
#>  7   109 Algazira Sharg Algazira     0       0         0       0
#>  8   108 Algazira Sharg Algazira     0       2         0       0
#>  9   107 Algazira Sharg Algazira     0       0         0       0
#> 10   106 Algazira Sharg Algazira     0       0         0       0
#> # ℹ 46 more rows
#> 
#> $`Al Kamlin`
#> # A tibble: 56 × 7
#>     muac state    locality  Alsiraiha Mealig `Elsaha Elmadrasia`  Giad
#>    <dbl> <chr>    <chr>         <dbl>  <dbl>               <dbl> <dbl>
#>  1   115 Algazira Al Kamlin         1      3                   7     1
#>  2   114 Algazira Al Kamlin         0      0                   5     2
#>  3   113 Algazira Al Kamlin         2      0                   6     5
#>  4   112 Algazira Al Kamlin         2      0                   4    NA
#>  5   111 Algazira Al Kamlin         0      0                   5     2
#>  6   110 Algazira Al Kamlin         6      2                   1    21
#>  7   109 Algazira Al Kamlin         1      0                   0     0
#>  8   108 Algazira Al Kamlin         2      0                   0     1
#>  9   107 Algazira Al Kamlin         0      0                   0     0
#> 10   106 Algazira Al Kamlin         0      0                   1     0
#> # ℹ 46 more rows
#> 
```
