# Bayesian priors - Two Source Trophic Position

Create priors for two source trophic position model derived from [Post
2002](https://esajournals.onlinelibrary.wiley.com/doi/full/10.1890/0012-9658%282002%29083%5B0703%3AUSITET%5D2.0.CO%3B2).

## Usage

``` r
two_source_priors(bp = FALSE)
```

## Arguments

- bp:

  logical value that controls whether informed priors are supplied to
  the model for both \\\delta^{15}\\N and \\\delta^{15}\\C baselines.
  Default is `FALSE` meaning the model will use uninformed priors,
  however, the supplied `data.frame` needs values for both
  \\\delta^{15}\\N and \\\delta^{15}\\C baseline (`c1`, `c2`, `n1`, and
  `n2`).

## Value

returns priors for two source model to be used in a `brms()` call.

## See also

[`two_source_model()`](https://benjaminhlina.github.io/trps/reference/two_source_model.md)
and
[`brms::brms()`](https://paulbuerkner.com/brms/reference/brms-package.html)

## Examples

``` r
two_source_priors()
#>                        prior class coef group resp dpar nlpar    lb       ub
#>                   beta(a, b)     b            d13c      alpha     0        1
#>                   beta(a, b)     b            d15n      alpha     0        1
#>         normal(dn, dn_sigma)     b            d15n         dn  <NA>     <NA>
#>        uniform(tp_lb, tp_ub)     b            d15n         tp tp_lb    tp_ub
#>  uniform(sigma_lb, sigma_ub) sigma            d13c             <NA> sigma_ub
#>  uniform(sigma_lb, sigma_ub) sigma            d15n             <NA> sigma_ub
#>  tag source
#>        user
#>        user
#>        user
#>        user
#>        user
#>        user
```
