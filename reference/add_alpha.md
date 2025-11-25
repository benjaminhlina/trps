# Calculate and add \\\alpha\\

Calculate \\\alpha\\ for a two source trophic position model using
equations from [Post
2002](https://esajournals.onlinelibrary.wiley.com/doi/full/10.1890/0012-9658%282002%29083%5B0703%3AUSITET%5D2.0.CO%3B2).

## Usage

``` r
add_alpha(data, abs = FALSE)
```

## Arguments

- data:

  `data.frame` of stable isotope samples with mean values for two
  baselines. For aquatic ecosystems, baseline one needs to come from a
  benthic source and baseline two needs to come from a pelagic source.
  Baseline \\\delta^{13}\\C columns need to be named `c1` and `c2`, with
  the consumer's \\\delta^{13}\\C column named `d13c`.

- abs:

  logical that controls whether the absolute value is taken for the
  numerator and denominator. Default is `FALSE` meaning that the
  absolute value is not taken.

## Value

a `data.frame` that has `alpha`, `min_alpha`, and `max_alpha` added.

## Details

\$\$\alpha = (\delta^{13}C_c - \delta ^{13}C_2) / (\delta ^{13}C_1 -
\delta ^{13}C_2)\$\$

where \\\delta^{13}C_c\\ is the isotopic value for consumer,
\\\delta^{13}C_1\\ is the mean isotopic value for baseline 1 and
\\\delta^{13}C_2\\ is the mean isotopic value for baseline 2.

## Examples

``` r
combined_iso |>
  add_alpha()
#> # A tibble: 117 × 16
#>       id common_name ecoregion  d13c  d15n d13c_b1 d15n_b1 d13c_b2 d15n_b2    c1
#>    <int> <fct>       <fct>     <dbl> <dbl>   <dbl>   <dbl>   <dbl>   <dbl> <dbl>
#>  1     1 Lake Trout  Anthropo… -22.3  17.6   -20.3    8.85   -26.4    7.72 -21.3
#>  2     2 Lake Trout  Anthropo… -23.0  17.7   -20.1    8.77   -24.4    8.69 -21.3
#>  3     3 Lake Trout  Anthropo… -21.2  16.7   -20.3    8.85   -24.8    7.99 -21.3
#>  4     4 Lake Trout  Anthropo… -20.9  18.7   -20.1    8.77   -24.4    8.69 -21.3
#>  5     5 Lake Trout  Anthropo… -20.7  18.0   -20.5    8.38   -24.8    7.99 -21.3
#>  6     6 Lake Trout  Anthropo… -20.7  18.0   -20.1    8.34   -24.4    8.05 -21.3
#>  7     7 Lake Trout  Anthropo… -22.8  17.8   -19.7    8.04   -24.1    8.79 -21.3
#>  8     8 Lake Trout  Anthropo… -22.4  17.9   -20.1    8.56   -24.6   10.7  -21.3
#>  9     9 Lake Trout  Anthropo… -20.9  18.4   -18.7    8.95   -24.3   10.6  -21.3
#> 10    10 Lake Trout  Anthropo… -21.7  17.7   -20.8    9.28   -24.6   10.7  -21.3
#> # ℹ 107 more rows
#> # ℹ 6 more variables: n1 <dbl>, c2 <dbl>, n2 <dbl>, alpha <dbl>,
#> #   min_alpha <dbl>, max_alpha <dbl>
```
