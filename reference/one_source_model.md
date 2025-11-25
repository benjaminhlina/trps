# Bayesian model - One Source Trophic Position

Estimate trophic position using a one source model derived from [Post
2002](https://esajournals.onlinelibrary.wiley.com/doi/full/10.1890/0012-9658%282002%29083%5B0703%3AUSITET%5D2.0.CO%3B2)
using a Bayesian framework.

## Usage

``` r
one_source_model(bp = FALSE)
```

## Arguments

- bp:

  logical value that controls whether informed priors are supplied to
  the model for \\\delta^{15}\\N baseline. Default is `FALSE` meaning
  the model will use uninformed priors, however, the supplied
  `data.frame` needs values for \\\delta^{15}\\N baseline (`n1`).

## Value

returns model structure for one source model to be used in a `brms()`
call.

## Details

\$\$\delta^{15}N = \delta^{15} N_1 + \Delta N \times (tp -
\lambda_1)\$\$

\\\delta^{15}\\N are values from the consumer, \\\delta^{15} N_1\\ is
mean \\\delta^{15}\\N values of baseline 1, \\\Delta\\N is the trophic
discrimination factor for N (i.e., `dn` mean of `3.4`), \\tp\\ is
trophic position, and \\\lambda_1\\ is the trophic level of baselines
which are often a primary consumer (e.g., `2`).

The data supplied to `brms()` needs to have the following variables
`d15n`, `n1`, and `l1` (\\\lambda\\) which is usually `2`.

## See also

[`brms::brms()`](https://paulbuerkner.com/brms/reference/brms-package.html)

## Examples

``` r
one_source_model()
#> d15n ~ n1 + dn * (tp - l1) 
#> dn ~ 1
#> tp ~ 1
```
